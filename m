Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aqYR4-00019t-3f
	for mharc-qemu-trivial@gnu.org; Wed, 13 Apr 2016 23:59:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1aqYR1-00014x-LV
	for qemu-trivial@nongnu.org; Wed, 13 Apr 2016 23:59:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1aqYR0-0001p4-ND
	for qemu-trivial@nongnu.org; Wed, 13 Apr 2016 23:59:15 -0400
Received: from [59.151.112.132] (port=27106 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1aqYQu-0001mU-Pa; Wed, 13 Apr 2016 23:59:09 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5584413"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Apr 2016 11:59:05 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id EFF8F42B55E5;
	Thu, 14 Apr 2016 11:59:03 +0800 (CST)
Received: from localhost.localdomain (10.167.226.50) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 14 Apr 2016 11:59:03 +0800
From: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, <peter.maydell@linaro.org>,
	<xiecl.fnst@cn.fujitsu.com>, Wei Jiangang <weijg.fnst@cn.fujitsu.com>
Date: Thu, 14 Apr 2016 11:58:02 +0800
Message-ID: <1460606282-4570-1-git-send-email-weijg.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.50]
X-yoursite-MailScanner-ID: EFF8F42B55E5.A04CB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: [Qemu-trivial] [Qemu-devel][PATCH v2] accel: make
 configure_accelerator return void
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Apr 2016 03:59:16 -0000

Return the negated value of accel_initialised is meaningless,
and the caller vl doesn't check it.

Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
---
 accel.c                | 4 +---
 include/sysemu/accel.h | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/accel.c b/accel.c
index 0510b90..403eb5e 100644
--- a/accel.c
+++ b/accel.c
@@ -77,7 +77,7 @@ static int accel_init_machine(AccelClass *acc, MachineState *ms)
     return ret;
 }
 
-int configure_accelerator(MachineState *ms)
+void configure_accelerator(MachineState *ms)
 {
     const char *p;
     char buf[10];
@@ -128,8 +128,6 @@ int configure_accelerator(MachineState *ms)
     if (init_failed) {
         fprintf(stderr, "Back to %s accelerator.\n", acc->name);
     }
-
-    return !accel_initialised;
 }
 
 
diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
index 997720f..c230f1b 100644
--- a/include/sysemu/accel.h
+++ b/include/sysemu/accel.h
@@ -57,6 +57,6 @@ typedef struct AccelClass {
 
 extern int tcg_tb_size;
 
-int configure_accelerator(MachineState *ms);
+void configure_accelerator(MachineState *ms);
 
 #endif
-- 
1.9.3




