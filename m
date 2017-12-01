Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKug2-0007XU-W2
	for mharc-qemu-trivial@gnu.org; Fri, 01 Dec 2017 18:25:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKufv-0007PO-Ry
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 18:24:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKufv-0004Kw-0r
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 18:24:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59540)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eKufp-0004FM-Vg; Fri, 01 Dec 2017 18:24:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1474681DE5;
	Fri,  1 Dec 2017 23:24:49 +0000 (UTC)
Received: from red.redhat.com (ovpn-122-182.rdu2.redhat.com [10.10.122.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 864565D6A3;
	Fri,  1 Dec 2017 23:24:45 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, qemu-trivial@nongnu.org, pbonzini@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Fri,  1 Dec 2017 17:24:29 -0600
Message-Id: <20171201232433.25193-4-eblake@redhat.com>
In-Reply-To: <20171201232433.25193-1-eblake@redhat.com>
References: <20171201232433.25193-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 01 Dec 2017 23:24:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 3/7] chardev: Use goto/label instead of
 do/break/while(0)
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
X-List-Received-Date: Fri, 01 Dec 2017 23:24:59 -0000

Use of a do/while(0) control flow in order to permit an early break
is an unusual paradigm, and triggers a false positive with a planned
future syntax check against 'while (0);'.  Rewrite the code to use a
goto instead.  This patch temporarily keeps an extra level of
indentation to highlight the change; the next patch cleans it up.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 chardev/char-serial.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/chardev/char-serial.c b/chardev/char-serial.c
index 2f8f83821d..10162f9fa3 100644
--- a/chardev/char-serial.c
+++ b/chardev/char-serial.c
@@ -64,9 +64,14 @@ static void tty_serial_init(int fd, int speed,
 #endif
     tcgetattr(fd, &tty);

-#define check_speed(val) if (speed <= val) { spd = B##val; break; }
+#define check_speed(val) \
+    if (speed <= val) {  \
+        spd = B##val;    \
+        goto done;       \
+    }
+
     speed = speed * 10 / 11;
-    do {
+    {
         check_speed(50);
         check_speed(75);
         check_speed(110);
@@ -125,8 +130,10 @@ static void tty_serial_init(int fd, int speed,
         check_speed(4000000);
 #endif
         spd = B115200;
-    } while (0);
+    }

+#undef check_speed
+ done:
     cfsetispeed(&tty, spd);
     cfsetospeed(&tty, spd);

-- 
2.14.3


