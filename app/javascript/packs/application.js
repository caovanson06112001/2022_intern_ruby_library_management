// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
require("login/jquery-3.2.1.min")
require("login/animsition.min")
require("login/select2.min")
require("admin/sweetalert2.all.min")
require("login/main")
Turbolinks.start()
ActiveStorage.start()
