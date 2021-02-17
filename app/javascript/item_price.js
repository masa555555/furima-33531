const { formEnableSelector } = require("@rails/ujs");

window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item-price");
  
    priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    

    const gain = document.getElementById("profit");
    total_amount = inputValue * 0.1
    
    gain.innerHTML = (Math.floor(inputValue - total_amount));
    
     
    
    
    
    
  })
  
});