window.addEventListener("turbo:load",function(){
  const itemPrice = document.getElementById("item-price");
  if (!itemPrice) {return false;}
    itemPrice.addEventListener("input",function(){
      const addTaxPrice = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit");
      const itemAmount= itemPrice.value
      addTaxPrice.innerHTML = Math.floor(itemAmount * 0.1);
      profit.innerHTML = Math.floor(itemAmount - addTaxPrice.innerHTML);
    })
});