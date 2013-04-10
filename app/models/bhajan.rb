require 'raaga.rb'
class Bhajan < ActiveRecord::Base
set_primary_key :name
  def self.find_details(bhajan_name)
    bhajan = Bhajan.find(bhajan_name)
    raaga = Raaga.find(bhajan.raaga).name
    lyrics = "Deva Devottama Deena Samrakshaka"
    meaning = "Sai please protect me"
    deity = "Sathya Sai"
    bhajan_details = {"raaga" => raaga, "lyrics" => lyrics, "meaning" => meaning, "deity" => deity}
    bhajan_details
  end
  def self.find_all_bhajans(search_key)
    match = []
    bhajan_list = Bhajan.find(:all).map {|b| b.name}
    bhajan_list.each do |bhajan|
      match << bhajan if bhajan.start_with?(search_key)
    end
    match
  end
  def self.lookup_all
    names_list = Bhajan.find(:all).map {|b| b.name}
  end
end

