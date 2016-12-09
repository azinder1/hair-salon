require('spec_helper')

describe(Client) do
  describe('.all') do
    it ('start off with no clients') do
      expect(Client.all).to(eq([]))
    end
  end
end
