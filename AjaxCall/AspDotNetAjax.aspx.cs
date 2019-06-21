using System;
using System.Web.Services;

namespace AjaxCall
{
    public partial class AspDotNetAjax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod()]
        public static int AddTwoNumbers(int firstNumber, int secondNumber)
        {
            int total = default(int);
            total = firstNumber + secondNumber;
            return total;
        }
    }
}