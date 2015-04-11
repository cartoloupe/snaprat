class SnapRat

  def initialize
  end


  class << self
    def contents dir
      Dir["#{dir}/**"]
    end

    def gettime file
      File.ctime(file)
    end

    def timestamp_to_directories(timestamp)
      [timestamp.year, timestamp.month, timestamp.day]
    end

  end

end
