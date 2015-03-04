Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTClZ-0006Ae-14
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:07:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTClT-000601-FF
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:07:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTClO-0005jx-Nb
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:07:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTClG-0005hb-Jd; Wed, 04 Mar 2015 12:07:06 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 00DCE4089F;
	Wed,  4 Mar 2015 20:07:06 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CA4C3933;
	Wed,  4 Mar 2015 20:07:05 +0300 (MSK)
Received: (nullmailer pid 17487 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:19 +0300
Message-Id: <9015b06c747ce2093a14e08c766af2e78df269ca.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/47] xen-pt: fix Out-of-bounds read
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
X-List-Received-Date: Wed, 04 Mar 2015 17:07:23 -0000

From: Gonglei <arei.gonglei@huawei.com>

The array length of s->real_device.io_regions[] is
"PCI_NUM_REGIONS - 1".

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/xen/xen_pt_config_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 710fe50..d99c22e 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -438,7 +438,7 @@ static int xen_pt_bar_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
 
     /* get BAR index */
     index = xen_pt_bar_offset_to_index(reg->offset);
-    if (index < 0 || index >= PCI_NUM_REGIONS) {
+    if (index < 0 || index >= PCI_NUM_REGIONS - 1) {
         XEN_PT_ERR(&s->dev, "Internal error: Invalid BAR index [%d].\n", index);
         return -1;
     }
-- 
2.1.4


