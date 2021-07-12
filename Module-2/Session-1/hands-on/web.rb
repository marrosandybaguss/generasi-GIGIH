require 'sinatra'

listItem = {name: [], harga: []}

get '/' do
    'Hello World'
end

get '/messages' do
    "<h1 style=\"background-color:yellow;\">Hello World</h1>"
end

# get '/messages/:name' do
#     name = params['name']
#     "<h1 style=\"background-color:yellow\">Hello #{name}</h1>"
# end

# get '/messages/:name' do
#     name = params['name']
#     color = params['color'] ? params['color'] : "yellow"
#     "<h1 style=\"background-color:#{color}\">Hello #{name}</h1>"
# end

get '/messages/:name' do
    name = params['name']
    color = params['color'] ? params['color'] : "yellow"
    erb :message, locals: {
        color: color,
        name: name
    }
end

post '/login' do
    if params['username'] == 'admin' && params['password'] = 'admin'
        return "Logged in!"
    else
        redirect "/login"
    end
end

get '/login' do
    erb :login
end

post '/item' do
    name = params['name']
    harga = params['harga']

    listItem[:name] << name
    listItem[:harga] << harga

    erb :show_item, locals: {
        name: listItem[:name],
        harga: listItem[:harga]
    }

end

get '/item' do
    erb :item
end