Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SJlyb-0008BR-1c
	for mharc-qemu-trivial@gnu.org; Mon, 16 Apr 2012 09:28:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <camponez@oc6553588448.ibm.com>) id 1SJlyW-0007xD-NE
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 09:28:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <camponez@oc6553588448.ibm.com>) id 1SJlyQ-0000hM-KD
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 09:28:12 -0400
Received: from 189.26.211.247.dynamic.adsl.gvt.net.br ([189.26.211.247]:15958
	helo=oc6553588448.ibm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <camponez@oc6553588448.ibm.com>) id 1SJlyQ-0000fb-BS
	for qemu-trivial@nongnu.org; Mon, 16 Apr 2012 09:28:06 -0400
Received: by oc6553588448.ibm.com (Postfix, from userid 500)
	id 47F2A67B32; Mon, 16 Apr 2012 09:51:44 -0300 (BRT)
From: Eduardo Elias Ferreira <edusf@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Mon, 16 Apr 2012 09:51:42 -0300
Message-Id: <1334580702-8416-1-git-send-email-edusf@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 189.26.211.247
Subject: [Qemu-trivial] [PATCH] spice-qemu-char.c: Show what name is
	unsupported
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
X-List-Received-Date: Mon, 16 Apr 2012 13:28:15 -0000


Signed-off-by: Eduardo Elias Ferreira <edusf@linux.vnet.ibm.com>
---
 spice-qemu-char.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/spice-qemu-char.c b/spice-qemu-char.c
index 9bab4ac..ef44bc0 100644
--- a/spice-qemu-char.c
+++ b/spice-qemu-char.c
@@ -233,7 +233,7 @@ CharDriverState *qemu_chr_open_spice(QemuOpts *opts)
         }
     }
     if (subtype == NULL) {
-        fprintf(stderr, "spice-qemu-char: unsupported name\n");
+        fprintf(stderr, "spice-qemu-char: unsupported name: %s\n", name);
         print_allowed_subtypes();
         return NULL;
     }
-- 
1.7.1


