class DeityController < ApplicationController
  def search
    if(deity = Deity.find_by_name(params[:name].downcase.titleize))
       #bhajans = Bhajan.find_by_raaga(raaga.id)
       #bhajan_name = bhajan.name
      begin
      bhajans = []
      bhajans = Deity.find_bhajans(deity.id)
      render :json => {"bhajan_names" => bhajans}.to_json
      end
    else
      render :json => {"error" => "No Bhajans found".to_s}.to_json
    end
  end

  def lookup_all
    names_list = Deity.find(:all).map{|x| x.name}
    render :json => {"names_list" => names_list}.to_json
  end

  def count
    render :json => {:count => Bhajan.count}.to_json
  end 

end

