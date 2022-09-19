Folder structure:
* 01 - analysis
* 02 - data lifecycle management
* 03 - datamart & dashboard

# Zadání
Semestrální práce se skládá ze 3 částí, které na sebe navazují a je tedy nutné odevzdat všechny části.

### Analýza dat, návrh entitního a DB modelu.
- Výstup: 
    - textový popis zdrojových dat - tzn. detailní popis jednotlivých atributů včetně datových typů, business názvů a business popisu dat
    - entitní model targetu
    - DB model stage a targetu v CASE nástroji

### DLM, ETL.
- Výstup: 
    - datová logická mapa integrovaných dat - názvy atributů v source systému, názvy atributů v target DB, typ historizace apod.
    - upravené DDL s technickými sloupci a správnými klíči
    - ETL procesy pro stage i target (ukázka historizace všech typů) - jeden job, který bude spouštět ostatní transformace, které nahrávají jednotlivé tabulky (co transformace, to tabulka, transformace se nacházejí v transakci)

### Datamart + dashboard.
-  Výstup:
    -   model datamartu v CASE nástroji + pdf/png výstup DDL datamartu
    -   business popis navrženého datamartu - obsažené atributy, smysl datamartu -> pdf soubor
    - dashboard v Power BI ve formátu .pbix 
    - písemné zodpovězení libovolných 2 ze 3 zadaných otázek pomocí dashboardu -> pdf soubor (může to být společný soubor s business popisem)
