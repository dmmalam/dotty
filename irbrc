#!/usr/bin/ruby
# © 2013 D MALAM
# Dotty irbrc

if defined? IRB

  # Use readline
  IRB.conf[:USE_READLINE] = true

  # Save History in $DOTTY_VAR
  IRB.conf[:SAVE_HISTORY] = 10000
  IRB.conf[:HISTORY_FILE] = "#{ENV['DOTTY_VAR']}/irb_history"

  IRB.conf[:PROMPT_MODE] = :SIMPLE
  # Auto indents
  IRB.conf[:AUTO_INDENT] = true

  %w(rubygems irb/ext/save-history open-uri wirble interactive_editor ap net-http-spy).each do |x| begin;
   require x
     rescue LoadError => e
       puts e.inspect
     end
   end

  # Enable colored output
  Wirble.init
  Wirble.colorize

  # Theme
  module DynamicPrompt
    def self.apply!
      IRB.conf[:PROMPT][:INFORMATIVE] = {
        :PROMPT_I => ">>".tap {|s| def s.dup; gsub('>>', DynamicPrompt.normal); end },
        :PROMPT_S => "\e[0;35m%n\e[0m   ",
        :PROMPT_C => "\e[0;35m%n\e[0m>   ",
        :RETURN => "\e[1;35m=>\e[0m %.2048s\n"
      }
      IRB.conf[:PROMPT_MODE]  = :INFORMATIVE
    end

    def self.normal
      color1 = "\e[0;35m%n \e[35m[\e[1;35m"
      color2 = "\e[0;35m]::\e[1;34m"
      color3 = "\e[0;35m]\e[0m>"
      color1 + current_ruby + color2 + cwd + color3
    end

  private
    def self.current_ruby
      @@current_ruby ||= `rbenv version | cut -d ' ' -f 1`.strip
    end

    def self.cwd
      if Dir.pwd == '/'
        '/'
      elsif Dir.pwd == ENV['HOME']
        '~'
      else
        Dir.pwd.split('/').last
      end
    end

  end

  DynamicPrompt.apply!
end

# Monkey patch object
class Object
  # list methods which aren't in superclass
  def local_methods
    (methods - Object.instance_methods).sort
  end

  class Class
    def class_methods
     (methods - Class.instance_methods - Object.methods).sort
    end
  end
end

# Usefull Alias'
def clear
  system('clear')
end

# ^D also works
alias :quit :exit

# http://blog.evanweaver.com/articles/2006/12/13/benchmark/
def benchmark(times = 1000, samples = 20)
  times *= samples
  cur = Time.now
  result = times.times { yield }
  print "#{cur = (Time.now - cur) / samples.to_f } seconds"
  puts " (#{(cur / $last_benchmark * 100).to_i - 100}% change)" rescue puts ""
  $last_benchmark = cur
  result
end

# Profile the provided block
def profile
  require 'profiler'
  Profiler__.start_profile
  yield
  Profiler__.stop_profile
  Profiler__.print_profile($stdout)
end

# Simple regular expression helper
# show_regexp - stolen from the pickaxe
def show_regexp(a, re)
   if a =~ re
      "#{$`}<<#{$&}>>#{$'}"
   else
      "no match"
   end
end

# Convenience method on Regexp so you can do
# /an/.show_match("banana")
class Regexp
   def show_match(a)
       show_regexp(a, self)
   end
end
