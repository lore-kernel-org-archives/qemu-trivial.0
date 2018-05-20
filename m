Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKHlg-0008HK-01
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 02:24:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHlY-0007tn-SP
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:24:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1fKHlX-0008Mw-U6
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 02:24:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58087)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1fKHlT-0008JC-EP; Sun, 20 May 2018 02:24:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B4142410E4;
	Sun, 20 May 2018 09:24:18 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D235EF4A;
	Sun, 20 May 2018 09:15:12 +0300 (MSK)
Received: (nullmailer pid 7367 invoked by uid 1000);
	Sun, 20 May 2018 06:15:11 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun, 20 May 2018 09:14:52 +0300
Message-Id: <65f389c0e7f6660e1acbd93e2ad23ce7172324bf.1526796813.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 06/22] qemu-img-commands.hx: argument ordering
 fixups
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
X-List-Received-Date: Sun, 20 May 2018 06:24:25 -0000

From: John Snow <jsnow@redhat.com>

The TEXI and string versions are actually identical, except for markup.
We can probably automate this... but make the ordering the same until
then.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Jeff Cody <jcody@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-img-cmds.hx | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 2fe31893cf..8bcefcafe9 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -23,13 +23,13 @@ STEXI
 ETEXI
 
 DEF("check", img_check,
-    "check [-q] [--object objectdef] [--image-opts] [-f fmt] [--output=ofmt] [-r [leaks | all]] [-T src_cache] [-U] filename")
+    "check [--object objectdef] [--image-opts] [-q] [-f fmt] [--output=ofmt] [-r [leaks | all]] [-T src_cache] [-U] filename")
 STEXI
 @item check [--object @var{objectdef}] [--image-opts] [-q] [-f @var{fmt}] [--output=@var{ofmt}] [-r [leaks | all]] [-T @var{src_cache}] [-U] @var{filename}
 ETEXI
 
 DEF("commit", img_commit,
-    "commit [-q] [--object objectdef] [--image-opts] [-f fmt] [-t cache] [-b base] [-d] [-p] filename")
+    "commit [--object objectdef] [--image-opts] [-q] [-f fmt] [-t cache] [-b base] [-d] [-p] filename")
 STEXI
 @item commit [--object @var{objectdef}] [--image-opts] [-q] [-f @var{fmt}] [-t @var{cache}] [-b @var{base}] [-d] [-p] @var{filename}
 ETEXI
@@ -47,7 +47,7 @@ STEXI
 ETEXI
 
 DEF("create", img_create,
-    "create [-q] [--object objectdef] [-f fmt] [-b backing_file] [-F backing_fmt] [-u] [-o options] filename [size]")
+    "create [--object objectdef] [-q] [-f fmt] [-b backing_file] [-F backing_fmt] [-u] [-o options] filename [size]")
 STEXI
 @item create [--object @var{objectdef}] [-q] [-f @var{fmt}] [-b @var{backing_file}] [-F @var{backing_fmt}] [-u] [-o @var{options}] @var{filename} [@var{size}]
 ETEXI
-- 
2.11.0


