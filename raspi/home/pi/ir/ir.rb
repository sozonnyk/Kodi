#!/usr/bin/env ruby

require 'sinatra'


def signal(dev, key)
  `irsend SEND_START #{dev} #{key}`
  sleep(0.4)
  `irsend SEND_STOP #{dev} #{key}`
end

def sequence(seq)
  seq.each do |dev, commands|
    commands.each do |cmd|
      signal(dev, cmd)
    end
  end
end

get '/on' do
  cmd = {'pana' => ['KEY_POWER'], 'yamaha' => ['KEY_POWER','KEY_DVD','KEY_M','KEY_V']}
  sequence(cmd)
  'ON OK'
end

get '/off' do
  cmd = {'pana' => ['KEY_POWER'], 'yamaha' => ['KEY_S','KEY_V','KEY_POWER']}
  sequence(cmd)
  'OFF OK'
end

get '/volup' do
  cmd = {'yamaha' => ['KEY_VOLUMEUP']}
  sequence(cmd)
  'VOL UP OK'
end

get '/voldown' do
  cmd = {'yamaha' => ['KEY_VOLUMEDOWN']}
  sequence(cmd)
  'VOL DOWN OK'
end

