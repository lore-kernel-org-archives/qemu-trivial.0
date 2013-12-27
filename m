Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VwfZW-0002ue-VG
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:07:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfZR-0002j4-RG
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:07:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfZN-0003xX-GH
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:07:53 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VwfZA-0003s5-0F; Fri, 27 Dec 2013 17:07:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 157C14389F;
	Sat, 28 Dec 2013 02:07:36 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B669B5FC;
	Sat, 28 Dec 2013 02:07:34 +0400 (MSK)
Received: (nullmailer pid 10331 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:16 +0400
Message-Id: <1388182050-10270-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PULL 03/17] misc: Use macro ARRAY_SIZE where
	possible
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
X-List-Received-Date: Fri, 27 Dec 2013 22:07:58 -0000

From: Stefan Weil <sw@weilnetz.de>

This improves readability and simplifies the code.

Cc: Anthony Liguori <aliguori@amazon.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/audio/intel-hda.c |    4 ++--
 net/net.c            |    2 +-
 qemu-char.c          |    3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 6ab8c24..d41f82c 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -900,7 +900,7 @@ static const IntelHDAReg *intel_hda_reg_find(IntelHDAState *d, hwaddr addr)
 {
     const IntelHDAReg *reg;
 
-    if (addr >= sizeof(regtab)/sizeof(regtab[0])) {
+    if (addr >= ARRAY_SIZE(regtab)) {
         goto noreg;
     }
     reg = regtab+addr;
@@ -1025,7 +1025,7 @@ static void intel_hda_regs_reset(IntelHDAState *d)
     uint32_t *addr;
     int i;
 
-    for (i = 0; i < sizeof(regtab)/sizeof(regtab[0]); i++) {
+    for (i = 0; i < ARRAY_SIZE(regtab); i++) {
         if (regtab[i].name == NULL) {
             continue;
         }
diff --git a/net/net.c b/net/net.c
index 9db88cc..f8db85f 100644
--- a/net/net.c
+++ b/net/net.c
@@ -856,7 +856,7 @@ static int net_host_check_device(const char *device)
                                        ,"vde"
 #endif
     };
-    for (i = 0; i < sizeof(valid_param_list) / sizeof(char *); i++) {
+    for (i = 0; i < ARRAY_SIZE(valid_param_list); i++) {
         if (!strncmp(valid_param_list[i], device,
                      strlen(valid_param_list[i])))
             return 1;
diff --git a/qemu-char.c b/qemu-char.c
index 418dc69..30c5a6a 100644
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


