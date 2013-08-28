Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEfwa-0007AH-21
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 09:37:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1VEWxL-0006xx-EV
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 00:02:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1VEWxC-00032m-UL
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 00:02:07 -0400
Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231]:48916)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1VEWxC-00032h-Mx
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 00:01:58 -0400
Received: by mail-lb0-f177.google.com with SMTP id p5so3280110lbi.36
	for <qemu-trivial@nongnu.org>; Tue, 27 Aug 2013 21:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Wv8MDoiAcdZj9FDvi/rJjBKv9qr+SvX5Ci93bLRpvzo=;
	b=PQLuRu0CNzCP4NAKDXxzpDSk0JIwahFQneu3v6V1WlAZYsgJjJ2VzHc8HCvOLH797h
	iQ6MD3Yr3WeZnyrrL7ztYm9USEeeO8jkAMBAc/SSAsJ0tIVUtiZrE0XEu5UCL1boWCgB
	iELPrGX18wgdoWOcnGqwm2/JpxYP/FsWrxlPaeDbjaGf/a4r4C3YFI2Uk7/htPuCheqj
	qq5jqy7idArZIT7m/gImGHS3a6Mky1zg18tJ+le29ton/NbzA/V7OHMSxeI0Ucae1Qrz
	8Ig7ROwf1ZO54lrVsdwpL6ugtYLjNCrkZHR0DMXSa9JHBXwMwmmQfAcwStJmH+PaFgcs
	njzA==
X-Received: by 10.152.5.66 with SMTP id q2mr21965218laq.13.1377662517540;
	Tue, 27 Aug 2013 21:01:57 -0700 (PDT)
Received: from localhost.localdomain (ppp37-190-57-26.pppoe.spdop.ru.
	[37.190.57.26])
	by mx.google.com with ESMTPSA id rd5sm8260779lbb.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 21:01:56 -0700 (PDT)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: qemu-trivial@nongnu.org
Date: Wed, 28 Aug 2013 07:59:37 +0400
Message-Id: <1377662377-23865-1-git-send-email-antonynpavlov@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c04::231
X-Mailman-Approved-At: Wed, 28 Aug 2013 09:37:54 -0400
Cc: Antony Pavlov <antonynpavlov@gmail.com>
Subject: [Qemu-trivial] [PATCH] pflash_cfi02.c: fix debug macro
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
X-List-Received-Date: Wed, 28 Aug 2013 04:02:15 -0000

If PFLASH_DEBUG is enabled then we have some build errors:

hw/block/pflash_cfi02.c: In function ‘pflash_timer’:
hw/block/pflash_cfi02.c:128:5: error: expected ‘)’ before string constant
hw/block/pflash_cfi02.c:128:5: error: too few arguments to function ‘fprintf’

This patch fixes the problem.

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
---
 hw/block/pflash_cfi02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 99445b0..8d4b828 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -47,7 +47,7 @@
 #ifdef PFLASH_DEBUG
 #define DPRINTF(fmt, ...)                                  \
 do {                                                       \
-    fprintf(stderr "PFLASH: " fmt , ## __VA_ARGS__);       \
+    fprintf(stderr, "PFLASH: " fmt , ## __VA_ARGS__);       \
 } while (0)
 #else
 #define DPRINTF(fmt, ...) do { } while (0)
-- 
1.8.4.rc3


