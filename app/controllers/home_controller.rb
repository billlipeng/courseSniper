class HomeController < ApplicationController
  def index
    # create Mechanize instance
    agent = Mechanize.new
    
    # set the path of the certificate file
    # agent.cert = 'example.cer'
    
    # set the path of the private key file
    # agent.key = 'example.key'
    page = agent.get("https://eas.admin.uillinois.edu/eas/servlet/EasLogin?redirect=https://webprod.admin.uillinois.edu/ssa/servlet/SelfServiceLogin?appName=edu.uillinois.aits.SelfServiceLogin&dad=BANPROD1")
    # get the login form & fill it out with the username/password
    login_form = page.form('easForm')
    login_form.inputEnterpriseId = 'cheung16'
    login_form.password = '' #fill this derp with a password
    
    # submit login form
    login_form.submit(login_form.buttons[0])
    
    #reg_page = agent.click(agent.link_with(:text => /Registration & Records/))
    
    pp agent.page
    agent.page.links().each{|l| puts "*****************" + l.text}
    agent.page.link_with(:text => %r{Registration}).click
    agent.page.links().each{|l| puts "*****************" + l.text}
  
  
  end
end
