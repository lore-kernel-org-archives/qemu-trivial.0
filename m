Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abPpH-0005Ar-IC
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 04:45:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPpE-00055V-IK
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:45:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1abPpD-0006Bf-PF
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 04:45:40 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:13033)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1abPp9-000694-2H; Thu, 03 Mar 2016 04:45:35 -0500
Received: from 172.24.1.48 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.1.48])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFU06264; Thu, 03 Mar 2016 17:44:36 +0800 (CST)
Received: from localhost (10.177.18.62) by szxeml422-hub.china.huawei.com
	(10.82.67.152) with Microsoft SMTP Server id 14.3.235.1; Thu, 3 Mar 2016
	17:43:53 +0800
From: Gonglei <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 3 Mar 2016 17:43:42 +0800
Message-ID: <1456998223-12356-6-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 2.6.3.windows.1
In-Reply-To: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.18.62]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.56D807B9.0033, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 96a4a07a24c9f93f49edac6a5945c331
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH 5/6] spapr: fix possible Negative array index
	read
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
X-List-Received-Date: Thu, 03 Mar 2016 09:45:41 -0000

fix CID 1351391.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/ppc/spapr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e9d4abf..57d19ab 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2221,6 +2221,10 @@ static void spapr_machine_device_plug(HotplugHandler *hotplug_dev,
         if (*errp) {
             return;
         }
+        if (node < 0 || node >= MAX_NODES) {
+            error_setg(errp, "Invaild node %d", node);
+            return;
+        }
 
         /*
          * Currently PowerPC kernel doesn't allow hot-adding memory to
-- 
1.8.5.2



