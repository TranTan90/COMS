<%@ Page Language="C#" AutoEventWireup="true" CodeFile="esdview.aspx.cs" Inherits="esdview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js" integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
        display: flex;
        justify-content: center;
    }
    .admin1
    {
       background-color: ;
       height: 100%;
       /* width: 50%;
*/    }
    .admin2
    {
        display:inline-flex;
        width:100%;
    }
 .view1
 {
     background-color:;
      border: 2px solid Gray;
      border-radius:15px;
     
     
     }
     .viewicon 
     {
         
          margin-left:25px;
          width:"70px"; 
    }
</style>
<body>
    <form id="form1" runat="server" class="note">
    <div class="admin1">
        <div>
        <div style="height:30px"></div>
            <h3 style="text-align: center">
                내방객 기초 준수 사항<br />
                HẠNG MỤC CƠ BẢN CẦN TUÂN THỦ CỦA KHÁCH ĐẾN THĂM
                <br />
            </h3>
        </div>
        <div style="margin-top: 70px; text-align: center;">
            <span><b><h5><span style="color: Blue">비상 사태시 집결지 안내</span><br />
                HƯỚNG DẪN NƠI TẬP KẾT KHI XẢY RA TÌNH HUỐNG KHẨN CẤP<br />
            </b></span></h5>
            <img src="../../images/esd/fatory.PNG" alt="" height="450px" style=" margin-left: 25px"><br />
        </div>
          <div style="height:20px"></div>
        <div class="view1">
           <div style="height:30px"></div>
           <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                        <img src="../../images/esd/icon1.png" width="85px"  style=" margin-left: 35px" />
                    </td>
                    <td>
                        <span style="color: Blue">비상사태 발생시 비상대피로를 확인하여 대피하고 집결지로 집합합니다.</span><br />
                        Khi xảy ra tình huống khẩn cấp, cần xác định đường lánh nạn khẩn cấp và tập trung tại điểm tập kết 

                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                        <img src="../../images/esd/icon3.png" width="85px"  style=" margin-left: 35px" />
                    </td>
                    <td>
                        <span style="color: Blue">응급조치, 갑작스런 건강 이상시 식당 옆 보건관리실을 방문하여 주세요.</span><br />
                        Vui lòng đến phòng y tế (cạnh nhà ăn) nếu cần cấp cứu hoặc có dấu hiệu sức khỏe
                        bất thường.
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                        <img src="../../images/esd/icon2.png" width="85px" style=" margin-left: 35px" />
                    </td>
                    <td>
                        <span style="color: Blue">폐기물은 지정된 장소에 버려주시고 분류에 따라 폐기해야 합니다.</span><br />
                       Vui lòng vứt rác thải tại nơi quy định và cần vứt bỏ theo phân loại.

                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                        <img src="../../images/esd/icon4.png" width="80px" style=" margin-left: 35px" />
                    </td>
                    <td>
                        <span style="color: Blue">내방수칙 위반으로 시정 요구를 받을 경우 향후 출입이 제한될 수 있습니다.</span><br />
                        Có thể hạn chế ra vào sau này trong trường hợp nhận được yêu cầu sửa đổi quyền ra
                        vào do vi phạm nội quy khách đến thăm.
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                        <img src="../../images/esd/icon5.png" width="85px"  style=" margin-left: 35px"/>
                    </td>
                    <td>
                        <span style="color: Blue">사내 이동 시에는 전방을 주시하고, 돌출된 구역이 있는지 확인합니다.</span><br />
                        Khi di chuyển trong công ty, lưu ý phía trước và kiểm tra xem có vật/khu vực bị
                        nhô ra không.
                    </td>
                </tr>
            </table>
        </div>     
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                        <img src="../../images/esd/icon6.png" width="80px" style=" margin-left: 35px"/>
                    </td>
                    <td>
                        <span style="color: Blue">계단 이동 시에는 난간을 사용하고, 천천히 한 계단씩 이동합니다.</span><br />
                        Khi di chuyển trên cầu thang, sử dụng tay vịn, di chuyển từng bậc chậm rãi.
                    </td>
                </tr>
            </table>
        </div>
         </div>
        <div>
            <h3 style="text-align: center; margin-top:40px">
                보안 준수 사항<br />
                HẠNG MỤC BẢO AN CẦN TUÂN THỦ
                <br />
            </h3>
             <div class="view1" >
              <div style="height:30px"></div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                        <img src="../../images/esd/icon7.png"  style=" margin-left: 35px; width:65px" />
                    </td>
                    <td>
                        <span style="color: Blue">사내에서 항시 방문증을 패용하여 주십시오.</span><br />Luôn đeo thẻ khách trong công ty.
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                        <img src="../../images/esd/icon8.png" style=" margin-left: 35px; width:65px" />
                    </td>
                    <td>
                        <span style="color: Blue">사내에서 이동 시에는 반드시 당사 직원과 동행해야 합니다.</span><br />
                        Khi di chuyển trong công ty, phải luôn đi cùng nhân viên công ty
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                        <img src="../../images/esd/icon9.png" width="60px"  style="margin-left:35px"/>
                    </td>
                    <td>
                        <span style="color: Blue">휴대폰 봉인 스티커 부착에 협조하여 주십시오.</span>
                        <br />
                        Hợp tác khi được yêu cầu dán sticker camera điện thoại
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                       <img src="../../images/esd/icon10.png" width="85px"  style="margin-left:35px"/>
                    </td>
                    <td>
                      <span style="color:Blue">출문시 차량/소지품 검사에 협조하여 주십시오.</span><br />
                        Hợp tác khi có yêu cầu kiểm tra xe/hành lý khi ra cổng
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                       <img src="../../images/esd/icon11.PNG" width="100px" height="100px" style="margin-left:25px"/>
                    </td>
                    <td><span style="color:Blue">
                      저장 및 촬영매체는 반입이 금지되어 있습니다. 보안실에 보관하여 주시기 바랍니다.</span>
                        <br />
                        Không được phép mang thiết bị quay phim chụp ảnh hoặc lưu trữ vào công ty. Vui lòng
                        bảo quản tại Phòng bảo vệ.
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                      <img src="../../images/esd/icon12.PNG" width="100px" height="100px" style="margin-left:25px" />
                    </td>
                    <td><span style="color:Blue">
                        사내 물품을 임의 반출할 수 없습니다. 사전에 반출신고를 진행해야 합니다.</span><br />
                        Không thể tự ý mang đồ ra ngoài công ty. Cần phải khai báo trước.
                    </td>
                </tr>
            </table>
        </div>
        <div style="margin-top:15px; text-align: center;">
           
            <img src="../../images/esd/icon13.JPG" alt="" height="" style="margin:10px"><br />
        </div>
         <div style="height:50px"></div>
        </div>
        
    </div>
        <div>
            <h3 style="text-align: center; margin-top: 40px">
               안전보건 준수 사항 <br />HẠNG MỤC AN TOÀN SỨC KHỎE CẦN TUÂN THỦ 
             </h3>
      
             <div class="view1" >
               <div style="height:20px"></div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                       <img  src="../../images/esd/icon14.png"  style="margin-left:40px ;width:65px"  />
                    </td>
                    <td>
                        <span style="color:Blue">작업 전에는 안전작업허가를 받아야 합니다.</span> <br />
                Trước khi tiến hành công việc, phải có giấy phép làm việc an toàn
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                        <img src="../../images/esd/icon15.png" style="margin-left:35px ;width:80px" />
                    </td>
                    <td>
                        <span style="color:Blue">차량 운행 속도는 20KM/H이하이며, 운전, 보행 중 휴대폰  사용을 금지합니다.</span> <br />
                Tốc độ lái xe dưới 20KM/H, không dùng điện thoại trong khi đang lái xe hoặc đi bộ.
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                       <img  src="../../images/esd/icon16.png" width="80px"  style="margin-left:35px"/>
                    </td>
                    <td>
                        <span style="color: Blue">지정된 흡연구역 외에는 모든 구역이 금연구역 입니다.</span> <br />
                Ngoại trừ khu vực hút thuốc được chỉ định, tất cả các khu vực đều cấm hút thuốc
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                       <img src="../../images/esd/icon17.png" width="80px" style="margin-left:35px"/>
                    </td>
                    <td>
                      <span style="color:Blue">운전 또는 작업 중에 음주를 금지합니다.</span> <br />Cấm uống rượu trong khi làm việc hoặc lái xe
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                       <img src="../../images/esd/icon18.png" width="70px" style="margin-left:35px"/>
                    </td>
                    <td><span style="color:Blue">
                     보수 작업 또는 건축 작업 등 작업 현장 내 출입시 안전 보호구를 반드시 착용해야 합니다.</span> <br />
                Trường hợp xây dựng hoặc sửa chữa, khi ra vào nơi làm việc phải mặc đồ bảo hộ an toàn
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td style="width: 180px; height: 100px">
                      <img src="../../images/esd/icon19.png" width="85px"  style="margin-left:35px" />
                    </td>
                    <td><span style="color:Blue">
                        중장비가 작업하는 구역 아래는 이동을 금지합니다.</span> <br />
                Không di chuyển dưới khu vực đang thực hiện công việc với thiết bị nặng.
                    </td>
                </tr>
            </table>
        </div>
         <div style="height:30px"></div>
        </div>
        </div>
          <div style="height:40px"></div>
        <div>
        <span style="color:Blue">위반 사항이 발견될 경우 업무 중이라도 강제 출문될 수 있습니다. </span><br />Trường hợp phát hiện vi phạm, có thể bị cưỡng chế ra khỏi công ty dù đang làm việc.<br />
              <span style="color:Blue">  다시 한번 내방객 여러분의 건강과 안전을 위하여 안전/보안 담당자의 지시에 성실히 따라 주시기를 부탁드립니다</span><br />
              Vì sự an toàn và sức khỏe của khách đến thăm, một lần nữa, vui lòng tuân thủ những yêu cầu của người phụ trách an toàn/bảo an.<br /></td>
              <span style="color:Blue">
                하나마이크론 비나는 내방객 여러분의 안전을 보장하고, 사내 정보 자산을 보호하기 위하여 많은 노력을 하고 있습니다</span><br />
               Công ty TNHH Hana Micron vina đang nỗ lực hết mình để bảo đảm an toàn cho các vị khách đến thăm cũng như bảo vệ tài sản, thông tin nội bộ của công ty<br />
               <span style="color:Blue">
                     내방객 여러분들은 아래의 사항을 준수해야 하며 문제 사항이 발견될 경우 사내 담당자에게 내용을 즉시 전달해야 합니다</span><br />
                     Khách đến thăm cần tuân thủ các hạng mục sau, khi phát sinh vấn đề cần thông báo ngay nội dung cho người phụ trách trong công ty.         
    </div>
    <br />
    <br />
     <asp:CheckBox ID="CheckBox1" runat="server" Text="<span style='color:Blue'>본인은 상기 사항을 준수할 것이며, 규정에 위반되는 행위를 할 경우 어떠한 처벌도 감수하겠습니다</span><br/>(Tôi sẽ tuân thủ các hạng mục trên, và xin chịu bất kỳ hình phạt nào nếu có hành vi vi phạm quy định)"    OnCheckedChanged="CheckBox1_CheckedChanged"></asp:CheckBox>
        <p style="color: Red">
                *Đọc xong nút Đồng ý điều khoản sẽ hiện ra</p>
            <asp:Button runat="server" ID="name1" Text="Đồng Ý/ 동의" OnClick="name1_Click" Style="float: right;
                margin-left: 20px" CssClass="btn btn-primary" />
            <asp:Button ID="Button1" runat="server" Text="Quay Lại/뒤" OnClick="Unnamed1_Click" CssClass="btn btn-primary"
                Style="float: right" /><div>
           <b> Khách Thăm:</b> <asp:Label ID="showname" runat="server" Font-Size="20px" Font-Bold ForeColor=""></asp:Label><br />
        
         </div>
    </form>
    <div style="height: 200px">
    </div>
</body>
</html>
