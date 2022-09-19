### Original and bilateral filter
Kernel size is always set to 6*σ. 
So far I have only implemented bruteforce method.
#### Original
<img src="./imgs/arch.png" width="200" /> 

#### Results of filtering with log

<table>
    <tr>
        <td></td><td>σb = 1</td><td>σb = 3</td><td>σb = 5</td><td>σb = 10</td><td>σb = 50</td><td>σb = 150</td>
    </tr>
    <tr>
        <th>σg = 1.5</th> 
        <th><img src="./results/arch 1.5_1_log.jpg" width="150" /></th> 
        <td><img src="./results/arch 1.5_3_log.jpg" width="150" /></td> 
        <td><img src="./results/arch 1.5_5_log.jpg" width="150" /></td> 
        <td><img src="./results/arch 1.5_10_log.jpg"  width="150" /></td> 
        <td><img src="./results/arch 1.5_50_log.jpg"  width="150" /></td>
        <td><img src="./results/arch 1.5_150_log.jpg" width="150" /></td>
    </tr>
    <tr>
        <th>σg = 3</th> 
        <th><img src="./results/arch 3_1_log.jpg" width="150" /></th> 
        <td><img src="./results/arch 3_3_log.jpg" width="150" /></td> 
        <td><img src="./results/arch 3_5_log.jpg" width="150" /></td> 
        <td><img src="./results/arch 3_10_log.jpg"  width="150" /></td> 
        <td><img src="./results/arch 3_50_log.jpg"  width="150" /></td>
        <td><img src="./results/arch 3_150_log.jpg" width="150" /></td>
    </tr>
    <tr>
        <th>σg = 5</th> 
        <th><img src="./results/arch 5_1_log.jpg" width="150" /></th> 
        <td><img src="./results/arch 5_3_log.jpg" width="150" /></td> 
        <td><img src="./results/arch 5_5_log.jpg" width="150" /></td> 
        <td><img src="./results/arch 5_10_log.jpg"  width="150" /></td> 
        <td><img src="./results/arch 5_50_log.jpg"  width="150" /></td>
        <td><img src="./results/arch 5_150_log.jpg" width="150" /></td>
    </tr>
    <tr>
        <th>σg = 10</th> 
        <th><img src="./results/arch 10_1_log.jpg" width="150" /></th> 
        <td><img src="./results/arch 10_3_log.jpg" width="150" /></td> 
        <td><img src="./results/arch 10_5_log.jpg" width="150" /></td> 
        <td><img src="./results/arch 10_10_log.jpg"  width="150" /></td> 
        <td><img src="./results/arch 10_50_log.jpg"  width="150" /></td>
        <td><img src="./results/arch 10_150_log.jpg" width="150" /></td>
    </tr>
</table>

<table>
    <tr>
        <td></td><td>σb = 1.5</td>
    </tr>
    <tr>
        <th>σg = 1.5</th> 
        <th><img src="./results/lena 1.5_1.5.jpg" width="150" /></th> 

    </tr>
</table>


<table>
    <tr>
        <td></td><td>σb = 1.5</td><td>σb = 10</td><td>σb = 50</td>
    </tr>
    <tr>
        <th>σg = 1</th> 
        <th><img src="./results/museum 1_1.5.jpg" width="150" /></th> 
        <th><img src="./results/museum 1_10.jpg" width="150" /></th> 
        <th><img src="./results/museum 1_50.jpg" width="150" /></th> 
    </tr>
    <tr>
        <th>σg = 1.5</th> 
        <th><img src="./results/museum 1.5_1.5.jpg" width="150" /></th> 
        <th><img src="./results/museum 1.5_10.jpg" width="150" /></th> 
        <th><img src="./results/museum 1.5_50.jpg" width="150" /></th> 
    </tr>
    <tr>
        <th>σg = 3</th> 
        <th><img src="./results/museum 3_1.5.jpg" width="150" /></th> 
        <th><img src="./results/museum 3_10.jpg" width="150" /></th> 
        <th><img src="./results/museum 3_50.jpg" width="150" /></th> 
    </tr>
</table>


### Original
<img src="./imgs/lena.jpg" width="200" /> 


#### Results of filtering




<table>
    <tr>
        <td></td><td>σb = 10</td><td>σb = 50</td><td>σb = 250</td>
    </tr>
    <tr>
        <th>σg = 1.2</th> 
        <th><img src="./results/lena 1.2_10.jpg" width="150" /></th> 
        <td><img src="./results/lena 1.2_50.jpg" width="150" /></td> 
        <td><img src="./results/lena 1.2_250.jpg" width="150" /></td> 
    </tr>
    <tr>
        <th>σg = 1.5</th> 
        <th><img src="./results/lena 1.5_10.jpg" width="150" /></th> 
        <td><img src="./results/lena 1.5_50.jpg" width="150" /></td> 
        <td><img src="./results/lena 1.5_250.jpg" width="150" /></td> 
    </tr>
    <tr>
        <th>σg = 3</th> 
        <th><img src="./results/lena 3_10.jpg" width="150" /></th> 
        <td><img src="./results/lena 3_50.jpg" width="150" /></td> 
        <td><img src="./results/lena 3_250.jpg" width="150" /></td> 
    </tr>
    <tr>
        <th>σg = 10</th> 
        <th><img src="./results/lena 10_10.jpg" width="150" /></th> 
        <td><img src="./results/lena 10_50.jpg" width="150" /></td> 
        <td><img src="./results/lena 10_250.jpg" width="150" /></td> 
    </tr>
</table>


