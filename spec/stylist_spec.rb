require('spec_helper')

describe(Stylist) do
  describe('.all') do
    it ('start off with no stylists') do
      expect(Stylist.all).to(eq([]))
    end
  end
  describe('#name') do
    it('returns the clients name') do
      stylist1 = Stylist.new(:name => "Herald")
      expect(stylist1.name).to(eq("Herald"))
    end
  end
  describe('#==') do
    it "is the same for clients with same attributes" do
    stylist1 = Stylist.new(:name => "Herald")
    stylist2 = Stylist.new(:name => "Herald")
    expect(stylist1).to(eq(stylist2))
    end
  end
  describe('.find') do
    it('returns a stylist by their ID number') do
      stylist1 = Stylist.new(:name => "Herald")
      stylist1.save
      stylist2 = Stylist.new(:name => "Clara")
      stylist2.save
      expect(Stylist.find(stylist1.id)).to(eq(stylist1))
    end
  end
  describe("#delete") do
    it('lets you delete a stylist from the database') do
      stylist1 = Stylist.new(:name => "Herald")
      stylist1.save
      stylist2 = Stylist.new(:name => "Clara")
      stylist2.save
      stylist1.delete
      expect(Stylist.all).to(eq([stylist2]))
    end
  end
  describe("#update") do
    it('lets you update a stylist specs in a database') do
      stylist1 = Stylist.new(:name => "Herald")
      stylist1.save
      stylist1.save
      stylist1.update(:name => "Gerald")
      expect(stylist1.name).to(eq("Gerald"))
    end
  end
  describe('#clients') do
    it("can return the clients for a stylist") do
      stylist1 = Stylist.new(:name => "Herald")
      stylist1.save
      client1 = Client.new(:name => "Clyde", :contact_number => "555-555-5555", :gender => "Male", :stylist_id => stylist1.id)
      client1.save
      client2 = Client.new(:name => "Melissa", :contact_number => "444-444-4444", :gender => "Female", :stylist_id => stylist1.id)
      client2.save
      expect(stylist1.clients).to(eq([client1, client2]))
    end
  end
end
