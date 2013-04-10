class Raaga < ActiveRecord::Base
  def initialize()
    #dbconfig = YAML::load(File.open('../../config/database.yml'))
    #ActiveRecord::Base.establish_connection(dbconfig['development'])
  end

  def self.find_bhajans(raaga_id)
    bhajans = []
    bhajan_data = Bhajan.find_all_by_raaga(raaga_id)
    (bhajan_data).each do
      |bhajan| bhajans<<bhajan.name
    end
    bhajans
  end
end

