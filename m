Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UYdGI-0002ep-Ok
	for mharc-qemu-trivial@gnu.org; Sat, 04 May 2013 10:16:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1UYdGG-0002bI-Kr
	for qemu-trivial@nongnu.org; Sat, 04 May 2013 10:16:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1UYdGF-0006e6-IE
	for qemu-trivial@nongnu.org; Sat, 04 May 2013 10:16:28 -0400
Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10]:50641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1UYdGC-0006dC-Bx; Sat, 04 May 2013 10:16:24 -0400
Received: from localhost.localdomain (unknown [82.227.227.196])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 3483B940178;
	Sat,  4 May 2013 16:16:17 +0200 (CEST)
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Sat,  4 May 2013 16:17:37 +0200
Message-Id: <1367677057-6809-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:e0c:1:1599::10
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [Qemu-trivial] [PATCH for-1.5] audio: update documentation after
	removing --audio-card-list option
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
X-List-Received-Date: Sat, 04 May 2013 14:16:29 -0000

Commit 98af93fde2e37b5b0c8cee9036e028fe6df6446c removed the
--audio-card-list option in configure, and commit
8f3b664f6cc4153cc73941c941d54c4e499b7537 always compiled in
the adlib, gus and cs4231a audio cards.

Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
---
 qemu-doc.texi |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 64493eb..5fc0eae 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -214,10 +214,6 @@ PCI UHCI USB controller and a virtual USB hub.
=20
 SMP is supported with up to 255 CPUs.
=20
-Note that adlib, gus and cs4231a are only available when QEMU was
-configured with --audio-card-list option containing the name(s) of
-required card(s).
-
 QEMU uses the PC BIOS from the Bochs project and the Plex86/Bochs LGPL
 VGA BIOS.
=20
--=20
1.7.10.4


