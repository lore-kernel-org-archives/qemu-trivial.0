Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b2qQ1-0007uX-NW
	for mharc-qemu-trivial@gnu.org; Tue, 17 May 2016 21:37:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b2qPu-00055M-W6
	for qemu-trivial@nongnu.org; Tue, 17 May 2016 21:36:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b2n3M-0001Gm-Qs
	for qemu-trivial@nongnu.org; Tue, 17 May 2016 18:01:27 -0400
Received: from resqmta-po-07v.sys.comcast.net ([96.114.154.166]:42514)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b2n3M-0001Gg-Ls
	for qemu-trivial@nongnu.org; Tue, 17 May 2016 18:01:24 -0400
Received: from resomta-po-08v.sys.comcast.net ([96.114.154.232])
	by comcast with SMTP
	id 2n1tbDGqLpyio2n2NbuF2z; Tue, 17 May 2016 22:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1463522423;
	bh=w5Am18gw244SzQIyXrtpYJeYV3QVahyPHCJs38ZeKuE=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=NjttWarNWZotp0hmGnD2+N+d9lkn2Eks4meivmWqHdQkK0Yzc6E0Vz93r9wtRHjs0
	eU86d3e5jbH7fhg1nDQpmSyYS8D/fG7B12P7ZOVvS75ke3cJ9IEOKmKQ6HrC/Wc5+e
	5ZJFhvOSA+Nak+A+4q80LhGXZZPHI05D7fU63YGnDnEwIiczapb8dyf2mCCDWu1wGU
	hGO00A/34MeTCzWnOyU4J/ltieBhErAaobAgHXFCLh6UXCc9khaf744lVgeommROmN
	Le6/jkCWphwxRMgBKeXJwuGY9sz9mXiSc6IPPKgWiigwlb9ffeT2VjoAIqROiDSKGT
	X+oNZrwujU/ag==
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-08v.sys.comcast.net with comcast
	id va0K1s00h2fD5rL01a0NL9; Tue, 17 May 2016 22:00:23 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Date: Tue, 17 May 2016 16:00:15 -0600
Message-Id: <1463522415-6878-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.5.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.166
Subject: [Qemu-trivial] [PATCH] monitor: Typo fix
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 01:36:59 -0000

s/partinal/partial/

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 monitor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor.c b/monitor.c
index 4393151..2f56488 100644
--- a/monitor.c
+++ b/monitor.c
@@ -312,7 +312,7 @@ static void monitor_flush_locked(Monitor *mon)
             return;
         }
         if (rc > 0) {
-            /* partinal write */
+            /* partial write */
             QString *tmp = qstring_from_str(buf + rc);
             QDECREF(mon->outbuf);
             mon->outbuf = tmp;
-- 
2.5.5


