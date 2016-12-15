require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')
require('pry')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  @stylists = Stylist.all
  @clients = Client.all
  erb(:index)
end

post ('/stylists') do
  name = params['first_name'] + " " + params['last_name']
  @stylist = Stylist.new(:name => name)
  @stylist.save
  @stylists = Stylist.all
  @clients = Client.all
  erb(:index)
end

delete ('/stylist/delete/:id') do
  @stylist = Stylist.find(params['id'].to_i)
  @stylist.delete
  @stylists = Stylist.all
  @clients = Client.all
  erb(:index)
end

get('/stylist/:id/client/new') do
  @current_stylist = params.fetch('id').to_i
  erb(:client_form)
end

post('/') do
  name = params['first_name'] + " " + params['last_name']
  contact_number = params['contact_number']
  gender = params['gender']
  stylist_id = params['stylist_id'].to_i
  @client = Client.new(:name => name, :contact_number => contact_number, :gender => gender, :stylist_id =>stylist_id)
  @client.save
  @stylists = Stylist.all
  @clients = Client.all
  erb(:index)
end

# get ('/stylist/:id/clients') do
#   @stylists = Stylist.all
#   @stylist = params.fetch('id').to_i
#   erb(:index)
# end

get('/stylist/:id/edit') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_update)
end

patch('/stylist/:id') do
  name = params['first_name'] + " " + params['last_name']
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  @stylists = Stylist.all
  @clients = Client.all
  erb(:index)
end

get('/client/:id/edit') do
  @client= Client.find(params.fetch("id").to_i())
  erb(:client_update)
end

patch('/client/:id') do
  name = params['first_name'] + " " + params['last_name']
  contact_number = params['contact_number']
  gender = params['gender']
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:name => name, :phone => contact_number, :gender => gender})
  @stylists = Stylist.all
  @clients = Client.all
  erb(:index)
end

delete('/client/delete/:id') do
  @client = Client.find(params['id'].to_i)
  @client.delete
  @stylists = Stylist.all
  @clients = Client.all
  erb(:index)
end
