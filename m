Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vga4r-0000U0-KG
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 08:01:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vga4j-0000Fi-SM
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:01:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vga4f-0006wM-49
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 08:01:41 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:47033)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vga4T-0006qk-Mz; Wed, 13 Nov 2013 08:01:25 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CE35341756;
	Wed, 13 Nov 2013 17:01:24 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BC9C950F;
	Wed, 13 Nov 2013 17:01:24 +0400 (MSK)
Received: (nullmailer pid 16034 invoked by uid 1000);
	Wed, 13 Nov 2013 13:01:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Wed, 13 Nov 2013 17:01:06 +0400
Message-Id: <1384347680-15976-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1384347680-15976-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Krupa <jkrupa@suse.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 02/16] qemu-char: add Czech keymap file
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
X-List-Received-Date: Wed, 13 Nov 2013 13:01:46 -0000

From: Jan Krupa <JKrupa@suse.com>

This patch adds Czech keyboard layout to available keymap files
and Makefile.

Signed-off-by: Jan Krupa <jkrupa@suse.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 Makefile           |    2 +-
 pc-bios/keymaps/cz |   94 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 pc-bios/keymaps/cz

diff --git a/Makefile b/Makefile
index b15003f..55817c1 100644
--- a/Makefile
+++ b/Makefile
@@ -280,7 +280,7 @@ distclean: clean
 KEYMAPS=da     en-gb  et  fr     fr-ch  is  lt  modifiers  no  pt-br  sv \
 ar      de     en-us  fi  fr-be  hr     it  lv  nl         pl  ru     th \
 common  de-ch  es     fo  fr-ca  hu     ja  mk  nl-be      pt  sl     tr \
-bepo
+bepo    cz
 
 ifdef INSTALL_BLOBS
 BLOBS=bios.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
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
1.7.10.4


