Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aflu7-0008FU-TA
	for mharc-qemu-trivial@gnu.org; Tue, 15 Mar 2016 06:08:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1aflu4-00088a-Vr
	for qemu-trivial@nongnu.org; Tue, 15 Mar 2016 06:08:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1aflu4-000620-2f
	for qemu-trivial@nongnu.org; Tue, 15 Mar 2016 06:08:40 -0400
Received: from [59.151.112.132] (port=36751 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1afltz-0005q9-Fw; Tue, 15 Mar 2016 06:08:35 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="4591536"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Mar 2016 18:08:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3B2F942B55F0;
	Tue, 15 Mar 2016 18:08:27 +0800 (CST)
Received: from localhost.localdomain (10.167.226.50) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 15 Mar 2016 18:13:06 +0800
From: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 15 Mar 2016 18:07:43 +0800
Message-ID: <1458036463-20180-1-git-send-email-weijg.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.50]
X-yoursite-MailScanner-ID: 3B2F942B55F0.ADBBD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Wei Jiangang <weijg.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [Qemu-devel][PATCH] accel: make
	configure_accelerator return void
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
X-List-Received-Date: Tue, 15 Mar 2016 10:08:42 -0000

Return the negated value of accel_initialised is meaningless,
and the caller vl doesn't check it.

Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
---
 accel.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

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
 
 
-- 
1.9.3




