Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r0JAb-0004fN-OQ
	for mharc-qemu-trivial@gnu.org; Tue, 07 Nov 2023 05:18:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r0JAZ-0004O2-UD
 for qemu-trivial@nongnu.org; Tue, 07 Nov 2023 05:18:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r0JAK-00047P-6R
 for qemu-trivial@nongnu.org; Tue, 07 Nov 2023 05:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699352315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ToWQpQxx+Zr5pckkwTdzQDaW4cmvgheOVgTQzKyeMRA=;
 b=T8INluCHO+Wcxf3dNGaC/DyEsGEusgScvxm/bHAAzn+Z5sdoHa4m1niEP0kLodGF0YYdzW
 KFMJO2PM3MYUVEdnclrbn4uomWJhSpnP4zg2nYrc10F9W6APuFiSa/HsiH3NBZcs6wXqiy
 ISCOvO6FsQiC0I/x20/UQUqHoOQJ9lU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-85-D8tkywlNMcm2MIpAofB_AQ-1; Tue,
 07 Nov 2023 05:18:14 -0500
X-MC-Unique: D8tkywlNMcm2MIpAofB_AQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 841151C06520;
 Tue,  7 Nov 2023 10:18:14 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F737492BE0;
 Tue,  7 Nov 2023 10:18:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] MAINTAINERS: Add more guest-agent related files to the
 corresponding section
Date: Tue,  7 Nov 2023 11:18:11 +0100
Message-ID: <20231107101811.14189-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 07 Nov 2023 10:18:52 -0000

contrib/systemd/qemu-guest-agent.service , tests/data/test-qga-config
and tests/data/test-qga-os-release belong to the guest agent, so make
sure that these files are covered here, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b7be61119f..48a6507759 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3144,10 +3144,11 @@ M: Michael Roth <michael.roth@amd.com>
 M: Konstantin Kostiuk <kkostiuk@redhat.com>
 S: Maintained
 F: qga/
+F: contrib/systemd/qemu-guest-agent.service
 F: docs/interop/qemu-ga.rst
 F: docs/interop/qemu-ga-ref.rst
 F: scripts/qemu-guest-agent/
-F: tests/unit/test-qga.c
+F: tests/*/test-qga*
 T: git https://github.com/mdroth/qemu.git qga
 
 QEMU Guest Agent Win32
-- 
2.41.0


