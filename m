Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zys-0005QQ-IT
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:33:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zyl-0005DY-Ei
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:33:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zyk-0008Ad-LF
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:33:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zyf-00088L-8Y; Mon, 22 Jun 2015 07:33:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3D47541E4A;
	Mon, 22 Jun 2015 14:33:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 60E13A89;
	Mon, 22 Jun 2015 14:17:31 +0300 (MSK)
Received: (nullmailer pid 9297 invoked by uid 1000);
	Mon, 22 Jun 2015 11:17:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:27 +0300
Message-Id: <1ef32d467d228cc23445bdaa0a1c4e9fe1ef384f.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 20/21] hw/display/tcx.c: Fix memory leak
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
X-List-Received-Date: Mon, 22 Jun 2015 11:33:32 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/tcx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index f3faf78..244f777 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -1017,6 +1017,7 @@ static void tcx_realizefn(DeviceState *dev, Error **errp)
     if (fcode_filename) {
         ret = load_image_targphys(fcode_filename, s->prom_addr,
                                   FCODE_MAX_ROM_SIZE);
+        g_free(fcode_filename);
         if (ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
             error_report("tcx: could not load prom '%s'", TCX_ROM_FILE);
         }
-- 
2.1.4


