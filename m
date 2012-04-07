Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SGQ0E-0002BL-Qa
	for mharc-qemu-trivial@gnu.org; Sat, 07 Apr 2012 03:24:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SGQ05-0001h3-Au
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 03:23:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SGQ03-0008Jx-8x
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 03:23:56 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:38710)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SGPzv-0008Hf-OU; Sat, 07 Apr 2012 03:23:47 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	54E9672800B6; Sat,  7 Apr 2012 09:23:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Z1SRY77XZFFL; Sat,  7 Apr 2012 09:23:45 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 5943672800B4; Sat,  7 Apr 2012 09:23:45 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat,  7 Apr 2012 09:23:36 +0200
Message-Id: <1333783419-7982-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1333783419-7982-1-git-send-email-sw@weilnetz.de>
References: <1333783419-7982-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH 1/4] Replace Qemu by QEMU in user visible
	documentation
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
X-List-Received-Date: Sat, 07 Apr 2012 07:24:03 -0000

The official spelling is QEMU.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 fsdev/virtfs-proxy-helper.texi |    2 +-
 qemu-doc.texi                  |    2 +-
 qemu-nbd.texi                  |    2 +-
 qemu-options.hx                |    4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fsdev/virtfs-proxy-helper.texi b/fsdev/virtfs-proxy-helper.texi
index faa0434..e60e3b9 100644
--- a/fsdev/virtfs-proxy-helper.texi
+++ b/fsdev/virtfs-proxy-helper.texi
@@ -24,7 +24,7 @@ in non-root mode, but doing privileged operations using socket IO.
 Proxy helper(a stand alone binary part of qemu) is invoked with
 root privileges. Proxy helper chroots into 9p export path and creates
 a socket pair or a named socket based on the command line parameter.
-Qemu and proxy helper communicate using this socket. QEMU proxy fs
+QEMU and proxy helper communicate using this socket. QEMU proxy fs
 driver sends filesystem request to proxy helper and receives the
 response from it.
 
diff --git a/qemu-doc.texi b/qemu-doc.texi
index 83b2ad5..d18dff0 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -968,7 +968,7 @@ monitor (@pxref{pcsys_keys}).
 
 QEMU emulates a PCI UHCI USB controller. You can virtually plug
 virtual USB devices or real host USB devices (experimental, works only
-on Linux hosts).  Qemu will automatically create and connect virtual USB hubs
+on Linux hosts).  QEMU will automatically create and connect virtual USB hubs
 as necessary to connect multiple USB devices.
 
 @menu
diff --git a/qemu-nbd.texi b/qemu-nbd.texi
index 44996cc..6955d90 100644
--- a/qemu-nbd.texi
+++ b/qemu-nbd.texi
@@ -6,7 +6,7 @@ usage: qemu-nbd [OPTION]...  @var{filename}
 
 @c man begin DESCRIPTION
 
-Export Qemu disk image using NBD protocol.
+Export QEMU disk image using NBD protocol.
 
 @c man end
 
diff --git a/qemu-options.hx b/qemu-options.hx
index f72f9a0..a169792 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1310,7 +1310,7 @@ and a @var{name} can be assigned for use in monitor commands.
 Optionally, for PCI cards, you can specify the number @var{v} of MSI-X vectors
 that the card should have; this option currently only affects virtio cards; set
 @var{v} = 0 to disable MSI-X. If no @option{-net} option is specified, a single
-NIC is created.  Qemu can emulate several different models of network card.
+NIC is created.  QEMU can emulate several different models of network card.
 Valid values for @var{type} are
 @code{virtio}, @code{i82551}, @code{i82557b}, @code{i82559er},
 @code{ne2k_pci}, @code{ne2k_isa}, @code{pcnet}, @code{rtl8139},
@@ -2133,7 +2133,7 @@ activates telnet remote echo and single char transfer, then you can
 use the following options to step up a netcat redirector to allow
 telnet on port 5555 to access the qemu port.
 @table @code
-@item Qemu Options:
+@item QEMU Options:
 -serial udp::4555@@:4556
 @item netcat options:
 -u -P 4555 -L 0.0.0.0:4556 -t -p 5555 -I -T
-- 
1.7.9


