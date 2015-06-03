Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08Pv-0008L6-IM
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:09:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08Pp-0008AB-VG
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:09:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08Pp-00054X-1C
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:09:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56943)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08Pd-0004uB-E3; Wed, 03 Jun 2015 09:08:53 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 810694079B;
	Wed,  3 Jun 2015 16:08:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 65C9DA52;
	Wed,  3 Jun 2015 16:08:52 +0300 (MSK)
Received: (nullmailer pid 27420 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:24 +0300
Message-Id: <5708b2b736ebec6e3af04b9b249faadf896791cd.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
Subject: [Qemu-trivial] [PULL 04/30] docs/writing-qmp-commands: fix a typo
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
X-List-Received-Date: Wed, 03 Jun 2015 13:09:09 -0000

From: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>

s/interation/iteration

Signed-off-by: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/writing-qmp-commands.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/writing-qmp-commands.txt b/docs/writing-qmp-commands.txt
index f3df206..ab1fdd3 100644
--- a/docs/writing-qmp-commands.txt
+++ b/docs/writing-qmp-commands.txt
@@ -598,7 +598,7 @@ stored in its "value" member. In our example, the "value" member is a pointer
 to an TimerAlarmMethod instance.
 
 Notice that the "current" variable is used as "true" only in the first
-interation of the loop. That's because the alarm timer method in use is the
+iteration of the loop. That's because the alarm timer method in use is the
 first element of the alarm_timers array. Also notice that QAPI lists are handled
 by hand and we return the head of the list.
 
-- 
2.1.4


