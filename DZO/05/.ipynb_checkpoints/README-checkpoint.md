## Stitching

Využila jsem feedbacku ohledně redukované verze Laplace, což okrajům velmi pomohlo.
Naopak, když jsem ale použila barvy s okraje z druhé poloviny obrázku jako počáteční podmínky jedné poloviny, začaly se na okrajích objevovat výranzé skvrny z oné druhé poloviny (asi by to fungovalo podstatně líp, kdybych měla symetrický obrázek), proto jsem nakonec použila pouze malinko upravené hodnoty z předchozího odevzdání.


```
avg_img...vstupní obraz
laplacian...laplacian požadovaného výsledku

def GaussSeidel(avg_img, laplacian, k=1000, new_input = True):
    if(new_input):
        avg_img = avg_img/255.
    h,w,c = laplacian.shape
    for i in range(k):
        for color in range(laplacian.shape[2]):
            for (x,y), pix in np.ndenumerate(laplacian[:,:,color]):
                
                if(x+1 < h):
                    a = avg_img[x+1,y,color]
                else:
                    a = inp[x,y-1,color]
                
                
                if(x-1 > 0):
                    b = avg_img[x-1,y,color]
                else:
                    b = inp[x,y,color] 
                 
                if(y+1 < w): #prava strana
                    c = avg_img[x,y+1,color]
                else:
                    c = inp[x,y,color]#
                    
                if(y-1 > 0): #leva strana
                    d = avg_img[x,y-1,color] 
                else:
                    d = inp[x,y+1,color]
                
                # I*[x,y] =  ( I[x+1,y] + I[x-1,y] + I[x,y+1], + I[x,y-1] - b[x,y]) / 4
                avg_img[x,y,color] = (a + b + c+ d - pix)/4.       
    return avg_img
```

## Vstupní fotografie
<img src="./imgs/no_teabag_small.jpg" width="200" title="Original"/> <img src="./imgs/original_mug_small.jpg" width="200" title="Original"/> 

<img src="./imgs/half_nobag210.jpg" width="200" title="Original"/> <img src="./imgs/half_bag210.jpg" width="200" title="Original"/> 



### Multi-resolution scheme
 * mé řešení je pamětově naročné ale pracuji jen s malým obrázkem (476x400px)
 
```
in1 -- vstupni obraz 1
in2 -- vstupni obraz 2
input_gs -- startovni obraz (ostry predel nebo prumerna barva)
results -- vektor vysledku
k -- pocet iteraci na patro rekurze


def faster_GS(in1,in2, input_gs,results,k):
    # get mixed laplace
    lp = laplacian_mixed(in1,in2) #funkce vrati predem definovany laplacian
    
    # stopping condition
    if(lp.shape[0] < 60): 
        print(in1.shape)
        results.append(GaussSeidel(input_gs, lp, k, new_input = True))
        return results, lp
    
    # scale down
    sm1 = scale_im(in1,0.5)
    sm2 = scale_im(in2,0.5)
    ig = scale_im(input_gs,0.5)
    
    #recursion
    results, l = faster_GS(sm1, sm2,ig,results,k)
    product = results[-1]
    
    #upscale
    product_up = scale_im(product,2)
    product_up = product_up[:lp.shape[0],:lp.shape[1],:] #trim additional debris

    results.append(GaussSeidel(product_up, lp, k, new_input = False))
    return results, lp
```
 
 
##### Stitching

 <table>
    <tr>
        <td></td><td></td><td></td><td></td><td></td><td>original size</td><td>input</td><td>laplace</td>
    </tr>
    <tr>
        <th>2 cycles per level</th> 
        <th><img src="./results/resultsr-2iterations-5levels30.jpg" width="30" /></th> 
        <th><img src="./results/resultsr-2iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsr-2iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsr-2iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsr-2iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_bag210.jpg" width="300" /></th> 
        <th><img src="./results/vzorr-2iterations-5levels476.jpg" width="300" /></th> 
    </tr>
    <tr>
        <th>10 cycles per level</th> 
        <th></th> 
        <th><img src="./results/resultsr-10iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsr-10iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsr-10iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsr-10iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_bag210.jpg" width="300" /></th> 
        <th><img src="./results/vzorr-20iterations-5levels476.jpg" width="300" /></th> 
    </tr>
    <tr>
        <th>30 cycles per level</th> 
        <th></th> 
        <th><img src="./results/resultsr-30iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsr-30iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsr-30iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsr-30iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_bag210.jpg" width="300" /></th> 
        <th><img src="./results/vzorr-30iterations-5levels476.jpg" width="300" /></th> 
    </tr>
</table> 

#### Removing teabag
 <table>
    <tr>
        <td></td><td></td><td></td><td></td><td></td><td>original size</td><td>input</td><td>laplace</td>
    </tr>
    <tr>
        <th>10 cycles per level</th> 
        <th><img src="./results/results-10iterations-5levels30.jpg" width="30" /></th> 
        <th><img src="./results/results-10iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/results-10iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/results-10iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/results-10iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_bag210.jpg" width="300" /></th> 
        <th><img src="./results/vzor-10iterations-5levels476.jpg" width="300" /></th> 
    </tr>
    <tr>
        <th>50 cycles per level</th> 
        <th></th> 
        <th><img src="./results/results-50iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/results-50iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/results-50iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/results-50iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_bag210.jpg" width="300" /></th> 
        <th><img src="./results/vzor-50iterations-5levels476.jpg" width="300" /></th> 
    </tr>
    <tr>
        <th>100 cycles per level</th> 
        <th></th> 
        <th><img src="./results/results-100iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/results-100iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/results-100iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/results-100iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_bag210.jpg" width="300" /></th> 
        <th><img src="./results/vzor-100iterations-5levels476.jpg" width="300" /></th> 
    </tr>
     <tr>
        <th>500 cycles per level</th> 
        <th></th> 
        <th><img src="./results/results-500iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/results-500iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/results-500iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/results-500iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_bag210.jpg" width="300" /></th> 
        <th><img src="./results/vzor-100iterations-5levels476.jpg" width="300" /></th> 
    </tr>
</table>


    
#### Start from average color
 <table>
    <tr>
        <td></td><td></td><td></td><td></td><td></td><td>original size</td><td>input</td><td>laplace</td>
    </tr>
    <tr>
        <th>2 cycles per level</th> 
        <th><img src="./results/resultsa-2iterations-5levels30.jpg" width="30" /></th> 
        <th><img src="./results/resultsa-2iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsa-2iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsa-2iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsa-2iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./results/avg_small.jpg" width="300" /></th>
        <th><img src="./results/vzor-20iterations-5levels476.jpg" width="300" /></th> 
    </tr>
    <tr>
        <th>20 cycles per level</th> 
        <th><img src="./results/resultsa-20iterations-5levels30.jpg" width="30" /></th> 
        <th><img src="./results/resultsa-20iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsa-20iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsa-20iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsa-20iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./results/avg_small.jpg" width="300" /></th>
        <th><img src="./results/vzor-20iterations-5levels476.jpg" width="300" /></th> 
    </tr>
        <tr>
        <th>50 cycles per level</th> 
        <th><img src="./results/resultsa-50iterations-5levels30.jpg" width="30" /></th> 
        <th><img src="./results/resultsa-50iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsa-50iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsa-50iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsa-50iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./results/avg_small.jpg" width="300" /></th>
        <th><img src="./results/vzor-50iterations-5levels476.jpg" width="300" /></th> 
    </tr>
    <tr>
        <th>100 cycles per level</th> 
        <th><img src="./results/resultsa-100iterations-5levels30.jpg" width="30" /></th> 
        <th><img src="./results/resultsa-100iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsa-100iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsa-100iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsa-100iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./results/avg_small.jpg" width="300" /></th>
        <th><img src="./results/vzor-50iterations-5levels476.jpg" width="300" /></th> 
    </tr>
</table>  
    
#### Stitching
 <table>
    <tr>
        <td></td><td></td><td></td><td></td><td></td><td>original size</td><td>input</td><td>laplace</td>
    </tr>
    <tr>
        <th>2 cycles per level</th> 
        <th><img src="./results/resultsn-2iterations-5levels30.jpg" width="30" /></th> 
        <th><img src="./results/resultsn-2iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsn-2iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsn-2iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsn-2iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_nobag210.jpg" width="300" /></th> 
        <th><img src="./results/vzorn-2iterations-5levels476.jpg" width="300" /></th> 
    </tr>
    <tr>
        <th>10 cycles per level</th> 
        <th><img src="./results/resultsn-10iterations-5levels30.jpg" width="30" /></th> 
        <th><img src="./results/resultsn-10iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsn-10iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsn-10iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsn-10iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_nobag210.jpg" width="300" /></th> 
        <th><img src="./results/vzorn-10iterations-5levels476.jpg" width="300" /></th> 
    </tr>
        <tr>
        <th>20 cycles per level</th> 
        <th><img src="./results/resultsn-20iterations-5levels30.jpg" width="30" /></th> 
        <th><img src="./results/resultsn-20iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsn-20iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsn-20iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsn-20iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_nobag210.jpg" width="300" /></th> 
        <th><img src="./results/vzorn-50iterations-5levels476.jpg" width="300" /></th> 
    </tr>
    <tr>
        <th>50 cycles per level</th> 
        <th><img src="./results/resultsn-50iterations-5levels30.jpg" width="30" /></th> 
        <th><img src="./results/resultsn-50iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsn-50iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsn-50iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsn-50iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_nobag210.jpg" width="300" /></th> 
        <th><img src="./results/vzorn-50iterations-5levels476.jpg" width="300" /></th> 
    </tr>
</table>
    
 #### Adding teabag
 <table>
    <tr>
        <td></td><td></td><td></td><td></td><td></td><td>original size</td><td>input</td><td>laplace</td>
    </tr>
    <tr>
        <th>2 cycles per level</th> 
        <th><img src="./results/resultsadd-2iterations-5levels30.jpg" width="30" /></th> 
        <th><img src="./results/resultsadd-2iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsadd-2iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsadd-2iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsadd-2iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_nobag210.jpg" width="300" /></th> 
        <th><img src="./results/vzoradd-2iterations-5levels476.jpg" width="300" /></th> 
    </tr>
     <tr>
        <th>10 cycles per level</th> 
        <th><img src="./results/resultsadd-10iterations-5levels30.jpg" width="30" /></th> 
        <th><img src="./results/resultsadd-10iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsadd-10iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsadd-10iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsadd-10iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_nobag210.jpg" width="300" /></th> 
        <th><img src="./results/vzoradd-2iterations-5levels476.jpg" width="300" /></th> 
    </tr>
    <tr>
        <th>20 cycles per level</th> 
        <th></th> 
        <th><img src="./results/resultsadd-20iterations-5levels60.jpg" width="60" /></th>  
        <th><img src="./results/resultsadd-20iterations-5levels120.jpg" width="120" /></th>
        <th><img src="./results/resultsadd-20iterations-5levels238.jpg" width="220" /></th>
        <th><img src="./results/resultsadd-20iterations-5levels476.jpg" width="300" /></th>
        <th><img src="./imgs/half_nobag210.jpg" width="300" /></th> 
        <th><img src="./results/vzoradd-2iterations-5levels476.jpg" width="300" /></th> 
    </tr>
</table>

