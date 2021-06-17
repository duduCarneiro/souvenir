const bigBrown = () => {
  const brown = document.getElementById('brown');
  if (brown) {
    const bubble2 = document.querySelector(".speech-bubble2");
    const click = document.querySelector(".clique-brown");
    click.addEventListener('click', (event) => {
      brown.classList.toggle('brownBig');
      bubble2.classList.toggle('speech-bubble2hidden');
    });
  };
};

export { bigBrown };
