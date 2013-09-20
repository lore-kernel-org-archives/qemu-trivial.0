Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN42c-0005bD-Sn
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 12:58:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN42X-0005PC-Ti
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 12:58:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN42T-0000LV-Hr
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 12:58:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52158)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN42B-0000ED-9Z; Fri, 20 Sep 2013 12:58:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DD2E5419CA;
	Fri, 20 Sep 2013 20:58:20 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C0933213;
	Fri, 20 Sep 2013 20:58:20 +0400 (MSK)
Received: (nullmailer pid 32162 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:00 +0400
Message-Id: <1379696296-32105-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
	Jan Vesely <jano.vesely@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 01/17] configure: Undefine _FORTIFY_SOURCE
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
X-List-Received-Date: Fri, 20 Sep 2013 16:58:50 -0000

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
index 1b6f68b..8ad42bc 100755
--- a/configure
+++ b/configure
@@ -3520,7 +3520,7 @@ if test "$gcov" = "yes" ; then
   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
 elif test "$debug" = "no" ; then
-  CFLAGS="-O2 -D_FORTIFY_SOURCE=2 $CFLAGS"
+  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
 fi
 
 
-- 
1.7.10.4


