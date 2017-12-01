Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKug0-0007V0-TO
	for mharc-qemu-trivial@gnu.org; Fri, 01 Dec 2017 18:25:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKufw-0007PV-0u
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 18:24:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKufv-0004L8-1W
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 18:24:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:31917)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eKufr-0004Hv-78; Fri, 01 Dec 2017 18:24:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E78E4E90E;
	Fri,  1 Dec 2017 23:24:50 +0000 (UTC)
Received: from red.redhat.com (ovpn-122-182.rdu2.redhat.com [10.10.122.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58BCE5D6A3;
	Fri,  1 Dec 2017 23:24:49 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, qemu-trivial@nongnu.org, pbonzini@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Fri,  1 Dec 2017 17:24:30 -0600
Message-Id: <20171201232433.25193-5-eblake@redhat.com>
In-Reply-To: <20171201232433.25193-1-eblake@redhat.com>
References: <20171201232433.25193-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 01 Dec 2017 23:24:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 4/7] chardev: Clean up previous patch
 indentation
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

The previous patch left in an extra scope layer for ease of
review; time to remove it.  No semantic change.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 chardev/char-serial.c | 66 +++++++++++++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/chardev/char-serial.c b/chardev/char-serial.c
index 10162f9fa3..93392c528c 100644
--- a/chardev/char-serial.c
+++ b/chardev/char-serial.c
@@ -71,66 +71,64 @@ static void tty_serial_init(int fd, int speed,
     }

     speed = speed * 10 / 11;
-    {
-        check_speed(50);
-        check_speed(75);
-        check_speed(110);
-        check_speed(134);
-        check_speed(150);
-        check_speed(200);
-        check_speed(300);
-        check_speed(600);
-        check_speed(1200);
-        check_speed(1800);
-        check_speed(2400);
-        check_speed(4800);
-        check_speed(9600);
-        check_speed(19200);
-        check_speed(38400);
-        /* Non-Posix values follow. They may be unsupported on some systems. */
-        check_speed(57600);
-        check_speed(115200);
+    check_speed(50);
+    check_speed(75);
+    check_speed(110);
+    check_speed(134);
+    check_speed(150);
+    check_speed(200);
+    check_speed(300);
+    check_speed(600);
+    check_speed(1200);
+    check_speed(1800);
+    check_speed(2400);
+    check_speed(4800);
+    check_speed(9600);
+    check_speed(19200);
+    check_speed(38400);
+    /* Non-Posix values follow. They may be unsupported on some systems. */
+    check_speed(57600);
+    check_speed(115200);
 #ifdef B230400
-        check_speed(230400);
+    check_speed(230400);
 #endif
 #ifdef B460800
-        check_speed(460800);
+    check_speed(460800);
 #endif
 #ifdef B500000
-        check_speed(500000);
+    check_speed(500000);
 #endif
 #ifdef B576000
-        check_speed(576000);
+    check_speed(576000);
 #endif
 #ifdef B921600
-        check_speed(921600);
+    check_speed(921600);
 #endif
 #ifdef B1000000
-        check_speed(1000000);
+    check_speed(1000000);
 #endif
 #ifdef B1152000
-        check_speed(1152000);
+    check_speed(1152000);
 #endif
 #ifdef B1500000
-        check_speed(1500000);
+    check_speed(1500000);
 #endif
 #ifdef B2000000
-        check_speed(2000000);
+    check_speed(2000000);
 #endif
 #ifdef B2500000
-        check_speed(2500000);
+    check_speed(2500000);
 #endif
 #ifdef B3000000
-        check_speed(3000000);
+    check_speed(3000000);
 #endif
 #ifdef B3500000
-        check_speed(3500000);
+    check_speed(3500000);
 #endif
 #ifdef B4000000
-        check_speed(4000000);
+    check_speed(4000000);
 #endif
-        spd = B115200;
-    }
+    spd = B115200;

 #undef check_speed
  done:
-- 
2.14.3


