Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hT6VV-0007ZI-At
	for mharc-qemu-trivial@gnu.org; Tue, 21 May 2019 11:16:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hT6VS-0007Wd-8q
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hT6VR-0001aH-AQ
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:16:46 -0400
Received: from m12-16.163.com ([220.181.12.16]:57274)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1hT6VO-0001Up-8w; Tue, 21 May 2019 11:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=GphRRHXPmZj/YCwTEB
	a/ZbIMgwXVEM5rbWw176Y/gW0=; b=gm/NhhWAj+Q+4XUulj057PTfL5SWSJA3j4
	Jy4LbqMfOke7przrYr6MEoJA7WWFIo3B1d1kfIC4k3yoppV35fVDfhvOAVTRIXQH
	hf6Fy8Od7+Io6qAAKctKs+kASJXG2iz908tG6zwPtqRxpyCobNtFirfFVFUbEhXU
	RqjqI3trw=
Received: from localhost.localdomain (unknown [115.192.71.0])
	by smtp12 (Coremail) with SMTP id EMCowAC31lxJFuRcie7uGw--.4521S5;
	Tue, 21 May 2019 23:16:36 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: alex.williamson@redhat.com,
	lvivier@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, liq3ea@gmail.com,
	philmd@redhat.com, Li Qiang <liq3ea@163.com>
Date: Tue, 21 May 2019 08:15:42 -0700
Message-Id: <20190521151543.92274-4-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521151543.92274-1-liq3ea@163.com>
References: <20190521151543.92274-1-liq3ea@163.com>
X-CM-TRANSID: EMCowAC31lxJFuRcie7uGw--.4521S5
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryfGFW3uF13JrWrCr1xXwb_yoWftFbEv3
	W8K397C3WvgrZa9rWqyrW3Zry7Zw4UKFsakFyxt3Wq93y5Aa15CwnruFZ7Xr47Cr12y34D
	Cw4kC3ZxAF13ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8tDG7UUUUU==
X-Originating-IP: [115.192.71.0]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBLxS7bVUMJbPrPAAAs1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.16
Subject: [Qemu-trivial] [PATCH v2 3/4] vfio: platform: fix a typo
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
X-List-Received-Date: Tue, 21 May 2019 15:16:47 -0000

'eventd' should be 'eventfd'.

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



