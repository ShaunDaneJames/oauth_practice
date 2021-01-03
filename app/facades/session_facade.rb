class SessionFacade

  def self.authenticate(code)
    session = SessionService.authenticate(code)
    
  end
end
