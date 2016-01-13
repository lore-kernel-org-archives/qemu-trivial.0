Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aJInD-0001bz-PZ
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jan 2016 05:36:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <w.bumiller@proxmox.com>) id 1aJInC-0001aQ-60
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 05:36:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <w.bumiller@proxmox.com>) id 1aJInB-00016m-9N
	for qemu-trivial@nongnu.org; Wed, 13 Jan 2016 05:36:42 -0500
Received: from proxmox.maurer-it.com ([94.136.31.133]:50193)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <w.bumiller@proxmox.com>)
	id 1aJIn6-00010o-6M; Wed, 13 Jan 2016 05:36:36 -0500
Received: from proxmox.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox.maurer-it.com (Proxmox) with ESMTP id B2431AD0940;
	Wed, 13 Jan 2016 11:36:03 +0100 (CET)
From: Wolfgang Bumiller <w.bumiller@proxmox.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Date: Wed, 13 Jan 2016 11:36:00 +0100
Message-Id: <1452681360-29239-1-git-send-email-w.bumiller@proxmox.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 94.136.31.133
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] vnc: fix tls-creds error message
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
X-List-Received-Date: Wed, 13 Jan 2016 10:36:42 -0000

The parameter is called 'tls-creds', 'credid' is just the
variable name in the code.

Signed-off-by: Wolfgang Bumiller <w.bumiller@proxmox.com>
---
 ui/vnc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 09756cd..2270ac2 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3605,7 +3605,7 @@ void vnc_display_open(const char *id, Error **errp)
             qemu_opt_get(opts, "x509") ||
             qemu_opt_get(opts, "x509verify")) {
             error_setg(errp,
-                       "'credid' parameter is mutually exclusive with "
+                       "'tls-creds' parameter is mutually exclusive with "
                        "'tls', 'x509' and 'x509verify' parameters");
             goto fail;
         }
-- 
2.1.4



