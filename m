Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tIjXt-00037Q-NV
	for mharc-qemu-trivial@gnu.org; Wed, 04 Dec 2024 02:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tIjXr-000379-RZ
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2024 02:11:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tIjXq-00027A-6h
 for qemu-trivial@nongnu.org; Wed, 04 Dec 2024 02:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733296293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WeROUwj/BDmYQuZ+7K3hxwfUYROEuwxgCumbH5RhtQ4=;
 b=aTpZah5w1hi97dWxGLvjUEOtSB8FOYsPZOdApBlvmu7g9ZJNvo9WTlGkuN7RXbGVNMrfjY
 UpGr9PmgxyBrjC51MqQ6M5x1eVe2hvZqhs6DjaSrear8SHdq4KceeJWVk/HapqCCHTduv6
 JHS6mXYtstEGSLt3Rqg8R/46Krw2bo4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-ISODUfanOIqYTvR6lZcMKw-1; Wed,
 04 Dec 2024 02:11:29 -0500
X-MC-Unique: ISODUfanOIqYTvR6lZcMKw-1
X-Mimecast-MFC-AGG-ID: ISODUfanOIqYTvR6lZcMKw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 696FC19560B6; Wed,  4 Dec 2024 07:11:28 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.155])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 555AF19560A2; Wed,  4 Dec 2024 07:11:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org
Subject: [PATCH] MAINTAINERS: Cover the tests/functional/test_sh4eb_r2d.py file
Date: Wed,  4 Dec 2024 08:11:20 +0100
Message-ID: <20241204071120.663446-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Wed, 04 Dec 2024 07:11:36 -0000

This file should belong to the R2D machine in the MAINTAINERS file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index aaf0505a21..727f18fae5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1643,7 +1643,7 @@ F: hw/pci-host/sh_pci.c
 F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh_intc.h
 F: include/hw/timer/tmu012.h
-F: tests/functional/test_sh4_r2d.py
+F: tests/functional/test_sh4*_r2d.py
 F: tests/functional/test_sh4_tuxrun.py
 
 SPARC Machines
-- 
2.47.0


