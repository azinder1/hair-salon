require('spec_helper')

describe(Client) do
  describe('.all') do
    it ('start off with no clients') do
      expect(Client.all).to(eq([]))
    end
  end
  describe('#name') do
    it('returns the clients name') do
      client1 = Client.new(:name => "Clyde", :contact_number => "555-555-5555", :gender => "Male", :stylist_id => '3')
      expect(client1.name).to(eq("Clyde"))
    end
  end
  describe('#==') do
    it "is the same for clients with same attributes" do
    client1 = Client.new(:name => "Clyde", :contact_number => "555-555-5555", :gender => "Male", :stylist_id => '3')
    client2 = Client.new(:name => "Clyde", :contact_number => "555-555-5555", :gender => "Male", :stylist_id => '3')
    expect(client1).to(eq(client2))
    end
  end
  describe('.find') do
    it('returns a client by their ID number') do
      client1 = Client.new(:name => "Clyde", :contact_number => "555-555-5555", :gender => "Male", :stylist_id => '3')
      client1.save
      client2 = Client.new(:name => "Melissa", :contact_number => "444-444-4444", :gender => "Female", :stylist_id => '1')
      client2.save
      expect(Client.find(client1.id)).to(eq(client1))
    end
  end
  describe("#delete") do
    it('lets you delete a client from the database') do
      client1 = Client.new(:name => "Clyde", :contact_number => "555-555-5555", :gender => "Male", :stylist_id => 3)
      client1.save
      client2 = Client.new(:name => "Melissa", :contact_number => "444-444-4444", :gender => "Female", :stylist_id => 1)
      client2.save
      client1.delete
      client2.delete
      expect(Client.all).to(eq([]))
    end
  end
  describe("#update") do
    it('lets you update a client specs in a database') do
      client1 = Client.new(:name => "Clyde", :contact_number => "555-555-5555", :gender => "Male", :stylist_id => 3)
      client1.save
      client1.update(:name => "Clevis")
      expect(client1.name).to(eq("Clevis"))
    end
  end
end
