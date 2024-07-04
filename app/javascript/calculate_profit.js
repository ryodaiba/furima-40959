window.addEventListener('turbo:load', () => {
  function calculateProfit() {
    const price = document.getElementById('item-price').value;
    const commission = Math.floor(price * 0.1);
    const profit = Math.floor(price - commission);
    document.getElementById('add-tax-price').textContent = commission;
    document.getElementById('profit').textContent = profit;
  }
});
