class Gemlist
  include Comparable
  attr_accessor :name, :versions

  GEMPATH = Gem.path.find { |p| p !~ /\.gem/ } # system gem path
  
  @@gemlists = []

  def self.all
    Gem::SourceIndex.from_installed_gems.each do |index|
      self.push index[1] # second element of index is Gem
    end
    @@gemlists.reject! { |g| g.main_rdoc_path.nil? }
    @@gemlists.sort!
  end
  
  def self.push(gem)
    gemlist = @@gemlists.find { |gl| gl.name == gem.name }
    if gemlist
      gemlist.versions << gem
    else
      @@gemlists << Gemlist.new(gem)
    end
  end
  
  def self.path
    GEMPATH
  end
  
  def initialize(gem)
    self.name = gem.name
    self.versions = [gem]
  end
  
  def available_versions
    versions.select do |gem|
      File.exists?(File.join(GEMPATH, "doc", gem.full_name, "rdoc/index.html"))
    end
  end
  
  def main_rdoc_path
    return if available_versions.empty?
    versions.max.full_name+'/rdoc/index.html'
  end
  
  def <=>(other)
    name.downcase <=> other.name.downcase
  end

end
