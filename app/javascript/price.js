function calculation (){
  
  const price = document.getElementById("item-price")
  const commission = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener("input", () => {
    const commission_price = Math.floor(price.value * 0.1)
    const profit_price = Math.floor(price.value * 0.9)
    commission.innerHTML = commission_price;
    profit.innerHTML = profit_price;
  })
 };
 
 window.addEventListener('load', calculation);