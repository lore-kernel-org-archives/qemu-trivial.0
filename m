Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Va0Ei-0001yG-9z
	for mharc-qemu-trivial@gnu.org; Sat, 26 Oct 2013 05:32:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0Ec-0001m5-8B
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:32:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0EX-00085d-Dc
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:32:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40748)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Va0EN-00083q-LN; Sat, 26 Oct 2013 05:32:27 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CF23B43917;
	Sat, 26 Oct 2013 13:32:26 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9F76851D;
	Sat, 26 Oct 2013 13:32:26 +0400 (MSK)
Received: (nullmailer pid 19501 invoked by uid 1000);
	Sat, 26 Oct 2013 09:32:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Sat, 26 Oct 2013 13:31:21 +0400
Message-Id: <1382779887-15971-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 1/7] configure: create fsdev/ directory
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
X-List-Received-Date: Sat, 26 Oct 2013 09:32:47 -0000

In some cases when building with parallelism (make -jN),
build fails because the directory where output files are
supposed to be does not exist.  In particular, when make
decides to build virtfs-proxy-helper.1 before other files
in fsdev/, build will fail with the following error:

perl -Ww -- BUILDDIR/scripts/texi2pod.pl BUILDDIR/fsdev/virtfs-proxy-helper.texi fsdev/virtfs-proxy-helper.pod && pod2man --utf8 --section=1 --center=" " --release=" " fsdev/virtfs-proxy-helper.pod > fsdev/virtfs-proxy-helper.1
opening "fsdev/virtfs-proxy-helper.pod": No such file or directory

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
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


