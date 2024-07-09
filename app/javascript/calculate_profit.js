window.addEventListener('turbo:load', () => {
  console.log("Turbo load event triggered for calculate_profit.js");

  const calculateProfit = () => {
    const priceElement = document.getElementById('item-price');
    if (!priceElement) return;

    const price = priceElement.value;
    const commission = Math.floor(price * 0.1);
    const profit = Math.floor(price - commission);
    document.getElementById('add-tax-price').textContent = commission;
    document.getElementById('profit').textContent = profit;
  };

  const priceElement = document.getElementById('item-price');
  if (priceElement) {
    priceElement.addEventListener('input', calculateProfit);
  }
});

window.addEventListener('turbo:render', () => {
  console.log("Turbo render event triggered for calculate_profit.js");

  const calculateProfit = () => {
    const priceElement = document.getElementById('item-price');
    if (!priceElement) return;

    const price = priceElement.value;
    const commission = Math.floor(price * 0.1);
    const profit = Math.floor(price - commission);
    document.getElementById('add-tax-price').textContent = commission;
    document.getElementById('profit').textContent = profit;
  };

  const priceElement = document.getElementById('item-price');
  if (priceElement) {
    priceElement.addEventListener('input', calculateProfit);
  }
});