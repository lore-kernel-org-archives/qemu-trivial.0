Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnB3u-0006DI-AF
	for mharc-qemu-trivial@gnu.org; Tue, 28 Apr 2015 15:20:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YnB3r-00069A-JA
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 15:20:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YnB3q-0000dS-Qo
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 15:20:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1YnB3k-0000a0-N1; Tue, 28 Apr 2015 15:20:44 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 486E98E91C;
	Tue, 28 Apr 2015 19:20:43 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-29.bos.redhat.com [10.18.17.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3SJKgJA011097; Tue, 28 Apr 2015 15:20:42 -0400
From: John Snow <jsnow@redhat.com>
To: qemu-trivial@nongnu.org
Date: Tue, 28 Apr 2015 15:20:41 -0400
Message-Id: <1430248841-26558-1-git-send-email-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] qmp-commands: Fix typo
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
X-List-Received-Date: Tue, 28 Apr 2015 19:20:52 -0000

Just a trivial patch to correct a QMP example in qmp-commands.hx.

Signed-off-by: John Snow <jsnow@redhat.com>
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
2.1.0


