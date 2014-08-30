Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XNZTy-0000g1-0s
	for mharc-qemu-trivial@gnu.org; Fri, 29 Aug 2014 23:37:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XNZTr-0000eu-Bt
	for qemu-trivial@nongnu.org; Fri, 29 Aug 2014 23:37:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>) id 1XNZTm-0002h7-GY
	for qemu-trivial@nongnu.org; Fri, 29 Aug 2014 23:37:35 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:32520)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <john.liuli@huawei.com>)
	id 1XNZTk-0002ep-V1; Fri, 29 Aug 2014 23:37:30 -0400
Received: from 172.24.2.119 (EHLO szxeml459-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATR98995; Sat, 30 Aug 2014 11:37:16 +0800 (CST)
Received: from localhost (10.142.143.9) by szxeml459-hub.china.huawei.com
	(10.82.67.202) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 30 Aug 2014 11:37:09 +0800
From: "john.liuli" <john.liuli@huawei.com>
To: <mjt@tls.msk.ru>
Date: Sat, 30 Aug 2014 11:36:39 +0800
Message-ID: <1409369799-9028-1-git-send-email-john.liuli@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.142.143.9]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020208.540146ED.0064,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: e2657cc763c7714a72e96d23bfc50acc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] numa: fix qerror_report_err not free issue
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
X-List-Received-Date: Sat, 30 Aug 2014 03:37:40 -0000

From: Li Liu <john.liuli@huawei.com>

All qerror_report_err returned none NULL pointers need to
be freed, otherwise will cause memory leaking.

Although this place did not cause real memory leaking by exit,
obviously it's not correct to use qerror_report_err
without error_free it.

Signed-off-by: Li Liu <john.liuli@huawei.com>
---
 numa.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/numa.c b/numa.c
index c78cec9..0b4ac9b 100644
--- a/numa.c
+++ b/numa.c
@@ -298,6 +298,7 @@ void memory_region_allocate_system_memory(MemoryRegion *mr, Object *owner,
         MemoryRegion *seg = host_memory_backend_get_memory(backend, &local_err);
         if (local_err) {
             qerror_report_err(local_err);
+            error_free(local_err);
             exit(1);
         }
 
-- 
1.7.9.5



