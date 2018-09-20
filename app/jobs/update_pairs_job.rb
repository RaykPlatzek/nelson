class UpdatePairsJob < ActiveJob::Base
  
  def perform
    puts "updating all pairs..."
    Pair.all.map(&:code).uniq.each do |pair|
      puts "updating...#{pair}"
      RetrieveForgeData.new.call([pair])
    end
    puts "update finshed..."
  end
end
