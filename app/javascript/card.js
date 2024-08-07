window.addEventListener('turbo:load', () => {
  const pay = () => {
    const publicKey = gon.public_key
    if (typeof window.payjpInstance === 'undefined') {
      window.payjpInstance = Payjp(publicKey); // PAY.JPテスト公開鍵
    }
    const payjp = window.payjpInstance;
    
    const elements = payjp.elements();
    const numberElement = elements.create('cardNumber');
    const expiryElement = elements.create('cardExpiry');
    const cvcElement = elements.create('cardCvc');

    numberElement.mount('#number-form');
    expiryElement.mount('#expiry-form');
    cvcElement.mount('#cvc-form');

    const form = document.getElementById('charge-form');
    if (!form) {
      return;
    }

    form.addEventListener("submit", (e) => {
      e.preventDefault();

      payjp.createToken(numberElement).then(function (response) {
        if (response.error) {
          alert("カード情報が正しくありません。もう一度確認してください。");
        } else {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='token' type="hidden">`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
        numberElement.clear();
        expiryElement.clear();
        cvcElement.clear();
        document.getElementById("charge-form").submit();
      });
    });
  };

  pay();
});
window.addEventListener("turbo:render", pay);