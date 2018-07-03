require 'pry'

class Owner

attr_reader :species
attr_accessor :name, :pets

  @@all = []

  def initialize(species)
    @species = species
    @pets = {fishes: [], dogs: [], cats: []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.length
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(fishname)
    fish = Fish.new(fishname)
    self.pets[:fishes] << fish
  end

  def buy_cat(catname)
    cat = Cat.new(catname)
    self.pets[:cats] << cat
  end

  def buy_dog(dogname)
    dog = Dog.new(dogname)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets.each do |pet_type, pet_array|
      pet_array.each do |pet|
        pet.mood = "nervous"
      end
    end
    self.pets = {fishes: [], dogs: [], cats: []}
  end

  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end

end
