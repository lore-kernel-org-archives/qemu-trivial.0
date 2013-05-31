Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UiO45-00043o-Vx
	for mharc-qemu-trivial@gnu.org; Fri, 31 May 2013 08:04:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UiO42-0003yd-Ld
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 08:04:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UiO1W-00057f-Kt
	for qemu-trivial@nongnu.org; Fri, 31 May 2013 08:01:39 -0400
Received: from mail-ea0-x22a.google.com ([2a00:1450:4013:c01::22a]:39960)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UiO0f-0004yp-Co; Fri, 31 May 2013 08:00:41 -0400
Received: by mail-ea0-f170.google.com with SMTP id f15so1591291eak.1
	for <multiple recipients>; Fri, 31 May 2013 05:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=kkQOElJuNrbaYpL8md1gwUBM3pt8ok6nwRHiB/N1rOs=;
	b=wuScd/z5hBmb+/4OL+5BroZKiprxSW3zMtrPo60W4p0NVfsRW2iuj4RX9xCIoDvEer
	gKamxbDfgiTNG1fPKrv5Y/A2fhMrIQT3UtBCc44Fldl2O0ZmBoLQnR20hwvEDN1vUUWi
	jJor8bNsXyLzahT3tIBnAjt6ftCscjJe+v6+AyTToQ0D1/JSvMaLNhLmu9yILskegWfl
	XhqYUYctkuGl2Kzm+gj0b8aBFK/QL2sg0OpD5kpMytlhWUA4x+xBD2jEEWAY/NTPrplO
	8ZA+weN3Mj2VmNvXu3kS79bW6i93D5nz8V0SkQZ4Xn8x+mxhH+u8BCh2yHW7IZGrZNHq
	av9Q==
X-Received: by 10.14.213.73 with SMTP id z49mr13134662eeo.94.1370001640280;
	Fri, 31 May 2013 05:00:40 -0700 (PDT)
Received: from playground.lan (net-37-116-217-184.cust.dsl.vodafone.it.
	[37.116.217.184])
	by mx.google.com with ESMTPSA id t6sm30447867eev.14.2013.05.31.05.00.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 31 May 2013 05:00:38 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 May 2013 14:00:27 +0200
Message-Id: <1370001627-11830-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.1.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::22a
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PATCH] do not check pointers after dereferencing
	them
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
X-List-Received-Date: Fri, 31 May 2013 12:04:12 -0000

Two instances, both spotted by Coverity.  In one, two blocks were
swapped.  In the other, the check is not needed anymore.

Cc: qemu-stable@nongnu.org
Cc: qemu-trivial@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 monitor.c |  2 +-
 savevm.c  | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/monitor.c b/monitor.c
index 6ce2a4e..eefc7f0 100644
--- a/monitor.c
+++ b/monitor.c
@@ -280,7 +280,7 @@ void monitor_flush(Monitor *mon)
     buf = qstring_get_str(mon->outbuf);
     len = qstring_get_length(mon->outbuf);
 
-    if (mon && len && !mon->mux_out) {
+    if (len && !mon->mux_out) {
         rc = qemu_chr_fe_write(mon->chr, (const uint8_t *) buf, len);
         if (rc == len) {
             /* all flushed */
diff --git a/savevm.c b/savevm.c
index 31dcce9..4e0fab6 100644
--- a/savevm.c
+++ b/savevm.c
@@ -322,16 +322,16 @@ QEMUFile *qemu_popen_cmd(const char *command, const char *mode)
     FILE *stdio_file;
     QEMUFileStdio *s;
 
-    stdio_file = popen(command, mode);
-    if (stdio_file == NULL) {
-        return NULL;
-    }
-
     if (mode == NULL || (mode[0] != 'r' && mode[0] != 'w') || mode[1] != 0) {
         fprintf(stderr, "qemu_popen: Argument validity check failed\n");
         return NULL;
     }
 
+    stdio_file = popen(command, mode);
+    if (stdio_file == NULL) {
+        return NULL;
+    }
+
     s = g_malloc0(sizeof(QEMUFileStdio));
 
     s->stdio_file = stdio_file;
-- 
1.8.1.4


