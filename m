Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQqb-0001Yo-2Z
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:43:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqZ-0001X4-FE
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqY-0007nH-GV
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:55 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:40054)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQqW-0007lv-F5; Mon, 25 Jun 2018 08:43:52 -0400
Received: by mail-qt0-x232.google.com with SMTP id x23-v6so1558762qto.7;
	Mon, 25 Jun 2018 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZuMsEJNqvKSyCBPPY14CcKQaksQw5RRFbWT+Gic0K8g=;
	b=bRF858RmjQSogIzEoRn9AHTptOTP1YHcn1UTbmAJ3xVpfmKhKYsESnFMQlAUpZV31R
	yv+9s2g6Jk7kysIw6L7jyePoeiji3Tz/u4TC1vbdklQR8FcAKE2OTunB99tZpSe/uapv
	BheZ2NIzmzrmptWCgd86zTOJZT03e6VuPgO/6kRCzfiTJ0YLHDBvf+plZgGuewE0qFjb
	dKXYRzlOLa8XMn0LzIbENeZckc79r0RFtEKeJe+maz4uzsAFcyGivOgKBIiUG2e1kXjn
	JXbmddWu4y24mPWn+vODlXqW5XZu0oC9ToeUa94q5VySjs9ylWtzZsSBHZqtVXEniJSw
	bsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ZuMsEJNqvKSyCBPPY14CcKQaksQw5RRFbWT+Gic0K8g=;
	b=cDOJVMUqg/Jq2bLJsEorajIavZbkdrr+bgEC3QbInzZxRIm0dFuTsNFLcT5qbCxQIy
	p3cEuRN7olCsvexIcdFe2oEx7PzCsHF8TKnulWqfYHjNvkGCY2AfGukiOoKh1IvyW3+u
	Bj1SfcuAjmi9BiSmVDIwgzcbPmrSt2So3KAXTQ5Hco9GqZhbVK90pdw/F8IKIDRTJsc3
	NjU5i+Qpd7np3LJQin3DDenpMdQ0nCj0Kyc/ENOocgYqRR6EmRhyzi7AiuIq6KbYXwxZ
	FuY3K7e5r+ph5cZb3kV01ZEkWakQd6rHxEmna08AXydoYq+98otbAXk/HZtk3x1tUA6j
	eWKA==
X-Gm-Message-State: APt69E2/ynKjBeF4Es7bGExA83vS7PjO5bqa1cFpf+9zijxKWgpAFTDk
	bkaw0FCOGBb9y5L3oizM6a4=
X-Google-Smtp-Source: ADUXVKKe2mwLeQ9SaArPEJhQGQS34/l/83o7AwjHiurMdC9UsU5+XR1N0wT2wp7W61ERVrob1Ex49g==
X-Received: by 2002:aed:39a1:: with SMTP id
	m30-v6mr10096450qte.328.1529930631918; 
	Mon, 25 Jun 2018 05:43:51 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Jiri Slaby <jslaby@suse.cz>
Date: Mon, 25 Jun 2018 09:42:07 -0300
Message-Id: <20180625124238.25339-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
Subject: [Qemu-trivial] [PATCH v5 15/46] hw/misc: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:43:56 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 3 ++-
 hw/misc/edu.c    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index b4cacd664b..b8a8721201 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -27,6 +27,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/log.h"
 #include "hw/misc/auxbus.h"
 #include "hw/i2c/i2c.h"
@@ -68,7 +69,7 @@ AUXBus *aux_init_bus(DeviceState *parent, const char *name)
 
     /* Memory related. */
     bus->aux_io = g_malloc(sizeof(*bus->aux_io));
-    memory_region_init(bus->aux_io, OBJECT(bus), "aux-io", (1 << 20));
+    memory_region_init(bus->aux_io, OBJECT(bus), "aux-io", 1 * MiB);
     address_space_init(&bus->aux_addr_space, bus->aux_io, "aux-io");
     return bus;
 }
diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index 34eb05d213..df26a4d046 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
 #include "qemu/timer.h"
@@ -357,7 +358,7 @@ static void pci_edu_realize(PCIDevice *pdev, Error **errp)
                        edu, QEMU_THREAD_JOINABLE);
 
     memory_region_init_io(&edu->mmio, OBJECT(edu), &edu_mmio_ops, edu,
-                    "edu-mmio", 1 << 20);
+                    "edu-mmio", 1 * MiB);
     pci_register_bar(pdev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &edu->mmio);
 }
 
-- 
2.18.0


