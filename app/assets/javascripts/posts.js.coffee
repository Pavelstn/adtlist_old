# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  
 load_all_agent_list = ->
      $.getJSON "/agentprofiles.json", (data) ->
        $.each data, (key, val) ->
          $("#all_agents").append "<option value=\""+val.id+"\">"+val.name+"</option>"
        

 
 add_agent = (post_id, agent_id) ->
    #alert "post json "+post_id+" "+agent_id
    accountabilityagent = undefined
    agent_data = accountabilityagent:
      post_id: post_id
      agentprofile_id: agent_id
    my_ajax_send "/accountabilityagents.json", agent_data, ->
      load_accountabilityagents $("#post_id").val()


 load_accountabilityagents = (post_id) ->
   $("#agent_list").empty()
   $.getJSON "/agentprofiles/findbypost/" + post_id, (data) ->
    $.each data, (key, val) ->
      $("#agent_list ").append "<div>" + val.name + "<button class=\"delete_agent_button\"  type=\"button\"  value=\"" + val.id + "\" ><i class=\"icon-remove\"></i></button>" + "</div> "


  update_image_list = (post_id) ->
    $.getJSON "/images/findbypost/" + post_id, (data) ->
      $.each data, (key, val) ->
        $("#image_thumbinals ").append "<div class=\"image_thumb\" " + " style=\"background-image:  url(" + val.url + ");\">" + val.url + "<button class=\"delete_img_button\"  type=\"button\"  value=\"" + val.id + "\" ><i class=\"icon-remove\"></i></button>" + "</div> "

        #$("#image_thumbinals ").append "<div class=\"image_thumb\"   style=\"background-image: url(https://lh5.googleusercontent.com/Za2V5LjH8qafRNYSmxwYiWS8_dZXoR8ewhETXB-3RnS3pHt5Fsfcl-94meh4C7djnfrvl2tsZB5yvqkA);\">" + val.url + "<button class=\"delete_img_button\"  type=\"button\"  value=\"" + val.id + "\" ><i class=\"icon-remove\"></i></button>" + "</div> "

  load_full_name_category= (category_id)->
    $.getJSON "/categories/" + category_id+".json", (data) ->
      $("#title_field").val(data.full_name+" "+$("#district_field").val())

  $('.plan_select').click ->
    $("#plan_field").val($(this).text())

  $('.material_select').click ->
    $("#material_field").val($(this).text())

  $('.apartmen_select').click ->
    $("#apartmen_field").val($(this).text())

  $("#price_field").change ->
    re = /^\d+$/
    str = $("#price_field").val()
    #newstr= str.replace(/(\D+)/g, "")
    newstr= str.replace(/(\s+)/g, "")
    $("#price_field").val(newstr)
  
  $("#post_imageurl").popover
    html:true
    placement: 'top'
    trigger: 'hover'
    delay: 2000
    content: ->
      "<img src=\""+$("#post_imageurl").val()+"\">"
      

  
  $("#compile_title").click ->
    category_id= $("#category_field").val()
    load_full_name_category(category_id)

  $("#add_new_img_button").click ->
    image_data = undefined
    imgurl = undefined
    post_id = undefined
    imgurl = $("#imgurl").val()
    post_id = $("#post_id").val()
    image_data = image:
      post_id: post_id
      url: imgurl

    my_ajax_send "/images.json", image_data, ->
      $("#imgurl").val ""
      $("#image_thumbinals").empty()
      update_image_list $("#post_id").val()

  $("#add_agent_button").click ->
    add_agent($("#post_id").val(),$("#all_agents").val() )


  $(document).on "click", ".delete_img_button", ->
    my_ajax_delete "/images/" + $(this).val() + ".json"
    $("#image_thumbinals").empty()
    update_image_list $("#post_id").val()

  $(document).on "click", ".delete_agent_button", ->
    my_ajax_delete "/accountabilityagents/" + $(this).val() + ".json"
    load_accountabilityagents $("#post_id").val()
  
  update_image_list $("#post_id").val()
  load_all_agent_list()
  load_accountabilityagents $("#post_id").val()
  
  



