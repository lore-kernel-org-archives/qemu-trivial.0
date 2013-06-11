Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmMWs-0006ui-MB
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 07:14:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UmMWq-0006rK-7V
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:14:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UmMWk-0004QB-LS
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:14:20 -0400
Received: from cantor2.suse.de ([195.135.220.15]:41796 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UmMWY-0004NO-KQ; Tue, 11 Jun 2013 07:14:02 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E0852A5077;
	Tue, 11 Jun 2013 13:14:01 +0200 (CEST)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: qemu-devel@nongnu.org
Date: Tue, 11 Jun 2013 13:13:58 +0200
Message-Id: <1370949238-2770-1-git-send-email-afaerber@suse.de>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-stable@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, brogers@suse.com
Subject: [Qemu-trivial] [PATCH] Makefile: Install qemu-img and qemu-nbd man
	pages only if built
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
X-List-Received-Date: Tue, 11 Jun 2013 11:14:21 -0000

When splitting openSUSE's qemu and qemu-linux-user packages we noticed
that for linux-user-only builds unrelated man pages got installed.
It's surely possible to delete them before packaging, but not installing
them in the first place seems more logical.

Cc: qemu-stable@nongnu.org
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 306e7bd..3cfa7d0 100644
--- a/Makefile
+++ b/Makefile
@@ -306,10 +306,13 @@ install-doc: $(DOCS)
 	$(INSTALL_DATA) QMP/qmp-commands.txt "$(DESTDIR)$(qemu_docdir)"
 ifdef CONFIG_POSIX
 	$(INSTALL_DIR) "$(DESTDIR)$(mandir)/man1"
-	$(INSTALL_DATA) qemu.1 qemu-img.1 "$(DESTDIR)$(mandir)/man1"
+	$(INSTALL_DATA) qemu.1 "$(DESTDIR)$(mandir)/man1"
+ifneq ($(TOOLS),)
+	$(INSTALL_DATA) qemu-img.1 "$(DESTDIR)$(mandir)/man1"
 	$(INSTALL_DIR) "$(DESTDIR)$(mandir)/man8"
 	$(INSTALL_DATA) qemu-nbd.8 "$(DESTDIR)$(mandir)/man8"
 endif
+endif
 ifdef CONFIG_VIRTFS
 	$(INSTALL_DIR) "$(DESTDIR)$(mandir)/man1"
 	$(INSTALL_DATA) fsdev/virtfs-proxy-helper.1 "$(DESTDIR)$(mandir)/man1"
--=20
1.8.1.4


