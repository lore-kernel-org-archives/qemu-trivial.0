Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqj-0001js-9A
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqg-0001gu-OT
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqf-0007qt-LX
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:02 -0400
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:36332)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqc-0007oi-3b; Mon, 25 Jun 2018 08:43:58 -0400
Received: by mail-qt0-x230.google.com with SMTP id o9-v6so11745937qtp.3;
	Mon, 25 Jun 2018 05:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=w/eNHN7MVFKtZqhxJDVTIFbHzlGa0yQerWoCZrXvEQM=;
	b=sekyyqspgYSfb+sUm0AfP3QPQgrTX8WKWBnkikxDkqOyHQmXaKqGVrFu97+22WJEhY
	TkfpIAYHSa9kTWawoaQ+REhNK6QZbZNcdnAVCcMhwQ0I5z4gRCnvIVhNT1RE+sa4sNlQ
	ZwpAj/3//SKClX+6Q6liNfO8TZyhDjITDbmec0Q2IJfnEUvfxSavOVYRolySL/4f6THG
	CIDR5aPArgdVvg9sU0vDkN1A7TCrzfXkwPDnpzSL4CmKmGshxVoZEDJGzW0i0HeNyNeV
	KWJlfThGIS2aWxsWnUpGkR+YPLvgY2Ba8B84TOs87aWnm8w/66pPbHUpMNt57X2PO37l
	XOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=w/eNHN7MVFKtZqhxJDVTIFbHzlGa0yQerWoCZrXvEQM=;
	b=P8Q0v3Hy+MzJLEWyGEFGWg0PsiG2E8e0bmXKK4kQV4+13hMK7uYnarxsNj/rh+D7Av
	7hQv9m4u0dRxIsFeiQsQiyQ5MhhfsjcOrgeQwgqbVBKRl64jOaw6p4XJ2n1aYR4gSQZH
	Do4BVBSj0GRn2P4+e7/5tjbJ/yfxeK7GaHWOBDF4meZyCWbNTvt9MHy3i4nUt4poCXNr
	/vmoRKFCrwmm6POGNSBWjCQ934m1QtNbkA0t2WDghXD2EGvArSB4ZCTeV3sUGJCOY7O2
	zHau0NAzFmT7DesYWnM4EpyM5QS7OWhX1TUoL/VjfTMJajZpOptgkBecZL1FtSyN4hKT
	hrhA==
X-Gm-Message-State: APt69E0I8C2Q4OI/7HLP6ovjxW74rgSOuRKn2I35eG4QoMzM2SpnOX4r
	7EMSqVhsPgnqi6Tl/9loQgU=
X-Google-Smtp-Source: ADUXVKJy0uHooAIQWbwa07jlWbPnQggiu8fyRaUTQY7aS9geSAIERxKVN679/HDb2/n8wozEWW8bHw==
X-Received: by 2002:ac8:2e83:: with SMTP id
	h3-v6mr10553238qta.365.1529930637537; 
	Mon, 25 Jun 2018 05:43:57 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Thomas Huth <huth@tuxfamily.org>
Date: Mon, 25 Jun 2018 09:42:09 -0300
Message-Id: <20180625124238.25339-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: [Qemu-trivial] [PATCH v5 17/46] hw/m68k: Use the IEC binary prefix
 definitions
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:03 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@tuxfamily.org>
---
 hw/m68k/mcf5208.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index ae3dcc98c3..0f2245dd81 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -6,6 +6,7 @@
  * This code is licensed under the GPL
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
@@ -241,7 +242,7 @@ static void mcf5208evb_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0x40000000, ram);
 
     /* Internal SRAM.  */
-    memory_region_init_ram(sram, NULL, "mcf5208.sram", 16384, &error_fatal);
+    memory_region_init_ram(sram, NULL, "mcf5208.sram", 16 * KiB, &error_fatal);
     memory_region_add_subregion(address_space_mem, 0x80000000, sram);
 
     /* Internal peripherals.  */
-- 
2.18.0


