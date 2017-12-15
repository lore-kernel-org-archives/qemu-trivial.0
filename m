Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgkX-00047o-TA
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:33:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgkS-00042b-GW
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:33:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgkO-0007K8-HL
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:33:20 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36921)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgkE-00077F-PW; Thu, 14 Dec 2017 22:33:06 -0500
Received: by mail-qk0-x241.google.com with SMTP id i130so8871245qke.4;
	Thu, 14 Dec 2017 19:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qQySGZRWitYLjldBg/lCrO9TdSWZkl5tDmjIwefvZoc=;
	b=jVGxIGDwpaxvALpip8mvf5rAR9Oc3fP4DG1HkFvhtU/XVv0Wb0NI8/1SdFVAvajXBM
	B3gKtCZg2goqugEW6PfOIft4LZ/Gd0iKawT/7lcqU07ewPJeb10v0K/d6c5qHUrw4eSU
	sIFCJhHWqfwLCz8JDd3G3/5RVmDi1jdlcdH8kQAzzVjPAsl0sXqU88tqgtnqncCj5gBO
	Cqwb0HmHsisvyCKeXnVobFrwwJWRpdu/7yMRti/hkI3L8KOKXQFnCt6LmCPFuLLyICeT
	h8GciUvI7gAogv26PiGnz6yUjr4zDf6hbdbFz3LwGEA+nW79pfMtIR4VrCLaCT2eiDZ6
	So+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qQySGZRWitYLjldBg/lCrO9TdSWZkl5tDmjIwefvZoc=;
	b=dWrNcb1rqhVMKcQ3F+AGoEcZ7SfkAON0vrG30737VoL5JLPkjOIh8yXck9Yc5EYnjq
	NKtj59VmXbnbHmLfc+OEMMXYM/zuDqmZ2Qia/G18/OgFPG5VK1e4il+WVIg0Jq+ODAn5
	PETmJT41HYhKqqVXGjHGS34wEMygYMLmlDAHMmxfveZjK1+W/Sb8hwu59T5Nj8Zsn4D4
	l4OEuViMuERIs3G9ibZhd12KTCbcuj8xDW/uEVlL5rZt2ynLVR0qNophWw4o5niNHA8Q
	OagAtB5mxIyGbXDlMCExUic3DbMADGsebFAfbyJNU4jaQAEQwpY9b5BrYpzpb6bLJy+T
	c/WQ==
X-Gm-Message-State: AKGB3mI7DcIXMN/qizWxVQbNuTvyolaKTr8x2lcPcQDRJCqZTLlz1mcY
	ptk4uVUVbuT0VhDUf/HEy448GyXHacg=
X-Google-Smtp-Source: ACJfBoteDZsH5sKuu648MwS9BvtEHPBsJawnble6or9VNZQiXR91zH/HRxek4gUcEp23N+qA8iNxGw==
X-Received: by 10.55.122.135 with SMTP id v129mr19771837qkc.104.1513308786361; 
	Thu, 14 Dec 2017 19:33:06 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.33.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:33:05 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Michael Walle <michael@walle.cc>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Date: Fri, 15 Dec 2017 00:30:15 -0300
Message-Id: <20171215033015.738-44-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v4 43/43] misc: drop old i386 dependency
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
X-List-Received-Date: Fri, 15 Dec 2017 03:33:25 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/char/debugcon.c      | 1 -
 hw/intc/lm32_pic.c      | 1 -
 hw/moxie/moxiesim.c     | 1 -
 hw/sparc/sun4m.c        | 1 -
 hw/watchdog/wdt_ib700.c | 1 -
 5 files changed, 5 deletions(-)

diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index 95ccec6f8b..e2abc61b04 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -29,7 +29,6 @@
 #include "hw/hw.h"
 #include "chardev/char-fe.h"
 #include "hw/isa/isa.h"
-#include "hw/i386/pc.h"
 
 #define TYPE_ISA_DEBUGCON_DEVICE "isa-debugcon"
 #define ISA_DEBUGCON_DEVICE(obj) \
diff --git a/hw/intc/lm32_pic.c b/hw/intc/lm32_pic.c
index 09e15115fb..db6c7afc2f 100644
--- a/hw/intc/lm32_pic.c
+++ b/hw/intc/lm32_pic.c
@@ -20,7 +20,6 @@
 #include "qemu/osdep.h"
 
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "monitor/monitor.h"
 #include "hw/sysbus.h"
 #include "trace.h"
diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index 3ba58481d0..3c3ba9d8c5 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -30,7 +30,6 @@
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/isa.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 24c2b8a555..e71648404c 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -36,7 +36,6 @@
 #include "net/net.h"
 #include "hw/boards.h"
 #include "hw/scsi/esp.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/isa.h"
 #include "hw/nvram/sun_nvram.h"
 #include "hw/nvram/chrp_nvram.h"
diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
index 532afe89e7..d045032bf4 100644
--- a/hw/watchdog/wdt_ib700.c
+++ b/hw/watchdog/wdt_ib700.c
@@ -25,7 +25,6 @@
 #include "sysemu/watchdog.h"
 #include "hw/hw.h"
 #include "hw/isa/isa.h"
-#include "hw/i386/pc.h"
 
 /*#define IB700_DEBUG 1*/
 
-- 
2.15.1


