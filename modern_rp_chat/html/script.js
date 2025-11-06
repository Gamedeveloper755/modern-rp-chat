const chat = document.getElementById("messages");

window.addEventListener("message", (event) => {
    const data = event.data;

    if (data.action === "addMessage") {
        const msg = document.createElement("div");
        msg.classList.add("message");
        msg.innerHTML = `<strong style="color:${data.color}">${data.name}</strong> ${data.message}`;
        chat.appendChild(msg);

        if (chat.childElementCount > 30) {
            chat.removeChild(chat.firstChild);
        }
    }

    if (data.action === "clear") {
        chat.innerHTML = "";
    }
});
