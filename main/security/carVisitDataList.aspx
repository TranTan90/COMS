<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="carVisitDataList.aspx.cs" Inherits="main_security_carVisitDataList"
    Title="Chi tiết đăng ký (신청 내역)" EnableViewState="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="../../include/Calender/js/jsCalendar.js" type="text/javascript"></script>
    <script src="../../include/Calender/js/jsCalendar.datepicker.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
var arrHandler;
var arrEp;
// ajax ready?
var request = false;
try {
	request = new XMLHttpRequest();
} catch (trymicrosoft) {
	try {
		request = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (othermicrosoft) {
		try {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (failed) {
			request = false;
		}
	}
}
if (!request) alert("Error initializing XMLHttpRequest!");

function confirmDelete(url){
    if(confirm('Không thể khôi phục dữ liệu đã bị xóa. \n\nCó chắc chắn xóa không? (한번 삭제된 데이터는 복구가 불가능합니다.\n\n정말로 삭제하시겠습니까?)')){
        window.location=url;
    }else{
        return false;
    }
}

function change(){
    var f = document.forms[0];
    var selectCar = f.slCarType.value;
    var output = document.getElementById('output');

    if(selectCar == '3') output.style.display='block';
    else output.style.display='none';
}

// 차량번호 숫자 체크  check số xe (chỉ số)
function numCheck(){
    var f=document.forms[0];
    
    if(isNaN(f.<%=txtCarNo.ClientID%>.value)){
        alert('Chỉ nhập số (숫자만 입력하여 주세요)');
        f.<%=txtCarNo.ClientID%>.focus();
        f.<%=txtCarNo.ClientID%>.value='';
        return false;
        }
}

function selectThisEp(carCode, carHeader, carNumber, carType, company, companyCode){
    var f=document.forms[0];

    //alert(company);
    f.txtCarCode.value=carCode;
    f.<%=txtHeader.ClientID%>.value=carHeader;
    f.<%=txtCarNumer.ClientID%>.value=carNumber;    
    f.companyName.value=decodeURI(company);
    f.slCarType.value=carType;
    f.companyCode.value=companyCode;     

    if(carHeader == ''){
        f.txtUpdate.value = 'yes';
        //document.getElementById('searchImg').style.display='block';
    }else{
        f.txtUpdate.value = 'no';
    }    

    
    change();
    closeDiv();
    getHandlerDataInfo();      
}

function closeDiv(){	
	searchCar.style.display='none';
}

// ajax 호출
function getCarDataInfo(){
    numCheck();
	if(document.getElementById('<%=txtCarNo.ClientID%>').value.length >=1){
		var url='../car/visitCarSearch.aspx?&type=carData&number='+escape(document.getElementById('<%=txtCarNo.ClientID%>').value);
		//alert(url);
		request.open('GET',url,false);
		request.onreadystatechange = showCarDataInfo; // call back method
		request.send(null);		
	}
}

// ajax call back method
function showCarDataInfo(){
	if(request.readyState == 4){
		if(request.status== 200){
		    var f=document.forms[0];
			var response = request.responseText;
			var arrStr=response.split(':|:');			
			
			// 아무정보가 없을때 length가 1이기에.. 1보다 크면(즉 데이타 있으면..)
			if(arrStr.length > 1) {
			    searchCar.style.display='block';
		        var html='<table>';
		        html+='<tr>';
		        for(var i=1;i<arrStr.length;i++){
			        var arrEp=arrStr[i].split(',');

                    html+="<td style='cursor:hand;background-color: PaleGreen' onclick=selectThisEp('"+arrEp[0]+"','"+arrEp[1]+"','"+arrEp[2]+"','"+arrEp[3]+"','"+encodeURI(arrEp[4])+"','"+arrEp[5]+"')>"+arrEp[1]+ " "+arrEp[2]+" / "+arrEp[3]+" / " +arrEp[4]+"</td>";
			        html+='</tr>';
		        }
		        html+="<td style='cursor:hand;background-color: Orange' onclick=selectThisEp('','','','','','')>===Thêm mới (신규 추가)===</td>";                
		        //html+="<td style='cursor:hand' onclick=closeDiv()>==신규추가==</td>";
		        html+='</tr>';
		        html+='</table>';
		        searchCar.innerHTML=html;
            }
            // 데이타가 없으면 해당 form 초기화 // nếu không có dữ liệu thì khởi tạo from tương ứng
            else
            {
                searchCar.style.display='none';
            }
            
            //getHandlerDataInfo();
            
		}else if(request.status == 404){
			alert('request url does not exist!');
		}else{
			alert('status code is = ' + request.status);
		}
	}
}

function getHandlerDataInfo(){
   	if(document.getElementById('txtCarCode').value.length >=1){
		var url='../car/visitCarSearch.aspx?&type=handlerData&carCode='+escape(document.getElementById('txtCarCode').value);		
		//alert(url);
		request.open('GET',url,false);
		request.onreadystatechange = showHandlerDataInfo; // call back method
		request.send(null);
		selectHandler();
	}
	else{
	    //화면 display 초기화 & select Box 초기화  / khởi tạo màn hình display và khởi tạo select Box
		document.getElementById('handler').style.display='revert';
	    document.getElementById('selectHandler').style.display='none';
		document.forms[0].slHandler.length=0;		
	}
}

// ajax call back method
function showHandlerDataInfo(){
	if(request.readyState == 4){
		if(request.status== 200){
		    var f=document.forms[0];
			var response = request.responseText;
			var handler = document.getElementById('handler');		
			var selectHandler = document.getElementById('selectHandler');
			
			arrHandler=response.split(':|:');
			//화면 display 초기화 & select Box 초기화 / khởi tạo màn hình display và khởi tạo select Box
			handler.style.display='revert';
		    selectHandler.style.display='none';
			f.slHandler.length=0;
			
			// 아무정보가 없을때 length가 1이기에.. 1보다 크면(즉 데이타 있으면..)	
		    if(arrHandler.length > 1) {
		        for(var i=1;i<arrHandler.length;i++){		        	
    		        arrEp=arrHandler[i].split(',');
                    f.slHandler.add(new Option(arrEp[2],arrEp[2]));
		        }
		        // 마지막 option에 추가    thêm o[tion cuối cùng
		        f.slHandler.add(new Option("==Thêm (추가)==","ADD"));
		        handler.style.display='none';
		        selectHandler.style.display='revert';		        
            }            
		}else if(request.status == 404){
			alert('request url does not exist!');
		}else{
			alert('status code is = ' + request.status);
		}
	}
}

// arrHandler[1] ="carHandlerCode,handler,phone"
// arrEp[0]="carHandlerCode",arrEp[1]="handler",arrEp[2]="phone"
function selectHandler(){
    var f=document.forms[0];
    for(var i=1;i<arrHandler.length;i++){
        arrEp=arrHandler[i].split(',');
        if(f.slHandler.value==arrEp[2]){
            f.<%=txtPhone.ClientID%>.value=arrEp[3];
            f.txtHandlerCode.value=arrEp[0];
            handler.style.display='none';
            addhandler.style.display='none';
        }else if(f.slHandler.value=="ADD"){
            f.<%=txtPhone.ClientID%>.value='';
            f.txtHandlerCode.value='';
            handler.style.display='revert';
            addhandler.style.display='revert';
        }
    }
}

//function employeeSearch(txtObj){
//    var url = '../employee/searchEmployeeSecurity.aspx?name='+escape(txtObj.value);
//    alert(url);
//    newWinByNameByScroll(url,'emplo',600,500)
//}

// 업체 검색 완료  // hoàn thành tìm kiếm công ty
function addNameID(companyName,companyCode){
    var f=document.forms[0];
	f.companyName.value=companyName;    
    f.companyCode.value=companyCode;

    //document.forms[0].companyName.value=companyName;
	//document.forms[0].companyCode.value=companyCode;
}

    </script>
    <script language="javascript" type="text/javascript" src="../../include/js/calendar.js"></script>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <!--################################ 타이틀, 현재위치 시작 ################################-->
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="4" colspan="3">
                        </td>
                    </tr>
                    <tr>
                        <td width="26" style="height: 35px">
                            <img src="/COMS/images/basic/icon_02.gif" width="25" height="20">
                        </td>
                        <td class="contents_title" style="height: 35px">
                            Phòng bảo an (보안실) > Quản lý xe ra vào (차량 입출문 관리)
                        </td>
                        <td align="right" class="location" style="height: 35px">
                            HOME &gt;Phòng bảo an (보안실) >Quản lý xe ra vào (차량 입출문 관리)
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="title_line">
                        </td>
                    </tr>
                </table>
                <!--################################ 타이틀, 현재위치 끝 ################################-->
            </td>
        </tr>
        <tr>
            <td height="10">
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table width="100%">
                    <tr>
                        <td colspan="2">
                            <table>
                                <tr>
                                    <td class="title" style="background-color: #FFFFFF; height: 26px;">
                                        <strong>Tìm kiếm số xe (차량번호 검색) :&nbsp;
                                            <asp:TextBox ID="txtCarNo" runat="server" MaxLength="5" Width="70px"></asp:TextBox>
                                            <div id="searchCar" style="display: none; width: 240px; position: absolute; height: 21px;">
                                            </div>
                                        </strong>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="100%" cellpadding="6" cellspacing="1" style="background-color: #CCCCCC"
                                class="table table-bordered">
                                <tr>
                                    <td style="background-color: #F5F5F5; width: 219px;">
                                        Số xe<br />
                                        (차량번호)
                                    </td>
                                    <td style="background-color: #F5F5F5">
                                        Công ty<br />
                                        (업체)
                                    </td>
                                    <td style="background-color: #F5F5F5">
                                        Phân loại<br />
                                        (구분)
                                    </td>
                                    <td style="background-color: #F5F5F5">
                                        Lái xe<br />
                                        (운전자)
                                    </td>
                                    <td style="background-color: #F5F5F5; display: none;" id="addhandler">
                                        Thêm lái xe<br />
                                        (추가운전자)
                                    </td>
                                    <td style="background-color: #F5F5F5">
                                        Liên lạc<br />
                                        (연락처)
                                    </td>
                                    <td style="background-color: #F5F5F5">
                                        Người phụ trách<br />
                                        (담당자)
                                    </td>
                                    <td style="background-color: #F5F5F5">
                                        Card No.
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color: #FFFFFF; width: 219px;">
                                        <asp:TextBox ID="txtHeader" runat="server" Width="73px" MaxLength="3"></asp:TextBox>
                                        <asp:TextBox ID="txtCarNumer" runat="server" Width="86px" MaxLength="5"></asp:TextBox>
                                    </td>
                                    <td style="background-color: #FFFFFF">
                                        <input type="hidden" name="companyCode" />
                                        <input type="text" name="companyName" size="24" class="input" readonly />
                                        <%--<asp:TextBox ID="txtCompany" runat="server" Width="137px" ReadOnly="True" ></asp:TextBox>                                                      
                            <input type="hidden" name="txtCompanyCode" />--%>
                                        <%--<img id="searchImg" src="../../images/icon/searchKor.gif" onclick="newWinByNameByScroll('../company/searchCompany.aspx','car',700,500)" style="cursor:hand;vertical-align:middle;display: none;" alt="업체 조회" />--%>
                                        <img src="../../images/icon/searchKor.gif" onclick="newWinByNameByScroll('../company/searchCompany.aspx','car',700,500)"
                                            style="cursor: hand; vertical-align: middle" alt="tra cứu công ty (업체 조회)" />
                                    </td>
                                    <td style="background-color: #FFFFFF">
                                        <select name="slCarType" onchange="change()" id="slCarType">
                                            <option value="1">Xe giao hàng (납품차)</option>
                                            <option value="2">Xe nhân viên (임직원차)</option>
                                            <option value="3">Xe công vụ (업무차)</option>
                                            <option value="4">Xe khách thăm (내방객차)</option>
                                            <option value="5">Khác (기타)</option>
                                        </select>
                                    </td>
                                    <td id="selectHandler" style="background-color: #FFFFFF; display: none; height: 26px;">
                                        <select name="slHandler" onchange="selectHandler()" id="Select2">
                                        </select>
                                    </td>
                                    <td id="handler" style="background-color: #FFFFFF; display: revert; height: 26px;">
                                        <input type="text" name="txtHandler" style="width: 87px" />
                                    </td>
                                    <td style="background-color: #FFFFFF">
                                        <asp:TextBox ID="txtPhone" runat="server" Width="104px"></asp:TextBox>
                                    </td>
                                    <td style="background-color: #FFFFFF">
                                        <asp:TextBox ID="txtEmployee" runat="server" Width="140px"></asp:TextBox>
                                    </td>
                                    <td style="background-color: #FFFFFF">
                                        <asp:TextBox ID="txtEtc" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <table>
                                <tr>
                                    <td align="center" style="background-color: #FFFFFF; height: 26px;">
                                        <asp:Button ID="btnInput" runat="server" Text="Xử lý vào cổng (입문 처리)" OnClick="btnInput_Click" />
                                    </td>
                                    <td id="output" style="background-color: #FFFFFF; display: none; height: 26px;">
                                        <asp:Button ID="btnOutput" runat="server" Text="Xử lý ra cổng (출문 처리)" OnClick="btnOutput_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 27px">
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <table width="100%">
                    <tr>
                        <%--			    <td>
			        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
			        <img src="../../images/icon/searchKor.gif" onclick="employeeSearch(<%=txtName.ClientID%>)" style="cursor:hand;vertical-align:middle" alt="Tra cứu người gặp mặt 접견자 조회" />
			    </td>--%>
                        <td align="right" style="height: 27px">
                            <%--<asp:TextBox ID="txtStartDate" runat="server" Width="80px"></asp:TextBox>
					<img src="../../images/icon/calendar.gif" alt="Lựa chọn ngày 날짜선택" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, <%=txtStartDate.ClientID%>,'yyyy-mm-dd',-1,-1);"/>

					<asp:TextBox ID="txtEndDate" runat="server" Width="80px"></asp:TextBox>
					<img src="../../images/icon/calendar.gif" alt="Lựa chọn ngày 날짜선택" style="cursor:hand" align="absmiddle"  onclick="popUpCalendar(this, <%=txtEndDate.ClientID%>,'yyyy-mm-dd',-1,-1);"/>--%>
                            <label>
                                From</label>
                            <asp:TextBox ID="txtStartDate" runat="server" data-datepicker data-format="yyyy-MM-DD"
                                Style="width: 85px"></asp:TextBox>
                            <label>
                                To
                            </label>
                            <asp:TextBox ID="txtEndDate" runat="server" data-datepicker data-format="yyyy-MM-DD"
                                Style="width: 85px"></asp:TextBox>
                            <asp:DropDownList ID="ddlKeyWord" runat="server">
                                <asp:ListItem Value="number">Số xe (차량번호)</asp:ListItem>
                                <asp:ListItem Value="companyName"> Tên công ty (업체명)</asp:ListItem>
                                <asp:ListItem Value="handler"> Lái xe (운전자)</asp:ListItem>
                                <asp:ListItem Value="carType"> Phân loại (구분)</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtKey" runat="server" Width="80px" CssClass="input1" Style="ime-mode: active"></asp:TextBox>
                            <asp:Button ID="Button2" runat="server" Text="Tìm kiếm (검색)" />
                            <asp:Button ID="Button1" runat="server" Text="Tải xuống (다운로드)" OnClick="Button1_Click" />
                            <input type="button" value="In (인쇄)" onclick="window.print()" />
                        </td>
                    </tr>
                </table>
                <table width="100%">
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                CellPadding="3" PageSize="50" OnRowDataBound="GridView1_RowDataBound1" Width="100%"
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                OnPageIndexChanged="GridView1_PageIndexChanged" DataSourceID="ObjectDataSource1"
                                EmptyDataText="Không có nội dung đăng ký (등록 된 내용이 없습니다)." CssClass="table table-stripe">
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <Columns>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Số xe (차량번호)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Số number">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Phân loại (구분)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Tên công ty (업체명)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Ngày (일자)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Vào cổng (입문)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Ra cổng (출문)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Lái xe (운전자)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Liên lạc (연락처)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Người phụ trách (담당자)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Card No.">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <RowStyle ForeColor="#000066" />
                            </asp:GridView>
                            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                CellPadding="3" PageSize="99999" OnRowDataBound="GridView2_RowDataBound1" Width="100%"
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                DataSourceID="ObjectDataSource1" EmptyDataText="Không có nội dung đăng ký (등록 된 내용이 없습니다)."
                                Visible="false">
                                <FooterStyle BackColor="White" ForeColor="#000066" />
                                <Columns>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Số xe (차량번호)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Phân loại (구분)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Tên công ty (업체명)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Ngày (일자)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Vào cổng (입문)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Ra cổng (출문)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Lái xe (운전자)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Liên lạc (연락처)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Người phụ trách (담당자)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CarVistDataCode" HeaderText="Ghi chú (비고)">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                <RowStyle ForeColor="#000066" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectCarVisitDataList"
                                TypeName="HanaMicron.COMS.BLL.Car">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlKeyWord" Name="keyWord" PropertyName="SelectedValue"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="txtKey" Name="key" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtStartDate" Name="searchStartDate" PropertyName="Text"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="txtEndDate" Name="searchEndDate" PropertyName="Text"
                                        Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
            <td width="20" valign="top">
                &nbsp;
            </td>
        </tr>
    </table>
    <input type="hidden" name="txtCarCode" id="txtCarCode" />
    <input type="hidden" name="txtHandlerCode" />
    <input type="hidden" name="txtUpdate" />
</asp:Content>
