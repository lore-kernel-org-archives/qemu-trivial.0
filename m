Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TdfAX-00063Z-15
	for mharc-qemu-trivial@gnu.org; Wed, 28 Nov 2012 05:47:05 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1TdfAR-0005mO-8i
	for qemu-trivial@nongnu.org; Wed, 28 Nov 2012 05:47:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1TdfAL-0005nw-N3
	for qemu-trivial@nongnu.org; Wed, 28 Nov 2012 05:46:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:20363)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1TdfAC-0005ls-0c; Wed, 28 Nov 2012 05:46:44 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qASAkgbB017543
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 28 Nov 2012 05:46:42 -0500
Received: from bart.brq.redhat.com (dhcp-27-249.brq.redhat.com [10.34.27.249])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id qASAkeXC015993; Wed, 28 Nov 2012 05:46:41 -0500
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Nov 2012 11:46:39 +0100
Message-Id: <db00c89dd60757fa9b3be58894e3cbf0fdaa9517.1354099560.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] nbd-server-add: Fix the default for
	'writable'
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
X-List-Received-Date: Wed, 28 Nov 2012 10:47:03 -0000

The documentation to this monitor command tells, that 'writable'
argument is optional and defaults to false. However, the code sets
true as the default. But since some applications may already been
using this, it's safer to fix the code and not documentation which
would break those applications.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 blockdev-nbd.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index d1721a3..6b26bbf 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -99,7 +99,7 @@ void qmp_nbd_server_add(const char *device, bool has_writable, bool writable,
     }
 
     if (!has_writable) {
-        writable = true;
+        writable = false;
     }
     if (bdrv_is_read_only(bs)) {
         writable = false;
-- 
1.7.8.6


