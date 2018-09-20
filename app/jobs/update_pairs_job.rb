class UpdatePairsJob < ActiveJob::Base
  
  def perform
    puts "updating all pairs..."
    Pair.all_pairs.each do |pair|
      puts "updating...#{pair.code}"
      RetrieveForgeData.new.call([pair.code])
    end
    puts "update finshed..."
  end
end
