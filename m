Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UgukW-0002Qa-JN
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 06:33:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1UgukR-0002KL-9F
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1UgukN-0001fj-Uk
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:33:51 -0400
Received: from e28smtp01.in.ibm.com ([122.248.162.1]:48734)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1UgukN-0001fC-8R
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 06:33:47 -0400
Received: from /spool/local
	by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <lilei@linux.vnet.ibm.com>;
	Mon, 27 May 2013 15:57:42 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
	by e28smtp01.in.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 27 May 2013 15:57:41 +0530
Received: from d28relay04.in.ibm.com (d28relay04.in.ibm.com [9.184.220.61])
	by d28dlp01.in.ibm.com (Postfix) with ESMTP id 6EA49E0056;
	Mon, 27 May 2013 16:06:19 +0530 (IST)
Received: from d28av02.in.ibm.com (d28av02.in.ibm.com [9.184.220.64])
	by d28relay04.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r4RAXZ3h4718936; Mon, 27 May 2013 16:03:35 +0530
Received: from d28av02.in.ibm.com (loopback [127.0.0.1])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r4RAXeBM017168; Mon, 27 May 2013 20:33:41 +1000
Received: from localhost.localdomain ([9.125.24.193])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r4RAXYrd016928; Mon, 27 May 2013 20:33:39 +1000
From: Lei Li <lilei@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Mon, 27 May 2013 18:33:02 +0800
Message-Id: <1369650782-14608-3-git-send-email-lilei@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1369650782-14608-1-git-send-email-lilei@linux.vnet.ibm.com>
References: <1369650782-14608-1-git-send-email-lilei@linux.vnet.ibm.com>
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13052710-4790-0000-0000-0000087D116D
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.1
Cc: qemu-trivial@nongnu.org, Lei Li <lilei@linux.vnet.ibm.com>,
	quintela@redhat.com
Subject: [Qemu-trivial] [PATCH 2/2] migration: Remove duplicate
	bandwidth_limit set
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
X-List-Received-Date: Mon, 27 May 2013 10:33:52 -0000

bandwidth_limit is double set in migrate_init(), remove one.

Signed-off-by: Lei Li <lilei@linux.vnet.ibm.com>
---
 migration.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/migration.c b/migration.c
index bfbc345..058f9e6 100644
--- a/migration.c
+++ b/migration.c
@@ -349,7 +349,6 @@ static MigrationState *migrate_init(const MigrationParams *params)
            sizeof(enabled_capabilities));
 
     memset(s, 0, sizeof(*s));
-    s->bandwidth_limit = bandwidth_limit;
     s->params = *params;
     memcpy(s->enabled_capabilities, enabled_capabilities,
            sizeof(enabled_capabilities));
-- 
1.7.7.6


