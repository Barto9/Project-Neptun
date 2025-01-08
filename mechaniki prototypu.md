Gra jest platformówką 2D z elementami logicznymi

### Zmiana kolorów: 
Plansza jest podzielona na 3 warstwy: Czerwoną, Zieloną i Niebieską oznaczonymi kolorami adekwatnie do nazw. Gracz jest w stanie przemieszczać się między tymi warstwami. Gdy gracz znajduje się na jednej warstwie, nie jest on w stanie wchodzić w interakcje z pozostałymi. 
Warstwy nieaktywne przybierają kolor biały półprzeźroczysty
Zmiana warstwy jest sekwencyjna tj. do umiejętność potrzebny jest jeden przycisk, który zmienia warstę z czerwonej na zieloną, z zielonej na niebieską i z niebieskiej na czerwoną
`Spacja` - Zmiana koloru

>[! example]- Przykład
Gdy gracz znajduje się na warstwie Czerwonej, jest on w stanie skakać tylko po platformach czerwonych, wchodzić w interakcje z dźwigniami czerwonymi i dostawać obrażenia od czerwonych przeciwników 

### Warstwy kolorów wtórnych:
- Warstwa Biała jest aktywna niezależnie od warstwy
- Warstwa Cyjan jest aktywna w warstwach Zielonej i Niebieskiej
- Warstwa Magenta jest aktywna w warstwach Czerwonej i Niebieskiej
- Warstwa Żółta jest aktywna w warstwach Czerwonej i Zielonej

### Null zone
Obszar na planszy gry, po wkroczeniu do którego gracz traci możliwość zmiany koloru, będąc w ten sposób zmuszony do pracowania wewnątrz danej warstwy.
Mechanika kolorów warstw również dotyczy tej mechaniki.

### Okienka
Warstwy są wyświetlane na osobnych oknach gry. 
Plansza wewnątrz okien jest statyczna relatywnie do ekranu komputera, a oknami gracz może manipulować sprawiając wrażenie, że okna gry są faktycznymi "oknami" fizycznie wewnątrz świata gry, za pomocą których można go obserwować.
Każde z okien odpowiednio nazwane Red, Green i Blue pokazują osobno warstwy dając graczowi możliwość zobaczenia co się dziaje na osobnych warstwach bez konieczności zmiany kolorów
> [! important]
> Mechanika okienek jest w osobnej scenie "test", kiedy mechanika normalnej zmiany koloru na scenie "test_map"