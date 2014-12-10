Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XydPa-0000du-AL
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 04:18:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XydPQ-0000Q4-A9
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:18:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XydPH-0007Qi-8I
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:18:12 -0500
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:53390)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1XydOy-0007K4-US; Wed, 10 Dec 2014 04:17:45 -0500
Received: by mail-wi0-f172.google.com with SMTP id n3so10505258wiv.5
	for <multiple recipients>; Wed, 10 Dec 2014 01:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=2OB4Oe71rUETZk7EosTiFD+KTtogZWkIbt/svyiI5qw=;
	b=rY5/D0suXs54O0KAOd1w62vdzz0KfoKsff5KmRpQt7XGULjdKVGYUGWC2wIgcogGT+
	VgDspcyMY8Zhm8HCC3cx7uZZkQ5Qy44p1IlXKd3UTTGuJBcwwiDEpwfbHEwXEoAk5iXX
	P2c9x7AcuOEasTnDFXj8BN7N/Yt44vSJjvtkOHApGsVWRVHoJ0tE0FV+utHNY43HHVtN
	S6FvXDGpA4jn0VP+RppcJxfULuD3/mrf5J/d0rHkCxm3VsxSIHifB/ec/m6UDSBIlw3a
	50kJ2IHUOCJiFTOgImcqjABmLPb9tDwvHr2jcAaR/obFxBY675KcynmZB2oDCulano8I
	gTHg==
X-Received: by 10.180.208.69 with SMTP id mc5mr4611245wic.25.1418203063889;
	Wed, 10 Dec 2014 01:17:43 -0800 (PST)
Received: from playground.station (net-2-35-193-40.cust.vodafonedsl.it.
	[2.35.193.40])
	by mx.google.com with ESMTPSA id u9sm5022350wjy.37.2014.12.10.01.17.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Dec 2014 01:17:42 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 Dec 2014 10:17:36 +0100
Message-Id: <1418203056-5365-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
Cc: qemu-trivial@nongnu.org, zhang.zhanghailiang@huawei.com,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH] vt82c686: avoid out-of-bounds read
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
X-List-Received-Date: Wed, 10 Dec 2014 09:18:21 -0000

superio_ioport_readb can read the 256th element of the array.
Coverity reports an out-of-bounds write in superio_ioport_writeb,
but it does not show the corresponding out-of-bounds read
because it cannot prove that it can happen.  Fix the root
cause of the problem (zhanghailang's patch instead fixes
the logic in superio_ioport_writeb).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/isa/vt82c686.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index e0c235c..a43e26d 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -36,7 +36,7 @@
 
 typedef struct SuperIOConfig
 {
-    uint8_t config[0xff];
+    uint8_t config[0x100];
     uint8_t index;
     uint8_t data;
 } SuperIOConfig;
-- 
1.8.3.1


