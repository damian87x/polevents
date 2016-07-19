class Notify
  include ActiveModel::AttributeMethods

  attribute_method_affix prefix: 'reset_', suffix: '_to_default!'
  attribute_method_suffix '_contrived?'
  attribute_method_prefix 'clear_'
  define_attribute_methods :event

  def initialize
    yield self if block_given?
    @conditions = event.to_filter_conditions
    @users = find_users
    send_emails
  end

  def send_emails
    @users.map { |u| UserMailer.notify_user(u).deliver_now }
  end

  def find_users
    @users = User.joins('LEFT JOIN filters on users.id = filters.user_id')
            .where("filters.owner_id = ? AND filters.owner_type = ? OR filters.owner_id = ? AND filters.owner_type = ?",
                   @conditions[:city_id], 'City', @conditions[:topic_id], 'Topic')
  end

  attr_accessor :event, :conditions


  def attributes
    {'event' => @event}
  end

  private


  def attribute_contrived?(attr)
    true
  end

  def clear_attribute(attr)
    send("#{attr}=", nil)
    true
  end

  def reset_attribute_to_default!(attr)
    send("#{attr}=", 'No attributes')
    true
  end


end