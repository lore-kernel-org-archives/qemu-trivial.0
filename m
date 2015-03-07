Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YUAop-00030u-3B
	for mharc-qemu-trivial@gnu.org; Sat, 07 Mar 2015 04:14:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUAom-0002xq-Mj
	for qemu-trivial@nongnu.org; Sat, 07 Mar 2015 04:14:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUAol-0003Ag-Eh
	for qemu-trivial@nongnu.org; Sat, 07 Mar 2015 04:14:44 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:41081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YUAoc-000391-F8; Sat, 07 Mar 2015 04:14:34 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id CFF4517F989; Sat,  7 Mar 2015 10:14:30 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat,  7 Mar 2015 10:14:30 +0100
Message-Id: <1425719670-5486-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Kevin Wolf <kwolf@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, Peter Lieven <pl@kamp.de>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] iscsi: Fix check for username
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
X-List-Received-Date: Sat, 07 Mar 2015 09:14:45 -0000

The variable user in struct iscsi_url is a character array, not a pointer.
Therefore its address will never be NULL.

clang reports this error:

block/iscsi.c:1329:20: warning:
 comparison of array 'iscsi_url->user' not equal to a null pointer
 is always true [-Wtautological-pointer-compare]

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This error also exists in libscsi. See my pull request
https://github.com/sahlberg/libiscsi/pull/146

Cheers
Stefan

 block/iscsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 1fa855a..a2bd70a 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -1326,7 +1326,7 @@ static int iscsi_open(BlockDriverState *bs, QDict *options, int flags,
         goto out;
     }
 
-    if (iscsi_url->user != NULL) {
+    if (iscsi_url->user[0] != '\0') {
         ret = iscsi_set_initiator_username_pwd(iscsi, iscsi_url->user,
                                               iscsi_url->passwd);
         if (ret != 0) {
-- 
2.1.4


