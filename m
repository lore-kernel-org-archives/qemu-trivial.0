Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQilu-0005Hf-Eq
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 18:55:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQilt-0005GL-58
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 18:55:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQils-0005zO-Fo
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 18:55:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQilm-0005pZ-TT; Sun, 17 Dec 2017 18:54:59 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3F66A4115E;
	Mon, 18 Dec 2017 02:54:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 722CBC8E;
	Mon, 18 Dec 2017 00:25:46 +0300 (MSK)
Received: (nullmailer pid 30907 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Mike Frysinger <vapier@gentoo.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Dec 2017 00:27:17 +0300
Message-Id: <0cdb2ed3aeba8038e6efd88a11707b04a837b147.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 12/61] build: fix typo in error message
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
X-List-Received-Date: Sun, 17 Dec 2017 23:55:06 -0000

From: Mike Frysinger <vapier@gentoo.org>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/git-submodule.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
index 030617b4ac..bc7224a27f 100755
--- a/scripts/git-submodule.sh
+++ b/scripts/git-submodule.sh
@@ -24,7 +24,7 @@ error() {
     echo "Alternatively you may disable automatic GIT submodule checkout"
     echo "with:"
     echo
-    echo " $ ./configure --disable-git-update'"
+    echo " $ ./configure --disable-git-update"
     echo
     echo "and then manually update submodules prior to running make, with:"
     echo
-- 
2.11.0


