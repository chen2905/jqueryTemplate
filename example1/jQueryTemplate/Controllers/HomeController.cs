using System.Web.Mvc;
using jQueryTemplate.Models;

namespace jQueryTemplate.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            // Initiate checkboxes
            CheckBoxRepository.Initiate();
            return View();
        }

        [HttpPost]
        public ActionResult GetCheckBoxesData()
        {
            return Json(CheckBoxRepository.GetCheckBoxes());
        }
    }
}
