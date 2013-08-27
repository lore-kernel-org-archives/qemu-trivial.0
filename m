Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEfw9-0006cw-9b
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 09:37:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <JKrupa@suse.com>) id 1VEKyq-0005MR-KJ
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 11:14:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <JKrupa@suse.com>) id 1VEKyk-0006uU-M9
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 11:14:52 -0400
Received: from cantor2.suse.de ([195.135.220.15]:46281 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <JKrupa@suse.com>)
	id 1VEKyY-0006rr-8d; Tue, 27 Aug 2013 11:14:34 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id A2B15A52D9;
	Tue, 27 Aug 2013 17:14:32 +0200 (CEST)
From: Jan Krupa <JKrupa@suse.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2013 17:14:47 +0200
Message-Id: <1377616488-16491-3-git-send-email-JKrupa@suse.com>
X-Mailer: git-send-email 1.6.0.2
In-Reply-To: <1377616488-16491-2-git-send-email-JKrupa@suse.com>
References: <1377616488-16491-1-git-send-email-JKrupa@suse.com>
	<1377616488-16491-2-git-send-email-JKrupa@suse.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
X-Mailman-Approved-At: Wed, 28 Aug 2013 09:37:28 -0400
Cc: qemu-trivial@nongnu.org, Jan Krupa <jkrupa@suse.com>, anthony@codemonkey.ws
Subject: [Qemu-trivial] [PATCH 2/3] qemu-char: add Czech keymap file
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
X-List-Received-Date: Tue, 27 Aug 2013 15:14:58 -0000

This patch adds Czech keyboard layout to available keymap files.

Signed-off-by: Jan Krupa <jkrupa@suse.com>
---
 pc-bios/keymaps/cz |   94 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 94 insertions(+), 0 deletions(-)
 create mode 100644 pc-bios/keymaps/cz

diff --git a/pc-bios/keymaps/cz b/pc-bios/keymaps/cz
new file mode 100644
index 0000000..6584bfb
--- /dev/null
+++ b/pc-bios/keymaps/cz
@@ -0,0 +1,94 @@
+include common
+
+# Czech qwertz layout
+# comments are czech descriptions of the characters
+
+# -----------
+#  First row
+# -----------
+
+# strednik, kolecko
+semicolon 0x29
+dead_abovering 0x29 shift
+
+# numbers
+plus 0x2
+1 0x2 shift
+ecaron 0x3
+2 0x3 shift
+scaron 0x4
+3 0x4 shift
+ccaron 0x5
+4 0x5 shift
+rcaron 0x6
+5 0x6 shift
+zcaron 0x7
+6 0x7 shift
+yacute 0x8
+7 0x8 shift
+aacute 0x9
+8 0x9 shift
+iacute 0xa
+9 0xa shift
+eacute 0xb
+0 0xb shift
+
+# rovnitko
+equal 0x0c
+percent 0x0c shift
+
+# carka, hacek
+dead_acute 0x0d
+dead_caron 0x0d shift
+
+# ------------
+#  Second row
+# ------------
+
+z 0x15 addupper
+
+# u s carkou, zpetne lomitko
+uacute 0x1a
+slash 0x1a shift
+
+# prava zavorka, leva zavorka
+parenright 0x1b
+parenleft 0x1b shift
+
+# -----------
+#  Third row
+# -----------
+
+# u s krouzkem, uvozovky
+uring 0x27
+quotedbl 0x27 shift
+
+# paragraf, vykricnik
+section 0x28
+exclam 0x28 shift
+
+# vodorovna dvojtecka, apostrof
+dead_diaeresis 0x2b
+apostrophe 0x2b shift
+
+# ------------
+#  Fourth row
+# ------------
+
+# zpetne lomitko, roura
+backslash 0x2b
+bar 0x2b shift
+
+y 0x2c addupper
+
+# carka, otaznik
+comma 0x33
+question 0x33 shift
+
+# tecka, dvojtecka
+period 0x34
+colon 0x34 shift
+
+# minus, podtrzitko
+minus 0x35
+underscore 0x35 shift
-- 
1.6.0.2


