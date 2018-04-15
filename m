Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rIz-0004K4-Nb
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:43:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIw-0004Gy-LT
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIt-0008TP-KC
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:30 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:40965)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIt-0008TH-Gf; Sun, 15 Apr 2018 19:43:27 -0400
Received: by mail-qt0-x243.google.com with SMTP id d3so13549183qth.8;
	Sun, 15 Apr 2018 16:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kTd2LDGdmigWF4ptbWkAafWvCRXvDUz13u/cSq0VTKY=;
	b=LgXNLRyGoncr7dfxvtOUzLIhQ9GdN50QwWI8LxBqS1NMuUb8wnTnKE30nqkcrcjYX/
	t8NUerzjwZzhW4+OD6oLxfa65PLUslKCcp9r0yd36dL4DwfpsIyq++IQjRERyZnba0mW
	hCdpAbOD+aYofKwgJ/B8Jddm+Z9TzLFoEvLrzJ72ByqsE5EP7rnbMe9oZOi7kRxGRWvL
	DgeBVDstFHaOW/VlG4LPiRhjG7kjT9EAbVOUv1uUBp1I3WaZsUq2CBrtFsCIWltfTyba
	sbqaCd383A3P6C39J62ohz8K28xlcL1+lVqYtWJboDwOY9Te4EkOzW6qDwRuz4En0VFJ
	naLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=kTd2LDGdmigWF4ptbWkAafWvCRXvDUz13u/cSq0VTKY=;
	b=pBLPQFUZkEeIbnJqRW/RziKnoIYEt/uf7hJldRve3TMKAn9htzx/hwPpYARdReSFqu
	UqWfsCIZEJ9t/nqGkH8edlbMyd19jzLJ3q2/EfBN6twpWYCcRTendLqWSRJ3ZlE5IeUq
	cyKiLSWZDZB1Rkbx9HKna0RUbGJrACq/YSLqcCN8PVwp+AMmuWHbMl1QhF+IoamG+pEB
	W0q4MwZ4URSKiOfqaE8mRVsoFm58HOksJzI3X6fjei22HvnJHaC+WR08N+FP4wFM6OfX
	xyA5Z4rkqJqQlpXL9s4Ye+HmmT2RMWrFdf5+u/t5i2Uq2c5OD71ejR4hXx9vnnSc4OTR
	34pA==
X-Gm-Message-State: ALQs6tBY1ZtiHWGrwC9uSc6e2fkPWATNNo+HirPoqXiG5yMLrBbArSEW
	ROhevI5SZi7BxgiYbbZQw8cdHfiJ
X-Google-Smtp-Source: AIpwx4/1sGSrXo+tbap+3j/VF+19HQe/JlXkbJge91G5oKVzmNdVY4HsOGyB6u/kmq13+ywklYdI2g==
X-Received: by 10.200.6.65 with SMTP id e1mr1690070qth.242.1523835806890;
	Sun, 15 Apr 2018 16:43:26 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.43.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:43:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Keith Busch <keith.busch@intel.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:nvme)
Date: Sun, 15 Apr 2018 20:42:29 -0300
Message-Id: <20180415234307.28132-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v3 03/41] hw/block/nvme: Include the
 "qemu/cutils.h" in the source file
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
X-List-Received-Date: Sun, 15 Apr 2018 23:43:31 -0000

where it is used.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/block/nvme.h | 1 -
 hw/block/nvme.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 8f3981121d..cabcf20c32 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -1,6 +1,5 @@
 #ifndef HW_NVME_H
 #define HW_NVME_H
-#include "qemu/cutils.h"
 #include "block/nvme.h"
 
 typedef struct NvmeAsyncEvent {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 85d2406400..811084b6a7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -35,6 +35,7 @@
 #include "sysemu/block-backend.h"
 
 #include "qemu/log.h"
+#include "qemu/cutils.h"
 #include "trace.h"
 #include "nvme.h"
 
-- 
2.17.0


