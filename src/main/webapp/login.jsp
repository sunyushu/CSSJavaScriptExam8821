<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Bootstrap 按钮状态插件</title>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script language="javascript" type="text/javascript">
    function SetInputNull() {
        var input1 = document.getElementById("name");
		var input2 = document.getElementById("password");
        if(input1.value =="")
		{
			alert("用户名不能为空！");
			//input.setAttribute("className","input");
		}
		 if(input2.value =="")
		{
			alert("密码不能为空！");
			//input.setAttribute("className","input");
		}
    }

</script>
</head>



<body background="2.jpg">
   <div class="container">
        <div class="row">
            <div class="col-sm-2">
                 <a href="#" class="thumbnail">
                     <img src="14.jpg" alt="通用的占位符缩略图" width="100px" height="100px"> 
                 </a>
            </div> 
            <div class="col-ms-3">
                 <p class=" page-header">8821孙堉澍</p>
            </div>   
         </div>
         <div class="row">
            <br/>
            <br/>
            <br/>
             <div class="col-sm-6 col-sm-offset-3">
                  <form role="form" class="outline:none" name="myform" action="loginAction" method="post">
<div class="form-group">

       <h3 class="page-header">电影租用管理系统</h3>
           <label for="username">Username</label>
           <input type="text" class="form-control" id="name" placeholder="Enter username" name="name">
           </div>
           <div class="form-group">
           <label for="Password">Password</label>
            <input type="password" class="form-control" id="password" placeholder="Password">
   </div>
<button type="submit" class="btn btn-default" onclick="SetInputNull()">登录</button>
</form>
             </div>
         </div>
   </div>


</body>
</html>
