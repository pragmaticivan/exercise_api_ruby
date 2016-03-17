Fabricator(:payment) do
  amount 1
  payment_date { Date.today }
  loan
end
