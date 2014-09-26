Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXbTb-0005Zp-GY
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 15:46:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1XXbTT-0005MQ-PQ
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 15:46:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1XXbTN-0007GR-LH
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 15:46:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1XXbTB-0007D6-4B; Fri, 26 Sep 2014 15:46:21 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8QJkEMO023657
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 26 Sep 2014 15:46:15 -0400
Received: from localhost (ovpn-113-54.phx2.redhat.com [10.3.113.54])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8QJkDJ6011852; Fri, 26 Sep 2014 15:46:14 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 26 Sep 2014 16:46:02 -0300
Message-Id: <1411760764-18292-2-git-send-email-ehabkost@redhat.com>
In-Reply-To: <1411760764-18292-1-git-send-email-ehabkost@redhat.com>
References: <1411760764-18292-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH 1/3] tests: Add missing include to
	test-bitops.c
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
X-List-Received-Date: Fri, 26 Sep 2014 19:46:46 -0000

The test code needs osdep.h for the ARRAY_SIZE macro.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 tests/test-bitops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/test-bitops.c b/tests/test-bitops.c
index 8238eb5..47b5d3e 100644
--- a/tests/test-bitops.c
+++ b/tests/test-bitops.c
@@ -8,6 +8,7 @@
 
 #include <glib.h>
 #include <stdint.h>
+#include "qemu/osdep.h"
 #include "qemu/bitops.h"
 
 typedef struct {
-- 
1.9.3


