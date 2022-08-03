import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
require("jquery")
require("admin/popper.min")
require("admin/perfect-scrollbar.min")
require("admin/bootstrap.min")
require("admin/pcoded.min")

Turbolinks.start()
ActiveStorage.start()
