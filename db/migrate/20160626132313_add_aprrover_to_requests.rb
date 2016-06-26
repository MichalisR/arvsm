class AddAprroverToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :aprrover, index: true
  end
end
