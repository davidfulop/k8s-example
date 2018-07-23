using System.Net;
using System.Threading.Tasks;
using NUnit.Framework;

namespace K8sExample.SmokeTests
{
    public class ValuesControllerTests
    {
        [Test]
        public async Task Returns_200OK()
        {
            var request = WebRequest.Create("http://localhost:80/values");
            var response = await request.GetResponseAsync() as HttpWebResponse;

            Assert.AreEqual(HttpStatusCode.OK, response.StatusCode, $"Unexpected {response.StatusCode} status.");
        }
    }
}
