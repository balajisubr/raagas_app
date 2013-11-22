require 'raaga.rb'
class Bhajan < ActiveRecord::Base
set_primary_key :name

  def self.find_details(bhajan_name)
    bhajan = Bhajan.find(bhajan_name)
    raaga = Raaga.find(bhajan.raaga).name if bhajan.raaga
    deity = Deity.find(bhajan.deity).name if bhajan.deity
    url = bhajan.radiosai_url 
    bhajan_details = {
      :raaga   => raaga || '', 
      :lyrics  => bhajan.lyrics || '', 
      :meaning => bhajan.meaning || '', 
      :url     => bhajan.radiosai_url || ('http://192.168.1.70:3000/play/' + bhajan.server_url),
      :deity   => deity || ''
      }
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

  def self.number_of_bhajans
    count 
  end
end

