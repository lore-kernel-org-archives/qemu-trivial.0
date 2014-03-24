Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WRy2M-0004D9-4O
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 02:07:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <deepak.mk17@gmail.com>) id 1WRy2B-0003yz-M1
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 02:07:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <deepak.mk17@gmail.com>) id 1WRy23-0007hL-87
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 02:06:55 -0400
Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236]:65250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <deepak.mk17@gmail.com>)
	id 1WRy1l-0007co-3p; Mon, 24 Mar 2014 02:06:29 -0400
Received: by mail-pb0-f54.google.com with SMTP id ma3so5031654pbc.27
	for <multiple recipients>; Sun, 23 Mar 2014 23:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bKD67XKLR6NnqS7Qx1xfQEwl6mHa+KJGy7qaYnLc+0I=;
	b=af09l5Uvg8EDjqJK/Fdg5K+A7UVr09B37JQNr/csdS+4wmg3kFqHuowdcbJR9lm4c9
	Nubt6R4Nn/irqvCoMGSRpTzB4fH7r6webXy+UbT3x/uG5N4w05unxLuBdCdQH1W2Vc3O
	JF28Dicu/qNx+FZxGjwbn9VnZNMMG01D3VRfXz8N0BP3bIft2n66DiLKnHYPnY//i3cy
	0iDdvvIfLEtGbaRj0UTnjl0SivNQOvIvnLOd1Y34gjBgvxhilGG0wH4UnHxkE7XPozGc
	nb5K6QHaNuC2b5K+w+Hhpig2yEPQrViBphkvBQyGV05FEphXhs6kiQ5HoQAFnTUH+DbG
	/Qow==
X-Received: by 10.67.4.169 with SMTP id cf9mr69629312pad.45.1395641187173;
	Sun, 23 Mar 2014 23:06:27 -0700 (PDT)
Received: from monroe.comp.nus.edu.sg (nusnet-208-140.dynip.nus.edu.sg.
	[137.132.208.140]) by mx.google.com with ESMTPSA id
	yo9sm54283876pab.16.2014.03.23.23.06.24 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 23 Mar 2014 23:06:25 -0700 (PDT)
From: Deepak Kathayat <deepak.mk17@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Mar 2014 14:06:15 +0800
Message-Id: <1395641175-30878-1-git-send-email-deepak.mk17@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::236
Cc: qemu-trivial@nongnu.org, Deepak Kathayat <deepak.mk17@gmail.com>,
	stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] qcow2: Remove FIXME comment, already fixed
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
X-List-Received-Date: Mon, 24 Mar 2014 06:07:04 -0000


Signed-off-by: Deepak Kathayat <deepak.mk17@gmail.com>
---
 block/qcow2.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 0b0eac8..25663d4 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -413,7 +413,6 @@ static inline uint64_t l2meta_cow_end(QCowL2Meta *m)
         + (m->cow_end.nb_sectors << BDRV_SECTOR_BITS);
 }
 
-// FIXME Need qcow2_ prefix to global functions
 
 /* qcow2.c functions */
 int qcow2_backing_read1(BlockDriverState *bs, QEMUIOVector *qiov,
-- 
1.7.9.5


