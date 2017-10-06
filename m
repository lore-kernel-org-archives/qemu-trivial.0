Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSq-0002ky-0X
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSn-0002ia-K1
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSm-00005a-RC
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:29 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:52776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSk-0008UH-8X; Fri, 06 Oct 2017 19:55:26 -0400
Received: by mail-qt0-x244.google.com with SMTP id o52so34330922qtc.9;
	Fri, 06 Oct 2017 16:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=era+XnocuyRf561qAOJ7vKj2ffEpWucxQRSEif3klIs=;
	b=H+IQ1+FLPi7lu3IV9dMpBpagN/UTM2fRIM5dVs0kHvZv2CgB8gMJT+pfLJSZxOCKeN
	2/VmaT1GghgnVBrJLGlNhzw9U944ishdYG1U4cwQCBupRJvA2qrUgIdt7j+3iOqUJ3VT
	fhFc46W9uTPAYcuxVNp+RHBWO6KYcPXJ7ZMay7F6o+S7FXRlXoGCE05moBGESt00m6B7
	1vX+Ppp9NZ6ALFF7Db9JobQB08+mDVaCVjoNrmxHGoXaunJcusXAYYtNzRRd4dQ8E0Cu
	W/xCM4exe7eIqq7bR3ed3kwTQpjta4ZNR7qBRg33Dho94hAVJIKq4ftf+Z6JCs+Ini2C
	YNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=era+XnocuyRf561qAOJ7vKj2ffEpWucxQRSEif3klIs=;
	b=ku6KtYKbPmmzuGWxPGUVhPrEuLfB6WeNZIqQEHmXaD2NxMBP/1Rhmw3JS9GYxg0jz+
	KNzQrXTb/4ebqHoRIdH7v2CQnnYEiP6nJRWqNqtgX7rGzNIc6C9U95k52TwuGhDIEjlA
	FynrJu8lnx9dZczWSPEGt1Fo1eMzvLemSUn223BgF+fGASfEMJMIQAe3nbamXfYeIjai
	sEyKOBW387i+45Yzr3nmwRG2VWeBlNcCkFN0M4sfF4duhjBqOj5wu3SDjDxEQWnKA0AA
	IqajpHlJM7IAge2V1qDh8mcTid7csXnyLmSa18UpcnQGvf6Z010dA3IDpPCotR7pg7UI
	ZZqw==
X-Gm-Message-State: AMCzsaV93nadLMsZ/Yx+NA/bUOuj/rOyZdnUJo6b0U085o8BQSntaJsf
	3eSoAcrFvYCsvp9JmeeYREAVd/Rpv4A=
X-Google-Smtp-Source: AOwi7QCXlpJ52klj9OMIdhPY7fIlLAfpBMPu17jWCCDaeAO/+Bz7nNWeRIwrn3tqWCgoFOJSd26lfw==
X-Received: by 10.200.22.231 with SMTP id y36mr5548078qtk.31.1507334125755;
	Fri, 06 Oct 2017 16:55:25 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.55.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:55:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:18 -0300
Message-Id: <20171006235023.11952-84-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 83/88] hw/pci: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:30 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci/pci.c          | 2 +-
 hw/pci/pcie_port.c    | 2 +-
 tests/libqos/pci-pc.c | 2 +-
 tests/libqos/pci.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 1e6fb88eba..32625d9fcc 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1644,7 +1644,7 @@ static PciMemoryRegionList *qmp_query_pci_regions(const PCIDevice *dev)
             continue;
         }
 
-        region = g_malloc0(sizeof(*region));
+        region = g_new0(PciMemoryRegionList, 1);
         region->value = g_malloc0(sizeof(*region->value));
 
         if (r->type & PCI_BASE_ADDRESS_SPACE_IO) {
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index 6432b9ac1f..236d8bc4db 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -72,7 +72,7 @@ void pcie_chassis_create(uint8_t chassis_number)
     if (c) {
         return;
     }
-    c = g_malloc0(sizeof(*c));
+    c = g_new0(struct PCIEChassis, 1);
     c->number = chassis_number;
     QLIST_INIT(&c->slots);
     QLIST_INSERT_HEAD(&chassis, c, next);
diff --git a/tests/libqos/pci-pc.c b/tests/libqos/pci-pc.c
index ded1c54c06..cde5e0a627 100644
--- a/tests/libqos/pci-pc.c
+++ b/tests/libqos/pci-pc.c
@@ -119,7 +119,7 @@ QPCIBus *qpci_init_pc(QGuestAllocator *alloc)
 {
     QPCIBusPC *ret;
 
-    ret = g_malloc(sizeof(*ret));
+    ret = g_new(QPCIBusPC, 1);
 
     ret->bus.pio_readb = qpci_pc_pio_readb;
     ret->bus.pio_readw = qpci_pc_pio_readw;
diff --git a/tests/libqos/pci.c b/tests/libqos/pci.c
index 0b73cb23d0..9dd689c7b5 100644
--- a/tests/libqos/pci.c
+++ b/tests/libqos/pci.c
@@ -54,7 +54,7 @@ QPCIDevice *qpci_device_find(QPCIBus *bus, int devfn)
 {
     QPCIDevice *dev;
 
-    dev = g_malloc0(sizeof(*dev));
+    dev = g_new0(QPCIDevice, 1);
     dev->bus = bus;
     dev->devfn = devfn;
 
-- 
2.14.2


