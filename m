Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgit-0002XE-IX
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:31:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgin-0002TG-Fa
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgim-0004wz-LU
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:37 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36914)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgik-0004tu-JM; Thu, 14 Dec 2017 22:31:34 -0500
Received: by mail-qk0-x241.google.com with SMTP id i130so8868456qke.4;
	Thu, 14 Dec 2017 19:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AE0xPxY8Laa3NxlROs5TwGpZnOQdsaN6k646u+533tA=;
	b=IGgM97dK5Lgdnt6JWJQbBvNqTnIM+yqfjVerLoqKK+MiV8So2U8xgAASCCJJB/kslW
	oUjvoiF/dZNkVhz+/jo/Ep4Bpgd8e7JaBKbxKn7TEDKTtpOE03dNtntJhpHfiykrNW6b
	eFMTtal4WX9ZeUGQnyzVhbMkjljLAizxuvRz85IxPotcwhZpxkBxcxemKKdZveyWDZKV
	/SH+rNrwtifulSDwr2eh32RikXBVvcwXTMd5jJODMxvDp2t+Zh34Zf9upE/8MDaBBXZH
	c3yZoYIFKWPtyDrxmniVscxte938SWjqvECjEY509REbfweVHvJBWeC5OWoqGT1uuG20
	rL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=AE0xPxY8Laa3NxlROs5TwGpZnOQdsaN6k646u+533tA=;
	b=Z/kK38i8H1WH8n1MGIrAZhTN7Nca1NqPEvtJjs1ydEawlsWPsEZn7LNv5XlPljhPQU
	JTuAoL+nkW47ignmtubFlSF5ubdYe8dn8tydD2rtu5vRkuzTQn7jh03mMtx7nqpq1z7y
	V5M7AhoMj2Z/WJPedI+tWjfyqXTdagRWPkMg80RaX84U8VE60nwRQp+OPM5ISBxhWszp
	jL6o/ej3+xBVy8L/+6QG5lW/U//ZmYB/JdufS11jrzl5q900o8yQDNmg7srt4O4pCKYu
	7MwSYFFIT+9sl9ksp2RSIFs0L0EHtUdWNZJeU8TYUAhtXkCOJKKcGsYWZ080WbrkMezO
	+POQ==
X-Gm-Message-State: AKGB3mIKvtYMBXQI/Ka/HKbrhMJsi1KBUYAEYpXacHv4P4jgzPh+Tjz9
	IZ0IsPfkhVogv7mqG7nv8i8=
X-Google-Smtp-Source: ACJfBosG7xOEREVR/mXeM0pA8vnJhzpk7P61rUhHNZOShaXYS49cPoHL5Px0X9dvUcioNtslnpHyUQ==
X-Received: by 10.55.152.129 with SMTP id a123mr18989677qke.142.1513308694128; 
	Thu, 14 Dec 2017 19:31:34 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.31.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:31:33 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 15 Dec 2017 00:29:50 -0300
Message-Id: <20171215033015.738-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v4 18/43] misc: avoid "include/" in include
 path
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
X-List-Received-Date: Fri, 15 Dec 2017 03:31:40 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/adb.c      | 2 +-
 hw/ssi/aspeed_smc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index fcca3a8eb9..924a3f9fd5 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -24,8 +24,8 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "hw/input/adb.h"
+#include "hw/input/adb-keys.h"
 #include "ui/console.h"
-#include "include/hw/input/adb-keys.h"
 #include "ui/input.h"
 #include "sysemu/sysemu.h"
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index cb515730c5..992617fd3a 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -26,7 +26,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
-#include "include/qemu/error-report.h"
+#include "qemu/error-report.h"
 #include "exec/address-spaces.h"
 
 #include "hw/ssi/aspeed_smc.h"
-- 
2.15.1


