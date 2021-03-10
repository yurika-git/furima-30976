
 window.addEventListener('load', () => {
  // 金額を入力した数値をpriceInputという変数に格納する
 const priceInput = document.getElementById("item-price")
 priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = (Math.floor(inputValue * 0.1))
  const addProfit = document.getElementById("profit");
  addProfit.innerHTML = (Math.floor(inputValue - addTaxDom.innerHTML))
  })
})