Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UT0vv-00031e-0j
	for mharc-qemu-trivial@gnu.org; Thu, 18 Apr 2013 22:20:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UT0vr-0002ze-AV
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 22:20:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UT0vq-0007QV-3P
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 22:20:11 -0400
Received: from mail-da0-x22b.google.com ([2607:f8b0:400e:c00::22b]:61526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UT0vp-0007Q6-T6
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 22:20:10 -0400
Received: by mail-da0-f43.google.com with SMTP id u36so1690101dak.2
	for <qemu-trivial@nongnu.org>; Thu, 18 Apr 2013 19:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=32R96lsycs3zhD2T6ZdzKdwfDilS6R0EB0ytDx2jDoo=;
	b=L2YbVlAb5Ay8QZQ+l5dqwWdruLjS8tvyNxHjgNFNrfoABRzl59rd64mCI4A3g0rVZR
	6m7rBwzwS0Z09xF7YIig1IH0WOQIt1kDmHWiPtPkYFvXBPHe6/n+DjLOQcp5B4zsaVCb
	jJzMMfxyzZu/ZeCkwAAgoVUMeF6QPvp/4lyvCN9ZWBsqoXqbjUiw4+xY2xHYuqfc9f8j
	PuUZ9pFvPHH9CyTKurvYb9K+Tab5P/Ho+BHkBpemj9y/BaXgTtyZNyAGWh4h+x5MY6/K
	QsNhjoWA3Yg7fvFLgzV2Dbu8Znbejl/DX0RzpPU4d4FW1bvjGHvDj8CE5IT7J+9TcLCf
	cXAA==
X-Received: by 10.66.248.6 with SMTP id yi6mr15750142pac.20.1366338008923;
	Thu, 18 Apr 2013 19:20:08 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id dg5sm11606101pbc.29.2013.04.18.19.20.06
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 19:20:07 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Fri, 19 Apr 2013 12:18:05 +1000
Message-Id: <1366337885-9358-1-git-send-email-peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
X-Gm-Message-State: ALoCoQkVn+nv7/I91y/XsE44sY/m2UAG6wAsKHheJigMYVZOX+6oj8lYzAUSfu9W5ZBtm0Pot+HD
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c00::22b
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] m25p80: Remove bogus include of devices.h
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
X-List-Received-Date: Fri, 19 Apr 2013 02:20:13 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

I think in the early revisions of this we had an instantiation helper
for the device in devices.h. This was later removed and this header was
left over. Removed

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
 hw/block/m25p80.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index efcc7f4..b3ca19a 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -24,7 +24,6 @@
 #include "hw/hw.h"
 #include "sysemu/blockdev.h"
 #include "hw/ssi.h"
-#include "hw/devices.h"
 
 #ifndef M25P80_ERR_DEBUG
 #define M25P80_ERR_DEBUG 0
-- 
1.7.0.4


