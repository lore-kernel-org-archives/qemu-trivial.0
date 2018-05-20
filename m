Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKHvK-00067B-6A
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:34:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHvI-00064u-5i
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:34:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHvH-00035Q-CA
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:34:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56971)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKHv9-0002t5-SH; Sun, 20 May 2018 02:34:20 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E01494111D;
	Sun, 20 May 2018 09:34:18 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3C26110CE;
	Sun, 20 May 2018 09:15:14 +0300 (MSK)
Received: (nullmailer pid 7384 invoked by uid 1000);
	Sun, 20 May 2018 06:15:11 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 09:14:56 +0300
Message-Id: <4885b0caf607579a0f99c221fa39ca97d9a6ddf4.1526796813.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/22] qemu-img-cmds.hx: add
 passive-aggressive note
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 20 May 2018 06:34:29 -0000

From: John Snow <jsnow@redhat.com>

I'm kidding. It's very easy to forget there are per-command sections
in the texi, and insane that we don't autogenerate those, too.

Until then, leave a little post-it note in this .hx file until I
find a way to delete it.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Jeff Cody <jcody@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-img-cmds.hx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 84deb858af..3d2f7b26eb 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -6,6 +6,9 @@ HXCOMM DEF(command, callback, arg_string) is used to construct
 HXCOMM command structures and help message.
 HXCOMM HXCOMM can be used for comments, discarded from both texi and C
 
+HXCOMM When amending the TEXI sections, please remember to copy the usage
+HXCOMM over to the per-command sections in qemu-img.texi.
+
 STEXI
 @table @option
 ETEXI
-- 
2.11.0


