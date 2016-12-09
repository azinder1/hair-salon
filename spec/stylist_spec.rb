require('spec_helper')

describe(Stylist) do
  describe('.all') do
    it ('start off with no stylists') do
      expect(Stylist.all).to(eq([]))
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
end
