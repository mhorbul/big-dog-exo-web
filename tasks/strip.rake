desc 'Strip trailing whitespace and extra blank lines from files'
task :strip do
  Dir.glob("{content,layouts,tasks,templates,lib}/**/*.{rake,erb,txt,rb}").each do |path|
    unless File.directory?(path)
      doc = `cat -s "#{path}" | sed 's/[ \t]*$//'`
      File.open(path, 'w') { |f| f.write(doc) }
    end
  end
end
