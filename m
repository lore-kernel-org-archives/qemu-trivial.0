Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgT4H-0005c2-Ng
	for mharc-qemu-trivial@gnu.org; Sat, 03 May 2014 02:05:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgT4F-0005ZE-Pz
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 02:05:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgT4E-0007Aq-TB
	for qemu-trivial@nongnu.org; Sat, 03 May 2014 02:04:59 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:58107)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WgT4C-0007AP-Uh; Sat, 03 May 2014 02:04:57 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id F196F17FCC1; Sat,  3 May 2014 08:04:53 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sat,  3 May 2014 08:04:40 +0200
Message-Id: <1399097081-24523-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Jim Meyering <meyering@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] xen: remove unused global, xen_xcg
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
X-List-Received-Date: Sat, 03 May 2014 06:05:00 -0000

From: Jim Meyering <meyering@redhat.com>

Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Jim Meyering <meyering@redhat.com>
Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
---

I rebased this rather old trivial patch - it still applies.

Stefan

 hw/xen/xen_backend.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/xen/xen_backend.c b/hw/xen/xen_backend.c
index 197795f..3cd45b4 100644
--- a/hw/xen/xen_backend.c
+++ b/hw/xen/xen_backend.c
@@ -45,7 +45,6 @@
 
 /* public */
 XenXC xen_xc = XC_HANDLER_INITIAL_VALUE;
-XenGnttab xen_xcg = XC_HANDLER_INITIAL_VALUE;
 struct xs_handle *xenstore = NULL;
 const char *xen_protocol;
 
-- 
1.7.10.4


