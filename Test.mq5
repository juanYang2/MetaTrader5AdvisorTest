// //+------------------------------------------------------------------+
// //|                                                         Test.mq5 |
// //|                                  Copyright 2024, MetaQuotes Ltd. |
// //|                                             https://www.mql5.com |
// //+------------------------------------------------------------------+
// #property copyright "Copyright 2024, MetaQuotes Ltd."
// #property link      "https://www.mql5.com"
// #property version   "1.00"
// //+------------------------------------------------------------------+
// //| Include                                                          |
// //+------------------------------------------------------------------+

// //+------------------------------------------------------------------+
// //| Inputs                                                           |
// //+------------------------------------------------------------------+
// //--- inputs for expert
// input string             Expert_Title                  ="Test";      // Document name
// ulong                    Expert_MagicNumber            =15345;       //
// bool                     Expert_EveryTick              =false;       //
// //--- inputs for main signal
// input int                Signal_ThresholdOpen          =10;          // Signal threshold value to open [0...100]
// input int                Signal_ThresholdClose         =10;          // Signal threshold value to close [0...100]
// input double             Signal_PriceLevel             =0.0;         // Price level to execute a deal
// input double             Signal_StopLevel              =50.0;        // Stop Loss level (in points)
// input double             Signal_TakeLevel              =50.0;        // Take Profit level (in points)
// input int                Signal_Expiration             =4;           // Expiration of pending orders (in bars)
// input int                Signal_DEMA_PeriodMA          =12;          // Double Exponential Moving Average Period of averaging
// input int                Signal_DEMA_Shift             =0;           // Double Exponential Moving Average Time shift
// input ENUM_APPLIED_PRICE Signal_DEMA_Applied           =PRICE_CLOSE; // Double Exponential Moving Average Prices series
// input double             Signal_DEMA_Weight            =1.0;         // Double Exponential Moving Average Weight [0...1.0]
// //--- inputs for trailing
// input int                Trailing_FixedPips_StopLevel  =30;          // Stop Loss trailing level (in points)
// input int                Trailing_FixedPips_ProfitLevel=50;          // Take Profit trailing level (in points)
// //--- inputs for money
// input double             Money_FixLot_Percent          =10.0;        // Percent
// input double             Money_FixLot_Lots             =0.1;         // Fixed volume
// //+------------------------------------------------------------------+
// //| Global expert object                                             |
// //+------------------------------------------------------------------+
// CExpert ExtExpert;
// //+------------------------------------------------------------------+
// //| Initialization function of the expert                            |
// //+------------------------------------------------------------------+
// int OnInit()
//   {
// //--- Initializing expert
//    if(!ExtExpert.Init(Symbol(),Period(),Expert_EveryTick,Expert_MagicNumber))
//      {
//       //--- failed
//       printf(__FUNCTION__+": error initializing expert");
//       ExtExpert.Deinit();
//       return(INIT_FAILED);
//      }
// //--- Creating signal
//    CExpertSignal *signal=new CExpertSignal;
//    if(signal==NULL)
//      {
//       //--- failed
//       printf(__FUNCTION__+": error creating signal");
//       ExtExpert.Deinit();
//       return(INIT_FAILED);
//      }
// //---
//    ExtExpert.InitSignal(signal);
//    signal.ThresholdOpen(Signal_ThresholdOpen);
//    signal.ThresholdClose(Signal_ThresholdClose);
//    signal.PriceLevel(Signal_PriceLevel);
//    signal.StopLevel(Signal_StopLevel);
//    signal.TakeLevel(Signal_TakeLevel);
//    signal.Expiration(Signal_Expiration);
// //--- Creating filter CSignalDEMA
//    CSignalDEMA *filter0=new CSignalDEMA;
//    if(filter0==NULL)
//      {
//       //--- failed
//       printf(__FUNCTION__+": error creating filter0");
//       ExtExpert.Deinit();
//       return(INIT_FAILED);
//      }
//    signal.AddFilter(filter0);
// //--- Set filter parameters
//    filter0.PeriodMA(Signal_DEMA_PeriodMA);
//    filter0.Shift(Signal_DEMA_Shift);
//    filter0.Applied(Signal_DEMA_Applied);
//    filter0.Weight(Signal_DEMA_Weight);
// //--- Creation of trailing object
//    CTrailingFixedPips *trailing=new CTrailingFixedPips;
//    if(trailing==NULL)
//      {
//       //--- failed
//       printf(__FUNCTION__+": error creating trailing");
//       ExtExpert.Deinit();
//       return(INIT_FAILED);
//      }
// //--- Add trailing to expert (will be deleted automatically))
//    if(!ExtExpert.InitTrailing(trailing))
//      {
//       //--- failed
//       printf(__FUNCTION__+": error initializing trailing");
//       ExtExpert.Deinit();
//       return(INIT_FAILED);
//      }
// //--- Set trailing parameters
//    trailing.StopLevel(Trailing_FixedPips_StopLevel);
//    trailing.ProfitLevel(Trailing_FixedPips_ProfitLevel);
// //--- Creation of money object
//    CMoneyFixedLot *money=new CMoneyFixedLot;
//    if(money==NULL)
//      {
//       //--- failed
//       printf(__FUNCTION__+": error creating money");
//       ExtExpert.Deinit();
//       return(INIT_FAILED);
//      }
// //--- Add money to expert (will be deleted automatically))
//    if(!ExtExpert.InitMoney(money))
//      {
//       //--- failed
//       printf(__FUNCTION__+": error initializing money");
//       ExtExpert.Deinit();
//       return(INIT_FAILED);
//      }
// //--- Set money parameters
//    money.Percent(Money_FixLot_Percent);
//    money.Lots(Money_FixLot_Lots);
// //--- Check all trading objects parameters
//    if(!ExtExpert.ValidationSettings())
//      {
//       //--- failed
//       ExtExpert.Deinit();
//       return(INIT_FAILED);
//      }
// //--- Tuning of all necessary indicators
//    if(!ExtExpert.InitIndicators())
//      {
//       //--- failed
//       printf(__FUNCTION__+": error initializing indicators");
//       ExtExpert.Deinit();
//       return(INIT_FAILED);
//      }
// //--- ok
//    return(INIT_SUCCEEDED);
//   }
// //+------------------------------------------------------------------+
// //| Deinitialization function of the expert                          |
// //+------------------------------------------------------------------+
// void OnDeinit(const int reason)
//   {
//    ExtExpert.Deinit();
//   }
// //+------------------------------------------------------------------+
// //| "Tick" event handler function                                    |
// //+------------------------------------------------------------------+
// void OnTick()
//   {
//    ExtExpert.OnTick();
//   }
// //+------------------------------------------------------------------+
// //| "Trade" event handler function                                   |
// //+------------------------------------------------------------------+
// void OnTrade()
//   {
//    ExtExpert.OnTrade();
//   }
// //+------------------------------------------------------------------+
// //| "Timer" event handler function                                   |
// //+------------------------------------------------------------------+
// void OnTimer()
//   {
//    ExtExpert.OnTimer();
//   }
// //+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade/Trade.mqh>
#include <Trade/SymbolInfo.mqh>

CTrade Trade;
CSymbolInfo symbol_info;
int barsTotal;

input double Lots = 0.01;

void OnDeinit(const int reason)
  {

   
  }

int OnInit()
  {
   barsTotal = iBars(NULL, PERIOD_CURRENT);
   // Initialize symbol_info for the specific symbol
   if(!symbol_info.Name(_Symbol))
     {
      Print("Failed to initialize symbol info for ", _Symbol);
      return(INIT_FAILED);
     }

   // Output some debug information
   Print("Successfully initialized symbol info for ", _Symbol);
   Print("Symbol: ", symbol_info.Name());
   Print("Spread: ", symbol_info.Spread());
     
     
            bool spreadfloat=SymbolInfoInteger(Symbol(),SYMBOL_SPREAD_FLOAT);
         string comm=StringFormat("Spread %s = %I64d points\r\n",
                                  spreadfloat?"floating":"fixed",
                                  SymbolInfoInteger(Symbol(),SYMBOL_SPREAD));
      //--- now let's calculate the spread by ourselves
         double ask=SymbolInfoDouble(Symbol(),SYMBOL_ASK);
         double bid=SymbolInfoDouble(Symbol(),SYMBOL_BID);
         double spread=ask-bid;
         int spread_points=(int)MathRound(spread/SymbolInfoDouble(Symbol(),SYMBOL_POINT));
         comm=comm+"Calculated spread = "+(string)spread_points+" points";
         Comment(comm);
         
   return(INIT_SUCCEEDED);
  }

void onTick()
{
   Sleep(10);
   int bars = iBars(NULL, PERIOD_CURRENT);
   
  // doesn't execute a trade every tick but rather after every bar
    if(barsTotal != bars){
        barsTotal = bars;
         
  }

}
