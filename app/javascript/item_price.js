window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    console.log("イベント発火");
  })
  const priceContent1 = document.getElementById("add-tax-price");
  const priceContent2 = document.getElementById("profit");
  
  // priceInput.addEventListener("input", () => {
  //   console.log("イベント発火");
  // })
});