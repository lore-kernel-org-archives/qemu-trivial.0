Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XpaGY-0006eg-Ij
	for mharc-qemu-trivial@gnu.org; Sat, 15 Nov 2014 05:07:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGR-0006QE-Cd
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGM-0003v5-Ie
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:31 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:2905)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XpaG4-0003iF-2C; Sat, 15 Nov 2014 05:07:11 -0500
Received: from 172.24.2.119 (EHLO szxeml448-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CEL83189; Sat, 15 Nov 2014 18:07:00 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml448-hub.china.huawei.com
	(10.82.67.191) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 15 Nov 2014 18:06:53 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 15 Nov 2014 18:06:44 +0800
Message-ID: <1416046008-7880-6-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: weidong.huang@huawei.com, zhang.zhanghailiang@huawei.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 5/9] nvme: remove superfluous check
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
X-List-Received-Date: Sat, 15 Nov 2014 10:07:36 -0000

From: Gonglei <arei.gonglei@huawei.com>

Operands don't affect result (CONSTANT_EXPRESSION_RESULT)
((n->bar.aqa >> AQA_ASQS_SHIFT) & AQA_ASQS_MASK) > 4095
is always false regardless of the values of its operands.
This occurs as the logical second operand of '||'.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/block/nvme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index b6263dc..1327658 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -583,8 +583,7 @@ static int nvme_start_ctrl(NvmeCtrl *n)
             NVME_CC_IOCQES(n->bar.cc) > NVME_CTRL_CQES_MAX(n->id_ctrl.cqes) ||
             NVME_CC_IOSQES(n->bar.cc) < NVME_CTRL_SQES_MIN(n->id_ctrl.sqes) ||
             NVME_CC_IOSQES(n->bar.cc) > NVME_CTRL_SQES_MAX(n->id_ctrl.sqes) ||
-            !NVME_AQA_ASQS(n->bar.aqa) || NVME_AQA_ASQS(n->bar.aqa) > 4095 ||
-            !NVME_AQA_ACQS(n->bar.aqa) || NVME_AQA_ACQS(n->bar.aqa) > 4095) {
+            !NVME_AQA_ASQS(n->bar.aqa) || !NVME_AQA_ACQS(n->bar.aqa)) {
         return -1;
     }
 
-- 
1.7.12.4



