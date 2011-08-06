import os
 
#Enter your username and password below within double quotes
# eg. username="username" and password="password"
username="4wd22r"
password="I\<3bFm66"
com="wget -q -O - https://"+username+":"+password+"@mail.google.com/mail/feed/atom --no-check-certificate"

temp=os.popen(com)
msg=temp.read()
index=msg.find("<fullcount>")
index2=msg.find("</fullcount>")
fc=int(msg[index+11:index2])

print ("GMail:")
if fc==0:
   print ("0 new")
else:
   print (str(fc)+" new")
