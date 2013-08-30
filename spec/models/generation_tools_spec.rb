require 'spec_helper'

describe GenerationTools do

  it 'should roll a d1' do
    GenerationTools.d(1) == 1
  end

  it 'should roll a d20' do
    GenerationTools.d(20) <= 20
    GenerationTools.d(20) >= 1
  end

end