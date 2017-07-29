using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(webforms.Startup))]
namespace webforms
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
