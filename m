Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U0rBB-0003X4-CW
	for mharc-qemu-trivial@gnu.org; Thu, 31 Jan 2013 05:15:37 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1U0rB8-0003Qn-MN
	for qemu-trivial@nongnu.org; Thu, 31 Jan 2013 05:15:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1U0rB7-0000mL-Pg
	for qemu-trivial@nongnu.org; Thu, 31 Jan 2013 05:15:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1U0rAy-0000k1-9B; Thu, 31 Jan 2013 05:15:24 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0VAFNeZ012414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 31 Jan 2013 05:15:23 -0500
Received: from bart.brq.redhat.com (dhcp-27-245.brq.redhat.com [10.34.27.245])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id r0VAFKDO022930; Thu, 31 Jan 2013 05:15:22 -0500
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 31 Jan 2013 11:15:19 +0100
Message-Id: <9021f2f9e51e4c7a253d1993ea05f87d0718752f.1359627279.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: Undefine _FORTIFY_SOURCE prior
	using it
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
X-List-Received-Date: Thu, 31 Jan 2013 10:15:35 -0000

Currently, we are enforcing the _FORTIFY_SOURCE=2 without any
previous detection if the macro has been already defined, e.g.
by environment, or is just enabled by compiler by default.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index b7635e4..97070eb 100755
--- a/configure
+++ b/configure
@@ -3159,7 +3159,7 @@ if test "$gcov" = "yes" ; then
   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
 elif test "$debug" = "no" ; then
-  CFLAGS="-O2 -D_FORTIFY_SOURCE=2 $CFLAGS"
+  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
 fi
 
 
-- 
1.8.0.2


