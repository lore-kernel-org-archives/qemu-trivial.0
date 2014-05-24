Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wo4k2-0004gc-SA
	for mharc-qemu-trivial@gnu.org; Sat, 24 May 2014 01:43:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aoates.org>) id 1Wnzky-0007jj-O4
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 20:24:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aoates.org>) id 1Wnzko-0002wJ-4x
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 20:24:12 -0400
Received: from mail-qg0-f42.google.com ([209.85.192.42]:47382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aoates.org>) id 1Wnzko-0002vw-27
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 20:24:02 -0400
Received: by mail-qg0-f42.google.com with SMTP id q107so9346810qgd.1
	for <qemu-trivial@nongnu.org>; Fri, 23 May 2014 17:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=juTfue5bb/q1vCieSA8XvxzcrdiiEf4/ZJXxa0TkJ/o=;
	b=cCV34K2NhhDAuMUNE8T8xtbz7Q8qx13a+KqjsGCy5s4xP4MH8XpAYRnyg9zUSMnf0s
	OU5F4qH4T7+4o5r5hyalnX1UnGaPJh+Ljz6USICWJVI/anoVqt29wfLhbcpLf2sbTnxC
	6gVPh5TrCd2g+/vty5Hm/skKGvznyQ0UIYFSAxuuJlNAcnHm1bf0kFVXRE/9KY0hx4XU
	tGWQL+10i0fRv1NWn8mQF7V5tdqzrfQCrhVUWPPdgc/PklH2ggIcvKZ5/Hejx8Yy0BJg
	4xi6N7sQKGFY4w00VdO8H4lqUEnxnXKtvgaQiEWj3/EBnv+fKhScnE6+qyy9mbwoHIDd
	n8wg==
X-Gm-Message-State: ALoCoQkAvjiyvC05+K/OSw9PskwZ70+dafu2N8P+bYPLjYTly7FyKeHu0TsaI27ay135knYn9hjQ
X-Received: by 10.229.72.10 with SMTP id k10mr12026816qcj.2.1400891040686;
	Fri, 23 May 2014 17:24:00 -0700 (PDT)
Received: from egg.hsd1.ma.comcast.net (c-66-31-202-57.hsd1.ma.comcast.net.
	[66.31.202.57])
	by mx.google.com with ESMTPSA id 7sm2934241qgj.27.2014.05.23.17.23.59
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 May 2014 17:24:00 -0700 (PDT)
From: Andrew Oates <andrew@aoates.org>
To: qemu-devel@nongnu.org
Date: Fri, 23 May 2014 20:16:09 -0400
Message-Id: <1400890569-30822-1-git-send-email-andrew@aoates.org>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.42
X-Mailman-Approved-At: Sat, 24 May 2014 01:43:33 -0400
Cc: qemu-trivial@nongnu.org, Andrew Oates <andrew@aoates.org>
Subject: [Qemu-trivial] [PATCH] input (curses): mask keycodes to remove
	modifier bits
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 24 May 2014 00:24:19 -0000

Without the mask, control bits are passed on in the keycode, generating
incorrect PS/2 sequences when SHIFT, ALT, etc are held down.

Signed-off-by: Andrew Oates <andrew@aoates.org>
---
 ui/curses.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/curses.c b/ui/curses.c
index b044790..de85f76 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -288,8 +288,8 @@ static void curses_refresh(DisplayChangeListener *dcl)
                 qemu_input_event_send_key_number(NULL, GREY | ALT_CODE, true);
             }
 
-            qemu_input_event_send_key_number(NULL, keycode, true);
-            qemu_input_event_send_key_number(NULL, keycode, false);
+            qemu_input_event_send_key_number(NULL, keycode & KEY_MASK, true);
+            qemu_input_event_send_key_number(NULL, keycode & KEY_MASK, false);
 
             if (keycode & ALTGR) {
                 qemu_input_event_send_key_number(NULL, GREY | ALT_CODE, false);
-- 
1.9.3


