Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S79lU-00048p-Gz
	for mharc-qemu-trivial@gnu.org; Mon, 12 Mar 2012 14:14:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1S79l8-0003Zx-Fn
	for qemu-trivial@nongnu.org; Mon, 12 Mar 2012 14:14:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1S79l4-0007yo-0j
	for qemu-trivial@nongnu.org; Mon, 12 Mar 2012 14:14:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>)
	id 1S79kx-0007rG-Gc; Mon, 12 Mar 2012 14:14:03 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2CIE0bi011774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 12 Mar 2012 14:14:00 -0400
Received: from localhost (ovpn-112-23.phx2.redhat.com [10.3.112.23])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q2CIDwGE012704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Mon, 12 Mar 2012 14:14:00 -0400
From: Jeff Cody <jcody@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 12 Mar 2012 14:13:57 -0400
Message-Id: <14fd588cffd843789d6b6a4379f42ac1b2a6fbbf.1331575674.git.jcody@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] monitor: Remove unused bool field 'qapi' in
	mon_cmd_t struct
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
X-List-Received-Date: Mon, 12 Mar 2012 18:14:34 -0000

Some minor code cleanup: the 'qapi' bool field in mon_cmd_t is
unused, and can be removed.

Signed-off-by: Jeff Cody <jcody@redhat.com>
---
 monitor.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/monitor.c b/monitor.c
index a787aab..34272eb 100644
--- a/monitor.c
+++ b/monitor.c
@@ -128,7 +128,6 @@ typedef struct mon_cmd_t {
         int  (*cmd_async)(Monitor *mon, const QDict *params,
                           MonitorCompletion *cb, void *opaque);
     } mhandler;
-    bool qapi;
     int flags;
 } mon_cmd_t;
 
-- 
1.7.9.rc2.1.g69204


