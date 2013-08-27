Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEfwD-0006ig-SJ
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 09:37:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <JKrupa@suse.com>) id 1VEKys-0005P5-CA
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 11:15:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <JKrupa@suse.com>) id 1VEKym-0006ug-Ct
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 11:14:54 -0400
Received: from cantor2.suse.de ([195.135.220.15]:46283 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <JKrupa@suse.com>)
	id 1VEKyY-0006ru-8W; Tue, 27 Aug 2013 11:14:34 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id F3904A531D;
	Tue, 27 Aug 2013 17:14:32 +0200 (CEST)
From: Jan Krupa <JKrupa@suse.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2013 17:14:48 +0200
Message-Id: <1377616488-16491-4-git-send-email-JKrupa@suse.com>
X-Mailer: git-send-email 1.6.0.2
In-Reply-To: <1377616488-16491-3-git-send-email-JKrupa@suse.com>
References: <1377616488-16491-1-git-send-email-JKrupa@suse.com>
	<1377616488-16491-2-git-send-email-JKrupa@suse.com>
	<1377616488-16491-3-git-send-email-JKrupa@suse.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
X-Mailman-Approved-At: Wed, 28 Aug 2013 09:37:31 -0400
Cc: qemu-trivial@nongnu.org, Jan Krupa <jkrupa@suse.com>, anthony@codemonkey.ws
Subject: [Qemu-trivial] [PATCH 3/3] qemu-char: add support for U-prefixed
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
X-List-Received-Date: Tue, 27 Aug 2013 15:15:00 -0000

This patch adds support for Unicode symbols in keymap files. This
feature was already used in some keyboard layouts in QEMU generated
from XKB (e.g. Arabic) but it wasn't implemented in QEMU source code.

Signed-off-by: Jan Krupa <jkrupa@suse.com>
---
 ui/keymaps.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/ui/keymaps.c b/ui/keymaps.c
index f373cc5..426a893 100644
--- a/ui/keymaps.c
+++ b/ui/keymaps.c
@@ -33,6 +33,9 @@ static int get_keysym(const name2keysym_t *table,
         if (!strcmp(p->name, name))
             return p->keysym;
     }
+    if (strlen(name) == 5 && name[0] == 'U') {
+        return (int)strtol(name + 1, NULL, 16);
+    }
     return 0;
 }
 
-- 
1.6.0.2


