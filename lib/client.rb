class Client
  attr_reader(:name, :contact_number, :gender, :id)

  def initialize(attributes)
    @name = attributes(:name)
    @contact_number = attributes(:contact_number)
    @gender = attributes(:gender)
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
end
