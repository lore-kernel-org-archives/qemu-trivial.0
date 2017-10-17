Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVh-0006TY-RI
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVe-0006Qq-FV
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVb-0004HA-M6
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:26 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:45632)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVZ-0004Bz-RG; Mon, 16 Oct 2017 20:13:21 -0400
Received: by mail-qk0-x243.google.com with SMTP id f199so30874qke.2;
	Mon, 16 Oct 2017 17:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jUJhEuy+XIuC/oXCtoHkrHZlRd1DJtmdg7Wax4ceGvY=;
	b=ITGCh4D0Q+52+8wyEcpMqEEl6chj1/b9lrZXpQp9bp1BBI5CvFSxeIrsn1s66LGkpE
	BK96FTO4kUMU4uyXWORc7o0SwIT95xoztNLTYGDzUs7PkHxTXu/vdY5GQpXYwuaNYkW3
	HVEUGtXKGNCg0u4U2K2HhWtClm4Z3bgjO2kDM3VYqZ8zFqZ+6eu1wvrORv1JoCXDQci3
	/CfVFe5laBBRbOaDXCubPq5FkU04LdrB2evfjPcpJ7VVtvON44VLZWeoNjXPhZXdVTmx
	JPEv/Zr2A/mrcxBojjW4gdUNRg/5H/oQbLVOnzTxcbOVqhwNOjQk/MSOlQxQN8Ta4lGb
	AFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jUJhEuy+XIuC/oXCtoHkrHZlRd1DJtmdg7Wax4ceGvY=;
	b=rayDCh5QR56NIZ3QT/d65mpSto4XsNA9JGWwGiNt9e+D5gogZNkQ9GoPSU8qfQpR4G
	aRHATQ1Dl8Uc0S86/s8qDFx7MVbQFmNpaHyA+XzAm4uOOQeTHic5EB7wDYfRlHl9x4o2
	MLBEn6P3dbne8yA3nKSeWjIGyQkkFCoxOj2yaNE6UoWa90601FUTpuPDM8xd7WPpUima
	MvnmQkYsoVF6ujlRYZhkx7UTn0KlqWpwT+UcKFEyvu5+ukNFod8Odp42Q2nb+l7Jpbac
	1+K608aNuSPGtoz62rmKYKmIoO0SUFQgdSiA5pHcvfA46EeiXSJTGxuqZf6GkjZBi7Ae
	PLNQ==
X-Gm-Message-State: AMCzsaVOhmM/GOUGXdvufbkc4KKaIVvY0uJG2E0mPCefWXMVZeotSpEF
	eBs/EIx+lfnuHQ08bavobrM=
X-Google-Smtp-Source: ABhQp+SKNoWpTfVTl4Ntr5lo5mfHWwoBxAuQNI14CoWS2Nkc7jWVo1+eHmGH5JOZc9h104H3mz7rJQ==
X-Received: by 10.55.91.199 with SMTP id p190mr16625986qkb.291.1508199201418; 
	Mon, 16 Oct 2017 17:13:21 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:47 -0300
Message-Id: <20171017001209.32276-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v2 17/39] misc: avoid "include/" in include
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:27 -0000

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
2.15.0.rc0


