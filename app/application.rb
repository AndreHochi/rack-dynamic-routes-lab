class Application

    @@item = [Item.new("Sorry", "Justin Bieber"), 
        Item.new("Hello","Adele")]
  
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
            if req.path.match(/items/)
                item_name = req.path.split("/songs/").last
                item = @@item.find{|s| s.name == item_name}
                if item == nil
                    resp.write "ERROR"
                    resp.status = 404
                else
                    resp.write item.price
                    resp.status = 200
                end
            else
                resp.write "Route not found"
                resp.status = 404
            end

        resp.finish
    end
end 