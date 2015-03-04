Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTGBn-0001k1-Nd
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 15:46:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGBl-0001iW-Mw
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:46:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGBk-0001cA-Sk
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:46:41 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTGBc-0001Zf-D3; Wed, 04 Mar 2015 15:46:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4AD4640924;
	Wed,  4 Mar 2015 23:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 499A5935;
	Wed,  4 Mar 2015 20:07:06 +0300 (MSK)
Received: (nullmailer pid 17511 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:31 +0300
Message-Id: <083a8c61789851e2dbad15cdf7b589366dcdd255.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 14/47] pl330.c: remove superfluous '\n' around
	error_setg
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
X-List-Received-Date: Wed, 04 Mar 2015 20:46:42 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/dma/pl330.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 16cf77e..5be3df5 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1566,7 +1566,7 @@ static void pl330_realize(DeviceState *dev, Error **errp)
         s->cfg[1] |= 5;
         break;
     default:
-        error_setg(errp, "Bad value for i-cache_len property: %" PRIx8 "\n",
+        error_setg(errp, "Bad value for i-cache_len property: %" PRIx8,
                    s->i_cache_len);
         return;
     }
@@ -1601,7 +1601,7 @@ static void pl330_realize(DeviceState *dev, Error **errp)
         s->cfg[CFG_CRD] |= 0x4;
         break;
     default:
-        error_setg(errp, "Bad value for data_width property: %" PRIx8 "\n",
+        error_setg(errp, "Bad value for data_width property: %" PRIx8,
                    s->data_width);
         return;
     }
-- 
2.1.4


