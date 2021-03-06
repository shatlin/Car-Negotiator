using System.Web.Mvc;
using System.Web.Routing;

namespace CarNegotiator
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
    name: "Dealer",
    url: "Dealer",
    defaults: new { controller = "Dealer", action = "Login" }
);

            routes.MapRoute(
name: "Apply",
url: "Apply",
defaults: new { controller = "Car", action = "Apply" }
);

            routes.MapRoute(
            name: "Admin",
            url: "Admin",
            defaults: new { controller = "Admin", action = "Login" }
        );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Client", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
