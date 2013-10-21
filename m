Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VYAyP-0002qr-Sh
	for mharc-qemu-trivial@gnu.org; Mon, 21 Oct 2013 04:36:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VYAyJ-0002iH-N1
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 04:36:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VYAyF-00023p-25
	for qemu-trivial@nongnu.org; Mon, 21 Oct 2013 04:36:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38231)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VYAy5-00020i-H3; Mon, 21 Oct 2013 04:36:05 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1C84C42DFC;
	Mon, 21 Oct 2013 12:35:55 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0D6AB207;
	Mon, 21 Oct 2013 12:35:55 +0400 (MSK)
Received: (nullmailer pid 10804 invoked by uid 1000);
	Mon, 21 Oct 2013 08:35:54 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Mon, 21 Oct 2013 12:35:50 +0400
Message-Id: <1382344550-10769-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: pbonzini@redhat.com, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] configure: create fsdev/ directory
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
X-List-Received-Date: Mon, 21 Oct 2013 08:36:24 -0000

In some cases when building with parallelism (make -jN),
build fails because the directory where output files are
supposed to be does not exist.  In particular, when make
decides to build virtfs-proxy-helper.1 before other files
in fsdev/, build will fail with the following error:

perl -Ww -- BUILDDIR/scripts/texi2pod.pl BUILDDIR/fsdev/virtfs-proxy-helper.texi fsdev/virtfs-proxy-helper.pod && pod2man --utf8 --section=1 --center=" " --release=" " fsdev/virtfs-proxy-helper.pod > fsdev/virtfs-proxy-helper.1
opening "fsdev/virtfs-proxy-helper.pod": No such file or directory

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 57ee62a..61bb27c 100755
--- a/configure
+++ b/configure
@@ -4647,6 +4647,7 @@ fi
 
 # build tree in object directory in case the source is not in the current directory
 DIRS="tests tests/tcg tests/tcg/cris tests/tcg/lm32 tests/libqos tests/qapi-schema tests/tcg/xtensa tests/qemu-iotests"
+DIRS="$DIRS fsdev"
 DIRS="$DIRS pc-bios/optionrom pc-bios/spapr-rtas pc-bios/s390-ccw"
 DIRS="$DIRS roms/seabios roms/vgabios"
 DIRS="$DIRS qapi-generated"
-- 
1.7.10.4


