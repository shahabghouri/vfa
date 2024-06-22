using VfA.Models.DTOs;

namespace VfAWeb.Utilities
{
    public class SatimPayment
    {
        private readonly string userName = "";
        private readonly string password = "";
        readonly HttpClient _httpClient;
        public SatimPayment()
        {
            _httpClient = new HttpClient();
            _httpClient.BaseAddress = new Uri("https://test.satim.dz/payment/rest/");
        }
        public async Task<SatimRegisterOrderResponse> Subscribe(long amount, int orderNumber, string description)
        {
            var parameters = new
            {
                userName,
                password,
                amount,
                orderNumber,
                description,
                currency = "012",
                returnUrl = "",
                failUrl = "",
                language = "en",
                jsonParams = new
                {
                    force_terminal_id = "E005005097",
                    udf1 = "2018105301346"
                }
            };
            var result = await _httpClient.PostAsJsonAsync("register.do", parameters);
            if (result.IsSuccessStatusCode)
            {
                var response = await result.Content.ReadFromJsonAsync<SatimRegisterOrderResponse>();
                if (response != null)
                {
                    return response;
                }
            }
            return null;
        }
        public async Task<SatimConfirmOrderResponse> ConfirmOrder(int orderNumber)
        {
            var parameters = new
            {
                userName,
                password,
                orderNumber
            };
            var result = await _httpClient.PostAsJsonAsync("confirmOrder.do", parameters);
            if (result.IsSuccessStatusCode)
            {
                var response = await result.Content.ReadFromJsonAsync<SatimConfirmOrderResponse>();
                if (response != null)
                {
                    return response;
                }
            }
            return null;
        }
    }
}
