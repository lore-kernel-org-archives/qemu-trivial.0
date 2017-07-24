Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi6P-0000gQ-6C
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:29:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6N-0000eE-1l
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6M-0005GP-64
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:07 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35767)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6K-0005DV-4Z; Mon, 24 Jul 2017 14:29:04 -0400
Received: by mail-qk0-x242.google.com with SMTP id k2so3225645qkf.2;
	Mon, 24 Jul 2017 11:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JF1zCj/a2H3l+jm97v/rsw2Xg+MX/98ug/OteBtS8tQ=;
	b=SQU5nnGs5/ZwTNnYY7xbTl3S0fxg6N0xS7KBOBXzggGrBlwzAJuKerV1DDWcA3hluS
	NW/dJsgoZka8XArPJhH1eP775ba8fXcRWHrEVj82vBqVDQXpXP5fO1yQEWfRyJfrAa2w
	uZofnJ1WF6+srNO4TeZTOnPeC3e2wZn9L1arxWlYgdZgD91tIRuPxMg0PoIHKK7/kHfx
	cxD6Rt44svnvRvJEC1t7KHsVv7MdCLM3VuzZM4OFf82UzdBA/sLWR/jYNAigd/f2At5t
	53JR/RFG1A1XcOCSlZGu3wZEW0aQzJTU+6nfpJmiv2JmJwqYOGjyIkM128/yPZoX96to
	RmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=JF1zCj/a2H3l+jm97v/rsw2Xg+MX/98ug/OteBtS8tQ=;
	b=awLsMcX9Q8MGEKDw22mZK/tg2pfYef79QFND51ubxUaeV9amjQ1k5U26rPvzFxYFjj
	sGXkaAhS9VA9g2EUGKyqI14b13a1t9zz08jfdpZ+QKhmbjX9Fx1AvYKhsF5cDlw+/HCB
	pdvov4Qq5wVVDFKXAWBHgbpsuMlG7VdUYKm1IPBE2YcvxZ/UqeNhB2eSdBxf4jJwnSQ4
	GUCxu+t79D4Y7Q937Ei9ZUFr1+aqOtVDWfhqNZ2WD4j1cbXXvWO3c+EvOiyJ8mZK+5N2
	mvxe7WrP3Wrz2ROrNz4J40nzdu/J+FtbgU/yLXqjjsH9/7h9Te0yTfYuc9lXqzGgRC4a
	A7BQ==
X-Gm-Message-State: AIVw1104IVJyoOWPzvO7f1n32L0OOlqkjNwfNvzrN/qVp4dXmp6EZjeW
	Z/cS42q95GXpwA==
X-Received: by 10.55.43.144 with SMTP id r16mr20732155qkr.59.1500920943718;
	Mon, 24 Jul 2017 11:29:03 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:35 -0300
Message-Id: <20170724182751.18261-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH for 2.10 19/35] usb/dev-mtp: fix use of
 uninitialized variable
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
X-List-Received-Date: Mon, 24 Jul 2017 18:29:08 -0000

hw/usb/dev-mtp.c:1200:15: warning: The left operand of '==' is a garbage value
        if (o == NULL) {
            ~ ^

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/dev-mtp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index b4f0b5dafd..5615fb3634 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -1117,7 +1117,7 @@ static MTPData *usb_mtp_get_object_prop_value(MTPState *s, MTPControl *c,
 static void usb_mtp_command(MTPState *s, MTPControl *c)
 {
     MTPData *data_in = NULL;
-    MTPObject *o;
+    MTPObject *o = NULL;
     uint32_t nres = 0, res0 = 0;
 
     /* sanity checks */
-- 
2.13.3


