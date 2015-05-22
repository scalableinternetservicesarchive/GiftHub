class ExchangeMatchJob < ActiveJob::Base
  queue_as :default

  def perform(exchange)
    # Do something later

    candidate_pool = exchange.exchange_profiles.all.to_a #.where.not( :user_id => User.find_by_email("admin@admin.com").id ).to_a

    if candidate_pool.count > 0
      if candidate_pool.count.even?
        loopCount = 0
      else
        loopCount = 1
      end

      while candidate_pool.count > loopCount
        cand1_idx = rand(candidate_pool.count)
        cand1_id = candidate_pool[cand1_idx].user_id
        candidate_pool.delete_at(cand1_idx)

        cand2_idx = rand(candidate_pool.count)
        cand2_id = candidate_pool[cand2_idx].user_id
        candidate_pool.delete_at(cand2_idx)

        profile1 = ExchangeProfile.joins(:exchange).where( :exchange_id => exchange.id, :user_id => cand1_id ).first
        profile2 = ExchangeProfile.joins(:exchange).where( :exchange_id => exchange.id, :user_id => cand2_id ).first
        profile1.exchange_profile_id = profile2.id
        profile2.exchange_profile_id = profile1.id

        profile1.save!
        profile2.save!
      end

      if loopCount == 1
        admin = User.find_by_email("admin@admin.com")
        admin_profile = ExchangeProfile.new(:user_id => admin.id, :exchange_id => exchange.id, :gift_received => false)

        if admin_profile.save
          profile = ExchangeProfile.joins(:exchange).where( :exchange_id => exchange.id, :user_id => candidate_pool[0].user_id ).first
          # candidate_pool.delete_at(0)
          profile.exchange_profile_id = admin_profile.id
          admin_profile.exchange_profile_id = candidate_pool[0].id

          profile.save!
          admin_profile.save!
        end
      end
    end
  end
end
