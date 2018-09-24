class UpdatePairValuationsJob < ActiveJob::Base
  
  def perform
    puts "updating all pair valuations..."
    Pair.all.each do |pair|
      puts "updating...#{pair.code}"
      RetrieveValuationData.new.call([pair.code])
    end
    puts "update finshed..."
  end
end
