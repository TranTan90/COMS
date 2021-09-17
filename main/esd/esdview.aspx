<%@ Page Language="C#" AutoEventWireup="true" CodeFile="esdview.aspx.cs" Inherits="esdview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js" integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g=="crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
    $(function () {
        $('#name1').css("display", "none");
        var removeratt = function () {
            $('#name1').prop("onclick", null);
        }
        var addcls = function () {
            $('#name1').css("display", "block");
        };
        setTimeout(addcls, 50000);
    });
  
</script>
<style type="text/css">
    
    .note
    {
        width:90px;
        height:90px;    
        margin-left:100px;
        
    }
      .note1
      {
          display:flex;
          justify-content:space-between;
          
      }  
      .admin1
          {
              height:100px;
              width:100px;
               background-color:Blue;
           }
</style>

<body>
    <form id="form1" runat="server" class="note1">
   
    <div class="admin1" >1</div>
    <div class="admin1" >2</div>
    <div class="admin1" >3</div>
    </form>
    <div style="height:200px"></div>
</body>
</html>
