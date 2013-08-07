def all_js(files)
  js_arr = []
  for file in files
    item = @items.find{|i| i.identifier == "/assets/javascripts/#{file}/"}
    if item
      puts "Minify #{file}.js"
      js_arr << item.compiled_content
    else
      puts "File #{file} doesn't exist!"
    end
  end
  js_arr.join("\n")
end

def all_css(files)
  css_arr = []
  for file in files
    item = @items.find{|i| i.identifier == "/assets/stylesheets/#{file}/"}
    if item
      puts "Minify #{file}.css"
      css_arr << item.compiled_content
    else
      puts "File #{file} doesn't exist!"
    end
  end
  css_arr.join("\n")
end