using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace characterToKana
{
    public partial class characterToKana : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            hz2.Attributes.Add("onfocus", "BsmWebKanaInput.Focus('pjm2');");
            hz2.Attributes.Add("onblur", "BsmWebKanaInput.Blur();");
            hz2.Attributes.Add("onkeydown", "if (!OnKeyDownByEdit(event)) {return false;} else {BsmWebKanaInput.Keydown();}");
            hz2.Attributes.Add("onkeyup", "BsmWebKanaInput.Keyup();");
            //}

        }
    }
}