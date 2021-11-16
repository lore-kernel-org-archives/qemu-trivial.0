Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mn2Eb-0002Pt-P1
	for mharc-qemu-trivial@gnu.org; Tue, 16 Nov 2021 12:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn2EZ-0002Oy-Tb
 for qemu-trivial@nongnu.org; Tue, 16 Nov 2021 12:27:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn2EX-0004kp-NT
 for qemu-trivial@nongnu.org; Tue, 16 Nov 2021 12:27:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637083621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HqZnPDrp1xIa4GdFRINL3GzOA88hthFW+13YOjEUpHI=;
 b=YwYz6D+v34XyfB9cIMCiEIHc0127vObR1P2YTvC+bTRAA/yPl7LZayXiSFaZ+Qm923rCNA
 29qKsNBlV93Qcds4L3TbQK20kjN0dd78NUcXBbuw3hfT4hrez0V30CCnr6eVLB6SvVuWRr
 CieUohdA8d+1ebvJplKMEefGMaZEkps=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-Dgus9BXpO5epz8nDsDjUWA-1; Tue, 16 Nov 2021 12:26:59 -0500
X-MC-Unique: Dgus9BXpO5epz8nDsDjUWA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so1765864wmq.9
 for <qemu-trivial@nongnu.org>; Tue, 16 Nov 2021 09:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HqZnPDrp1xIa4GdFRINL3GzOA88hthFW+13YOjEUpHI=;
 b=XMtqdSiqGgoQywWxXNg5YzJsiMFXdGSgtL1pXe0rxTP5H43kI/NCzkUGURXobmWSd0
 NRp0wHNzoE2ibqjo6sRUSMeAz5GAOyqM0AVOStLwXyPcLp2p1Mbfa28k5p6KlOH8gt70
 pt0S7KHbmwvr4qc/c+eZWeJGsmLXE8k0/guR4GQhqt5BZR50gkN5pHIMBocv4xAPVpHm
 Qcd2OjqXB4kr6kDVkwo6LMUgN8K/OY1jnOe6Z+akX0PSp6oSr040trgnf92OQLwMI6bZ
 5xucpLMXgwDHPixKXMm9FbL8loOZko00X6wCCAiynK+SF0ugvfqNEuIUSvReaBde0Fh8
 o+Qw==
X-Gm-Message-State: AOAM531ObXmrmlUEvIoFI9QFHTsRoWulb2h+ylkuEM3D0aHFtfnyHiiF
 +HiFuyXZM8LCJNuDHfvQtn774T1aHujFnyeacLR68qCLjpGVeFZFPDXKpF8vDU/I9+nX9Lxt/sG
 bBYLG5tmmpv5dYJusyg==
X-Received: by 2002:a05:600c:19cc:: with SMTP id
 u12mr72022556wmq.24.1637083618204; 
 Tue, 16 Nov 2021 09:26:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYED4VJKHOibXGZzcDumNop9s29r0K02kI47PZkUP6G5maLM7aaQdmBnRH/h/Oevtg7q/cqw==
X-Received: by 2002:a05:600c:19cc:: with SMTP id
 u12mr72022518wmq.24.1637083617959; 
 Tue, 16 Nov 2021 09:26:57 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 q8sm17707960wrx.71.2021.11.16.09.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 09:26:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jagannathan Raman <jag.raman@oracle.com>, Jason Wang <jasowang@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-trivial@nongnu.org,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-7.0] hw/pci: Don't open-code pci_intx()
Date: Tue, 16 Nov 2021 18:26:55 +0100
Message-Id: <20211116172655.2752742-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Nov 2021 17:27:04 -0000

Use the pci_intx() helper instead of open-coding it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Based-on: <20211116170133.724751-3-fbarrat@linux.ibm.com>
---
 hw/net/vmxnet3.c  | 2 +-
 hw/remote/iohub.c | 6 ++----
 hw/remote/proxy.c | 3 +--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 41f796a247d..c7fc5f44d8f 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1350,7 +1350,7 @@ static void vmxnet3_update_features(VMXNET3State *s)
 static bool vmxnet3_verify_intx(VMXNET3State *s, int intx)
 {
     return s->msix_used || msi_enabled(PCI_DEVICE(s))
-        || intx == pci_get_byte(s->parent_obj.config + PCI_INTERRUPT_PIN) - 1;
+                        || intx == pci_intx(PCI_DEVICE(s));
 }
 
 static void vmxnet3_validate_interrupt_idx(bool is_msix, int idx)
diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
index 547d597f0fe..0e0bb651d1a 100644
--- a/hw/remote/iohub.c
+++ b/hw/remote/iohub.c
@@ -93,11 +93,9 @@ void process_set_irqfd_msg(PCIDevice *pci_dev, MPQemuMsg *msg)
 {
     RemoteMachineState *machine = REMOTE_MACHINE(current_machine);
     RemoteIOHubState *iohub = &machine->iohub;
-    int pirq, intx;
+    int pirq;
 
-    intx = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
-
-    pirq = remote_iohub_map_irq(pci_dev, intx);
+    pirq = remote_iohub_map_irq(pci_dev, pci_intx(pci_dev));
 
     if (event_notifier_get_fd(&iohub->irqfds[pirq]) != -1) {
         qemu_set_fd_handler(event_notifier_get_fd(&iohub->resamplefds[pirq]),
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index bad164299dd..22f32a5930b 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -32,14 +32,13 @@ static void proxy_intx_update(PCIDevice *pci_dev)
 {
     PCIProxyDev *dev = PCI_PROXY_DEV(pci_dev);
     PCIINTxRoute route;
-    int pin = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
 
     if (dev->virq != -1) {
         kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &dev->intr, dev->virq);
         dev->virq = -1;
     }
 
-    route = pci_device_route_intx_to_irq(pci_dev, pin);
+    route = pci_device_route_intx_to_irq(pci_dev, pci_intx(pci_dev));
 
     dev->virq = route.irq;
 
-- 
2.31.1


