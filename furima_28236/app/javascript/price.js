window.onload = function() {
  if (!document.getElementById("item-price")) {
  } else {
    const item_price = document.getElementById("item-price");
    const tax_price = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    if (tax_price.innerHTML == undefined) {
      tax_price.innerHTML = 0 ;
    } else {
      tax_price.innerHTML = Math.round((item_price.value) * 0.1);
    }
    if (profit.innerHTML == undefined) {
      profit.innerHTML = 0 ;
    } else {
      profit.innerHTML = Math.round((item_price.value) * 0.9);
    }
    item_price.addEventListener("keyup", (e) => {
      tax_price.innerHTML = Math.round((item_price.value) * 0.1);
      profit.innerHTML = Math.round((item_price.value) * 0.9);
    })
  }

}
function price() {
}
window.addEventListener("load", price);