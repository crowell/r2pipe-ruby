require 'r2pipe/version'
require 'pty'
require 'json'
require 'shellwords'

module R2Pipe
  # R2Pipe is an easy way to communicate with an r2 core through ruby
  class R2Pipe
    def initialize(file)
      @file = file
      exec = "r2 -q0 #{Shellwords.shellescape file} 2>/dev/null"
      PTY.spawn(exec) do |read, write, pid|
        @read = read
        @write = write
        @pid = pid
        @read.gets("\0")
      end
    end

    # runs a command on the radare2 core
    def cmd(str)
      @write.print "#{str}\n"
      @read.gets("\0")[0..-2]
    end

    # closes the radare2 core and quits
    def quit
      cmd('q!')
      ::Process.wait @pid
    end

    # returns a parsed json string
    def json(str)
      JSON.parse str.sub("\n", '').sub("\r", '')
    end
  end
end
