<%@ Page Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="companyView.aspx.cs" Inherits="admin_car_carCategoryView" Title="Xem chi tiết (상세보기)" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" CssClass="contents_title"></asp:Label><br /><br />
	<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White"
		BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ObjectDataSource1"
		ForeColor="Black" GridLines="Horizontal" Height="50px" Width="100%" OnDataBound="DetailsView1_DataBound" CssClass=" table table-bordered">
		<FooterStyle BackColor="#CCCC99" ForeColor="Black" />
		<EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
		<Fields>
			<asp:BoundField DataField="CompanyCode" HeaderText="Code (코드)" SortExpression="CompanyCode" />
			<asp:BoundField DataField="CompanyName" HeaderText="Tên công ty (회사명)" SortExpression="CompanyName" />
			<asp:BoundField DataField="MasterName" HeaderText="Tên người đại diện (대표자명)" SortExpression="MasterName" />
			<asp:BoundField DataField="Phone1" HeaderText="Số điện thoại (전화번호)" SortExpression="Phone1" />
			<asp:BoundField DataField="Phone2" HeaderText="Phone2" SortExpression="Phone2" />
			<asp:BoundField DataField="Phone3" HeaderText="Phone3" SortExpression="Phone3" />
			<asp:BoundField DataField="RegNumber1" HeaderText="mã kinh doanh (사업자번호)" SortExpression="RegNumber1" />
			<asp:BoundField DataField="RegNumber2" HeaderText="RegNumber2" SortExpression="RegNumber2" />
			<asp:BoundField DataField="RegNumber3" HeaderText="RegNumber3" SortExpression="RegNumber3" />
            <asp:BoundField DataField="RegNumber4" HeaderText="RegNumber4" SortExpression="RegNumber4" />
			<asp:BoundField DataField="Address" HeaderText="Địa chỉ (주소)" SortExpression="Address" />
			<asp:BoundField DataField="CompanyManagementNo" HeaderText="사업장관리번호" SortExpression="CompanyManagementNo" />
			<asp:BoundField DataField="CompanyStartNo" HeaderText="사업개시번호" SortExpression="CompanyStartNo" />
			<asp:BoundField DataField="RegDate" HeaderText="Ngày đăng ký (등록일)" SortExpression="RegDate" />
			<asp:BoundField DataField="EmployeeName" HeaderText="Người đăng ký (등록자)" SortExpression="EmployeeName" />
            <asp:BoundField DataField="EmployeeDept" HeaderText="Bộ phận đăng ký (신청부서)" SortExpression="EmployeeDept" >	</asp:BoundField>

			<asp:HyperLinkField />
		</Fields>
		<HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
	</asp:DetailsView>
	<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="getCompany"
		TypeName="HanaMicron.COMS.BLL.Company">
		<SelectParameters>
			<asp:QueryStringParameter Name="companyCode" QueryStringField="companyCode" Type="String" />
		</SelectParameters>
	</asp:ObjectDataSource>
</asp:Content>

