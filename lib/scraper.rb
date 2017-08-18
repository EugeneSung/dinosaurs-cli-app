require 'open-uri'
require 'pry'

class Scraper

  def self.create_project_hash
    # write your code here

    doc = Nokogiri::HTML(open('https://www.thoughtco.com/dinosaurs-a-to-z-1093748'))
    projects = []
    doc.css("div#flex_1-0").each do |project|

          project.css("p").each do |dino|
            unless dino.css("a").text == nil
              arry = dino.text.split(" ")
              dinosaurs_name = arry[0]
              arry.shift
              dinosaurs_description = arry.join(" ")
              projects << {name: dinosaurs_name, description: dinosaurs_description}
            #  binding.pry
            end
          end
     # return the projects hash
   end
     projects
  end
end
