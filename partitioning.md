## Tworzenie nowych zasobów dyskowych
1. Fizyczny dysk dostępny na maszynie.
2. Tworzymy PV.
3. Tworzymy VG oraz LV(s).
4. Tworzymy filesystem na LV(s).
5. Tworzymy mountpoint i montujemy LV(s) na danych mountpointach.
6. Dodajemy wpis do /etc/fstab
7. Test finalny "mount -a" (wykonanie bez żadnych błędów).

## Rozszerzenie zasobów LVM:
1. VG musi mieć dostępne miejsce na rozszerzenie (jeśli nie ma to dodajemy kolejny PV).
2. LV extend

## Zmniejszenie zasobów LVM:
1. XFS dump na danym mountpoincie = filesystemie
2. Odmontowujemy zasób 
3. LV reduce (zmniejszamy LV)
4. Tworzymy nowy świeży filesystem
5. Montujemy zasób
6. XFS restore 
