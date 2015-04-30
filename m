Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynj1w-0002Ob-4U
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 03:37:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynj1r-0002EA-JQ
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 03:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynj1q-0006Bo-J4
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 03:37:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48425)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynj1l-00069D-VV; Thu, 30 Apr 2015 03:36:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A721742BAB;
	Thu, 30 Apr 2015 10:36:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C1CA6968;
	Thu, 30 Apr 2015 08:09:00 +0300 (MSK)
Received: (nullmailer pid 4368 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:50 +0300
Message-Id: <c3182d51cd68cedd9a52e2b1030dde5e5998ebbc.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	John Snow <jsnow@redhat.com>
Subject: [Qemu-trivial] [PULL 37/42] qmp-commands: Fix typo
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
X-List-Received-Date: Thu, 30 Apr 2015 07:37:04 -0000

From: John Snow <jsnow@redhat.com>

Just a trivial patch to correct a QMP example in qmp-commands.hx.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qmp-commands.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qmp-commands.hx b/qmp-commands.hx
index 213508f..d4a837c 100644
--- a/qmp-commands.hx
+++ b/qmp-commands.hx
@@ -2380,7 +2380,7 @@ Example:
                   "virtual-size":2048000,
                   "backing_file":"base.qcow2",
                   "full-backing-filename":"disks/base.qcow2",
-                  "backing-filename-format:"qcow2",
+                  "backing-filename-format":"qcow2",
                   "snapshots":[
                      {
                         "id": "1",
@@ -3847,7 +3847,7 @@ Example:
                       "virtual-size":2048000,
                       "backing_file":"base.qcow2",
                       "full-backing-filename":"disks/base.qcow2",
-                      "backing-filename-format:"qcow2",
+                      "backing-filename-format":"qcow2",
                       "snapshots":[
                          {
                             "id": "1",
-- 
2.1.4


