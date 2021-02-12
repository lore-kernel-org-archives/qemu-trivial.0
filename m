Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAYsr-0004ZB-8y
	for mharc-qemu-trivial@gnu.org; Fri, 12 Feb 2021 08:53:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lAYsp-0004Uz-IC
 for qemu-trivial@nongnu.org; Fri, 12 Feb 2021 08:53:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1lAYsm-0006cl-KY
 for qemu-trivial@nongnu.org; Fri, 12 Feb 2021 08:53:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613137996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jcMTMUXlB9fn6rvY/i3Nx6DEu5q7slM2IdVjMLgYj3w=;
 b=G3tuIR+ZH8xtkDy6vPfwv/VpyIm4Y5kExK04mu63MD5GWejKvnojgk5IrkNQZBjykLYRlY
 Y5ZyhoHAnGKAjn20GUEtE4t1DLILBARfKM1TXVajPKKP1wV6adhDR4MWNYRGuLbesgiBvj
 R6X6b1zQ6/TNC0Q7L3+zykM42BLtWb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-K4ULx2gqNNuBK9acnabdGA-1; Fri, 12 Feb 2021 08:53:12 -0500
X-MC-Unique: K4ULx2gqNNuBK9acnabdGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9A5A1936B68;
 Fri, 12 Feb 2021 13:53:10 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09FA72C154;
 Fri, 12 Feb 2021 13:53:04 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 benh@kernel.crashing.org, zhengxiang9@huawei.com, quintela@redhat.com,
 alex.williamson@redhat.com, jfreimann@redhat.com
Subject: [PATCH v3 1/4] pci: cleanup failover sanity check
Date: Fri, 12 Feb 2021 14:52:47 +0100
Message-Id: <20210212135250.2738750-2-lvivier@redhat.com>
In-Reply-To: <20210212135250.2738750-1-lvivier@redhat.com>
References: <20210212135250.2738750-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Feb 2021 13:53:19 -0000

Commit a1190ab628 has added a "allow_unplug_during_migration = true" at
the end of the main "if" block, so it is not needed to set it anymore
in the previous checking.

Remove it, to have only sub-ifs that check for needed conditions and exit
if one fails.

Fixes: 4f5b6a05a4e7 ("pci: add option for net failover")
Fixes: a1190ab628c0 ("migration: allow unplug during migration for failover devices")
Cc: jfreimann@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/pci/pci.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 512e9042ffae..ecb7aa31fabd 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2120,10 +2120,8 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
             pci_qdev_unrealize(DEVICE(pci_dev));
             return;
         }
-        if (!(pci_dev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION)
-            && (PCI_FUNC(pci_dev->devfn) == 0)) {
-            qdev->allow_unplug_during_migration = true;
-        } else {
+        if ((pci_dev->cap_present & QEMU_PCI_CAP_MULTIFUNCTION)
+            || (PCI_FUNC(pci_dev->devfn) != 0)) {
             error_setg(errp, "failover: primary device must be in its own "
                               "PCI slot");
             pci_qdev_unrealize(DEVICE(pci_dev));
-- 
2.29.2


