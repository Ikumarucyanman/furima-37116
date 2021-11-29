const pay = () => {
  Payjp.setPublicKey("pk_test_8d78d1f9425f3c1a7f9392d7");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_shipping[number]"),
      exp_month: formData.get("order_shipping[exp_month]"),
      exp_year: `20${formData.get("order_shipping[exp_year]")}`,
      cvc: formData.get("order_shipping[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);