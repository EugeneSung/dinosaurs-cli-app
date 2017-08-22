
require 'nokogiri'
require 'colorize'
require_relative "../lib/scraper.rb"
require_relative "../lib/dinosaurs.rb"

class CommandLineInteface
  BASE_URL = 'https://en.m.wikipedia.org/wiki/'
  def run
    input = ""
    make_dinosaurs
    until input == "exit"
      puts "Welcome to Dinosaurs A to Z"
      puts "What would you like to see?"
      puts "List all of dinosaurs(A-Z), enter 'all'."
      puts "List a dinosaurs start with a letter, enter 'letter'."
      puts "Display one specific dinosaur, enter 'one'"
      puts "To quit, enter 'exit':"
      puts ">>"
      input = gets.chomp


      case input
      when "all"
        display_dinosaurs
      when "letter"
        start_with_display
      when "one"
        display_one
      end #case
  end#until



  end

  def make_dinosaurs
    dinosaurs_array = Scraper.create_project_hash
    Dinosaurs.create_from_collection(dinosaurs_array)

  end

  def display_dinosaurs
    puts "----------------------------------------------------------------------------".colorize(:green)

    Dinosaurs.all.each do |dinosaur|
      if dinosaur.name.length < 2
        puts "#{dinosaur.name.upcase}".colorize(:red)
        puts "============================================================================".colorize(:yellow)
      elsif dinosaur.name.length > 2

        puts "#{dinosaur.name.upcase}".colorize(:red)
        puts "description: ".colorize(:light_blue) + "#{dinosaur.description}"
        puts "URL:".colorize(:light_blue) + "#{dinosaur.url}"
        puts "============================================================================".colorize(:yellow)
      end
    end
    puts "----------------------------------------------------------------------------".colorize(:green)
  end
  def start_with_display
    puts "Please choose a letter(A-Z):"
    input = gets.strip

    Dinosaurs.all.each do |dinosaur|
      letters = []
      letters = dinosaur.name.split("")
      letter = letters[0]


      if input.upcase == letter || input.downcase == letter
        if dinosaur.name.length < 2
          puts "Start with #{dinosaur.name.upcase}".colorize(:red)
          puts "============================================================================".colorize(:yellow)
        elsif dinosaur.name.length > 2



        puts "#{dinosaur.name.upcase}".colorize(:red)
        puts "description: ".colorize(:light_blue) + "#{dinosaur.description}"
          puts "URL:".colorize(:light_blue) + "#{dinosaur.url}"

        puts "----------------------------------------------------------------------------".colorize(:green)
      end
    end
    end
  end
  def display_one
    puts "Please choose a name of dinosaurs:"
    input = gets.strip

    dinosaur = Dinosaurs.all.detect{|dino| dino.name.downcase == input.downcase}
    add_attributes_to_dinosaur(dinosaur)
    #binding.pry
    puts "----------------------------------------------------------------------------".colorize(:green)
    puts "#{dinosaur.name.upcase}".colorize(:red)
    puts "description: ".colorize(:light_blue) + "#{dinosaur.description}"
    puts "URL:".colorize(:light_blue) + "#{dinosaur.url}"
    puts "Wikipedia Description: ".colorize(:light_blue) + "#{dinosaur.wiki_description}"
    puts "----------------------------------------------------------------------------".colorize(:green)




  end
  def add_attributes_to_dinosaur(dinosaur)

      attributes = Scraper.scrape_wiki_page(BASE_URL + dinosaur.name)
      #binding.pry
      dinosaur.add_dinosaur_attributes(attributes)

  end





end
