# encoding: utf-8
module ApplicationHelper

  def link_to_top
    label = image_tag('back_to_top_new.png') + 'Do góry'
    link_to label, '#top', :class => 'back-to-top'
  end
end
