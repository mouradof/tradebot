//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
input double lot_size = 0.1;     // Taille de la position
input int rsi_period = 14;       // Période du RSI
input double take_profit = 47.4; // Take profit en pips
input double stop_loss = 7.6;    // Stop Loss en pips
input int rsi_overbought = 70;   // RSI seuil de surachat

// Fonction d'initialisation
int OnInit()
{
   Print("Bot de trading démarré...");
   return INIT_SUCCEEDED;
}

// Fonction principale appelée à chaque tick
void OnTick()
{
   // Obtenir la valeur du RSI
   double rsi_value = iRSI(NULL, 0, rsi_period, PRICE_CLOSE, 0);

   // Si RSI > 70 et qu'il n'y a pas de position ouverte
   if (rsi_value > rsi_overbought && OrdersTotal() == 0)
   {
      double price = Bid;
      double tp = price - take_profit * Point;
      double sl = price + stop_loss * Point;

      // Ouvrir une position SELL
      OrderSend(Symbol(), OP_SELL, lot_size, price, 3, sl, tp, "RSI Bot", 0, 0, Red);
      Print("Position SELL ouverte au prix de ", price);
   }
}

// Fonction de déinitialisation à la fermeture du bot
void OnDeinit(const int reason)
{
   Print("Bot de trading arrêté.");
}
