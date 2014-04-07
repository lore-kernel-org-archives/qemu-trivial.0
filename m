Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WX61F-0004ri-Ug
	for mharc-qemu-trivial@gnu.org; Mon, 07 Apr 2014 05:39:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WX619-0004io-JP
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 05:39:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WX614-000214-MI
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 05:39:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WX60u-0001ya-JR; Mon, 07 Apr 2014 05:38:48 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5BAD640C36;
	Mon,  7 Apr 2014 13:38:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2FFCA6AD;
	Mon,  7 Apr 2014 13:38:47 +0400 (MSK)
Received: (nullmailer pid 3605 invoked by uid 1000);
	Mon, 07 Apr 2014 09:38:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon,  7 Apr 2014 13:38:46 +0400
Message-Id: <1396863526-3562-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] doc: grammify "allows to"
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
X-List-Received-Date: Mon, 07 Apr 2014 09:39:08 -0000

English language grammar does not allow usage
of the word "allows" directly followed by an
infinitive, declaring constructs like "something
allows to do somestuff" un-grammatical.  Often
it is possible to just insert "one" between "allows"
and "to" to make the construct grammatical, but
usually it is better to re-phrase the statement.

This patch tries to fix 2 examples of "allows to"
usage in qemu doc, but does not address comments
in the code with similar constructs.  In qemu-options.hx
this patch also adds a missing "the" on the same line.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-doc.texi   |    2 +-
 qemu-options.hx |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index e6e20eb..88ec9bb 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -823,7 +823,7 @@ In this case, the block device must be exported using qemu-nbd:
 qemu-nbd --socket=/tmp/my_socket my_disk.qcow2
 @end example
 
-The use of qemu-nbd allows to share a disk between several guests:
+The use of qemu-nbd allows sharing of a disk between several guests:
 @example
 qemu-nbd --socket=/tmp/my_socket --share=2 my_disk.qcow2
 @end example
diff --git a/qemu-options.hx b/qemu-options.hx
index 2d33815..585cb8d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -444,7 +444,8 @@ This option defines the type of the media: disk or cdrom.
 @item cyls=@var{c},heads=@var{h},secs=@var{s}[,trans=@var{t}]
 These options have the same definition as they have in @option{-hdachs}.
 @item snapshot=@var{snapshot}
-@var{snapshot} is "on" or "off" and allows to enable snapshot for given drive (see @option{-snapshot}).
+@var{snapshot} is "on" or "off" and controls snapshot mode for the given drive
+(see @option{-snapshot}).
 @item cache=@var{cache}
 @var{cache} is "none", "writeback", "unsafe", "directsync" or "writethrough" and controls how the host cache is used to access block data.
 @item aio=@var{aio}
-- 
1.7.10.4


