class ChartController < ApplicationController

  def our_data
    title = OFC2::Title.new( :text => "Readers/friends statistic" , :style => "{font-size: 14px; color: #b50F0F; text-align: center;}")
    bar = OFC2::Bar3d.new(:text => '', :colour => '#41046f')
    bar.values= [current_user.followers.count, current_user.following.count]
    x_labels = OFC2::XAxisLabels.new
    x_labels.steps= 1
    x_labels.labels = ['Readers', 'Friends']
    bar.on_show = OFC2::Animation.new(
      :type => "pop-up",
      :cascade => 1,
      :delay => 0.5
    )
    x = OFC2::XAxis.new
    x.set_labels x_labels
    x.___3d = 10
    max = (current_user.followers.count > current_user.following.count) ? current_user.followers.count : current_user.following.count
    y = OFC2::YAxis.new(:min => 0, :max => max + 2, :steps => 1)
    chart = OFC2::Graph.new
    chart.title= title
    chart << bar
    chart.x_axis = x
    chart.y_axis = y
    render :text => chart.render
  end



  def other_user_data
    user = User.find(params[:id])
    title = OFC2::Title.new( :text => "Readers/friends statistic" , :style => "{font-size: 14px; color: #b50F0F; text-align: center;}")
    bar = OFC2::Bar3d.new(:text => '', :colour => '#41046f')
    bar.values= [user.followers.count, user.following.count]
    x_labels = OFC2::XAxisLabels.new
    x_labels.steps= 1
    x_labels.labels = ['Readers', 'Friends']
    bar.on_show = OFC2::Animation.new(
      :type => "pop-up",
      :cascade => 1,
      :delay => 0.5
    )
    x = OFC2::XAxis.new
    x.set_labels x_labels
    x.___3d = 10
    max = (user.followers.count > user.following.count) ? user.followers.count : user.following.count
    y = OFC2::YAxis.new(:min => 0, :max => max + 2, :steps => 1)
    chart = OFC2::Graph.new
    chart.title= title
    chart << bar
    chart.x_axis = x
    chart.y_axis = y
    render :text => chart.render
  end
end

