= HW4 - Social Network Analysis
Task:
- Convert 'casts' data to a graph
    - Create a node for each actor
    - Create an edge if two actors appeared in the same movie
    
- Compute general statistics
     - e.g. number of nodes and edges, density, number of components
- Identify key players using centrality measures
- Identify clusters/communities in graph
- Compute 'Kevin Bacon' number for each actor with selected key player  
	e.g. top actors with the highest/lowest number average number
- Visualise important aspects of the analysis
- Insert a file with the graph exported to a GEXF format
    - All computed values should be present as attributes
    

Veskere exportovane grafy jsou ve slozce res/*
Nejvetsim problemem ulohy pro me byly spatne naparsovana vstupni data, ktera casto delala v analyze neplechu (napr. "herec" s a, ktery mel stupen pres 3 tisice). 
Problem jsem vyresila tak, ze jsem neuplne zaznamy z datasetu smazala. 
Vykresluji jen nekolik mensich grafu, k centrality measure pouzivam jen degree a eigenvector. 
Jako sveho Kevina Bacona jsem si zvolila 2. herce v poradi z key_players: James Stewart, 
KB cislo je pak uvedeno jako attribut a je videt v exportu grafu G (Goriginal.gexf), stejne tak je tam id clique velikosti 5, pokud se dany node v takove klice nachazel.