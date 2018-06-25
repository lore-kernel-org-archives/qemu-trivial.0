Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqH-0001Gq-Df
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:43:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqA-0001Bt-LL
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQq9-0007aN-8W
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:30 -0400
Received: from mail-qk0-x236.google.com ([2607:f8b0:400d:c09::236]:34001)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQq4-0007YG-Oj; Mon, 25 Jun 2018 08:43:24 -0400
Received: by mail-qk0-x236.google.com with SMTP id b66-v6so1876830qkj.1;
	Mon, 25 Jun 2018 05:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QnrE27O2IfbCIWuv5SqVyNFfiWt6gyI8Civ7/zlOuMs=;
	b=XJ4353M4c8z8aDtwkiy0blWqPtxri8Px7rn9J6gvdBBNw0nGNI2y0hb6Gi2MD7Tb82
	XhwmzSQbV1LQDpcTzo53EqFLpRsky6Z3JH7h5yWoo+ExmDzE1sTjaBNiyu+6VskSl700
	Pf5dGPm9StarDEJq279dqFsDRhYq6NsvQjdsUmtdGvGrK3MEV6C17QkgZEGBU8vvQU5t
	nhgnI1q868/Xmrn+EAmxvlu6ItSRGD2x0xKGUwUvvbNJ9CH7SWJgxQ0LtlSpqcG0AMUa
	oZcxOg5tAv0fzbGB+XlSpjcPvVQy2cHsh3uzCuNrHnSUMCu4M1kHV8ZWAExOtoQMiviX
	0+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QnrE27O2IfbCIWuv5SqVyNFfiWt6gyI8Civ7/zlOuMs=;
	b=p75ir9YGnEfiw8LSpkY9ejCMhUJKPRikRdRBUUzmeQTWCvAWDqZOl7ecOJ39ozi0pL
	uXt9nepoEby3gABnhE9hTZNOUQC7mUg4+xU/UD5gxtVMdawIWIZYp7OaPYb/r4Tne1Wm
	KE72wCcw0vthIYAiHD3jwyQWeVgAtFRHhhUr7PcEC4744qgq+OFLdQZGgF8UTNAzluQD
	6g3zFkTQOk28myGIaDwnECV4HutZ6gNFJl/mziQJ0Mmk9gmz8GmYFxMlUM/zvMlLqt2C
	2HZmMyd3FRIn/O+/DV2A+yDGs2PMKw+80YSIKLBdWnPviNgvOwkm4gP9yG+JyfpgnbVC
	X1WQ==
X-Gm-Message-State: APt69E3/hH7yR5uipXKK0ZuwdArFWHMH3wN29ayW4UZKKwIsx47nj4xA
	TnaMyhs6jRIlPQUPv9zgZ6s=
X-Google-Smtp-Source: ADUXVKJtLHSPvyBjZe+vc2uvQOnGjrh6PPeBA/8oAAaq1Pqgr6R/gmvTpa8f4ast2tU9uvf0OGk35A==
X-Received: by 2002:a37:1614:: with SMTP id
	g20-v6mr9970810qkh.64.1529930604213; 
	Mon, 25 Jun 2018 05:43:24 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paul Burton <paul.burton@mips.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@mips.com>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	qemu-arm@nongnu.org (open list:ARM),
	qemu-ppc@nongnu.org (open list:PowerPC)
Date: Mon, 25 Jun 2018 09:41:58 -0300
Message-Id: <20180625124238.25339-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::236
Subject: [Qemu-trivial] [PATCH v5 06/46] hw: Directly use "qemu/units.h"
 instead of "qemu/cutils.h"
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
X-List-Received-Date: Mon, 25 Jun 2018 12:43:33 -0000

These files don't use anything exposed by "qemu/cutils.h",
simplify preprocessing including directly "qemu/units.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au> (ppc parts)
---
 hw/arm/msf2-soc.c  | 2 +-
 hw/arm/msf2-som.c  | 2 +-
 hw/core/machine.c  | 2 +-
 hw/display/sm501.c | 2 +-
 hw/mips/boston.c   | 2 +-
 hw/ppc/pnv.c       | 2 +-
 hw/ppc/ppc440_uc.c | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 530e461c42..edb3ba824f 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -23,13 +23,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "hw/arm/arm.h"
 #include "exec/address-spaces.h"
 #include "hw/char/serial.h"
 #include "hw/boards.h"
-#include "qemu/cutils.h"
 #include "hw/arm/msf2-soc.h"
 #include "hw/misc/unimp.h"
 
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index ed533bbde1..2432b5e935 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -23,12 +23,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
 #include "exec/address-spaces.h"
-#include "qemu/cutils.h"
 #include "hw/arm/msf2-soc.h"
 #include "cpu.h"
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index ccf3a4b9c7..2077328bcc 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/boards.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-common.h"
@@ -19,7 +20,6 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/numa.h"
 #include "qemu/error-report.h"
-#include "qemu/cutils.h"
 #include "sysemu/qtest.h"
 
 static char *machine_get_accel(Object *obj, Error **errp)
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 3bd871630e..9dec0d3218 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -24,7 +24,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/cutils.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 512c60c03e..b7bfeccf4c 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-common.h"
 
 #include "exec/address-spaces.h"
@@ -32,7 +33,6 @@
 #include "hw/mips/cpudevs.h"
 #include "hw/pci-host/xilinx-pcie.h"
 #include "qapi/error.h"
-#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "chardev/char.h"
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 5fdac62311..346f5e7aed 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/numa.h"
@@ -31,7 +32,6 @@
 #include "hw/ppc/pnv_core.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
-#include "qemu/cutils.h"
 #include "qapi/visitor.h"
 #include "monitor/monitor.h"
 #include "hw/intc/intc.h"
diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index b5b31b4b9b..1ab2235f20 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -9,8 +9,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-common.h"
-#include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "cpu.h"
-- 
2.18.0


