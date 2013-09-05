Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VHcRE-00043E-Mw
	for mharc-qemu-trivial@gnu.org; Thu, 05 Sep 2013 12:29:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1VHXDM-0002Ix-JH
	for qemu-trivial@nongnu.org; Thu, 05 Sep 2013 06:55:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1VHXDM-0004wv-HH
	for qemu-trivial@nongnu.org; Thu, 05 Sep 2013 06:55:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1VHXDB-0004l1-MF; Thu, 05 Sep 2013 06:54:54 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r85Aspbk028388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 5 Sep 2013 06:54:51 -0400
Received: from bart.brq.redhat.com (dhcp-26-146.brq.redhat.com [10.34.26.146])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id r85AsoPq021099; Thu, 5 Sep 2013 06:54:50 -0400
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  5 Sep 2013 12:54:49 +0200
Message-Id: <58dbd819c4270169fa26487cf1e7220b11c363ac.1378378402.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 05 Sep 2013 12:29:43 -0400
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH RESEND] configure: Undefine _FORTIFY_SOURCE
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
X-List-Received-Date: Thu, 05 Sep 2013 10:55:15 -0000

Currently, we are enforcing the _FORTIFY_SOURCE=2 without any
previous detection if the macro has been already defined, e.g.
by environment, or is just enabled by compiler by default.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---

The issue still happens thus the patch is still valid.

 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index e989609..24e5b00 100755
--- a/configure
+++ b/configure
@@ -3419,7 +3419,7 @@ if test "$gcov" = "yes" ; then
   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
 elif test "$debug" = "no" ; then
-  CFLAGS="-O2 -D_FORTIFY_SOURCE=2 $CFLAGS"
+  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
 fi
 
 
-- 
1.8.1.5


