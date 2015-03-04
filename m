Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTDNi-0000a7-BN
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:46:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTDNc-0000OB-LI
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:46:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTDNb-0004He-TY
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:46:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41899)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTDNS-0004Du-Up; Wed, 04 Mar 2015 12:46:35 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AAC49408AE;
	Wed,  4 Mar 2015 20:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 03C79972;
	Wed,  4 Mar 2015 20:07:11 +0300 (MSK)
Received: (nullmailer pid 17577 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:07:03 +0300
Message-Id: <8f3bad9f247b8123a90c9781d08de52535802d45.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 46/47] gdbstub: avoid possible NULL pointer
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
X-List-Received-Date: Wed, 04 Mar 2015 17:46:45 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Coverity reports that s->chr is checked after put_packet dereferences it.
Move the check earlier, consistent with the code used for user-mode
emulation.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


