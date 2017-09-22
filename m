Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQPB-0006aN-CF
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:02:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQP6-0006Uu-AS
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:02:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQP5-0000Fl-5q
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:02:12 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33381)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQOu-00007X-OT; Fri, 22 Sep 2017 12:02:00 -0400
Received: by mail-qt0-x241.google.com with SMTP id b1so930417qtc.0;
	Fri, 22 Sep 2017 09:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qLPbhOJJ8a0CzqpY0SvbrdoIYBNHNCL1sxvkHrjczRs=;
	b=gIDZGpB7hD2+kPE/axTaXBV7F5QP6HkzvIsuJdh6wGPQ7Dz88Y+t9ScCgD+s29+VDV
	xW2yiqVjgLR/pTjyMJHtxcr7aoHTNHDWBYDz6ACaXMEg13/ehOBGZfRZptSw80rF2NUF
	KAB7HodRE6vdI0EkWbgcBRhBgRERs6OJ7Fcjpztg1itQbyV6WTCeQ1qgrbK2qYB6rDBb
	w2PjyZmyeOY1sVwa2VnRmPbRfECy/y/2FGXe/b3uY9RyFgQVOPTpPfIMlWJlacka9avU
	1Mgcjp7w7eS3Au9hfp5VQXPu5r7pt7F1ZBHqNSs5A46ybviMsdM1o+9aoA16/vdwMlh5
	9Nig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=qLPbhOJJ8a0CzqpY0SvbrdoIYBNHNCL1sxvkHrjczRs=;
	b=QqhewbbCQ9FBlLmjO9QeiaXEwnzshRWB9iM4dSTrR5LrR8HfEdGLWF/UlOuHEdC41k
	4ae9S1jvCjR7JROPL2Z8IRhd6Bjs5A0Q9TxcHcgg9kMOSvLczFUXqIXPMy1WYmaPRElQ
	NSPfb5B1hP81f/dLo4fuRIfiK0GXFkciMM8qMsr+uO3RgNa5FD+4gJN67OKXTpatLGO0
	S/ReycQOm+2/su4eZX0v0+qxtuuth1ganb2X102A82cf69JS0izQf8Cn95Xypgo0gKF1
	ZtDDe/48QyHWUzIIGr1aB8LrrpB2mUo40BtgQy1NnDVv65GUyrXXSUoX6kFUJpEoWbZP
	tOaQ==
X-Gm-Message-State: AHPjjUh0+iNMI3MCQ+erlLoQp8bRLnhBcyKI+9kGebwKPB+0grpWIHpX
	5hDO41nU1mGg77+O33vbNSsMfmOoD74=
X-Google-Smtp-Source: AOwi7QC6/ogfPz2kUSxV/Yrd3DE6QwDk+AOwsTpjGy9alvGOfWzfeBzrhMyZG2wvOm89u+VvCO/OUg==
X-Received: by 10.200.54.3 with SMTP id m3mr9371026qtb.197.1506096120204;
	Fri, 22 Sep 2017 09:02:00 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id y31sm108325qta.83.2017.09.22.09.01.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 09:01:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 13:01:06 -0300
Message-Id: <20170922160111.31885-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 29/34] hw/net/e1000e: use TYPE_PCI_E1000E
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
X-List-Received-Date: Fri, 22 Sep 2017 16:02:15 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/net/pci.h | 1 +
 hw/net/e1000e.c      | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/hw/net/pci.h b/include/hw/net/pci.h
index b24b5257a5..92111f86f3 100644
--- a/include/hw/net/pci.h
+++ b/include/hw/net/pci.h
@@ -14,6 +14,7 @@
 #include "hw/pci/pci_bus.h"
 
 #define TYPE_PCI_E1000      "e1000"
+#define TYPE_PCI_E1000E     "e1000e"
 
 PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
                                const char *default_model,
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 6c42b4478c..494f8cced6 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -40,6 +40,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
+#include "hw/net/pci.h"
 
 #include "hw/net/e1000_regs.h"
 
@@ -49,8 +50,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 
-#define TYPE_E1000E "e1000e"
-#define E1000E(obj) OBJECT_CHECK(E1000EState, (obj), TYPE_E1000E)
+#define E1000E(obj) OBJECT_CHECK(E1000EState, (obj), TYPE_PCI_E1000E)
 
 typedef struct E1000EState {
     PCIDevice parent_obj;
@@ -703,7 +703,7 @@ static void e1000e_instance_init(Object *obj)
 }
 
 static const TypeInfo e1000e_info = {
-    .name = TYPE_E1000E,
+    .name =   TYPE_PCI_E1000E,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(E1000EState),
     .class_init = e1000e_class_init,
-- 
2.14.1


