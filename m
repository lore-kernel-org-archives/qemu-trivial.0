Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWPrD-0000mQ-VN
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 09:42:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWILu-0005Qc-Nj
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 01:41:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWI6w-0007j1-An
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 01:26:15 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:23879)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWI6s-0007iC-AX; Fri, 13 Mar 2015 01:26:11 -0400
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CKS85290; Fri, 13 Mar 2015 13:22:37 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml433-hub.china.huawei.com (10.82.67.210) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 13 Mar 2015 13:22:27 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 13 Mar 2015 13:21:59 +0800
Message-ID: <1426224119-8352-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
X-Mailman-Approved-At: Fri, 13 Mar 2015 09:42:30 -0400
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] hw/net/e1000: fix integer endianness
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
X-List-Received-Date: Fri, 13 Mar 2015 05:41:46 -0000

It's detected by coverity.In is_vlan_packet s->mac_reg[VET] is
unsigned int but is dereferenced as a narrower unsigned short.
This may lead to unexpected results depending on machine
endianness.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/net/e1000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index a207e21..59d73cd 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -578,7 +578,7 @@ static inline int
 is_vlan_packet(E1000State *s, const uint8_t *buf)
 {
     return (be16_to_cpup((uint16_t *)(buf + 12)) ==
-                le16_to_cpup((uint16_t *)(s->mac_reg + VET)));
+                le16_to_cpu(s->mac_reg[VET]));
 }
 
 static inline int
@@ -711,7 +711,7 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
         (tp->cptse || txd_lower & E1000_TXD_CMD_EOP)) {
         tp->vlan_needed = 1;
         stw_be_p(tp->vlan_header,
-                      le16_to_cpup((uint16_t *)(s->mac_reg + VET)));
+                      le16_to_cpu(s->mac_reg[VET]));
         stw_be_p(tp->vlan_header + 2,
                       le16_to_cpu(dp->upper.fields.special));
     }
-- 
1.8.3.1



