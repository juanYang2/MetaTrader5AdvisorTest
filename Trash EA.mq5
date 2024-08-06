
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <trade/trade.mqh>
CTrade trade;


//input variables
input int openMinute;
input int openMinute2;
input int openMinute3;
input int openMinute4;
input int closeSecond;


int OnInit()
  {
   
   return(INIT_SUCCEEDED);
  }

void OnDeinit(const int reason)
  {

   
  }

void OnTick()
  {
  MqlDateTime timeNow;
  TimeToStruct(TimeCurrent(), timeNow);
  
  double currentPrice = SymbolInfoDouble(NULL, SYMBOL_ASK);
  currentPrice = NormalizeDouble(currentPrice, _Digits);
  double tp = entry + 10 * _Point;
  double sl = entry - 10 * _Point;            
  tp = NormalizeDouble(tp, _Digits);
  sl = NormalizeDouble(sl, _Digits);
  
  if(openMinute == timeNow.sec || openMinute2 == timeNow.sec || openMinute3 == timeNow.sec || openMinute4 == timeNow.sec )
     {
        trade.Buy(Lots, NULL, entry, sl, tp);
     
     }

   
  }

