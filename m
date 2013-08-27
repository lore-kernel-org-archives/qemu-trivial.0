Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEfwV-00074e-4n
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 09:37:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>) id 1VEMRp-0003d8-Fj
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 12:48:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>) id 1VEMRl-0003ha-0I
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 12:48:53 -0400
Received: from multi.imgtec.com ([194.200.65.239]:53234)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>)
	id 1VEMRk-0003hE-RO; Tue, 27 Aug 2013 12:48:48 -0400
From: Yongbok Kim <yongbok.kim@imgtec.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 27 Aug 2013 17:48:36 +0100
Message-ID: <1377622116-37650-1-git-send-email-yongbok.kim@imgtec.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.14.85]
X-SEF-Processed: 7_3_0_01192__2013_08_27_17_48_48
X-detected-operating-system: by eggs.gnu.org: Windows XP
X-Received-From: 194.200.65.239
X-Mailman-Approved-At: Wed, 28 Aug 2013 09:37:46 -0400
Cc: qemu-trivial@nongnu.org, yongbok.kim@imgtec.com, james.hogan@imgtec.com
Subject: [Qemu-trivial] [PATCH] target-mips: fix get_physical_address() #if
	0 build error
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
X-List-Received-Date: Tue, 27 Aug 2013 16:48:58 -0000

From: James Hogan <james.hogan@imgtec.com>

In get_physical_address() is a qemu_log() call inside an #if 0 block.
When enabled the following build error is hit:

target-mips/helper.c In function ‘get_physical_address’:
target-mips/helper.c:220:13: error: format ‘%x’ expects argument of type ‘unsigned int’, but argument 5 has type ‘hwaddr’ [-Werror=format]

Fix the *physical (hwaddr) formatting by using "%"HWADDR_PRIx instead of
TARGET_FMT_lx.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Yongbok Kim <yongbok.kim@imgtec.com>
---
 target-mips/helper.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target-mips/helper.c b/target-mips/helper.c
index 6feef7b..33e0e88 100644
--- a/target-mips/helper.c
+++ b/target-mips/helper.c
@@ -193,7 +193,7 @@ static int get_physical_address (CPUMIPSState *env, hwaddr *physical,
         }
     }
 #if 0
-    qemu_log(TARGET_FMT_lx " %d %d => " TARGET_FMT_lx " %d (%d)\n",
+    qemu_log(TARGET_FMT_lx " %d %d => %" HWADDR_PRIx " %d (%d)\n",
             address, rw, access_type, *physical, *prot, ret);
 #endif
 
-- 
1.7.4



