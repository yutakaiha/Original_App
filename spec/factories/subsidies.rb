FactoryBot.define do
  factory :subsidy do
    # association :category
    # association :event
    title{"foo"}
    content{"foofoo"}
    start_date{Time.current}
    end_date{3.days.ago}
    limit_amount{3}
    event_id{１}
  end
end
