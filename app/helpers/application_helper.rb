module ApplicationHelper
  def select_info
    Information.order(created_at: :desc).limit(5)
  end

  def most_viewd
    Information.order(impressions_count: :desc).limit(5)
  end

  def all_category
    Category.all
  end
end
