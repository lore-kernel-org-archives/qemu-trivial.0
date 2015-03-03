Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSjYl-0000vF-KH
	for mharc-qemu-trivial@gnu.org; Tue, 03 Mar 2015 04:56:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YSjYj-0000qg-Du
	for qemu-trivial@nongnu.org; Tue, 03 Mar 2015 04:56:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1YSjYe-00043t-N0
	for qemu-trivial@nongnu.org; Tue, 03 Mar 2015 04:56:13 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:26514)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1YSjYe-00040c-5n; Tue, 03 Mar 2015 04:56:08 -0500
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKG22673; Tue, 03 Mar 2015 17:56:00 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1; Tue, 3 Mar 2015
	17:55:49 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Tue, 3 Mar 2015 17:55:08 +0800
Message-ID: <1425376508-12632-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, peter.huangpeng@huawei.com,
	armbru@redhat.com, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] error: Replace error_report() & error_free()
	with error_report_err()
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
X-List-Received-Date: Tue, 03 Mar 2015 09:56:14 -0000

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 hw/arm/virt.c | 2 +-
 savevm.c      | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 69f51ac..4732c12 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -768,7 +768,7 @@ static void machvirt_init(MachineState *machine)
         /* Handle any CPU options specified by the user */
         cc->parse_features(CPU(cpuobj), cpustr[1], &err);
         if (err) {
-            error_report("%s", error_get_pretty(err));
+            error_report_err(err);
             exit(1);
         }
 
diff --git a/savevm.c b/savevm.c
index ce2b6a2..c4f8c39 100644
--- a/savevm.c
+++ b/savevm.c
@@ -932,8 +932,7 @@ int qemu_loadvm_state(QEMUFile *f)
     int ret;
 
     if (qemu_savevm_state_blocked(&local_err)) {
-        error_report("%s", error_get_pretty(local_err));
-        error_free(local_err);
+        error_report_err(local_err);
         return -EINVAL;
     }
 
-- 
1.7.12.4



