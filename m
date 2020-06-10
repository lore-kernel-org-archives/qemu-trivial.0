Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jirlq-000647-6x
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jun 2020 23:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jirln-00063B-Vu
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2020 23:51:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22159
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jirll-0001iA-FE
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2020 23:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591761075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=vs3FzAUf+ReHoBBXFePlOtCd3KPFBPufyrKfXSuCiP0=;
 b=GYOdP0c3kz/cuEZGPBBwPY+JxVXbqz6mojDD7+OOOlby7Md4NDTmcHLbhX/N3XZNbTg86S
 mF/uG3+BeHFXSONA/sXQgp5zdThkMk6SJuqAVS1be3liYfBUCvpw+z46ve8ojovY/ysbYY
 vtEfT3afs7QoztfBEYR7azQLuFHrxc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-VqKC98vsNxehw_AkleXuqQ-1; Tue, 09 Jun 2020 23:51:11 -0400
X-MC-Unique: VqKC98vsNxehw_AkleXuqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92214107ACCA;
 Wed, 10 Jun 2020 03:51:10 +0000 (UTC)
Received: from thuth.com (unknown [10.40.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3FB310013D0;
 Wed, 10 Jun 2020 03:51:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH] hw/vfio/pci-quirks: Fix broken legacy IGD passthrough
Date: Wed, 10 Jun 2020 05:51:02 +0200
Message-Id: <20200610035102.20192-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:51:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 10 Jun 2020 03:51:21 -0000

The #ifdef CONFIG_VFIO_IGD in pci-quirks.c is not working since the
required header config-devices.h is not included, so that the legacy
IGD passthrough is currently broken. Let's include the right header
to fix this issue.

Buglink: https://bugs.launchpad.net/qemu/+bug/1882784
Fixes: 29d62771c81d8fd244a67c14a1d968c268d3fb19
       ("hw/vfio: Move the IGD quirk code to a separate file")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/vfio/pci-quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index f2155ddb1d..3158390db1 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "config-devices.h"
 #include "exec/memop.h"
 #include "qemu/units.h"
 #include "qemu/error-report.h"
-- 
2.18.1


