class Client
  attr_reader(:name, :contact_number, :gender, :id)

  def initialize(attributes)
    @name = attributes[:name]
    @contact_number = attributes[:contact_number]
    @gender = attributes[:gender]
    @id = attributes.fetch(:id, nil)
  end

  def self.all
    return_clients = DB.exec("Select * FROM clients;")
    clients = []
    return_clients.each do |client|
      current_client = Client.new(:name => client['name'], :contact_number => client['contact_number'], :gender => client['gender'], :id => client['id'].to_i)
      clients.push(current_client)
    end
    clients
  end
  def save
    result = DB.exec("INSERT INTO clients(name, contact_number, gender) VALUES ('#{@name}', '#{@contact_number}', '#{@gender}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end
  def self.find(id)
    found_client = DB.exec("SELECT * FROM clients WHERE id = '#{id}'").first
    Client.new(:name => found_client['name'], :contact_number => found_client['contact_number'], :gender =>found_client['gender'], :id => found_client['id'].to_i)
  end
  def ==(another_client)
   (self.name && self.contact_number && self.gender) == (another_client.name && another_client.contact_number && another_client.gender)
 end
end
