## Main filtering function

    Kernel size is always set to 6*σ. 

    So far I have only implemented bruteforce method.

    ^ - changed rows in code



```
def convolution(img,k,sigmaG, sigmab,log=False):

    n,m,c = img.shape
    final = np.zeros((n,m,c))
    half = k//2

    v = gaussian(sigma,k)
    v = np.outer(v,v) # peak is 1.0

    for channel in range(c):
        # adding padding to edges
        d,e = np.pad(img[:,:,channel].copy(), half, 'reflect').shape
        
        im = img[:,:,channel].copy()
        #empty array for new data
        conv = np.zeros((n,m))
        
        for (x,y), pix in np.ndenumerate(np.zeros((n,m))):
            pix_val = 0.0
            W = 0.0
            center = im[x,y]
            
            for (k,l), val in np.ndenumerate(v):
                im_pos_x = ...
                im_pos_y = ...

                im_pix = im[im_pos_x,im_pos_y]
                gaussB = gaussianB(im_pix, center, sigmab, k, log) # peak  ==  1.0 is in diff==0                ^
                W += val*gaussB
                pix_val += im_pix * val * gaussB
            conv[x,y] = pix_val/W  #normalization factor
        ...
    return final
```

#### Gaussian kernel
```
#spacial weight
def gaussian(sigma, k):
    v = []
    for i in range(k):
        l = i - k//2
        g = np.exp(-(l*l) / (2 * (sigma**2)))             ^
        v.append(g)
    return v
```

#### Gaussian range weight B

```
def gaussianB(px, center, sigmab, log=False): 

    diff = abs(px - center)
    if(log):
        diff = (np.log(px+1) - np.log(center+1))*255      ^

    g = np.exp(-(diff*diff) / (2 * (sigmab**2)))          ^
    return g
```


## Results of filtering with log
<img src="./imgs/museum_s.jpg" width="400" title="Original"/> 

<table>
    <tr>
        <td></td><td>σb = 5</td><td>σb = 10</td><td>σb = 50</td><td>σb = 150</td>
    </tr>
    <tr>
        <th>σg = 1</th> 
        <th><img src="./results/museum 1_5_log.jpg" width="250" /></th> 
        <th><img src="./results/museum 1_10_log.jpg" width="250" /></th> 
        <th><img src="./results/museum 1_50_log.jpg" width="250" /></th> 
        <th><img src="./results/museum 1_150_log.jpg" width="250" /></th> 
    </tr>
    <tr>
        <th>σg = 3</th> 
        <th><img src="./results/museum 3_5_log.jpg" width="250" /></th>
        <th><img src="./results/museum 3_10_log.jpg" width="250" /></th> 
        <th><img src="./results/museum 3_50_log.jpg" width="250" /></th> 
        <th><img src="./results/museum 3_150_log.jpg" width="250" /></th> 
    </tr>
    <tr>
        <th>σg = 5</th> 
        <th><img src="./results/museum 5_5_log.jpg" width="250" /></th>
        <th><img src="./results/museum 5_10_log.jpg" width="250" /></th> 
        <th><img src="./results/museum 5_50_log.jpg" width="250" /></th> 
        <th><img src="./results/museum 5_150_log.jpg" width="250" /></th> 
    </tr>
</table>

<table>
    <tr>
        <th>original</th> 
        <th><img src="./imgs/lena.jpg" width="250" /></th> 
        <th><img src="./imgs/peppers.png" width="250" /></th> 
    </tr>
    <tr>
        <td></td><td>σb = 1.5</td><td>σb = 1.5</td>
    </tr>
    <tr>
        <th>σg = 1</th> 
        <th><img src="./results/lena 1_1.5_log.jpg" width="250" /></th> 
        <th><img src="./results/peppers 1_1.5_log.jpg" width="250" /></th> 
    </tr>
    <tr>
        <td></td><td>σb = 10</td><td>σb = 10</td>
    </tr>
    <tr>
        <th>σg = 3</th> 
        <th><img src="./results/lena 3_10_log.jpg" width="250" /></th> 
        <th><img src="./results/peppers 3_10_log.jpg" width="250" /></th> 
    </tr>
    <tr>
        <td></td><td>σb = 60</td><td>σb = 60</td>
    </tr>
    <tr>
        <th>σg = 3</th> 
        <th><img src="./results/lena 3_60_log.jpg" width="250" /></th> 
        <th><img src="./results/peppers 3_60_log.jpg" width="250" /></th> 
    </tr>
</table>




#### Results of filtering with absolute value


<img src="./imgs/museum_s.jpg" width="400" title="Original"/> 

<table>
    <tr>
        <td></td><td>σb = 5</td><td>σb = 10</td><td>σb = 50</td><td>σb = 150</td>
    </tr>
    <tr>
        <th>σg = 1</th> 
        <th><img src="./results/museum 1_5.jpg" width="250" /></th> 
        <th><img src="./results/museum 1_10.jpg" width="250" /></th> 
        <th><img src="./results/museum 1_50.jpg" width="250" /></th> 
        <th><img src="./results/museum 1_150.jpg" width="250" /></th> 
    </tr>
    <tr>
        <th>σg = 3</th> 
        <th><img src="./results/museum 3_5.jpg" width="250" /></th> 
        <th><img src="./results/museum 3_10.jpg" width="250" /></th> 
        <th><img src="./results/museum 3_50.jpg" width="250" /></th>
        <th><img src="./results/museum 3_150.jpg" width="250" /></th> 
    </tr>
    <tr>
        <th>σg = 5</th> 
        <th><img src="./results/museum 5_5.jpg" width="250" /></th> 
        <th><img src="./results/museum 5_10.jpg" width="250" /></th> 
        <th><img src="./results/museum 5_50.jpg" width="250" /></th>
        <th><img src="./results/museum 5_150.jpg" width="250" /></th> 
    </tr>
</table>


