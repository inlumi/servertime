using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace servertime
{
    public partial class ServerTimePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        static TimeSpan timeOffset = new TimeSpan(0, 0, 0);
        static TimeSpan newHour = new TimeSpan(1, 0, 0);

        [System.Web.Services.WebMethod]
        public static string GetDate()
        {
            return (DateTime.Now + timeOffset).ToString("MM/dd/yy H:mm:ss");
        }

        [System.Web.Services.WebMethod]
        public static string PlusHour()
        {
            timeOffset += newHour;
            return true.ToString();
        }

        [System.Web.Services.WebMethod]
        public static string MinusHour()
        {
            timeOffset -= newHour;
            return true.ToString();
        }
    }
}