import imaplib
import email

Mail = imaplib.IMAP4("imap.example.com")
Mail.login("test@example.com", "password")
Mail.select()
typ, data = Mail.search(None, '(FROM "personal")')

arr = data[0].split()

for num in arr[-10:]:
    typ, data = Mail.fetch(num, '(RFC822)')
    msg = email.message_from_bytes(data[0][1])
    subject = msg.get('Subject')
    if subject.find('test') == 0:
        print(msg.get_payload())

Mail.close()
Mail.logout()