Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WopJj-0003rg-6r
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:27:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopJd-0003fg-El
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:27:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WopJZ-0000qF-0M
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:27:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35161)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopJO-0000nQ-MR; Mon, 26 May 2014 03:27:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A460642FA9;
	Mon, 26 May 2014 11:27:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A28F46AD;
	Mon, 26 May 2014 11:20:14 +0400 (MSK)
Received: (nullmailer pid 23003 invoked by uid 1000);
	Mon, 26 May 2014 07:20:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:19:56 +0400
Message-Id: <1401088811-22923-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Saravanakumar <saravanakumar.punith@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/23] pci: move dereferencing of root only
	after verifying valid root pointer
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
X-List-Received-Date: Mon, 26 May 2014 07:27:30 -0000

From: Saravanakumar <saravanakumar.punith@gmail.com>

Signed-off-by: Saravanakumar <saravanakumar.punith@gmail.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/pci/pci.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 22fe5ee..8d6a8d4 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -605,13 +605,13 @@ PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *root=
, const char *devaddr)
     int dom, bus;
     unsigned slot;
=20
-    assert(!root->parent_dev);
-
     if (!root) {
         fprintf(stderr, "No primary PCI bus\n");
         return NULL;
     }
=20
+    assert(!root->parent_dev);
+
     if (!devaddr) {
         *devfnp =3D -1;
         return pci_find_bus_nr(root, 0);
--=20
1.7.10.4


