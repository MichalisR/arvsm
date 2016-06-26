class User < ActiveRecord::Base
  has_many :requests
  has_many :assigned_requests,class_name: "Request",foreign_key: 'approver_id'
  has_secure_password
end
