Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cwcFq-0007yS-Ix
	for mharc-qemu-trivial@gnu.org; Fri, 07 Apr 2017 18:21:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwcFo-0007wf-Bg
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 18:21:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwcFn-00053U-GH
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 18:21:16 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35381)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwcFi-00051M-WC; Fri, 07 Apr 2017 18:21:11 -0400
Received: by mail-qt0-x244.google.com with SMTP id r5so11572805qtb.2;
	Fri, 07 Apr 2017 15:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=roO5S6VZ+7cwj/eu4jG7oLhUYwUiPPLY4V0rpI9ScD8=;
	b=OgEgL3INvwH1ve2s52yZpcZ7KDxaCDabZC6MR6EpFj163Mz3fChal44BJim7+xZd4Y
	O22YfbMYa1A26ftz9iMcSBXQP0dr/R7fCHeSLzakSVCTO8hrZP9hHnrm5N/dWv3R7nBu
	YIhbo+YqfkEj9w5Zy7sElxs+o43DAWW43a0E0LegVGqffDKROSh+ai1oZ9RBlwMn0HsJ
	F875HmeMKvdQfp0/QGKodfMKN6motDVnpmvs4Pjs4/ewxf+vsuzOCOYLyraKYZaxswRH
	YYbaabHKCvd7s79JPWPc5ed4R0QR9meadvdFkzpeUrr5OUSgGvYp96HpsjZbZApX6HxD
	yrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=roO5S6VZ+7cwj/eu4jG7oLhUYwUiPPLY4V0rpI9ScD8=;
	b=D6WTG4clJGeIACfcb9/NlyUfmR7ZGnGOTo9jzsXuxDUlUGUG569O+0k9YEYboFN+Dg
	qBJIihFGlio0EHUz/x7jgU269DMMOJ473Ww0oI3QcDXYQMFRoEJz2hqUmNYXsR0PZlpS
	2Ht4tLPQ9PBoZIUzbSw7H+txGhkV8T/xvULHy7knO/8byN3c3cBWh9LF2+iEvb9kV27t
	PixHVAAkY0j3tpDYJku41XqooB48AFYy1vI6AJDGNe8aBPSC0PQzDsopsTJ4pH+FGVdL
	I3oW9zrE3x3jrAqATvJpCumuqtlbXe4H8FpsMGNpeKt4pIvg5CYbvvA7JuTi5ddRmyt3
	Jeuw==
X-Gm-Message-State: AN3rC/7KeXmdOsVsxOFDPN1JC3VrTcNxkuoVAdIIMblCZ1LTLK3Gyzf5iA0jIlfsiGB+7g==
X-Received: by 10.237.63.69 with SMTP id q5mr537208qtf.236.1491603670511;
	Fri, 07 Apr 2017 15:21:10 -0700 (PDT)
Received: from yoga.lan ([138.117.48.226]) by smtp.gmail.com with ESMTPSA id
	d133sm1442146qke.9.2017.04.07.15.21.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Apr 2017 15:21:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  7 Apr 2017 19:20:13 -0300
Message-Id: <20170407222016.15308-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170407222016.15308-1-f4bug@amsat.org>
References: <20170407222016.15308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 1/4] usb-ccid: make
 ccid_write_data_block() cope with null buffers
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
X-List-Received-Date: Fri, 07 Apr 2017 22:21:17 -0000

static code analyzer complain:

hw/usb/dev-smartcard-reader.c:816:5: warning: Null pointer passed as an argument to a 'nonnull' parameter
    memcpy(p->abData, data, len);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/dev-smartcard-reader.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 757b8b3f5a..49cb1829b5 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -813,7 +813,10 @@ static void ccid_write_data_block(USBCCIDState *s, uint8_t slot, uint8_t seq,
     if (p->b.bError) {
         DPRINTF(s, D_VERBOSE, "error %d\n", p->b.bError);
     }
-    memcpy(p->abData, data, len);
+    if (len) {
+        g_assert_nonnull(data);
+        memcpy(p->abData, data, len);
+    }
     ccid_reset_error_status(s);
     usb_wakeup(s->bulk, 0);
 }
-- 
2.11.0


