Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxE7W-0007jH-3D
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2015 08:38:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenhanxiao@cn.fujitsu.com>) id 1YxB7m-0001H6-Vb
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 05:26:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenhanxiao@cn.fujitsu.com>) id 1YxB7i-0000nT-DS
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 05:26:14 -0400
Received: from [59.151.112.132] (port=40235 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenhanxiao@cn.fujitsu.com>) id 1YxB7h-0000lC-C6
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 05:26:10 -0400
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="95855983"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 May 2015 17:30:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t4Q9OTQc005146;
	Tue, 26 May 2015 17:24:29 +0800
Received: from localhost.localdomain (10.167.226.38) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 26 May 2015 17:26:03 +0800
From: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
To: Markus Armbruster <armbru@redhat.com>
Date: Tue, 26 May 2015 05:25:41 -0400
Message-ID: <1432632341-5201-1-git-send-email-chenhanxiao@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.38]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Tue, 26 May 2015 08:38:07 -0400
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [Qemu-devel][PATCH] docs/writing-qmp-commands: fix a
	typo
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
X-List-Received-Date: Tue, 26 May 2015 09:26:16 -0000

s/interation/iteration

Signed-off-by: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
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
2.1.0


