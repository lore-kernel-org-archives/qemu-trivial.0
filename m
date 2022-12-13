Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p51x8-0000OV-VN
	for mharc-qemu-trivial@gnu.org; Tue, 13 Dec 2022 04:51:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p51x7-0000MI-Fj
 for qemu-trivial@nongnu.org; Tue, 13 Dec 2022 04:51:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p51x5-0006no-TH
 for qemu-trivial@nongnu.org; Tue, 13 Dec 2022 04:51:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670925114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ykKANd+RfEAb3zqWXeUrx7rCejyhkZ+OZenadFCu+BI=;
 b=NnJFxQ1pDQeOwit5HtU2q2JOj5aVDg2irVJLkOlHCMql5n1EsNfjvs0GxzvSjG7XFWVdY2
 KZ3wrTvuSbv0psmKAFEsRsHPoWeQWuecI6BfIEvmR6h59Gr8YlTzxCR9dHWJ30/YEFKwtC
 poErT4TzQcNq6Ri/grYLYCC0f7/J31I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-wAJwaikQMf22nHo2sj4AGw-1; Tue, 13 Dec 2022 04:51:51 -0500
X-MC-Unique: wAJwaikQMf22nHo2sj4AGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0499229AA3B6;
 Tue, 13 Dec 2022 09:51:51 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A29564039F60;
 Tue, 13 Dec 2022 09:51:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] hw: Include the VMWare devices only in the x86 targets
Date: Tue, 13 Dec 2022 10:51:44 +0100
Message-Id: <20221213095144.42355-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 13 Dec 2022 09:51:57 -0000

It seems a little bit weird that the para-virtualized x86 VMWare
devices "vmware-svga" and "vmxnet3" also show up in non-x86 targets.
They are likely pretty useless there (since the guest OSes likely
do not have any drivers for those enabled), so let's change this and
only enable those devices by default for the classical x86 targets.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 ...ate-Pseudo-encoding.txt => vnc-ledstate-pseudo-encoding.rst} | 0
 hw/display/Kconfig                                              | 2 +-
 hw/net/Kconfig                                                  | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename docs/interop/{vnc-ledstate-Pseudo-encoding.txt => vnc-ledstate-pseudo-encoding.rst} (100%)

diff --git a/docs/interop/vnc-ledstate-Pseudo-encoding.txt b/docs/interop/vnc-ledstate-pseudo-encoding.rst
similarity index 100%
rename from docs/interop/vnc-ledstate-Pseudo-encoding.txt
rename to docs/interop/vnc-ledstate-pseudo-encoding.rst
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index a1b159becd..7b3da68d1c 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -55,7 +55,7 @@ config VGA_MMIO
 
 config VMWARE_VGA
     bool
-    default y if PCI_DEVICES
+    default y if PCI_DEVICES && PC_PCI
     depends on PCI
     select VGA
 
diff --git a/hw/net/Kconfig b/hw/net/Kconfig
index 6d795ec752..1cc1c5775e 100644
--- a/hw/net/Kconfig
+++ b/hw/net/Kconfig
@@ -51,7 +51,7 @@ config RTL8139_PCI
 
 config VMXNET3_PCI
     bool
-    default y if PCI_DEVICES
+    default y if PCI_DEVICES && PC_PCI
     depends on PCI
 
 config SMC91C111
-- 
2.31.1


