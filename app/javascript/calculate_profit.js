function calculateProfit() {
  const price = document.getElementById('item-price').value;
  const commission = price * 0.1;
  const profit = price - commission;
  document.getElementById('add-tax-price').textContent = commission;
  document.getElementById('profit').textContent = profit;
}


window.addEventListener('turbo:load', item);