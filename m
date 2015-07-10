Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZDMYB-0003Ou-0c
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jul 2015 20:52:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ZDMY8-0003Ku-EB
	for qemu-trivial@nongnu.org; Thu, 09 Jul 2015 20:52:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ZDMY5-00052r-8E
	for qemu-trivial@nongnu.org; Thu, 09 Jul 2015 20:52:20 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:50993)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1ZDMY4-000514-M9; Thu, 09 Jul 2015 20:52:17 -0400
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CQZ76954; Fri, 10 Jul 2015 08:51:55 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 10 Jul 2015 08:51:43 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 10 Jul 2015 08:51:29 +0800
Message-ID: <1436489490-236-4-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1436489490-236-1-git-send-email-arei.gonglei@huawei.com>
References: <1436489490-236-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH 3/4] arm/xlnx-zynqmp: fix memory leak
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
X-List-Received-Date: Fri, 10 Jul 2015 00:52:21 -0000

From: Gonglei <arei.gonglei@huawei.com>

fix CID 1311372.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/arm/xlnx-zynqmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 5e72078..00c5943 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -144,7 +144,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         } else {
             s->boot_cpu_ptr = &s->apu_cpu[i];
         }
-
+        g_free(name);
         object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
                                 "reset-cbar", &err);
         if (err) {
@@ -181,7 +181,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         } else {
             s->boot_cpu_ptr = &s->rpu_cpu[i];
         }
-
+        g_free(name);
         object_property_set_bool(OBJECT(&s->rpu_cpu[i]), true, "reset-hivecs",
                                  &err);
         if (err != NULL) {
-- 
1.7.12.4



