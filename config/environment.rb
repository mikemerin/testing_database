require 'bundler'
Bundler.require
require 'sqlite3'
require_relative '../lib/song.rb'

DB = { conn: SQLite3::Database.new("db/music.db")}

DB[:conn].results_as_hash = true
