## Segmentace obrazu


##  Důležité funkce z notebooku
```
import gridcut ## Py wrapper for GridCut: https://github.com/Borda/GridCut-python

def segmenter(image_org, colors, sink, source, K, g):

    # edges
    e_u, e_d, e_l, e_r = set_edges(image_org, K, g)
    
    image = image_org.copy()
    w = image.shape[1], h = image.shape[0]
    
    a = source.ravel().astype(dtype=np.float32)
    b = sink.ravel().astype(dtype=np.float32)

    result = gridcut.maxflow_2D_4C(w,h, a,b, e_u.ravel(),e_d.ravel(),e_l.ravel(),e_r.ravel())
    
    idx = 0
    for (x,y), pix in np.ndenumerate(image[:,:,0]):
        if(sum(list(image[x,y,:])) > 0): #500
            if(result[idx]==0):
                image[x,y,:] = (image[x,y,0]/255.0) *colors[1]
            elif(result[idx]==1):
                image[x,y,:] = (image[x,y,0]/255.0) *colors[0]
        idx += 1
        
  
    save_image(image,"name.jpg")
```

```
## set_source je v zasade identicka funkce, K je bud pevne dane nebo predpocitane ze vstupniho obrazu, lambda je vetsinou 0.1
def set_sink(stencil, K, colors,l=1.0):
    sink = np.zeros((stencil.shape[0], stencil.shape[1]))
    
    for (x,y), pix in np.ndenumerate(stencil[:,:,0]):
        pix = stencil[x,y,:]
        if(list(pix) == list(colors[0])):
            sink[x,y] = K*l
        else:
            sink[x,y] = 0
            
    return sink

```


```
def compute_min(a, b, gamma):
    lower = min(a/255.0,b/255.)
    return 1+min((lower**gamma)*255,254.0)
```

```
def set_edges(img, gamma):
    edges_u = np.ones((img.shape[0], img.shape[1]), dtype=np.float32)
    edges_d = np.ones((img.shape[0], img.shape[1]), dtype=np.float32)
    edges_l = np.ones((img.shape[0], img.shape[1]), dtype=np.float32)
    edges_r = np.ones((img.shape[0], img.shape[1]), dtype=np.float32)
    
    for (x,y), pix in np.ndenumerate(img[:,:,0]):
        if(x < img.shape[0]-1):
            cap = compute_min(img[x,y,0], img[x+1,y,0],gamma)
            edges_u[x,y] = cap
        if(x > 0):
            cap = compute_min(img[x,y,0], img[x-1,y,0],gamma)
            edges_d[x,y] = cap
        if(y < img.shape[1]-1):
            cap = compute_min(img[x,y,0], img[x,y+1,0],gamma)
            edges_r[x,y] = cap
        if(y > 0):
            cap = compute_min(img[x,y,0], img[x,y-1,0],gamma)
            edges_l[x,y] = cap
            
            
    return edges_u, edges_d, edges_l, edges_r
```

## Vstupní obrázky
<img src="./imgs/rose2.jpg" width="190" title="Original"/> <img src="./imgs/rose0.png" width="200" title="Original"/> 


## Výsledky barvení



## Nové výsledky
K = <1000, 4000>
gamma = {0.5,1,3,5,8,10}
lambda = 0.05

<table>
    <tr>
        <td></td><td>scribble</td><td>gamma = 0.5</td><td>gamma = 1.0</td><td>gamma = 3.0</td><td>gamma = 5.0</td><td>gamma = 8.0</td><td>gamma = 10.0</td>
    </tr>
    <tr>
        <th>K=100</th> 
        <th><img src="./imgs/rose0_scr.png" width="145" /></th> 
        <th><img src="./results/rose01_100_0.5.jpg" width="145" /></th>  
        <th><img src="./results/rose01_100_1.jpg" width="145" /></th>
        <th><img src="./results/rose01_100_3.jpg" width="145" /></th>
    </tr>
    <tr>
        <th>K=2000</th> 
        <th><img src="./imgs/rose0_scr.png" width="145" /></th> 
        <th><img src="./results/rose01_2000_0.5.jpg" width="145" /></th>  
        <th><img src="./results/rose01_2000_1.jpg" width="145" /></th>
        <th><img src="./results/rose01_2000_3.jpg" width="145" /></th>
    </tr>
    <tr>
        <th>K=1000</th> 
        <th><img src="./imgs/rose2_scr3.png" width="145" /></th> 
        <th><img src="./results/rose_1000_0.5.jpg" width="145" /></th>  
        <th><img src="./results/rose_1000_1.jpg" width="145" /></th>
        <th><img src="./results/rose_1000_3.jpg" width="145" /></th>
        <th><img src="./results/rose_1000_5.jpg" width="145" /></th>
        <th><img src="./results/rose_1000_8.jpg" width="145" /></th>
        <th><img src="./results/rose_1000_10.jpg" width="145" /></th>
    </tr>
        <tr>
        <th>K=2000</th> 
        <th><img src="./imgs/rose2_scr3.png" width="145" /></th> 
        <th><img src="./results/rose_2000_0.5.jpg" width="145" /></th>  
        <th><img src="./results/rose_2000_1.jpg" width="145" /></th>
        <th><img src="./results/rose_2000_3.jpg" width="145" /></th>
        <th><img src="./results/rose_2000_5.jpg" width="145" /></th>
        <th><img src="./results/rose_2000_8.jpg" width="145" /></th>
        <th><img src="./results/rose_2000_10.jpg" width="145" /></th>
    </tr>
    <tr>
        <th>k=4000</th> 
        <th><img src="./imgs/rose2_scr3.png" width="145" /></th> 
        <th><img src="./results/rose_4000_0.5.jpg" width="145" /></th>  
        <th><img src="./results/rose_4000_1.jpg" width="145" /></th>
        <th><img src="./results/rose_4000_3.jpg" width="145" /></th>
        <th><img src="./results/rose_4000_5.jpg" width="145" /></th>
        <th><img src="./results/rose_4000_8.jpg" width="145" /></th>
        <th><img src="./results/rose_4000_10.jpg" width="145" /></th>
    </tr>
    <tr>
        <th>K=1000</th> 
        <th><img src="./imgs/rose2_scr4.png" width="145" /></th> 
        <th><img src="./results/rose4_1000_0.5.jpg" width="145" /></th>  
        <th><img src="./results/rose4_1000_1.jpg" width="145" /></th>
        <th><img src="./results/rose4_1000_3.jpg" width="145" /></th>
        <th><img src="./results/rose4_1000_5.jpg" width="145" /></th>
        <th><img src="./results/rose4_1000_8.jpg" width="145" /></th>
        <th><img src="./results/rose4_1000_10.jpg" width="145" /></th>
    </tr>
     <tr>
        <th>K=2000</th> 
        <th><img src="./imgs/rose2_scr4.png" width="145" /></th> 
        <th><img src="./results/rose4_2000_0.5.jpg" width="145" /></th>  
        <th><img src="./results/rose4_2000_1.jpg" width="145" /></th>
        <th><img src="./results/rose4_2000_3.jpg" width="145" /></th>
        <th><img src="./results/rose4_2000_5.jpg" width="145" /></th>
        <th><img src="./results/rose4_2000_8.jpg" width="145" /></th>
        <th><img src="./results/rose4_2000_10.jpg" width="145" /></th>
    </tr>
    <tr>
        <th>K=4000</th> 
        <th><img src="./imgs/rose2_scr4.png" width="145" /></th> 
        <th><img src="./results/rose4_4000_0.5.jpg" width="145" /></th>  
        <th><img src="./results/rose4_4000_1.jpg" width="145" /></th>
        <th><img src="./results/rose4_4000_3.jpg" width="145" /></th>
        <th><img src="./results/rose4_4000_5.jpg" width="145" /></th>
        <th><img src="./results/rose4_4000_8.jpg" width="145" /></th>
        <th><img src="./results/rose4_4000_10.jpg" width="145" /></th>
    </tr>
</table>


## Staré výsledky
K = <100, 1500>
gamma = {0,0.5,1,3,5,8,10}
lambda = 0.1

<table>
    <tr>
        <td></td><td>scribble</td><td>gamma = 0.0</td><td>gamma = 0.5</td><td>gamma = 1.0</td><td>gamma = 3.0</td><td>gamma = 5.0</td><td>gamma = 8.0</td><td>gamma = 10.0</td>
    </tr>
    <tr>
        <th></th> 
        <th><img src="./imgs/rose0_b.jpg" width="150" /></th> 
        <th><img src="./results/rose0_100_0.jpg" width="150" /></th> 
        <th><img src="./results/rose0_100_0.5.jpg" width="150" /></th>  
        <th><img src="./results/rose0_100_1.jpg" width="150" /></th> 
        <th><img src="./results/rose0_100_3.jpg" width="150" /></th>
    </tr>
    <tr>
        <th></th> 
        <th><img src="./imgs/rose2_scr3.png" width="145" /></th> 
        <th><img src="./results/rose2_100_0.jpg" width="145" /></th> 
        <th><img src="./results/rose2_100_0.5.jpg" width="145" /></th>  
        <th><img src="./results/rose2_100_1.jpg" width="145" /></th>
        <th><img src="./results/rose2_100_3.jpg" width="145" /></th>
        <th><img src="./results/rose2_100_5.jpg" width="145" /></th>
        <th><img src="./results/rose2_100_8.jpg" width="145" /></th>
        <th><img src="./results/rose2_100_10.jpg" width="145" /></th>
    </tr>
    <tr>
        <th></th> 
        <th><img src="./imgs/rose2_scr4.png" width="145" /></th> 
        <th><img src="./results/rose3_100_0.jpg" width="145" /></th> 
        <th><img src="./results/rose3_100_0.5.jpg" width="145" /></th>  
        <th><img src="./results/rose3_100_1.jpg" width="145" /></th>
        <th><img src="./results/rose3_100_3.jpg" width="145" /></th>
        <th><img src="./results/rose3_100_5.jpg" width="145" /></th>
        <th><img src="./results/rose3_100_8.jpg" width="145" /></th>
        <th><img src="./results/rose3_100_10.jpg" width="145" /></th>
    </tr>
</table>