Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9evf-0005RK-Sq
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 13:32:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mohan@in.ibm.com>) id 1V9aAT-0005Mr-MY
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 08:27:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mohan@in.ibm.com>) id 1V9aAK-0001Pu-GG
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 08:27:13 -0400
Received: from e28smtp09.in.ibm.com ([122.248.162.9]:45488)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mohan@in.ibm.com>) id 1V9aAJ-0001Or-Uf
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 08:27:04 -0400
Received: from /spool/local
	by e28smtp09.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mohan@in.ibm.com>;
	Wed, 14 Aug 2013 17:51:10 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
	by e28smtp09.in.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 14 Aug 2013 17:51:07 +0530
Received: from d28relay02.in.ibm.com (d28relay02.in.ibm.com [9.184.220.59])
	by d28dlp01.in.ibm.com (Postfix) with ESMTP id 5F8F0E0053;
	Wed, 14 Aug 2013 17:57:13 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
	by d28relay02.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r7ECSEsC35258576; Wed, 14 Aug 2013 17:58:15 +0530
Received: from d28av04.in.ibm.com (localhost [127.0.0.1])
	by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	r7ECQn4o013226; Wed, 14 Aug 2013 17:56:49 +0530
Received: from explorer.in.ibm.com ([9.77.123.113])
	by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	r7ECQi37012922; Wed, 14 Aug 2013 17:56:46 +0530
From: "M. Mohan Kumar" <mohan@in.ibm.com>
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org
Date: Wed, 14 Aug 2013 17:56:41 +0530
Message-Id: <1376483201-13466-1-git-send-email-mohan@in.ibm.com>
X-Mailer: git-send-email 1.7.11.7
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13081412-2674-0000-0000-00000A3BED40
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 122.248.162.9
X-Mailman-Approved-At: Wed, 14 Aug 2013 13:32:14 -0400
Cc: "M. Mohan Kumar" <mohan@in.ibm.com>
Subject: [Qemu-trivial] [PATCH 1/1] block: Dont ignore previously set
	bdrv_flags
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
X-List-Received-Date: Wed, 14 Aug 2013 12:27:23 -0000

From: "M. Mohan Kumar" <mohan@in.ibm.com>

bdrv_flags is set by bdrv_parse_discard_flags(), but later it is reset
to zero.

Signed-off-by: M. Mohan Kumar <mohan@in.ibm.com>
---
 blockdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index e174b7d..bc7016a 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -454,7 +454,6 @@ static DriveInfo *blockdev_init(QemuOpts *all_opts,
         }
     }
 
-    bdrv_flags = 0;
     if (qemu_opt_get_bool(opts, "cache.writeback", true)) {
         bdrv_flags |= BDRV_O_CACHE_WB;
     }
-- 
1.7.11.7


