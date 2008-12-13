class String
  def / (str)
    # remove extra slashes
    left = self.match(/(.*)[^\/]+/)[0]
    right = str.match(/[^\/]+(.*)/)[0]
    
    left + '/' + right
  end
end
