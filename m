Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZPb8C-0007pU-M2
	for mharc-qemu-trivial@gnu.org; Wed, 12 Aug 2015 14:52:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1ZPWtk-0007XE-Az
	for qemu-trivial@nongnu.org; Wed, 12 Aug 2015 10:20:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1ZPWtj-0001UT-1i
	for qemu-trivial@nongnu.org; Wed, 12 Aug 2015 10:20:56 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:43821)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>)
	id 1ZPWtb-0001T5-P4; Wed, 12 Aug 2015 10:20:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=roeck-us.net;
	s=default; h=Message-Id:Date:Subject:Cc:To:From;
	bh=3q/2HU3NZy3D0AhTkth14PJdn9f1vkT6TDN64twF1w0=; 
	b=5Ezsj/OPLaBxsPrcWz3sHVXVgQbtdQge74ZKlbst0Z4mRZr0mQizVX4tXruzz+u5FRTripBP+Du85VzwzMcZnyB0c+Z2oIaId78pfTOyeruINZkgt+T6mIOwPrVGXM/Pa7J4zX6TJWWEWnE0SWiF0m0gaRQghKY1tfA0tpVvHeg=;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:58223 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.85)
	(envelope-from <linux@roeck-us.net>)
	id 1ZPWtX-003Hm3-E0; Wed, 12 Aug 2015 14:20:43 +0000
From: Guenter Roeck <linux@roeck-us.net>
To: qemu-devel@nongnu.org
Date: Wed, 12 Aug 2015 07:20:36 -0700
Message-Id: <1439389236-22158-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.1.4
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
	guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 208.91.199.152
X-Mailman-Approved-At: Wed, 12 Aug 2015 14:52:06 -0400
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [Qemu-trivial] [PATCH] sh4: Fix initramfs initialization for
	endiannes-mismatched targets
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
X-List-Received-Date: Wed, 12 Aug 2015 14:20:57 -0000

If host and target endianness does not match, loding an initramfs does not work.
Fix by writing boot parameters with appropriate endianness conversion.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/sh4/r2d.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 5e22ed7..3b0b2ec 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -338,9 +338,9 @@ static void r2d_init(MachineState *machine)
         }
 
         /* initialization which should be done by firmware */
-        boot_params.loader_type = 1;
-        boot_params.initrd_start = INITRD_LOAD_OFFSET;
-        boot_params.initrd_size = initrd_size;
+        boot_params.loader_type = tswap32(1);
+        boot_params.initrd_start = tswap32(INITRD_LOAD_OFFSET);
+        boot_params.initrd_size = tswap32(initrd_size);
     }
 
     if (kernel_cmdline) {
-- 
2.1.4


