import consumer from "./consumer"

consumer.subscriptions.create("CarsChannel", {
    connected() {
        // Called when the subscription is ready for use on the server
    },

    disconnected() {
        // Called when the subscription has been terminated by the server
    },

    received(data) {
        const rentElement = document.querySelector("main.rent")
        if (rentElement) {
            rentElement.innerHTML = data.html
            $(".rent #main").html(data.html)
        }
    }
});
