= HW1 - Data Acquisition - Web Crawler/Scraper

Výsledky: CSV soubor(y) ve složce results, případně výpis v JSON formátu zobrazený za běhu programu
Kód: Jupyter notebook ve složce src

Rozhodla jsem se získávat data nahraných plachtařských letů z webu CPSka.cz (https://www.cpska.cz/public/index3.php)
Jelikož cílem je posléze získat informace hlavně o četnosti letů v daných dnech na různých místech (pro odhad kvality letovch podmínek), nejdůležitějšími údaji jsou datum, délka a rychlost letu (příp. typ) a souřadnice startu a cíle. Mimo tyto jsem stahovala i další zajímavé údaje, které by se časem mohly hodit.

- typ letadla
- imatrikulaci (unikátní číslo letadla)
- jméno pilota
- domovský klub
- datum letu
- délka letu
- rychlost
- typ letu
- tvar letu
- souřadnice a kódy počátečních a konečných letišť

Web CPS má jednoduchou nicméně nejednotnou strukturu, na problémy s timeoutem nebo odepřením přístupu jsem nenarazila.
Zarazilo mě až kódování windows-1250, které bylo nutné explicitně nastavit.

Stáhla jsem celkem informace z 1010 letů, které jsem pro kontrolu uložila ve formátu JSON, nicméně pro další operace se mi hodí více flat file, pandas data frame nebo csv soubor, tudíž jsem JSON strukturu zploštila do jednovrstvého listu s údaji o letech.

Data jsem stahovala a ukládala v batchi po 100 letech tak, abych v případě výpadku nebo chyby všechno neztratila, nakonec jsem je spojila do jednoho CSV souboru.