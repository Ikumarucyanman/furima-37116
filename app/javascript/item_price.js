window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const priceContent1 = document.getElementById("add-tax-price");
  const priceContent2 = document.getElementById("profit");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  })
});