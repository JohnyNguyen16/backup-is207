<?php

    session_start();
    error_reporting(0);

$con=mysqli_connect("localhost","root","","HANGKHONG");
$q=mysqli_query($con,"select pnr from CHITIETHOADON where pnr='".$_SESSION['user']."'");
$n=  mysqli_fetch_assoc($q);
$stname= $n['pnr'];
$id=$_SESSION['user'];

$result = mysqli_query($con,"SELECT * FROM HANHKHACH WHERE pnr='".$_SESSION['user']."'");
                    
                    while($row = mysqli_fetch_array($result))
                      {
?>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        
         <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
         <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css">
       <script src="bootstrap/jquery.min.js"></script>
        <script src="bootstrap/bootstrap.min.js"></script>
        <link type="text/css" rel="stylesheet" href="css/admform.css"></link>
        
        <script type="text/javascript">
            function printpage()
            {
            var printButton = document.getElementById("print");
            printButton.style.visibility = 'hidden';
            window.print()
             printButton.style.visibility = 'visible';
             }
        </script>
        
        
    </head>
    <body>
        </div>
<center><img src='images/airplane-pic.jpg' class='img-thumbnail' width='1200px' style='height:130px;'></center>";
         
  <div class="container-fluid">
                            <div class="row">
                               <div class="col-sm-12">
      <center>  <table class="table table-bordered" style="font-family: Verdana">
                
              
                
                <center><font style="font-family:Verdana; font-size:18px;">
                   Thông tin vé máy bay
                    </font></center>
                
                <br>
                <br>
                <center><font style="font-family:Arial Black; font-size:20px;">
		______________________________________________________________________
                   </font></center>
                </td>
                    <td colspan="2" width="3%" >
                   <?php
                  
                    $picfile_path ='images/';
                    
                    $result1 = mysqli_query($con,"SELECT * FROM HANHKHACH where ='".$_SESSION['user']."'");
                        
                    
                    
                    while($row1 = mysqli_fetch_array($result1))
                      {                  
                        $picsrc=$picfile_path.$row1['s_pic'];
                        
                        echo "<center><img src='images/maxx.jpg' class='img-thumbnail' width='180px' style='height:180px;'></center>";
                        echo"<div>";
                      }
                   ?>
                        </td>
                 </tr>       
                 
                 <tr>
                 <td style="width:4%;"> <font style="font-family: Verdana;">PNR: </font> </td>
                    <td style="width:8%;" colspan="3"> <?php echo $stname;?> </td>
                 </tr>
                 
                 
                <tr>
                    <td> <font style="font-family: Verdana;">Hành khách số: </font> </td>
                    <td colspan="3"> <?php echo ''. $row[0]. '   ' ?>
                </tr>
                  
                  <tr>
                    <td > <font style="font-family: Verdana;"> Họ và tên:</font>  </td>
                    <td colspan="3"> <?php echo ''. $row[2]. '   ' ?><br>
                   
                  </tr>
                  <tr>
                    <td > <font style="font-family: Verdana;"> Tuổi:</font>  </td>
                    <td colspan="3"> <?php echo ''. $row[3]. '   ' ?><br>
                    
                  </tr>
                  <tr>
                    <td><font style="font-family: Verdana;"> Giới tính: </font></td>
                    <td  colspan="3"><?php echo $row[4] ?> </td>
                   </tr>
                 
                  <tr>
                    <td> <font style="font-family: Verdana;">Thức ăn: </font></td>
                    <td> <?php echo $row[5] ?></td>
                  </tr>
                       </table></center>
                               </div>
                            </div>
            </div>
        <?php
              }
        ?>
    <center> <input type="submit" id="print" class="toggle btn btn-primary" value="Print" onclick="printpage();"></center>
<CENTER><a href="pnrall.php">Kiểm tra vé khác</a></center>
    </body>
</html>


 
            
    </body>
</html>


                     