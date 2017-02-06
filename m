Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1carHD-0005bY-1O
	for mharc-qemu-trivial@gnu.org; Mon, 06 Feb 2017 16:56:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ipavlikevich@gmail.com>) id 1cakXK-0003DZ-9B
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2017 09:44:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ipavlikevich@gmail.com>) id 1cakXJ-0004Q3-Og
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2017 09:44:58 -0500
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242]:36815)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ipavlikevich@gmail.com>)
	id 1cakXJ-0004Px-KR
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2017 09:44:57 -0500
Received: by mail-it0-x242.google.com with SMTP id f200so8894121itf.3
	for <qemu-trivial@nongnu.org>; Mon, 06 Feb 2017 06:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Kzewm9qeDrj1y1YB8zeQGLHXHI59mMS/LeAf88VrZ0I=;
	b=JMBO4igTOdUTZJtnbkQU3sKR8Ns1gy/Ffxs6WjvETChaER/J9m7e/f1n5OCDbyMx/I
	yv+PJWeX4LBGOUtBTmO/Er5NBhB7SgL4f748IIO5hez8fDfFxFx6+MPmsLFrHF/pJmT2
	+N6m8snjmaHeEkshjbanqR+35NnBp+3Q7zRAjKW4fNwv5HJltC2xwmDHGvr2Uae2O/6a
	O5vjDdkqIQ4q7pfW7SCwT95sMMJJZ8+NjvTf+QypH3dLGaf3mnZLxZOmI3PlYjCm+tld
	3BWhgGHtU8IsiWT9RAFt4HuTlZVW6QxyZNSxXbkdy8belQvImDOZB+m3GEpTY9CXTAbR
	Gaow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Kzewm9qeDrj1y1YB8zeQGLHXHI59mMS/LeAf88VrZ0I=;
	b=hMxH0fUaOvZo335DPRstJTy+lnuJLHpezVd0FpAzNPY2gt+kAml6SXM1QYY/gLllH3
	mAz0v+rQ3Gd0KiFn6rQhag2epcGIj7wkvkRh1QqiGmm3o7iqL9V5wee9jMZRcjSp4dpL
	efVIg3WgHOJnVocHez1k11CKxBMu49KQaNkjJjHlLmplwwjCXVhttAuyuPnJPwmnQNIV
	kTPpp8PQn00VIZBcAjRJj3fL9Ea5h0IyaiN+7RrimmuDpmdHQQyEpKVpdGYVdILXa1Fl
	wIoscvRsFVwHgDwWYp4dCeBdXOxXTQ/CZheIJAnEBNoqgs4zV/K+y049O3pXy+4o5uZ1
	dmhA==
X-Gm-Message-State: AIkVDXLy6U7aZPrTkSilB0lLDdAgWeLSr4prKw0hw9Zl+yYXWHhMB0K2HiwqUAhE/ISeVS+817bPxYvi884VCA==
X-Received: by 10.36.203.4 with SMTP id u4mr6592054itg.99.1486392296190; Mon,
	06 Feb 2017 06:44:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.128.198 with HTTP; Mon, 6 Feb 2017 06:44:55 -0800 (PST)
From: Igor Pavlikevich <ipavlikevich@gmail.com>
Date: Mon, 6 Feb 2017 17:44:55 +0300
Message-ID: <CA+O_+ExjKRNyfbXWzh7RRHgTjqTBC+WscYCiBGyjLK2XOvoPmQ@mail.gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c0b::242
X-Mailman-Approved-At: Mon, 06 Feb 2017 16:56:46 -0500
Subject: [Qemu-trivial] [PATCH] hw/acpi/tco.c: fix tco timer stop
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2017 14:44:59 -0000

TCO timer does not actually stop

Signed-off-by: Igor Pavlikevich <ipavlikevich@gmail.com>
---
 hw/acpi/tco.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/acpi/tco.c b/hw/acpi/tco.c
index 8ce7daf..b4adac8 100644
--- a/hw/acpi/tco.c
+++ b/hw/acpi/tco.c
@@ -49,6 +49,7 @@ static inline void tco_timer_reload(TCOIORegs *tr)
 static inline void tco_timer_stop(TCOIORegs *tr)
 {
     tr->expire_time = -1;
+    timer_del(tr->tco_timer);
 }

 static void tco_timer_expired(void *opaque)
-- 
2.1.4

