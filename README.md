# RISC-V CORDIC Implememtation
Wyliczanie sinus i cosinus algorytmem CORDIC <br />
Autor: Konrad Jurczyński-Chu

## Założenia projektowe
### Kąty 
- 32-bitowe słowa, najstarsze 1 bit część całkowita, pozostałe 31 bity część ułamkowa, reprezentacja U2
- Jednostki: rad/pi
### Obliczenia
- Dozwolone operacje: dodawanie, odejmowanie, bitshift
### Input
- Podany w kątach, konwertowany na rad/pi poprzez podzielenie przez 180
### Output
- Część ułamokwa (wynik należy podzielić przez 10^9)
