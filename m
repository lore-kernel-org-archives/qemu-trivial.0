Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vga4t-0000XL-HN
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 08:01:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vga4l-0000IN-LC
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:01:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vga4g-0006x7-UT
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:01:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vga4T-0006qX-Ms; Wed, 13 Nov 2013 08:01:25 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7E27D41753;
	Wed, 13 Nov 2013 17:01:24 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5C0CB525;
	Wed, 13 Nov 2013 17:01:24 +0400 (MSK)
Received: (nullmailer pid 16036 invoked by uid 1000);
	Wed, 13 Nov 2013 13:01:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Wed, 13 Nov 2013 17:01:07 +0400
Message-Id: <1384347680-15976-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Krupa <jkrupa@suse.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 03/16] qemu-char: add support for U-prefixed
	symbols
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
X-List-Received-Date: Wed, 13 Nov 2013 13:01:48 -0000

From: Jan Krupa <JKrupa@suse.com>

This patch adds support for Unicode symbols in keymap files. This
feature was already used in some keyboard layouts in QEMU generated
from XKB (e.g. Arabic) but it wasn't implemented in QEMU source code.

There is no need for check of validity of the hex string after U character
because strtol returns 0 in case the conversion was unsuccessful.

Signed-off-by: Jan Krupa <jkrupa@suse.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/keymaps.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/ui/keymaps.c b/ui/keymaps.c
index f373cc5..80d658d 100644
--- a/ui/keymaps.c
+++ b/ui/keymaps.c
@@ -33,6 +33,12 @@ static int get_keysym(const name2keysym_t *table,
         if (!strcmp(p->name, name))
             return p->keysym;
     }
+    if (name[0] == 'U' && strlen(name) == 5) { /* try unicode Uxxxx */
+        char *end;
+        int ret = (int)strtoul(name + 1, &end, 16);
+        if (*end == '\0' && ret > 0)
+          return ret;
+    }
     return 0;
 }
 
-- 
1.7.10.4


