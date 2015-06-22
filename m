Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zpF-0003js-Qc
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:23:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zp9-0003XI-Sv
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zp4-00054E-It
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37208)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zoz-00052t-AZ; Mon, 22 Jun 2015 07:23:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7DCE941E48;
	Mon, 22 Jun 2015 14:23:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A841AA58;
	Mon, 22 Jun 2015 14:16:31 +0300 (MSK)
Received: (nullmailer pid 9278 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:26 +0300
Message-Id: <08fbd77fdcb79d7ec6e10a04e9ab5411cc8b686a.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 19/21] hw/display/cg3.c: Fix memory leak
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
X-List-Received-Date: Mon, 22 Jun 2015 11:23:40 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/cg3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index b94e5e0..34dcbc3 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -303,6 +303,7 @@ static void cg3_realizefn(DeviceState *dev, Error **errp)
     if (fcode_filename) {
         ret = load_image_targphys(fcode_filename, s->prom_addr,
                                   FCODE_MAX_ROM_SIZE);
+        g_free(fcode_filename);
         if (ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
             error_report("cg3: could not load prom '%s'", CG3_ROM_FILE);
         }
-- 
2.1.4


