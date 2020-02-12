// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// load boostrap js
import "bootstrap";
import "../stylesheets/application";

document.addEventListener("turbolinks:load", () => {
  // views/posts/_form.html.rb
  // onChange of tags select, add selected tags to the
  //    textbox
  $('#post_tag_ids').change(function (e) {
    //var selected = $(e.target).val();
    let selected = $("#post_tag_ids option:selected").toArray().map(item => item.text).join();
    console.dir(selected);
    $("#post_all_tags").val(selected);
  });
});

require("trix")
require("@rails/actiontext")
