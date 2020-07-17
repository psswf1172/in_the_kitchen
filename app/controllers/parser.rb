class Parser

  # standardize times for comparison. Here converting time to utc then to unix because created_at column is unix

  def range_start
    Date.new(2014, 06, 22).to_utc.to_i
  end

  def range_end
    Date.new(2014, 07, 22).to_utc.to_i
  end

  # users created in our date range
  def created_under_cancer_users
    created_under_cancer_users = []
  end

  def find_users_by_created_at(range_start, range_end)
    created_under_cancer_users = []
    CSV.foreach("/sample_data.csv") do | row |
      sign_up_date = row['created_at'].to_i
      if row.created_at > range_start && row.created_at < range_end
        created_under_cancer_users << row
      end
    end
    created_under_cancer_users.sort_by(created_at)
  end

end