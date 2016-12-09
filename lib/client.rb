class Client
  attr_reader(:name, :contact_number, :gender, :stylist_id, :id)

  def initialize(attributes)
    @name = attributes[:name]
    @contact_number = attributes[:contact_number]
    @gender = attributes[:gender]
    @stylist_id = attributes[:stylist_id]
    @id = attributes.fetch(:id, nil)
  end

  def self.all
    return_clients = DB.exec("Select * FROM clients;")
    clients = []
    return_clients.each do |client|
      current_client = Client.new(:name => client['name'], :contact_number => client['contact_number'], :gender => client['gender'], :stylist_id => client['stylist_id'], :id => client['id'].to_i)
      clients.push(current_client)
    end
    clients
  end

  def save
    result = DB.exec("INSERT INTO clients(name, contact_number, gender, stylist_id) VALUES ('#{@name}', '#{@contact_number}', '#{@gender}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  def self.find(id)
    found_client = DB.exec("SELECT * FROM clients WHERE id = '#{id}'").first
    Client.new(:name => found_client['name'], :contact_number => found_client['contact_number'], :gender =>found_client['gender'], :stylist_id => found_client['stylist_id'].to_i, :id => found_client['id'].to_i)
  end

  def ==(another_client)
   (self.name && self.contact_number && self.gender && self.stylist_id) == (another_client.name && another_client.contact_number && another_client.gender && another_client.stylist_id)
 end

  def update(attributes)
    @id = self.id
    @name = attributes.fetch(:name, @name)
    @contact_number = attributes.fetch(:contact_number, @contact_number)
    @gender = attributes.fetch(:gender, @gender)
    @stylist_id = attributes.fetch(:stylist_id, @stylist_id)
    update_result = DB.exec("UPDATE clients SET name = '#{@name}', contact_number = '#{@contact_number}', gender = '#{@gender}', stylist_id = #{stylist_id} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end
end
