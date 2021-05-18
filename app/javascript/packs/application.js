// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

const handleNoticeRemoval = () => {
  let div = document.getElementById("alert-div");
  div.addEventListener("click", _e => {
    div.style.display = "none";
  });
};

const handleNoticeDisappearance = () => {
  let div = document.getElementById("alert-div");
  div.style.display = "none";
};

setTimeout(() => {
  handleNoticeRemoval();
}, 0);

setTimeout(() => {
  handleNoticeDisappearance();
}, 5000);
