//+------------------------------------------------------------------+
//|                Moyenne Mobile Simple (SMA) Example               |
//+------------------------------------------------------------------+
#property indicator_separate_window
#property indicator_buffers 1
#property indicator_color1 Blue

// Déclaration des buffers de l'indicateur
double maBuffer[];

// Paramètre de la moyenne mobile
input int maPeriod = 14;

// Fonction d'initialisation
int OnInit()
  {
   // Lier le buffer à l'indicateur
   SetIndexBuffer(0, maBuffer);
   IndicatorShortName("Moyenne Mobile Simple (" + maPeriod + ")");
   return(INIT_SUCCEEDED);
  }

// Fonction principale pour calculer la moyenne mobile
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   // Calcul de la moyenne mobile simple
   for (int i = prev_calculated; i < rates_total; i++)
      maBuffer[i] = iMA(NULL, 0, maPeriod, 0, MODE_SMA, PRICE_CLOSE, i);

   return(rates_total);
  }
