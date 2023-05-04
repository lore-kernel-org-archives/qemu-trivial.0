Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pudKd-0004L0-Oi
	for mharc-qemu-trivial@gnu.org; Thu, 04 May 2023 14:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pudKc-0004KG-EB
 for qemu-trivial@nongnu.org; Thu, 04 May 2023 14:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pudKb-0001nw-2a
 for qemu-trivial@nongnu.org; Thu, 04 May 2023 14:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683223528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MzJ2CkEQNDFwOO4AN68zKZ8alOKGdArTgY2Np6Dm8nk=;
 b=gHFrX2tLi1eVfuypufuEicFwED99CnrTEHXsOLBJRKCKddLcRLUNiM1j+zdedaCpUSd/IA
 cJN7ve+/kYxovr5YEI8IWsfQrGM/LFxjqnzQCrvotXmnICGdfUAnAi1iOUUKTNj9ffvmoW
 39z5csWrOJKXj4qiYO6LwAjciYyLHGM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-YWvnyCryPXyZHqDgI3Wi8g-1; Thu, 04 May 2023 14:05:25 -0400
X-MC-Unique: YWvnyCryPXyZHqDgI3Wi8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CF8F185A7A4;
 Thu,  4 May 2023 18:05:24 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42B451121331;
 Thu,  4 May 2023 18:05:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] hw/ppc/Kconfig: NVDIMM is a hard requirement for the pseries
 machine
Date: Thu,  4 May 2023 20:05:21 +0200
Message-Id: <20230504180521.220404-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 04 May 2023 18:05:30 -0000

When building QEMU with "--without-default-devices", the pseries
machine fails to start even when running with the --nodefaults option:

 $ ./qemu-system-ppc64 --nodefaults -M pseries
 Type 'spapr-nvdimm' is missing its parent 'nvdimm'
 Aborted (core dumped)

Looks like NVDIMM is a hard requirement for this machine nowadays.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/ppc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index c898021b5f..a689d9b219 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -3,7 +3,7 @@ config PSERIES
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply VIRTIO_VGA
-    imply NVDIMM
+    select NVDIMM
     select DIMM
     select PCI
     select SPAPR_VSCSI
-- 
2.31.1


