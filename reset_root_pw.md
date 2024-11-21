## Przerwanie procesu bootowania i reset hasła roota

Aby odzyskać lub zresetować hasło root należy dostać się do boot loadera oraz wyedytować konfigurację GRUB2.

**Resetowanie hasła roota**

1. Bootowanie systemu i zaczekania aż pojawi się menu GRUB2.
2. W menu boot loadera, podświetlić jakąkolwiek linijkę kodu i wcisnąć<kbd>e</kbd> aby wyedytować ją.
3. Znajdź linijkę zaycznającą się od **linux** i na końcu lini dopisać:
```
rd.break
rd.break enforcing=0
```
4. Zbootować sysytem używająć edytowanej linijki GRUB2 **Ctr+X**.
5. Przemontować partycję rootową w tryb rw:
```
mount –o remount,rw /sysroot
```
6. Uruchomić shella ze zmienionym katalogiem głównym:
```
chroot /sysroot/
```
7. Reset the root password:
```
passwd root
```
8. Wykonać autoetykietowanie SELinuxa:
```
touch .autorelabel
```
9. Wyjście i reboot systemu
```
exit
exit
```
