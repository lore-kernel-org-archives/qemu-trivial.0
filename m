Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wb2VO-0001JE-Gg
	for mharc-qemu-trivial@gnu.org; Fri, 18 Apr 2014 02:42:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wb2VI-00018K-HR
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 02:42:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wb2VD-0000f3-J0
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 02:42:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wb2V1-0000cc-53; Fri, 18 Apr 2014 02:42:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5644541D19;
	Fri, 18 Apr 2014 10:42:10 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 451E6651;
	Fri, 18 Apr 2014 10:42:10 +0400 (MSK)
Received: (nullmailer pid 241870 invoked by uid 1000);
	Fri, 18 Apr 2014 06:42:10 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 18 Apr 2014 10:42:09 +0400
Message-Id: <1397803329-241829-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1397803329-241829-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1397803329-241829-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH v3] doc: grammify "allows to"
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
X-List-Received-Date: Fri, 18 Apr 2014 06:42:33 -0000

English language grammar does not allow usage
of the word "allows" directly followed by an
infinitive, declaring constructs like "something
allows to do somestuff" un-grammatical.  Often
it is possible to just insert "one" between "allows"
and "to" to make the construct grammatical, but
usually it is better to re-phrase the statement.

This patch tries to fix 4 examples of "allows to"
usage in qemu doc, but does not address comments
in the code with similar constructs.  It also adds
missing "the" in the same line.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-doc.texi   |    2 +-
 qemu-options.hx |    7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

v2: catch one more occurence of the same construct
in qemu-options.hx, in vnc encodings section.  This
statement may need rewriting which I don't provide
in this patch, which just fixes the grammar.

v3: one more case in qemu-options.hx

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
index 2d33815..6457034 100644
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
@@ -1242,7 +1243,7 @@ Disable adaptive encodings. Adaptive encodings are enabled by default.
 An adaptive encoding will try to detect frequently updated screen regions,
 and send updates in these regions using a lossy encoding (like JPEG).
 This can be really helpful to save bandwidth when playing videos. Disabling
-adaptive encodings allows to restore the original static behavior of encodings
+adaptive encodings restores the original static behavior of encodings
 like Tight.
 
 @item share=[allow-exclusive|force-shared|ignore]
@@ -2805,7 +2806,7 @@ UTC or local time, respectively. @code{localtime} is required for correct date i
 MS-DOS or Windows. To start at a specific point in time, provide @var{date} in the
 format @code{2006-06-17T16:01:21} or @code{2006-06-17}. The default base is UTC.
 
-By default the RTC is driven by the host system time. This allows to use the
+By default the RTC is driven by the host system time. This allows using of the
 RTC as accurate reference clock inside the guest, specifically if the host
 time is smoothly following an accurate external reference clock, e.g. via NTP.
 If you want to isolate the guest time from the host, you can set @option{clock}
-- 
1.7.10.4


