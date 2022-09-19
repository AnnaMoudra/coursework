### Semestral work for Computational Intelligence Methods course

**Zadání:**
  Vezměte krátké 5-10 sekundové video a vytvořte generátor pro interpolování video rámců, abyste získali vysokofrekvenční zpomalené video. 
  Používejte obě architektury: GAN a U-Net. Porovnejte výsledky.
   
Literatura:
*  https://www.citi.sinica.edu.tw/papers/yylin/6497-F.pdf
*  http://tedxiao.me/pdf/CS294_Report.pdf
*  https://github.com/neil454/deep-motion


**Příprava a spuštění:**
Pro úspěšné spuštění je potřeba stáhnout a doplnit příslušné modely do složek deep-motion, CycleGan a cpk, viz report.
Dále je nutné mít nainstalované všechny základní knihovny (numpy, tensorflow, scipy, opencv etc..), doplnit video 
do složky in_vid a příslušně upravit název videa a vybrat jaký model cheme aplikovat v ControlPoint notebooku.
Poté stačí notebook spustit.

**Výstupy:**
Postup a hodnocení modelu jsou popsány v reportu.
Kompilace výsledných videí je k nahlédnutí zde: https://vimeo.com/382288779
Medium blogpost: https://medium.com/@anna.moudra/29031288d838