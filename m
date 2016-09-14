Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5Bd-0001iC-0q
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:04:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5BW-0001cd-3n
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:04:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5BS-000637-Al
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:04:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46356)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5BL-0005zW-Fm; Wed, 14 Sep 2016 04:04:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B742541846;
	Wed, 14 Sep 2016 11:04:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id AA033B1A;
	Wed, 14 Sep 2016 10:59:00 +0300 (MSK)
Received: (nullmailer pid 17356 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:48 +0300
Message-Id: <b1156e3e2351fd8b4285668d54e9a80e4534606e.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 22/27] tricore: remove useless cast
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
X-List-Received-Date: Wed, 14 Sep 2016 08:04:51 -0000

From: Laurent Vivier <lvivier@redhat.com>

This patch is the result of coccinelle script
scripts/coccinelle/typecast.cocci

CC: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/tricore/tricore_testboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
index 8d3520f..19dd587 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -46,7 +46,7 @@ static void tricore_load_kernel(CPUTriCoreState *env)
     long kernel_size;
 
     kernel_size = load_elf(tricoretb_binfo.kernel_filename, NULL,
-                           NULL, (uint64_t *)&entry, NULL,
+                           NULL, &entry, NULL,
                            NULL, 0,
                            EM_TRICORE, 1, 0);
     if (kernel_size <= 0) {
-- 
2.1.4


