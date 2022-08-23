import consumer from "./consumer"

document.addEventListener("turbolinks:load", () => {
  var user = $("#btn-comment").data("user")
  var book = $("#btn-comment").data("book")
  var url = window.location;
  var arr = url.toString().split('/');

  consumer.subscriptions.create({channel: "CommentChannel"}, {
    connected() {
    },

    disconnected() {
    },

    received(data) {
      if(arr.includes("admin")){
        console.log(data)
        toastr.success(I18n.comments.now, "", {"closeButton": true})
      }
      if(arr.includes("product")){
        console.log(data)
        toastr.success(I18n.comments.now, "", {"closeButton": true})
      }
    }
  });
});
