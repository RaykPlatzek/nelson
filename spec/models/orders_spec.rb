require 'rails_helper'

RSpec.describe "Orders", :vcr do

  let(:pair) {Pair.create(code: AUDEUR, trend: TREND_NO_CHANGE)}

end