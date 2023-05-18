<?php
    
    $server_name="localhost";
    $username="root";
    $pass="";
    $database_name="assignment1";

   



    $conn=mysqli_connect($server_name,$username,$pass,$database_name);
    if(!$conn)
    {

        die('Connection Fialed:'. mysqli_connect_error());
    }


    if(isset($_POST['Signup'])&&!isset($_POST['Login']))
    {
        $name=$_POST['name'];
        $password=$_POST['password'];
        $email=$_POST['email'];
        

        $sql = "SELECT * FROM form WHERE email='$email'";

        $res = mysqli_query($conn, $sql);

        if(mysqli_num_rows($res) > 0){
            echo "<script>
            alert('Email Inserted is Duplicated enter Unique Email');
            window.location.href='http://localhost/Backup%201/Signup.html';
            </script>";

        }
        else
        {
            $sql_query = "INSERT INTO form (name,password,email)
            VALUES ('$name','$password','$email')";
    
            $res1 = mysqli_query($conn, $sql_query);

            echo "<script>
            alert('New Details Entry inserted successfully');
            window.location.href='http://localhost/Backup%201/Login.html';
            </script>";

            
        }
      }

 
        

       

    else if(isset($_POST['Login']))
    {
        $email_login=$_POST['email_login'];
        $password_login=$_POST['password_login'];

        $sql="select * from form where (email='$email_login' or password='$password_login');";

        
      $res=mysqli_query($conn,$sql);
      $row = mysqli_fetch_assoc($res);

      if ($email_login==$row['email'] && $password_login==$row['password']) {
        echo "<script>
        alert('Login Successfully');
        </script>";

        echo " <font color=purple size='8pt'> <ol align='center'> <b>". "Welcome " . $row["name"]."</b>";
      
      
      }




    else if($email_login==$row['email'])
    {
        echo "<script>
        alert('    Correct Email but wrong Password');
        window.location.href='http://localhost/Backup%201/Login.html';
        </script>";
        
    }


    else{

    echo "<script>
    alert('Wrong Email And Password');
    window.location.href='http://localhost/Backup%201/Login.html';
    </script>";
    }


    }


    



?>