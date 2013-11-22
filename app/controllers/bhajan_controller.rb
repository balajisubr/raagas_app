class BhajanController < ApplicationController
  attr_accessor :bhajan_details
  def search
    if(bhajan = Bhajan.find_by_name(params[:name]))
      begin
        bhajan_details = Bhajan.find_details(bhajan.name)
        render :json => bhajan_details.to_json
      end
    else
      render :json => {"error" => "No such bhajan".to_s}.to_json
    end
  end

  def lookup
    if(bhajan_list = Bhajan.find_all_bhajans(params[:name]))
      render :json => bhajan_list.to_json
    else
      render :json => [].to_json
    end
  end

  def lookup_all
    if(names_list = Bhajan.lookup_all)
      render :json => { "names_list" => names_list}.to_json
    else
      render :json => [].to_json
    end
  end

  def count
    render :json => {:count => Bhajan.count}.to_json
  end

  def play
    #render :json => {"file" => File.new('/home/saibalaji/Desktop/bhajan.mp3')}.to_json
    #render :file => '/home/saibalaji/Desktop/bhajan.mp3', :content_type => 'audio/mpeg'
    send_file '/home/saibalaji/bhajans/'+params[:song] + '.mp3', :type => "audio/mpeg" 
    #file_path = File.split('/home/saibalaji/Desktop/bhajan.mp3')
    #render :mp3 => File.new(file_path[0]+'/'+file_path[1]), :content_type => 'audio/mpeg'
    #respond_to do |format|
    #format.mp3 { render '/home/saibalaji/Desktop/bhajan.mp3' } 
    #end
  end

end

