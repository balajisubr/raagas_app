class Deity < ActiveRecord::Base
  def initialize()
  end

  def self.find_bhajans(deity_id)
    bhajans = []
    bhajan_data = Bhajan.find_all_by_deity(deity_id)
    (bhajan_data).each do
      |bhajan| bhajans<<bhajan.name
    end
    bhajans
  end
end

