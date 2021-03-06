using System;
using System.Collections.Generic;
using System.Text;
using HanaMicron.COMS.Model;

namespace HanaMicron.COMS.IDAL
{
	/// <summary>
	/// 거래처 DAL  Interface
	/// </summary>
	public interface ICompany
	{
		/// <summary>
		/// 거래처 정보 가져오기
		/// </summary>
		/// <param name="companyCode"></param>
		/// <returns></returns>
		CompanyInfo getCompany(String companyCode);

		/// <summary>
		/// 거래처 목록
		/// </summary>
		/// <param name="keyWord"></param>
		/// <param name="key"></param>
		/// <param name="pageNo"></param>
		/// <param name="pageSize"></param>
		/// <returns></returns>
		List<CompanyInfo> getCompanyList(String keyWord, String key,Int32 approve,String employeeCode);

		/// <summary>
		/// 거래처 총 숫자
		/// </summary>
		/// <param name="keyWord"></param>
		/// <param name="key"></param>
		/// <returns></returns>
		Int32 getCompanyTotal(String keyWord, String key, Int32 approve, String employeeCode);

		/// <summary>
		/// 거래처 수정
		/// </summary>
		/// <param name="company"></param>
		/// <returns></returns>
		int updateCompany(CompanyInfo company);

		/// <summary>
		/// 거래처 저장
		/// </summary>
		/// <param name="company"></param>
		/// <returns></returns>
		int insertCompany(CompanyInfo company);

		/// <summary>
		/// 거래처 삭제
		/// </summary>
		/// <param name="companyCode"></param>
		/// <returns></returns>
		int deleteCompany(Int32 companyCode);

		/// <summary>
		/// 이미 등록된 거래처 여부
		/// </summary>
		/// <param name="regNumber1"></param>
		/// <param name="regNumber2"></param>
		/// <param name="regNumber3"></param>
		/// <param name="companyName"></param>
		/// <returns></returns>
		bool existsComapny(String regNumber1, String regNumber2, String regNumber3, String companyName);


        /// <summary>
        /// 오토 메일 발송
        /// </summary>
        /// <param name="regNumber1"></param>
        /// <param name="regNumber2"></param>
        /// <param name="regNumber3"></param>
        /// <param name="companyName"></param>
        /// <returns></returns>
        void CreateHtml(CompanyInfo company);

	}
}
