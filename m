Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XFr2C-0003Lp-Rp
	for mharc-qemu-trivial@gnu.org; Fri, 08 Aug 2014 16:45:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFr27-0003Ao-1R
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:45:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XFr22-0005tH-P4
	for qemu-trivial@nongnu.org; Fri, 08 Aug 2014 16:45:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XFr1s-0005m2-Rf; Fri, 08 Aug 2014 16:44:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 667FA41A1A;
	Sat,  9 Aug 2014 00:44:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9894A6F3;
	Sat,  9 Aug 2014 00:39:06 +0400 (MSK)
Received: (nullmailer pid 10314 invoked by uid 1000);
	Fri, 08 Aug 2014 20:39:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  9 Aug 2014 00:38:56 +0400
Message-Id: <1407530342-10259-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1407530342-10259-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: chenfan <chen.fan.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 3/9] target-i386/cpu.c: Fix two error output
	indentation
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
X-List-Received-Date: Fri, 08 Aug 2014 20:45:07 -0000

From: chenfan <chen.fan.fnst@cn.fujitsu.com>

Signed-off-by: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-i386/cpu.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 6d008ab..217500c 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1716,9 +1716,9 @@ static void x86_set_hv_spinlocks(Object *obj, Visitor *v, void *opaque,
 
     if (value < min || value > max) {
         error_setg(errp, "Property %s.%s doesn't take value %" PRId64
-                  " (minimum: %" PRId64 ", maximum: %" PRId64 ")",
-                  object_get_typename(obj), name ? name : "null",
-                  value, min, max);
+                   " (minimum: %" PRId64 ", maximum: %" PRId64 ")",
+                   object_get_typename(obj), name ? name : "null",
+                   value, min, max);
         return;
     }
     cpu->hyperv_spinlock_attempts = value;
@@ -1808,8 +1808,8 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
                 }
                 if (numvalue < min) {
                     error_report("hv-spinlocks value shall always be >= 0x%x"
-                            ", fixup will be removed in future versions",
-                            min);
+                                 ", fixup will be removed in future versions",
+                                 min);
                     numvalue = min;
                 }
                 snprintf(num, sizeof(num), "%" PRId32, numvalue);
-- 
1.7.10.4


