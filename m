Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWVW-0002Qs-1G
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:12:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWVR-0002IG-JM
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:12:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWVQ-0007mW-NZ
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:12:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWVJ-0007iY-FY; Thu, 19 Mar 2015 05:12:37 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8F2C441E45;
	Thu, 19 Mar 2015 12:12:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5CD6F933;
	Thu, 19 Mar 2015 12:05:46 +0300 (MSK)
Received: (nullmailer pid 351 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:32 +0300
Message-Id: <198675491fcec79f6ebb5d85ccaa52beecd56e43.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 14/24] error: Replace error_report() &
	error_free() with error_report_err()
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
X-List-Received-Date: Thu, 19 Mar 2015 09:12:46 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

This is a continuation of the work started in commit 565f65d27:
"error: Use error_report_err() where appropriate"

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/arm/virt.c | 2 +-
 savevm.c      | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b2eaea8..b652b07 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -771,7 +771,7 @@ static void machvirt_init(MachineState *machine)
         cc->parse_features(CPU(cpuobj), cpuopts, &err);
         g_free(cpuopts);
         if (err) {
-            error_report("%s", error_get_pretty(err));
+            error_report_err(err);
             exit(1);
         }
 
diff --git a/savevm.c b/savevm.c
index e7d97ee..3b0e222 100644
--- a/savevm.c
+++ b/savevm.c
@@ -941,8 +941,7 @@ int qemu_loadvm_state(QEMUFile *f)
     int file_error_after_eof = -1;
 
     if (qemu_savevm_state_blocked(&local_err)) {
-        error_report("%s", error_get_pretty(local_err));
-        error_free(local_err);
+        error_report_err(local_err);
         return -EINVAL;
     }
 
-- 
2.1.4


