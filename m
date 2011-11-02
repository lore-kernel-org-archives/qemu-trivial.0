Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RLWKh-0004e8-2m
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2011 04:38:03 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RLWKd-0004ZV-Hv
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2011 04:38:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RLWKc-0003pF-2w
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2011 04:37:59 -0400
Received: from e28smtp07.in.ibm.com ([122.248.162.7]:38731)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1RLWKb-0003nz-7s
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2011 04:37:57 -0400
Received: from /spool/local
	by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Wed, 2 Nov 2011 14:07:52 +0530
Received: from d28relay01.in.ibm.com ([9.184.220.58])
	by e28smtp07.in.ibm.com ([192.168.1.137]) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 2 Nov 2011 14:07:40 +0530
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay01.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pA28bcZg2658362; Wed, 2 Nov 2011 14:07:39 +0530
Received: from d28av01.in.ibm.com (loopback [127.0.0.1])
	by d28av01.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	pA28bbuU013804; Wed, 2 Nov 2011 14:07:37 +0530
Received: from wdongxu-T410.cn.ibm.com ([9.115.118.28])
	by d28av01.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pA28bYDa008899; Wed, 2 Nov 2011 14:07:36 +0530
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Nov 2011 16:36:21 +0800
Message-Id: <1320222981-3839-2-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1320222981-3839-1-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1320222981-3839-1-git-send-email-wdongxu@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-cbid: 11110208-8878-0000-0000-00000013D9EA
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.7
Cc: qemu-trivial@nongnu.org, afaerber@suse.de, raywang@linux.vnet.ibm.com
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH_2/2=5D_block=3Ause_g=5Ffree_ins?=
	=?utf-8?q?tead_of_free_in_cloop=2Ec?=
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
X-List-Received-Date: Wed, 02 Nov 2011 08:38:01 -0000

From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>

Fix mismatching allocation and deallocation: g_free should be used to pair with 
g_malloc.

v3: Split to 2 patches: one for fixing coding style, one for replacing free with
    g_free. And correct other 2 places with coding style problem.
v2: Fix spelling: gfree->g_free.
v1: Use gfree, to pair with g_malloc. Also fix coding style.

Reviewed-by: Andreas Färber <afaerber@suse.de>
Reviewed_by: Ray Wang <raywang@linux.vnet.ibm.com>
Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
---
 block/cloop.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/cloop.c b/block/cloop.c
index 799b6c2..7570eb8 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -171,10 +171,10 @@ static void cloop_close(BlockDriverState *bs)
 {
     BDRVCloopState *s = bs->opaque;
     if (s->n_blocks > 0) {
-        free(s->offsets);
+        g_free(s->offsets);
     }
-    free(s->compressed_block);
-    free(s->uncompressed_block);
+    g_free(s->compressed_block);
+    g_free(s->uncompressed_block);
     inflateEnd(&s->zstream);
 }
 
-- 
1.7.5.4


