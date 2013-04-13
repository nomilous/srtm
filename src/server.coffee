http     = require 'http'
assets   = require 'connect-assets'
express  = require 'express'
topology = require './topology'

module.exports = 

    start: (root) -> 

        app = express()

        app.set 'views', root + '/views'
        app.set 'view engine', 'jade'
        app.use express.logger 'dev'
        app.use assets()
        app.use express.static root + '/public'

        app.get '/', (req, res) -> res.render 'index'
        app.get '/main_controller.html', (req, res) -> res.render 'main_controller'
        app.get '/topology/:tile', (req, res) -> res.send topology.getTile req.params.tile


        http.createServer( app ).listen 3000, -> console.log 'http://localhost:3000'
