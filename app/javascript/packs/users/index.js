document.addEventListener("DOMContentLoaded", () => {
  const questions = document.querySelectorAll('#list-hover');
  questions.forEach(q => {
    q.addEventListener("mouseover", () => {
      q.classList.add("active");
    });

    q.addEventListener("mouseout", () => {
      q.classList.remove("active");
    });
  });
});