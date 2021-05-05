import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

// import Flatpickr
import Flatpickr from 'stimulus-flatpickr'

// Import style for flatpickr
require("flatpickr/dist/flatpickr.css")

const application = Application.start(document.documentElement)
const context = require.context('.', true, /_controller\.js$/)
application.load(definitionsFromContext(context))

application.register('flatpickr', Flatpickr)
