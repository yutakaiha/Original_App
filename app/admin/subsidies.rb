ActiveAdmin.register Subsidy do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :content, :start_date, :end_date, :limit_amount, :category_id, :event_id
  #
  # or
  #
  permit_params do
    permitted = [:title, :content, :start_date, :end_date, :limit_amount, :category_id, :event_id]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
