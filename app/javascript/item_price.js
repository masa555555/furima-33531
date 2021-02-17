const { formEnableSelector } = require("@rails/ujs");

window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  console.log(priceInput);
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(addTaxDom)

    const gain = document.getElementById("profit");
    total_amount = inputValue * 0.1
    console.log(total_amount)
    gain.innerHTML = (Math.floor(inputValue - total_amount));
    console.log(gain);
     
    
    
    
    
  })
  
});