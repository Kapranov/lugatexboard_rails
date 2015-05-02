current_valuation = 0
current_karma = 0
buzzwords = ['Paradigm shift', 'Leverage', 'Pivoting', 'Turn-key', 'Streamlininess', 'Exit strategy', 'Synergy', 'Enterprise', 'Web 2.0'] 
buzzword_counts = Hash.new({ value: 0 })

points = []
(1..10).each do |i|
  points << { x: i, y: rand(50) }
end
last_x = points.last[:x]

Dashing.scheduler.every '2s' do
  last_valuation = current_valuation
  last_karma     = current_karma
  current_karma     = rand(200000)
  current_valuation = rand(100)
  random_buzzword = buzzwords.sample
  buzzword_counts[random_buzzword] = { label: random_buzzword, value: (buzzword_counts[random_buzzword][:value] + 1) % 30 }
  points.shift
  last_x += 1
  points << { x: last_x, y: rand(50) }

  Dashing.send_event('valuation', { current: current_valuation, last: last_valuation })
  Dashing.send_event('synergy',   { value: rand(100) })
  Dashing.send_event('buzzwords', { items: buzzword_counts.values })
  Dashing.send_event('convergence', points: points)
  Dashing.send_event('karma', { current: current_karma, last: last_karma })
end
