Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sd3Zy-0006HO-Sl
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2012 14:06:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fboiteux@free.fr>) id 1Sd3Zw-0006Gj-Fl
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2012 14:06:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fboiteux@free.fr>) id 1Sd3Zu-0006WY-RJ
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2012 14:06:32 -0400
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:27803
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fboiteux@free.fr>) id 1Sd3Zu-0006W3-LT
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2012 14:06:30 -0400
Received: from joubarbe.local ([193.251.14.247]) by mwinf5d08 with ME
	id Ku6S1j00A5KpcBl03u6Sfx; Fri, 08 Jun 2012 20:06:28 +0200
Received: by joubarbe.local (Postfix, from userid 1000)
	id 5E84812612E; Fri,  8 Jun 2012 20:06:27 +0200 (CEST)
From: fboiteux@free.fr
To: qemu-devel@nongnu.org
Date: Fri,  8 Jun 2012 20:06:25 +0200
Message-Id: <1339178785-8977-1-git-send-email-fboiteux@free.fr>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.126
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Boiteux?= <fboiteux@free.fr>,
	676374@bugs.debian.org
Subject: [Qemu-trivial] [PATCH] Install 'bepo' keymap already included in
	Qemu source
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
X-List-Received-Date: Fri, 08 Jun 2012 18:06:33 -0000

From: Frédéric Boiteux <fboiteux@free.fr>

The 'bepo' layout (a french dvorak-like keyboard layout) was added
about one year ago, (see commit 2a3c633c1eb8692716220195b6d3fe78b7e411d0),
but I missed to declare to install it.

Signed-off-by: Frédéric Boiteux <fboiteux@free.fr>
---
 Makefile |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9b7a85e..5791aeb 100644
--- a/Makefile
+++ b/Makefile
@@ -249,7 +249,8 @@ distclean: clean
 
 KEYMAPS=da     en-gb  et  fr     fr-ch  is  lt  modifiers  no  pt-br  sv \
 ar      de     en-us  fi  fr-be  hr     it  lv  nl         pl  ru     th \
-common  de-ch  es     fo  fr-ca  hu     ja  mk  nl-be      pt  sl     tr
+common  de-ch  es     fo  fr-ca  hu     ja  mk  nl-be      pt  sl     tr \
+bepo
 
 ifdef INSTALL_BLOBS
 BLOBS=bios.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
-- 
1.7.10


