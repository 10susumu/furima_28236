const pay = () => {
  Payjp.setPublicKey("pk_test_090a426a9c713b6ee1b865b7");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: 4242424242424242,
      cvc: 123,
      exp_month: 3,
      exp_year: 2024
      // number: formData.get("number"),
      // cvc: formData.get("cvc"),
      // exp_month: formData.get("exp_month"),
      // exp_year: `20${formData.get("exp_year")}`
    };
      
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
  
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
      }
    });
  });
};

window.addEventListener("load", pay);