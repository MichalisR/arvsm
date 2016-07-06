class Request < ActiveRecord::Base
	# Status and absence Type Enums
  	enum status:       { requested: 'status_requested',
                       approved: 'status_approved',
                       denied: 'status_denied' }

  	enum absence_type: { full: 'absence_full',
                       sickness: 'absence_sickness',
                       partial: 'absence_partial' }

  attr_accessor :partial_starting, :starting_time, :end_time

  belongs_to :user
  belongs_to :approver, class_name: 'User'

  validates :user_id, :approver,
            :absence_type,
            presence: true

  with_options unless: :partial? do |np|

    # Start date must start after today
    np.validates_date :starting_date, on: :create, on_or_after: :today
    # End date must be after start date
    np.validates_date :end_date, on: :create, after: :starting_date

    np.validates      :no_days,
                      numericality: { only_integer: true,
                                      greater_than_or_equal_to: 1 }
  end

  with_options if: :partial?, on: :create do |p|
    p.validates_date :partial_starting, on_or_after: :today
    p.validates_time :starting_time
    p.validates_time :end_time, after: :starting_time
  end

  after_initialize :set_default_values

  def set_default_values
    self.absence_type ||= Request.absence_types[:full]
  end
end
