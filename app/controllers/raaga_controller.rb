class RaagaController < ApplicationController
  def search
    if(raaga = Raaga.find_by_name(params[:name].downcase.capitalize))
       #bhajans = Bhajan.find_by_raaga(raaga.id)
       #bhajan_name = bhajan.name
      begin
      bhajans = []
      bhajans = Raaga.find_bhajans(raaga.id)
      render :json => {"bhajan_names"=>bhajans}.to_json
      end
    else
      render :json => {"error" => "No Bhajans found".to_s}.to_json
    end
  end
  def lookup_all
    names_list = Raaga.find(:all).map{|x| x.name}
    render :json => {"names_list" => names_list}.to_json
  end
end

