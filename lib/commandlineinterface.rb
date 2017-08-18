
require 'nokogiri'
require 'colorize'
require_relative "../lib/scraper.rb"
require_relative "../lib/dinosaurs.rb"

class CommandLineInteface

  def run
    input = ""
    make_dinosaurs
    until input == "exit"
      puts "Welcome to Dinosaurs A to Z"
      puts "What would you like to see?"
      puts "================================="
      puts "List all of dinosaurs(A-Z), enter 'all'."
      puts "List a dinosaurs start with, enter 'some'."
      puts "Display one specific dinosaur, enter 'one'"
      puts "================================="
      puts "To quit, enter 'exit'."
      puts "================================="

      input = gets.strip
      case input
      when "all"
        display_dinosaurs
      when "some"
        start_with_display
      when "one"
        display_one
      end #case
  end#until


    #Start_with_display
    #Specific_display
    #add_attributes_to_dinosaurs


  end

  def make_dinosaurs
    dinosaurs_array = Scraper.create_project_hash
    Dinosaurs.create_from_collection(dinosaurs_array)
  end

  #def add_attributes_to_students
    #Dinosaurs.all.each do |dinosaurs|
    #  attributes = Scraper.scrape_profile_page
    #  student.add_student_attributes(attributes)
  #  end
#  end

  def display_dinosaurs
    puts "----------------------------------------------------------------".colorize(:green)
    puts "----------------------------------------------------------------".colorize(:green)
    Dinosaurs.all.each do |dinosaurs|
      puts "#{dinosaurs.name.upcase}".colorize(:red)
      puts "description: ".colorize(:light_blue) + "#{dinosaurs.description}"
      puts "================================================================".colorize(:purple)
    end
    puts "----------------------------------------------------------------".colorize(:green)
    puts "----------------------------------------------------------------".colorize(:green)
  end
  def start_with_display
    puts "Please choose a letter(A-Z):"
    input = gets.strip

    Dinosaurs.all.each do |dinosaurs|
      letters = []
      letters = dinosaurs.name.split("")
      letter = letters[0]


      if input.upcase == letter || input.downcase == letter
        puts "----------------------------------------------------------------".colorize(:green)
        puts "----------------------------------------------------------------".colorize(:green)
        puts "#{dinosaurs.name.upcase}".colorize(:red)
        puts "description: ".colorize(:light_blue) + "#{dinosaurs.description}"
        puts "----------------------------------------------------------------".colorize(:green)
        puts "----------------------------------------------------------------".colorize(:green)
      end
    end
  end
  def display_one
    puts "Please choose a name of dinosaurs:"
    input = gets.strip
    dinosaur = Dinosaurs.all.detect{|dino| dino.name.downcase == input.downcase}
    puts "----------------------------------------------------------------".colorize(:green)
    puts "----------------------------------------------------------------".colorize(:green)
        puts "#{dinosaur.name.upcase}".colorize(:red)
        puts "description: ".colorize(:light_blue) + "#{dinosaur.description}"
        puts "----------------------------------------------------------------".colorize(:green)
        puts "----------------------------------------------------------------".colorize(:green)
  end

end
