Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIrNG-0006rj-4f
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jun 2017 02:56:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <el13635@mail.ntua.gr>) id 1dIkam-0002Ek-92
	for qemu-trivial@nongnu.org; Wed, 07 Jun 2017 19:42:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <el13635@mail.ntua.gr>) id 1dIkah-0001Uc-9d
	for qemu-trivial@nongnu.org; Wed, 07 Jun 2017 19:42:24 -0400
Received: from smtp1.ntua.gr ([2001:648:2000:de::183]:12849)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <el13635@mail.ntua.gr>) id 1dIkag-0001UV-L4
	for qemu-trivial@nongnu.org; Wed, 07 Jun 2017 19:42:19 -0400
Received: from mail.ntua.gr (ppp141255063244.access.hol.gr [141.255.63.244])
	(authenticated bits=0)
	by smtp1.ntua.gr (8.15.2/8.15.2) with ESMTPSA id v57MhIDu045786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 8 Jun 2017 01:43:21 +0300 (EEST)
	(envelope-from el13635@mail.ntua.gr)
X-Authentication-Warning: smtp1.ntua.gr: Host ppp141255063244.access.hol.gr
	[141.255.63.244] claimed to be mail.ntua.gr
From: Manos Pitsidianakis <el13635@mail.ntua.gr>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-trivial@nongnu.org
Date: Thu,  8 Jun 2017 01:43:16 +0300
Message-Id: <20170607224316.6952-1-el13635@mail.ntua.gr>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:648:2000:de::183
X-Mailman-Approved-At: Thu, 08 Jun 2017 02:56:51 -0400
Subject: [Qemu-trivial] [PATCH] block: change variable names in
 BlockDriverState
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
X-List-Received-Date: Wed, 07 Jun 2017 23:42:25 -0000

Change the 'int count' parameter in bdrv_co_pwrite_zeros and
bdrv_co_pdiscard to 'int bytes', as they both refer to bytes.
This helps with code legibility.

Signed-off-by: Manos Pitsidianakis <el13635@mail.ntua.gr>
---
 include/block/block_int.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index cb78c4f..06e398b 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -162,9 +162,9 @@ struct BlockDriver {
      * will be called instead.
      */
     int coroutine_fn (*bdrv_co_pwrite_zeroes)(BlockDriverState *bs,
-        int64_t offset, int count, BdrvRequestFlags flags);
+        int64_t offset, int bytes, BdrvRequestFlags flags);
     int coroutine_fn (*bdrv_co_pdiscard)(BlockDriverState *bs,
-        int64_t offset, int count);
+        int64_t offset, int bytes);
 
     /*
      * Building block for bdrv_block_status[_above]. The driver should
-- 
2.11.0


