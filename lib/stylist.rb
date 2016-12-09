class Stylist
  attr_reader(:name, :id)

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes.fetch(:id, nil)
  end

  def self.all
    return_stylists = DB.exec("Select * FROM stylists;")
    stylists = []
    return_stylists.each do |stylist|
      current_stylist = Stylist.new(:name => stylist['name'], :id => stylist['id'].to_i)
      stylists.push(current_stylist)
    end
    stylists
  end

  def save
    result = DB.exec("INSERT INTO stylists(name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end


  def self.find(id)
    found_stylist = nil
    Stylist.all.each do |stylist|
      if stylist.id == id
        found_stylist = stylist
      end
    end
    found_stylist
  end

  def ==(another_stylist)
   (self.name) == (another_stylist.name)
 end


  def update(attributes)
    @id = self.id
    @name = attributes.fetch(:name, @name)
    update_result = DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
     DB.exec("DELETE FROM clients WHERE stylist_id = #{self.id()};")
  end
end
