module ApplicationHelper
  def select_info
    Information.order(created_at: :desc).limit(5)
  end
end
