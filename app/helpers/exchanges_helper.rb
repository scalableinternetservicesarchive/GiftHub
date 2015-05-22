module ExchangesHelper
  def generate_matches(exchange)
    candidate_pool = exchange.exchange_profiles.all.to_a

    if candidate_pool.count > 0
      if candidate_pool.count.even?
        while candidate_pool.count > 0
          cand1_idx = rand(candidate_pool.count)
          cand1 = candidate_pool[cand1_idx]
          candidate_pool.delete_at(cand1_idx)

          cand2_idx = rand(candidate_pool.count)
          cand2 = candidate_pool[cand2_idx]
          exchange.exchange_profiles.where( :user => { :id => cand1.id } ).exchange_profile_id = cand2.id
          exchange.exchange_profiles.where( :user => { :id => cand2.id } ).exchange_profile_id = cand1.id
        end
      else
        while candidate_pool.count > 1
          cand1_idx = rand(candidate_pool.count)
          cand1 = candidate_pool[cand1_idx]
          candidate_pool.delete_at(cand1_idx)

          cand2_idx = rand(candidate_pool.count)
          cand2 = candidate_pool[cand2_idx]
          exchange.exchange_profiles.where( :user => { :id => cand1.id } ).exchange_profile_id = cand2.id
          exchange.exchange_profiles.where( :user => { :id => cand2.id } ).exchange_profile_id = cand1.id

          admin = User.where( :email => "admin@admin.com" )
          admin_profile = ExchangeProfile.new(:user_id => admin.id, :exchange_id => exchange.id, :gift_received => false)

          if admin_profile.save
            admin_profile.exchange_profile_id = candidate_pool[0].id
            admin_profile.save!
          end
        end
      end

      begin
        exchange.exchange_profiles.save
      end if false
    end
  end
  handle_asynchronously :generate_matches
end
