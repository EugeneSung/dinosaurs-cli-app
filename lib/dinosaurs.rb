class Dinosaurs

  attr_accessor :name, :description, :profile_quote, :bio, :profile_url

  @@all = []

 def initialize(dinosaurs_hash)
   dinosaurs_hash.each do |key, value|
     self.send("#{key}=", value)
   end
   @@all << self
 end

 def self.create_from_collection(dinosaurs_array)
   dinosaurs_array.each do |dinosaurs|
     Dinosaurs.new(dinosaurs)
   end
 end

 def self.all
   @@all
 end

end
