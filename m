Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8aR-0003fr-05
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:35:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8aK-0003Ym-90
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:35:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8aF-000224-CC
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:35:32 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46690)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8Zz-0001tI-Qz; Thu, 11 Dec 2014 13:35:11 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AA66A41D4C;
	Thu, 11 Dec 2014 21:35:10 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 69A168F3;
	Thu, 11 Dec 2014 21:16:18 +0300 (MSK)
Received: (nullmailer pid 22991 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:16:06 +0300
Message-Id: <df6f93182a898c295d90dd502d49818c6bb98200.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Antony Pavlov <antonynpavlov@gmail.com>
Subject: [Qemu-trivial] [PULL 18/20] pflash_cfi02.c: associate
	"cfi.pflash02" to "Storage devices" category
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
X-List-Received-Date: Thu, 11 Dec 2014 18:35:37 -0000

From: Antony Pavlov <antonynpavlov@gmail.com>

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/block/pflash_cfi02.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 8513a17..389b4aa 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -744,6 +744,7 @@ static void pflash_cfi02_class_init(ObjectClass *klass, void *data)
 
     dc->realize = pflash_cfi02_realize;
     dc->props = pflash_cfi02_properties;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
 static const TypeInfo pflash_cfi02_info = {
-- 
2.1.3


