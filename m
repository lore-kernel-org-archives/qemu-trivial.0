Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIglg-0004cu-UN
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jun 2017 15:37:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1dIgle-0004UU-TT
	for qemu-trivial@nongnu.org; Wed, 07 Jun 2017 15:37:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1dIgle-0006ll-5r
	for qemu-trivial@nongnu.org; Wed, 07 Jun 2017 15:37:22 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:32964)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1dIglY-0006hW-0M; Wed, 07 Jun 2017 15:37:16 -0400
Received: by mail-lf0-x242.google.com with SMTP id u62so1651059lfg.0;
	Wed, 07 Jun 2017 12:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=deyzaVjezy8addkcE8HjoWDT7qy5sCaqXHEB39VGtAc=;
	b=XuutBLsx8CBR4SWI4UyJ2d5dgjYEj3UTegvQR4WbsF5EfsXLckw73ptQneApRP7Que
	TqVmFN9PaKKdmH5l0c22ZM4UET5DG2kYU113aBjwwDIXGnUYO4qZ5UnzRQw9NH67WLjF
	ne3wcOlFcuKO41F35K9c79wmPa142lzqSZUBN8HispZZfu+M4VVZsFRpo7UTwgSEIg1A
	NyKgcBGv1WlnSylvO7HpYIKL6B0wcq/pR/DZ/bzwULcS/Zi2NSoB74db7SVBZYoYyfGc
	EFsZs1mqLZmO2qehXwnHHq39hC8LbqkooceozgUJ3w+fEvKghrvsejn/IOaoWyJ4H5Uv
	t8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=deyzaVjezy8addkcE8HjoWDT7qy5sCaqXHEB39VGtAc=;
	b=kEPa9KaLhGlUj/n6WspAcaiR7/bcTJVtRcwSuJJXRxdfO0YWPxSpNRHNGTiWXIlboP
	O90qfnSh6hsk3YiYL7PO+IB1jKD/fqAYgbs6yMVXDv1hW9VxsIsU4m5ADqlcr/EU4/7r
	uTbKyFtbrThnF26cRYt0+Dch/AwpqocpgYGUkkDfQAO9ZzOWsxm9/NdjTsaJUTt8B8Z/
	KdS9+HP7mW9jmRGRFidANh3vgog8/c5uYEWRUkuoGkuO88IsV5y4ee20jLkXqLsjViRX
	EbYqNpTIxuNLdAPUutTptLGZ58t5cxpvwxdR56WUzsuyAeUbhXBKpUDjnxxZypnQzDeO
	XJ8w==
X-Gm-Message-State: AODbwcC8BhSZMuorQoQm46jCoSiepVkbyCzl4L5+tezrktgScQKRCRuc
	2uQ4zyIyZxQcjauc
X-Received: by 10.25.149.4 with SMTP id x4mr753765lfd.136.1496864234219;
	Wed, 07 Jun 2017 12:37:14 -0700 (PDT)
Received: from octofox.metropolis ([5.19.183.212])
	by smtp.gmail.com with ESMTPSA id e10sm525800ljb.68.2017.06.07.12.37.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Jun 2017 12:37:13 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Max Filippov <jcmvbkbc@gmail.com>
Date: Wed,  7 Jun 2017 12:36:44 -0700
Message-Id: <1496864204-5954-1-git-send-email-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-trivial] [PATCH] target/xtensa: gdbstub: drop dead return
 statement
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
X-List-Received-Date: Wed, 07 Jun 2017 19:37:23 -0000

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/gdbstub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/xtensa/gdbstub.c b/target/xtensa/gdbstub.c
index da131ae..d78a1b4 100644
--- a/target/xtensa/gdbstub.c
+++ b/target/xtensa/gdbstub.c
@@ -72,7 +72,6 @@ int xtensa_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
                       __func__, n, reg->type);
         memset(mem_buf, 0, reg->size);
         return reg->size;
-        return 0;
     }
 }
 
-- 
2.1.4


