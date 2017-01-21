class Auth

  def checkAll(arg)
    invalied = Array.new()
    require = Array.new()
    tmp = "false"
    i = 0
    arg.each do |row|
      case i
      when 0 then
      	tmp = "user"
      when 1 then
        tmp = "tell"
      when 2 then
      	tmp = "post_code"
      when 3 then
      	tmp = "mail"
      end

      if checkNil(row) == false
        require.push(tmp)
      else
        case tmp
    	  when "user" then
          val = checkUser(row)
      	  if val != true
      	    invalied.push(val)
      	  end
      	when "tell" then
      	  val = checkTell(row)
      	  if val != true
      	    invalied.push(val)
      	  end
  	    when "post_code" then
          val = checkPost_code(row)
          if val != true
            invalied.push(val)
          end
  	    when "mail" then
  	      val = checkMail(row)
  	      if val != true
  	        invalied.push(val)
  	      end
  	    end
      end
      i += 1
    end
    
    if invalied == nil
      p invalied
    else
      p "All OK"
    end
  end

  def checkNil(tar)
    if tar.nil?
      return false
    else
      return true
    end
  end

  def checkUser(user)
    err = false
    if user =~ /^@/
      if user.length > 3
	err = true
      else
        err = "3 or more characters"
      end
    else
      err = "Initially @"
    end
    if err != true
      err = "User:" + err
    end
    return err
  end

  def checkTell(tell)
    err = false
    if tell =~ /^0/
      if tell =~ /(\d\d\d-\d\d\d\d-\d\d\d\d|\d\d\d\d-\d\d\d-\d\d\d|\d\d\d-\d\d\d-\d\d\d\d)/
        err  = true
      else
        err = "Not a Number or It does not fit Number"
      end
    else
      err = "Initially 0"
    end
    if err != true
      err = "Tell:" + err
    end
    return err
  end
  
  def checkPost_code(post_code)
    err = false
    if post_code =~ /(\d\d\d-\d\d\d\d)/
      err = true
    else
      err = "post_code:" + err
    end
    return err
  end
  
  def checkMail(mail)
    err = false
    if mail =~ /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/
      err = true
    else
      err = "mail:" + err
    end
    return err
  end
  
end

arg = Array.new()
arg.push(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
auth = Auth.new()
auth.checkAll(arg)
