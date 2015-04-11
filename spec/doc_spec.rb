require 'rspec'
require 'pry'
require_relative '../snaprat.rb'

RSpec.describe SnapRat do
  let(:file) {'files/diceroni.png'}
  let(:time) { File.ctime(file)}
  let(:directory) {'tmp'}

  before :all do
    `rm -rf tmp` if Dir.exists? 'tmp'
  end

  it 'knows the creation dates of files' do
    expect(SnapRat.gettime(file).to_s).to match '2015-04-10 21:41:17 -0400'
  end

  it 'splits timestamp of files into directory structures' do

    expect(SnapRat.timestamp_to_directories(time)).to eq [2015, 4, 10]
  end

  it 'can check the contents of a directory' do
    `mkdir #{directory}`

    expect(SnapRat.contents directory).to eq []

    # create a file in the dir
    `touch #{directory}/tmpfile`
    expect(SnapRat.contents directory).to eq ['tmp/tmpfile']

    # cleanup
    `rm #{directory}/*`
    expect(SnapRat.contents directory).to eq []

  end

  xit 'sorts files into directory structure of year/month/day' do
    expect(SnapRat.target_directory(file)).to eq '2015/04/10'
  end


end
