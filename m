Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hRq1Z-0000dC-GX
	for mharc-qemu-trivial@gnu.org; Fri, 17 May 2019 23:28:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hRq1X-0000bd-Lk
	for qemu-trivial@nongnu.org; Fri, 17 May 2019 23:28:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hRq1W-00038A-Oo
	for qemu-trivial@nongnu.org; Fri, 17 May 2019 23:28:39 -0400
Received: from m12-18.163.com ([220.181.12.18]:40788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1hRq1T-00034p-As; Fri, 17 May 2019 23:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=wqsPUSs1VwoIXuA/zY
	7YR9mqlMCl+nmGzwi02r8ZDMs=; b=lC81mwcBLczt6As6lbVqdV2kQ93VfnppP0
	5lbwNYcCWGobHRPIU4HFLMxNNh4fKhMkDWSRPbQ41PgIgBrr2L2qS9RfS1UO2NmJ
	sbp5DYZDWl+gdIlUUknJaoCs/WuIcnozUyyOiOwZCrO0RW8Znc241iKnNae4mUpu
	UpnA4Gt0E=
Received: from localhost.localdomain (unknown [183.159.73.182])
	by smtp14 (Coremail) with SMTP id EsCowACXzsrXe99czqL5Gg--.37649S4;
	Sat, 18 May 2019 11:28:33 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: alex.williamson@redhat.com,
	lvivier@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, liq3ea@gmail.com,
	philmd@redhat.com, Li Qiang <liq3ea@163.com>
Date: Fri, 17 May 2019 20:28:10 -0700
Message-Id: <20190518032811.60341-3-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190518032811.60341-1-liq3ea@163.com>
References: <20190518032811.60341-1-liq3ea@163.com>
X-CM-TRANSID: EsCowACXzsrXe99czqL5Gg--.37649S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4DWr4xAFWfKFy5Aw1rXrb_yoWfCwbEv3
	W8K397C3WvgrZ29rWqyrW7Zry7Zw4UKFsakFyxt3Wq93y5Aay5CwnruFZ7Zr4xCr12y34D
	Cw4vkasxAF13CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb73vUUUUUU==
X-Originating-IP: [183.159.73.182]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBLwG4bVUMJXo4VQAAsQ
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.18
Subject: [Qemu-trivial] [PATCH 3/4] vfio: platform: fix a typo
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
X-List-Received-Date: Sat, 18 May 2019 03:28:40 -0000

CC: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
---
 hw/vfio/platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index e59a0234dd..d52d6552e0 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -72,7 +72,7 @@ static VFIOINTp *vfio_init_intp(VFIODevice *vbasedev,
         g_free(intp->interrupt);
         g_free(intp);
         error_setg_errno(errp, -ret,
-                         "failed to initialize trigger eventd notifier");
+                         "failed to initialize trigger eventfd notifier");
         return NULL;
     }
     if (vfio_irq_is_automasked(intp)) {
@@ -84,7 +84,7 @@ static VFIOINTp *vfio_init_intp(VFIODevice *vbasedev,
             g_free(intp->unmask);
             g_free(intp);
             error_setg_errno(errp, -ret,
-                             "failed to initialize resample eventd notifier");
+                             "failed to initialize resample eventfd notifier");
             return NULL;
         }
     }
-- 
2.17.1



