Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gaLWR-0005bJ-EH
	for mharc-qemu-trivial@gnu.org; Fri, 21 Dec 2018 09:11:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <npes87184@gmail.com>) id 1gaLK3-0000j8-1v
	for qemu-trivial@nongnu.org; Fri, 21 Dec 2018 08:58:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <npes87184@gmail.com>) id 1gaLK2-0004DD-DZ
	for qemu-trivial@nongnu.org; Fri, 21 Dec 2018 08:58:38 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39290)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <npes87184@gmail.com>)
	id 1gaLJx-00048F-1j; Fri, 21 Dec 2018 08:58:33 -0500
Received: by mail-pg1-x544.google.com with SMTP id w6so2563758pgl.6;
	Fri, 21 Dec 2018 05:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=G9QvOoCEr50F+wt+K33Hubpl2FiMIku4UKSsayjL+RI=;
	b=RxPt1EdbPTtwY/7/QsuiCtoi2M01bA1Vf2g7gOcbOUbpNg7hTCYie3W7f6NBKDJEIa
	L86wTiuIzeufpo6PL18ttbZnJ0i2FLrSbSmO/6S53hIQZaqsAZaO7nAc3EKsHa27O24B
	asjCL1V7bKT+iDSlCRBRmtgONionwZsGLFfR7Pifr+Ya/Z5MUwVyvWh7CBxQW3FTXTaa
	za2b2xGRyJw6vkf3cyVgvlBJKY+JUNuLwrCQujMxk7KBCKCxMV5xx1VuPKlhqdl5Kkst
	hM7JAlCDpVaqjURiPXariqSehSPw8jARXxbnJc/l8n4HTlDqMtWBceRCpDyDzYlcozjE
	R90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G9QvOoCEr50F+wt+K33Hubpl2FiMIku4UKSsayjL+RI=;
	b=Q3S0MHpBucNeIBK947REZHR5dh5mw0Tn3qFn2E7RuJ6cAC5XL/mCPaQGtNw5kYlS4K
	g8xEkgHvLgKMR/L+3IEuLH53m8Smn9Yj6C/3XqqFKpAWt07rRNDqWnJLgcwhUWivWngB
	cq5yKfZQNSNqeOO8MdG8s/WFKPIyrN1XgQ+q2+PLNVrlVfXxy6zjz5p+UiEOnReqMjLo
	gGHRL2Cz5nEk9cg4rILpBT+q+B+6Elo8jBiNt7wcuVY51OIzbn0KqdgHDvdScOeSGngq
	UIIQE9+91GUQX3MGq5CjgqoHCp0OBkaZXlddreLB23tHxmsBTahYf2G95FNbvJxC7crc
	aGrg==
X-Gm-Message-State: AJcUukd/x/4Ksd5L8RcxH4Y72VIN+YD4q0A1tWbujJar/vC2/BACpsz8
	3CaNDSkzjqBKyGZAgAwAkjztrFHi
X-Google-Smtp-Source: ALg8bN5peoilsJ2nVJ1zHB0UIv4ngePoguwYk1AtxzvjhSO8vmahAAg2LtKz4+Rj0PBN4IEaxiXeAQ==
X-Received: by 2002:a63:2c0e:: with SMTP id s14mr2569992pgs.132.1545400708414; 
	Fri, 21 Dec 2018 05:58:28 -0800 (PST)
Received: from localhost.localdomain (223-137-9-156.emome-ip.hinet.net.
	[223.137.9.156]) by smtp.gmail.com with ESMTPSA id
	p7sm46575187pfj.72.2018.12.21.05.58.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Dec 2018 05:58:27 -0800 (PST)
From: yuchenlin <npes87184@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	yuchenlin <npes87184@gmail.com>
Date: Fri, 21 Dec 2018 21:58:03 +0800
Message-Id: <20181221135803.9583-1-npes87184@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
X-Mailman-Approved-At: Fri, 21 Dec 2018 09:11:26 -0500
Subject: [Qemu-trivial] [PATCH] dmg: fix binary search
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
X-List-Received-Date: Fri, 21 Dec 2018 13:58:39 -0000

There is a possible hang in original binary searsh implemtation. That is
if chunk1 = 4, chunk2 = 5, chunk3 = 4, and we go else case.

The chunk1 will be still 4, and so on.

Signed-off-by: yuchenlin <npes87184@gmail.com>
---
 block/dmg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/dmg.c b/block/dmg.c
index 50e91aef6d..0e05702f5d 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -572,14 +572,14 @@ static inline uint32_t search_chunk(BDRVDMGState *s, uint64_t sector_num)
 {
     /* binary search */
     uint32_t chunk1 = 0, chunk2 = s->n_chunks, chunk3;
-    while (chunk1 != chunk2) {
+    while (chunk1 <= chunk2) {
         chunk3 = (chunk1 + chunk2) / 2;
         if (s->sectors[chunk3] > sector_num) {
-            chunk2 = chunk3;
+            chunk2 = chunk3 - 1;
         } else if (s->sectors[chunk3] + s->sectorcounts[chunk3] > sector_num) {
             return chunk3;
         } else {
-            chunk1 = chunk3;
+            chunk1 = chunk3 + 1;
         }
     }
     return s->n_chunks; /* error */
-- 
2.17.1


