Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWMJW-0006OM-JG
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 09:41:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJU-0006Lw-7O
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJT-0003iE-DZ
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 09:41:20 -0400
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a]:33069)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJR-0003dr-AX; Fri, 22 Jun 2018 09:41:17 -0400
Received: by mail-qt0-x22a.google.com with SMTP id l10-v6so5937861qtj.0;
	Fri, 22 Jun 2018 06:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rb4Tel6ruUx+KkPm4chyV+0/3KWS8VEG2yorSZc4qog=;
	b=rmRncngDDmZtkzWkBrWIUbMYuiBoZpXDw4csJka4Y0EBJA/VBZKB1RqVZ7aUF57mBn
	VbpYJL7GsP6nveyXCFgGFEwpVQeVH6BXlKjk0ekmFupSnqe4KUKx1OntFL/1luul3GyK
	+uUzgjNxt4I4R8AeprjWpJULjat4NLrVSEUBucaQIrRDA/irm+1otgny9JacFN/lsChU
	lAuo7mdraZznPkc3WMcncNNUHZswBZWUH+S91nzd1VzF34jhQb1CRZJP0iMx0ehp30E2
	2ymleoZXQDYZn3+TpfRd2PFVu4tKesfS9Qw/8GnJtxlqM2wDJGO1TWhhc/I2WRallVTJ
	gQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rb4Tel6ruUx+KkPm4chyV+0/3KWS8VEG2yorSZc4qog=;
	b=CQUeCWWpuztiFdcEA1ukajPzMGSymp2ewbDn/no+SNWw+C9H4+e1L6yGBguKHmzK3A
	m3fpWldt1tRsVE/QPr5ECDkcT73G4rXQr33EYxpGQo83Rj+ZC0oJu9mGG3R0Fn+K52qm
	bs3o1pfX2RVJZrRi0EsLbj9GlYkO2TeBU8UBtVc5a/BxCCau/NcUIaIfr4LKDmnlHEhv
	tddUkLsT1bcrLEie+eNPnzWV9EuLIHlT9qa0ArxhsRePeItjayPOVHPAmCdSvs499rx0
	/T2hXGCLiXZrTBd/Phc3QkmFOuy6TfFPguLwsyYPBxuPIQiPz4ONPP1j3jn1FOwXkJxD
	3RWg==
X-Gm-Message-State: APt69E0ctBI+jFWWag6y0bP4sL+AXa8cHqSs9WjBPAwjLBx2962PEQsa
	rh5YSJ8W79YQFiSL2FT5nLI=
X-Google-Smtp-Source: AAOMgpfKvuRtNVyLjleFds8XB9p/oAQx/BA2JddqI2If/hmO7i5JoOBKu9wFCN/yuZpv/LQH3tZNhw==
X-Received: by 2002:ac8:2302:: with SMTP id
	a2-v6mr1421215qta.180.1529674876626; 
	Fri, 22 Jun 2018 06:41:16 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.41.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Date: Fri, 22 Jun 2018 10:40:34 -0300
Message-Id: <20180622134036.23182-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22a
Subject: [Qemu-trivial] [PATCH v2 12/14] hw/net/smc91c111: Use
 qemu_log_mask(GUEST_ERROR) instead of hw_error
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
X-List-Received-Date: Fri, 22 Jun 2018 13:41:21 -0000

hw_error() finally calls abort(), but there is no need to abort here.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/smc91c111.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index c8cc5379b7..9094c0b47c 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -11,6 +11,7 @@
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "hw/devices.h"
+#include "qemu/log.h"
 /* For crc32 */
 #include <zlib.h>
 
@@ -478,7 +479,9 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
         }
         break;
     }
-    hw_error("smc91c111_write: Bad reg %d:%x\n", s->bank, (int)offset);
+    qemu_log_mask(LOG_GUEST_ERROR, "smc91c111_write(bank:%d) Illegal register"
+                                   " 0x%" HWADDR_PRIx " = 0x%x\n",
+                  s->bank, offset, value);
 }
 
 static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
@@ -621,7 +624,9 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
         }
         break;
     }
-    hw_error("smc91c111_read: Bad reg %d:%x\n", s->bank, (int)offset);
+    qemu_log_mask(LOG_GUEST_ERROR, "smc91c111_read(bank:%d) Illegal register"
+                                   " 0x%" HWADDR_PRIx "\n",
+                  s->bank, offset);
     return 0;
 }
 
-- 
2.18.0.rc2


