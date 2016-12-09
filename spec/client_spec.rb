require('spec_helper')

describe(Client) do
  describe('.all') do
    it ('start off with no clients') do
      expect(Client.all).to(eq([]))
    end
  end
  describe('.find') do
    it('returns a client by their ID number') do
      client1 = Client.new(:name => "Clyde", :contact_number => "555-555-5555", :gender => "Male")
      client1.save
      client2 = Client.new(:name => "Melissa", :contact_number => "444-444-4444", :gemder => "Female")
      client2.save
      expect(Client.find(client1.id)).to(eq(client1))
    end
  end
end
