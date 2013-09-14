Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKvp7-0005TE-R5
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 15:48:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvp2-0005Ij-2U
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:48:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvox-0006k8-PB
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:47:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55347)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKvom-0006cV-As; Sat, 14 Sep 2013 15:47:44 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 98BDF411BC;
	Sat, 14 Sep 2013 23:47:43 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7B9D94C3;
	Sat, 14 Sep 2013 23:47:43 +0400 (MSK)
Received: (nullmailer pid 7689 invoked by uid 1000);
	Sat, 14 Sep 2013 19:47:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sat, 14 Sep 2013 23:47:27 +0400
Message-Id: <1379188061-7634-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
	Jan Vesely <jano.vesely@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 01/15] configure: Undefine _FORTIFY_SOURCE
	prior using it
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
X-List-Received-Date: Sat, 14 Sep 2013 19:48:04 -0000

From: Michal Privoznik <mprivozn@redhat.com>

Currently, we are enforcing the _FORTIFY_SOURCE=2 without any
previous detection if the macro has been already defined, e.g.
by environment, or is just enabled by compiler by default.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 2b83936..21451ba 100755
--- a/configure
+++ b/configure
@@ -3502,7 +3502,7 @@ if test "$gcov" = "yes" ; then
   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
 elif test "$debug" = "no" ; then
-  CFLAGS="-O2 -D_FORTIFY_SOURCE=2 $CFLAGS"
+  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
 fi
 
 
-- 
1.7.10.4


