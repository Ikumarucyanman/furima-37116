window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = inputValue * 0.1;
    const priceProfit = document.getElementById("profit");
      priceProfit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
  })
});