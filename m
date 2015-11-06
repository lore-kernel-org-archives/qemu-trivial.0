Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zugvq-00031Z-Gf
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 08:19:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zugvj-0002qi-Sk
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:19:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Zugvj-0002HC-00
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 08:19:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50312)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zugvf-0002Ek-41; Fri, 06 Nov 2015 08:19:43 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CF10340DDC;
	Fri,  6 Nov 2015 16:19:39 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 291E6AB9;
	Fri,  6 Nov 2015 15:44:04 +0300 (MSK)
Received: (nullmailer pid 31686 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:44 +0300
Message-Id: <2c21ec3d1818cb0395b5a9b73128e6920d44def7.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/24] xen: fix invalid assertion
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
X-List-Received-Date: Fri, 06 Nov 2015 13:19:53 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Asserting "true" is not that useful.

Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/xen/xen_pt_config_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 0efee11..3d8686d 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -1937,7 +1937,7 @@ static int xen_pt_config_reg_init(XenPCIPassthroughState *s,
                 break;
         case 4: rc = xen_host_pci_get_long(&s->real_device, offset, &val);
                 break;
-        default: assert(1);
+        default: abort();
         }
         if (rc) {
             /* Serious issues when we cannot read the host values! */
@@ -1982,7 +1982,7 @@ static int xen_pt_config_reg_init(XenPCIPassthroughState *s,
                 break;
         case 4: pci_set_long(s->dev.config + offset, val);
                 break;
-        default: assert(1);
+        default: abort();
         }
         /* set register value pointer to the data. */
         reg_entry->ptr.byte = s->dev.config + offset;
-- 
2.1.4


