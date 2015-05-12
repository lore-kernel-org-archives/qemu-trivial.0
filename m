Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ys14y-0007Ls-P7
	for mharc-qemu-trivial@gnu.org; Mon, 11 May 2015 23:42:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YrztH-0000I5-G4
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YrztE-0007qv-BY
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:51 -0400
Received: from mail-pa0-f42.google.com ([209.85.220.42]:36495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YrztE-0007qp-6u
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:48 -0400
Received: by pabsx10 with SMTP id sx10so126766022pab.3
	for <qemu-trivial@nongnu.org>; Mon, 11 May 2015 19:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=l1pR9Y3TyXpUGDV3VLFI2gIPOpAIV1BkRKiW9Tqprkk=;
	b=Rlu5ifkxcviWCjZsKwIEflOuQGIjJ2xUlLFqtPZVDbJok+qsRa+I9hY73BhTY/s0OA
	25SMn3OAaCcv73f5WbyF5rErY4O5ErbMUjuEPO+u0D/RK8S8k/xZSgctQFauHqqD/SwB
	hAYzGcSCBrlS70CGASyW3of7dap9uahcox0sNKiKHmf/aroE16eMT9zFPtq2XtpJu2Nf
	/RPQCeQzhmB3VgCyMYVKDQTd4M1yycNBLBhYtdRsMtbwz5VScT6msq1JLHr2y3UYEKTH
	SGF8emPHUNW3ehY90+v11rj427qfCUN0ZMaXAwimFwuucBK6vxsMUNgt5gNzt4+rnSba
	t3tw==
X-Gm-Message-State: ALoCoQmj4sXcTlgg7BC+SBrdcCjFFnyvCdHZORjLZ3gRy5Zw68E5antXT/iPWBBnNdatJAqp6K9Z
X-Received: by 10.66.242.138 with SMTP id wq10mr24215868pac.143.1431397547751; 
	Mon, 11 May 2015 19:25:47 -0700 (PDT)
Received: from localhost ([180.150.141.243]) by mx.google.com with ESMTPSA id
	vi5sm14360187pbc.89.2015.05.11.19.25.45
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 May 2015 19:25:46 -0700 (PDT)
From: shannon.zhao@linaro.org
To: qemu-devel@nongnu.org
Date: Tue, 12 May 2015 10:25:18 +0800
Message-Id: <1431397521-2316-4-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.42
X-Mailman-Approved-At: Mon, 11 May 2015 23:41:57 -0400
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	zhaoshenglong@huawei.com, christoffer.dall@linaro.org
Subject: [Qemu-trivial] [PATCH 3/6] hw/virtio/virtio-pci: Remove meaningless
	blank Property
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
X-List-Received-Date: Tue, 12 May 2015 02:25:52 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/virtio/virtio-pci.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 5c173c4..47be00f 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1410,10 +1410,6 @@ static const TypeInfo virtio_net_pci_info = {
 
 /* virtio-rng-pci */
 
-static Property virtio_rng_pci_properties[] = {
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void virtio_rng_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VirtIORngPCI *vrng = VIRTIO_RNG_PCI(vpci_dev);
@@ -1440,7 +1436,6 @@ static void virtio_rng_pci_class_init(ObjectClass *klass, void *data)
 
     k->realize = virtio_rng_pci_realize;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-    dc->props = virtio_rng_pci_properties;
 
     pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
     pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_RNG;
-- 
2.1.0


