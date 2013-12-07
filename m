Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpDTR-0007J0-Mv
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 03:42:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpDTO-0007FN-QK
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 03:42:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpDTN-0004Ey-TA
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 03:42:50 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:52887
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpDTL-0004Ej-R1; Sat, 07 Dec 2013 03:42:47 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 535AA1802AD; Sat,  7 Dec 2013 09:42:44 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sat,  7 Dec 2013 09:42:44 +0100
Message-Id: <1386405764-18118-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PATCH] misc: Use macro ARRAY_SIZE were possible
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
X-List-Received-Date: Sat, 07 Dec 2013 08:42:52 -0000

This improves readability and simplifies the code.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/audio/intel-hda.c |    4 ++--
 net/net.c            |    2 +-
 qemu-char.c          |    3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 4327264..8fe5d87 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -899,7 +899,7 @@ static const IntelHDAReg *intel_hda_reg_find(IntelHDAState *d, hwaddr addr)
 {
     const IntelHDAReg *reg;
 
-    if (addr >= sizeof(regtab)/sizeof(regtab[0])) {
+    if (addr >= ARRAY_SIZE(regtab)) {
         goto noreg;
     }
     reg = regtab+addr;
@@ -1024,7 +1024,7 @@ static void intel_hda_regs_reset(IntelHDAState *d)
     uint32_t *addr;
     int i;
 
-    for (i = 0; i < sizeof(regtab)/sizeof(regtab[0]); i++) {
+    for (i = 0; i < ARRAY_SIZE(regtab); i++) {
         if (regtab[i].name == NULL) {
             continue;
         }
diff --git a/net/net.c b/net/net.c
index 0a88e68..d677606 100644
--- a/net/net.c
+++ b/net/net.c
@@ -850,7 +850,7 @@ static int net_host_check_device(const char *device)
                                        ,"vde"
 #endif
     };
-    for (i = 0; i < sizeof(valid_param_list) / sizeof(char *); i++) {
+    for (i = 0; i < ARRAY_SIZE(valid_param_list); i++) {
         if (!strncmp(valid_param_list[i], device,
                      strlen(valid_param_list[i])))
             return 1;
diff --git a/qemu-char.c b/qemu-char.c
index e00f84c..362a02d 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1975,8 +1975,7 @@ static void win_stdio_wait_func(void *opaque)
     DWORD              dwSize;
     int                i;
 
-    ret = ReadConsoleInput(stdio->hStdIn, buf, sizeof(buf) / sizeof(*buf),
-                           &dwSize);
+    ret = ReadConsoleInput(stdio->hStdIn, buf, ARRAY_SIZE(buf), &dwSize);
 
     if (!ret) {
         /* Avoid error storm */
-- 
1.7.10.4


