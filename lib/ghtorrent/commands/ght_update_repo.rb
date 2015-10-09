#!/usr/bin/env ruby

require 'ghtorrent'

class GHTUpdateRepo < GHTorrent::Command

  include GHTorrent::Commands::RepoUpdater

  def prepare_options(options)
    options.banner <<-BANNER
Updates the deleted field in the project table with current data

#{command_name} owner repo

    BANNER
  end

  def validate
    super
    Trollop::die "Takes two arguments" if ARGV.size == 1
  end

  def settings
    @config
  end

  def go
    process_project(ARGV[0], ARGV[1])
  end

end
