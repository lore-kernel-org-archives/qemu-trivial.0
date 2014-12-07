Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XxgQp-00018e-7l
	for mharc-qemu-trivial@gnu.org; Sun, 07 Dec 2014 13:19:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1XxgQe-0000ui-FJ
	for qemu-trivial@nongnu.org; Sun, 07 Dec 2014 13:19:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1XxgQV-0005qT-F2
	for qemu-trivial@nongnu.org; Sun, 07 Dec 2014 13:19:32 -0500
Received: from mail-lb0-x232.google.com ([2a00:1450:4010:c04::232]:41294)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>)
	id 1XxgQC-0005lP-Pt; Sun, 07 Dec 2014 13:19:04 -0500
Received: by mail-lb0-f178.google.com with SMTP id f15so3035973lbj.37
	for <multiple recipients>; Sun, 07 Dec 2014 10:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tICqcgmtSrPSuZuQCV8tFnc5KgqLAfxBOWkfW6lqVjc=;
	b=dp42mBk73FXvFVvWOLloND8vbbOTQhDRkoh2e2U/tYhP4PEIFWfkEPy0CX4X6BJBjA
	m2ArVDqICcho1/XU/MclvgcZUqw1DXHlp2fAZ3oU9SztVQ3ff0NQsyeC6YZ6OIGenlAR
	bjgTnvmXNJflHNSfu/0CgAJHqVJZvlw6BGRrkh0d53umb6FzoOeMZi/goA3gXXOvuMw/
	9/bHHgUbKw79OMVafrcikXBfgCasdCtQbX41y0BrO2jUTfZAxTIP4qboMBZe7XNfBzIN
	h7py8cymxIHN4TQ7O0ZQrcxiLLHZXM3CBm27Wck8ddw3WlxfIC3uzLHyDEMVCro2pCNN
	0+oQ==
X-Received: by 10.112.254.162 with SMTP id aj2mr12914206lbd.70.1417976343082; 
	Sun, 07 Dec 2014 10:19:03 -0800 (PST)
Received: from localhost.localdomain (ppp91-77-198-139.pppoe.mtu-net.ru.
	[91.77.198.139])
	by mx.google.com with ESMTPSA id f7sm10045521lam.26.2014.12.07.10.19.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Dec 2014 10:19:02 -0800 (PST)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  7 Dec 2014 21:20:45 +0300
Message-Id: <1417976445-18860-1-git-send-email-antonynpavlov@gmail.com>
X-Mailer: git-send-email 2.1.3
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c04::232
Cc: qemu-trivial@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>
Subject: [Qemu-trivial] [PATCH] pflash_cfi02.c: associate "cfi.pflash02" to
	"Storage devices" category
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
X-List-Received-Date: Sun, 07 Dec 2014 18:19:41 -0000

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
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


