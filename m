Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNDs-0004Kt-4I
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:02:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNDl-00049v-Pj
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:02:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNDg-0001A4-SM
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:02:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38725)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNDM-00015h-Eu; Mon, 05 May 2014 14:02:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0EFB44074E;
	Mon,  5 May 2014 22:02:06 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F16B566D;
	Mon,  5 May 2014 22:02:05 +0400 (MSK)
Received: (nullmailer pid 24220 invoked by uid 1000);
	Mon, 05 May 2014 18:02:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:46 +0400
Message-Id: <1399312923-24129-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 05/22] arch_init: Be sure of only one exit
	entry with DPRINTF() for ram_load()
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
X-List-Received-Date: Mon, 05 May 2014 18:02:39 -0000

From: Chen Gang <gang.chen.5i5j@gmail.com>

When DPRINTF() has effect, the original author wants to print all
ram_load() calling results. So need use 'goto' instead of 'return'
within ram_load(), just like other areas have done.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 arch_init.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch_init.c b/arch_init.c
index 60c975d..333f698 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -998,7 +998,8 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
     seq_iter++;
 
     if (version_id < 4 || version_id > 4) {
-        return -EINVAL;
+        ret = -EINVAL;
+        goto done;
     }
 
     do {
@@ -1055,7 +1056,8 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
 
             host = host_from_stream_offset(f, addr, flags);
             if (!host) {
-                return -EINVAL;
+                ret = -EINVAL;
+                goto done;
             }
 
             ch = qemu_get_byte(f);
@@ -1065,14 +1067,16 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
 
             host = host_from_stream_offset(f, addr, flags);
             if (!host) {
-                return -EINVAL;
+                ret = -EINVAL;
+                goto done;
             }
 
             qemu_get_buffer(f, host, TARGET_PAGE_SIZE);
         } else if (flags & RAM_SAVE_FLAG_XBZRLE) {
             void *host = host_from_stream_offset(f, addr, flags);
             if (!host) {
-                return -EINVAL;
+                ret = -EINVAL;
+                goto done;
             }
 
             if (load_xbzrle(f, addr, host) < 0) {
-- 
1.7.10.4


