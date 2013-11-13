class Translate
  attr_reader :lang_name
 def initialize result, lang_name, translate_phrase
    @result = result
    @lang_name = lang_name
    @translate_phrase = translate_phrase
 end  

  def what_language? 
    puts "Welcome to Justin's Command Line Translation App"
    puts "What language would you like to translate to?"
    @lang_name = gets.chomp 
    #@result.include?("#{lang_name}") == false
    #puts "that is an invalid language"
  end

  def translate_me
    if @result.include?("#{@lang_name}") == false
      puts "that is an invalid language"
    else
      puts "What would you like translated?"
      @translate_phrase = gets.chomp
    end
  end

end
