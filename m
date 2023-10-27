Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qwG2T-0006JJ-8h
	for mharc-qemu-trivial@gnu.org; Fri, 27 Oct 2023 02:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qwG2Q-0006AU-7C
 for qemu-trivial@nongnu.org; Fri, 27 Oct 2023 02:09:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qwG2O-0001e9-Mw
 for qemu-trivial@nongnu.org; Fri, 27 Oct 2023 02:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698386979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qrGqFHQqxt4DPBfmN6Pu44m/Ub5Bs8GHfQvnpk2jHe0=;
 b=PX3eFHZe2REzVKW40CaAKiE7rY4iRLHiwNYu+/vaCaHF24CinC1v5YL2tnwD+tACxL30v1
 CXj/5bGAiOGLDB6npH8A+NOgM07YsfK9nNnHHMtQTdRMHWeoJ60SDuVpGtoDm77F18jTeC
 e/yqoTC/Wuj+TTSKgyjRP4Kh6Shr1/c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-zqtQIvjLNmG6s9jc82xVag-1; Fri, 27 Oct 2023 02:09:34 -0400
X-MC-Unique: zqtQIvjLNmG6s9jc82xVag-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFF25101A529;
 Fri, 27 Oct 2023 06:09:33 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56C47492BE0;
 Fri, 27 Oct 2023 06:09:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Vikram Garhwal <fnu.vikram@xilinx.com>
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] MAINTAINERS: Add the can documenation file to the CAN section
Date: Fri, 27 Oct 2023 08:09:31 +0200
Message-ID: <20231027060931.242491-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 27 Oct 2023 06:09:42 -0000

Add can.rst to the corresponding section in MAINTAINERS, so that
the maintainers get CC:-ed on corresponding patches.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cce6feff35..48d45b958f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2606,6 +2606,7 @@ W: https://canbus.pages.fel.cvut.cz/
 F: net/can/*
 F: hw/net/can/*
 F: include/net/can_*.h
+F: docs/system/devices/can.rst
 
 OpenPIC interrupt controller
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
-- 
2.41.0


