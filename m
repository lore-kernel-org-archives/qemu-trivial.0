Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmxY3-0003e0-Nz
	for mharc-qemu-trivial@gnu.org; Tue, 20 May 2014 23:50:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1WmxXs-0003c1-2i
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 23:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1WmxXh-0001LH-9v
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 23:50:24 -0400
Received: from e23smtp06.au.ibm.com ([202.81.31.148]:58403)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1WmxXg-0001Kj-GU
	for qemu-trivial@nongnu.org; Tue, 20 May 2014 23:50:13 -0400
Received: from /spool/local
	by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aik@ozlabs.ru>;
	Wed, 21 May 2014 13:50:06 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
	by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 21 May 2014 13:50:04 +1000
Received: from d23relay04.au.ibm.com (d23relay04.au.ibm.com [9.190.234.120])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id 87EC72CE8050;
	Wed, 21 May 2014 13:50:03 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	s4L3SaQv56230128; Wed, 21 May 2014 13:28:37 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	s4L3o2OX009753; Wed, 21 May 2014 13:50:02 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.190.163.12])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	s4L3o2Le009749; Wed, 21 May 2014 13:50:02 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.190.164.82])
	by ozlabs.au.ibm.com (Postfix) with ESMTP id B5435A01BF;
	Wed, 21 May 2014 13:50:01 +1000 (EST)
Received: from ka1.ozlabs.ibm.com (ka1.ozlabs.ibm.com [10.61.145.11])
	by bran.ozlabs.ibm.com (Postfix) with ESMTP id 230E916AB65;
	Wed, 21 May 2014 13:50:01 +1000 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Wed, 21 May 2014 13:49:57 +1000
Message-Id: <1400644197-6179-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.9.rc0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 14052103-7014-0000-0000-000004EE1298
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.148
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org,
	Peter Lieven <pl@kamp.de>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] iscsi: Fix compile error
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
X-List-Received-Date: Wed, 21 May 2014 03:50:33 -0000

This fixes compile error when LIBISCSI_FEATURE_IOVECTOR is not defined:

block/iscsi.c|384 col 13| error: 'iscsi_allocationmap_is_allocated' defined but not used [-Werror=unused-f    unction]

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 block/iscsi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index d649424..5b3f459 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -380,6 +380,7 @@ retry:
     return 0;
 }
 
+#if defined(LIBISCSI_FEATURE_IOVECTOR)
 
 static bool iscsi_allocationmap_is_allocated(IscsiLun *iscsilun,
                                              int64_t sector_num, int nb_sectors)
@@ -393,9 +394,6 @@ static bool iscsi_allocationmap_is_allocated(IscsiLun *iscsilun,
                            sector_num / iscsilun->cluster_sectors) == size);
 }
 
-
-#if defined(LIBISCSI_FEATURE_IOVECTOR)
-
 static int64_t coroutine_fn iscsi_co_get_block_status(BlockDriverState *bs,
                                                   int64_t sector_num,
                                                   int nb_sectors, int *pnum)
-- 
1.9.rc0


