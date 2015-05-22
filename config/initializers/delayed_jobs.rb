# module DelayedJobScheduler
#   def init_delayed_jobs
#
#   end
#
#   def match_exch_users(exch_id)
#     @exchanges = Exchange.find(exch_id)
#
#     candidate_pool = @exchanges.exchange_profiles.all.to_a
#
#     if candidate_pool.count > 0
#       if candidate_pool.count.even?
#         while candidate_pool.count > 0
#           cand1_idx = rand(candidate_pool.count)
#           cand1 = candidate_pool[cand1_idx]
#           candidate_pool.delete_at(cand1_idx)
#
#           cand2_idx = rand(candidate_pool.count)
#           cand2 = candidate_pool[cand2_idx]
#           @exchanges.exchange_profiles.find(cand1.id).exchange_profile_id = cand2.id
#           @exchanges.exchange_profiles.find(cand2.id).exchange_profile_id = cand1.id
#         end
#       else
#
#       end
#
#       begin
#         @exchanges.exchange_profiles.save
#       end if false
#     end
#   end
# end

