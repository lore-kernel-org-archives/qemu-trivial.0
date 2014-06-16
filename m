Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wwceu-0004jI-FD
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jun 2014 15:33:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1Wwcel-0004Y9-VE
	for qemu-trivial@nongnu.org; Mon, 16 Jun 2014 15:33:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1Wwcef-0001re-Gf
	for qemu-trivial@nongnu.org; Mon, 16 Jun 2014 15:33:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49741)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1WwceS-0001oz-PG; Mon, 16 Jun 2014 15:33:08 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5GJX7lE018600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 16 Jun 2014 15:33:07 -0400
Received: from colepc.home.com (ovpn-113-186.phx2.redhat.com [10.3.113.186])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5GJX5bY014567; Mon, 16 Jun 2014 15:33:06 -0400
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Jun 2014 15:32:47 -0400
Message-Id: <92778d44f2f6c055c6caec15c83edc1c3723c272.1402946999.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PATCH v4] configure: Enable TPM by default,
	add --disable-tpm
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
X-List-Received-Date: Mon, 16 Jun 2014 19:33:34 -0000

I don't see why tpm is disabled by default: it doesn't have any
external dependencies, or change default behavior. Leaving it disabled
is just going to cause it to bit rot.

Enable it by default, and add a --disable-tpm option.

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
v4:
    Rebase to master

Previous posting in April didn't generate any complains, so seeing if
qemu-trivial can pick it up.

 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 27d84d9..fd4d1e9 100755
--- a/configure
+++ b/configure
@@ -330,7 +330,7 @@ virtio_blk_data_plane=""
 gtk=""
 gtkabi=""
 vte=""
-tpm="no"
+tpm="yes"
 libssh2=""
 vhdx=""
 quorum=""
@@ -1104,6 +1104,8 @@ for opt do
   ;;
   --enable-vte) vte="yes"
   ;;
+  --disable-tpm) tpm="no"
+  ;;
   --enable-tpm) tpm="yes"
   ;;
   --disable-libssh2) libssh2="no"
@@ -1377,6 +1379,7 @@ Advanced options (experts only):
   --disable-glusterfs      disable GlusterFS backend
   --enable-gcov            enable test coverage analysis with gcov
   --gcov=GCOV              use specified gcov [$gcov_tool]
+  --disable-tpm            disable TPM support
   --enable-tpm             enable TPM support
   --disable-libssh2        disable ssh block device support
   --enable-libssh2         enable ssh block device support
-- 
1.9.3


