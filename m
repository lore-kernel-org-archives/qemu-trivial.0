Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSPRG-0007BW-59
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2015 07:27:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YSPRE-0007AH-KY
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 07:27:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YSPRD-00076z-RF
	for qemu-trivial@nongnu.org; Mon, 02 Mar 2015 07:27:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48978)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YSPR8-00076c-OQ; Mon, 02 Mar 2015 07:27:02 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t22CR1LT012665
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 2 Mar 2015 07:27:01 -0500
Received: from donizetti.redhat.com (ovpn-112-49.ams2.redhat.com
	[10.36.112.49])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t22CQwMT025975; Mon, 2 Mar 2015 07:27:00 -0500
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Mar 2015 13:26:58 +0100
Message-Id: <1425299218-25488-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] gdbstub: avoid possible NULL pointer
	dereference
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
X-List-Received-Date: Mon, 02 Mar 2015 12:27:09 -0000

Coverity reports that s->chr is checked after put_packet dereferences it.
Move the check earlier, consistent with the code used for user-mode
emulation.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 gdbstub.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index e4a1a79..8abcb8a 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1443,15 +1443,17 @@ void gdb_exit(CPUArchState *env, int code)
   if (gdbserver_fd < 0 || s->fd < 0) {
       return;
   }
+#else
+  if (!s->chr) {
+      return;
+  }
 #endif
 
   snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
   put_packet(s, buf);
 
 #ifndef CONFIG_USER_ONLY
-  if (s->chr) {
-      qemu_chr_delete(s->chr);
-  }
+  qemu_chr_delete(s->chr);
 #endif
 }
 
-- 
2.3.0


