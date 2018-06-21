Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fW3vR-0000sn-15
	for mharc-qemu-trivial@gnu.org; Thu, 21 Jun 2018 14:03:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3vL-0000oe-9B
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:03:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3vK-0006iQ-CP
	for qemu-trivial@nongnu.org; Thu, 21 Jun 2018 14:03:11 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:41907)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fW3vI-0006h4-20; Thu, 21 Jun 2018 14:03:08 -0400
Received: by mail-qt0-x241.google.com with SMTP id y20-v6so3666003qto.8;
	Thu, 21 Jun 2018 11:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GnD9db+GG2BdlKeK0fJQYmrK38suHyZoUcP+/Y0sDZ0=;
	b=lgOg8gnSeZ58kQWTocLbhrlZf6Mk9YtYkagMD4wJBZyO3PbQFtnwPNeFdr/wkS7BqC
	bfeljfZOTbr6vXw+DGOyHsNInrQZob1FjsTgC1EGM1dvghyQc/8a+Ddmi1DENxLooHhB
	813XN0/8hvDX4besFmwka+5eO7+SzzURyU9bfnv8GfbvX34o0BClU/60Kf+q9TENQa9/
	3GTjA3tNBZvtEV89Xlck83masjnGzZLl0wINXmfKm/839pwy059EMh0f7WXmAAhn6FQJ
	hgm8QUDNfqVrK8+6BTrw0zxqu+QPq6GHYsOpRqmQ4CTqu9PR7LtDHjPsrijrZiJnBE9G
	KOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=GnD9db+GG2BdlKeK0fJQYmrK38suHyZoUcP+/Y0sDZ0=;
	b=t28ZVZT7kjPfEPtigIRcm9puSWdSkuQQeyzQjrQsCrQheYteAUgsNKXSx1ZyZZrltC
	Q8rbFr9oqkBQLuHIAqzAEjQsvKXB+FeVRi+zs785tKlan8XIBBOxwbWcHMVZcyQ9FlhA
	xgQzBelc1UT2SzcpWI9sd/PIfwoQkFGEWRo+cmdvPOe6XsuHkp1NURSh72nBWkNofxsF
	P1XUADADNazBkAt+Dfm07FVu5fGLC1Bl1Au6yMETX+iPpT/ZFEdyuqRmuKECUbH7wIel
	BR6ftJtMmwnNSR/JiF2eL634F1OhvQQERKWjI3EbRVJ1HqY5RVdjw2sEaY7AcRFlUyCs
	LBPA==
X-Gm-Message-State: APt69E3KrIBTdxlEUgFzrXqDkLHL81Vxe0BxZcuYuIJ+QbddIUjlrA/a
	3aGAlW5F7q7btuCC54xrQIeFHStJ
X-Google-Smtp-Source: ADUXVKJkXtywf52MIg6BFmI308L62tGk2lWqCREs9fJ5rGAZRCDgKeCYD/vF4CwlcllCvocsHt9P+A==
X-Received: by 2002:a0c:9123:: with SMTP id
	q32-v6mr23501395qvq.136.1529604187450; 
	Thu, 21 Jun 2018 11:03:07 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w51-v6sm2469469qta.12.2018.06.21.11.03.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 11:03:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Date: Thu, 21 Jun 2018 15:02:24 -0300
Message-Id: <20180621180224.8312-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180621180224.8312-1-f4bug@amsat.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 11/11] hw/net/smc91c111: Use
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
X-List-Received-Date: Thu, 21 Jun 2018 18:03:14 -0000

hw_error() finally calls abort(), but there is no need to abort here.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/smc91c111.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index c8cc5379b7..705a034cb9 100644
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
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "smc91c111_write(bank:%d) 0x%" HWADDR_PRIx " = 0x%x\n",
+                  s->bank, offset, value);
 }
 
 static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
@@ -621,7 +624,9 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
         }
         break;
     }
-    hw_error("smc91c111_read: Bad reg %d:%x\n", s->bank, (int)offset);
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "smc91c111_read(bank:%d) 0x%" HWADDR_PRIx "\n",
+                  s->bank, offset);
     return 0;
 }
 
-- 
2.18.0.rc2


