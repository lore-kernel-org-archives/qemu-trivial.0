Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXQ6B-0008R2-19
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 03:05:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQ5n-0007mC-22
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:05:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQ5i-0001ii-41
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:05:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51083)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXQ5N-0001M2-50; Tue, 08 Apr 2014 03:04:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DC2AE40E33;
	Tue,  8 Apr 2014 11:04:43 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E602A674;
	Tue,  8 Apr 2014 11:04:12 +0400 (MSK)
Received: (nullmailer pid 10564 invoked by uid 1000);
	Tue, 08 Apr 2014 07:04:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  8 Apr 2014 11:04:01 +0400
Message-Id: <1396940651-10513-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Gang <gang.chen.5i5j@gmail.com>
Subject: [Qemu-trivial] [PULL 01/11] vl: Report accelerator not supported
	for target more nicely
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
X-List-Received-Date: Tue, 08 Apr 2014 07:05:30 -0000

From: Chen Gang <gang.chen.5i5j@gmail.com>

When you ask for an accelerator not supported for your target, you get
a bogus "accelerator does not exist" message:

  $ qemu-system-arm -machine none,accel=kvm
  KVM not supported for this target
  "kvm" accelerator does not exist.
  No accelerator found!

Suppress it.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 9975e5a..db9ea90 100644
--- a/vl.c
+++ b/vl.c
@@ -2740,7 +2740,7 @@ static int configure_accelerator(QEMUMachine *machine)
                 if (!accel_list[i].available()) {
                     printf("%s not supported for this target\n",
                            accel_list[i].name);
-                    continue;
+                    break;
                 }
                 *(accel_list[i].allowed) = true;
                 ret = accel_list[i].init(machine);
-- 
1.7.10.4


