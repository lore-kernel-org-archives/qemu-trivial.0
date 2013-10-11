Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUYfO-0000w5-U1
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 05:05:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VUYfJ-0000qm-55
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 05:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VUYfE-0006uV-5k
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 05:05:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VUYf0-0006s4-Vr; Fri, 11 Oct 2013 05:05:27 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0205541713;
	Fri, 11 Oct 2013 13:05:17 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9C58F532;
	Fri, 11 Oct 2013 13:05:17 +0400 (MSK)
Received: (nullmailer pid 25468 invoked by uid 1000);
	Fri, 11 Oct 2013 09:05:17 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Oct 2013 13:05:17 +0400
Message-Id: <1381482317-25433-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] configure: create fsdev/ directory
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
X-List-Received-Date: Fri, 11 Oct 2013 09:05:49 -0000

In some cases when building with parallelism (make -jN),
build fails because the directory where output files are
supposed to be does not exist.  In particular, when make
decides to build virtfs-proxy-helper.1 before other files
in fsdev/, build will fail with the following error:

perl -Ww -- BUILDDIR/scripts/texi2pod.pl BUILDDIR/fsdev/virtfs-proxy-helper.texi fsdev/virtfs-proxy-helper.pod && pod2man --utf8 --section=1 --center=" " --release=" " fsdev/virtfs-proxy-helper.pod > fsdev/virtfs-proxy-helper.1
opening "fsdev/virtfs-proxy-helper.pod": No such file or directory

Create the `fsdev' subdir the same way as other "conditional"
subdirs (eg, dtc or pixman) are created in configure.

Might be better to extract all dirs from $tools and other
common vars and run mkdir on all of these, but this needs
some review/restructuring first.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 23dbaaf..203084a 100755
--- a/configure
+++ b/configure
@@ -3576,6 +3576,7 @@ if test "$softmmu" = yes ; then
     if test "$cap" = yes && test "$linux" = yes && test "$attr" = yes ; then
       virtfs=yes
       tools="$tools fsdev/virtfs-proxy-helper\$(EXESUF)"
+      mkdir -p fsdev
     else
       if test "$virtfs" = yes; then
         error_exit "VirtFS is supported only on Linux and requires libcap-devel and libattr-devel"
-- 
1.7.10.4


