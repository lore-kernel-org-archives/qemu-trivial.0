Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXbTd-0005eN-Se
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 15:46:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1XXbTV-0005Po-GR
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 15:46:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1XXbTP-0007Gg-DS
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 15:46:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:17119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1XXbTC-0007DP-NN; Fri, 26 Sep 2014 15:46:22 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8QJkH1t032721
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 26 Sep 2014 15:46:17 -0400
Received: from localhost (ovpn-113-54.phx2.redhat.com [10.3.113.54])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8QJkF9W021238; Fri, 26 Sep 2014 15:46:16 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 26 Sep 2014 16:46:03 -0300
Message-Id: <1411760764-18292-3-git-send-email-ehabkost@redhat.com>
In-Reply-To: <1411760764-18292-1-git-send-email-ehabkost@redhat.com>
References: <1411760764-18292-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/3] bitops.h: Don't include qemu-common.h
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
X-List-Received-Date: Fri, 26 Sep 2014 19:46:48 -0000

This removes the following circular dependency:

bitops.h -> qemu-common.h -> target-i386/cpu.h -> target-i386/cpu-qom.h ->
qom/cpu.h -> qdev-core.h -> bitmap.h -> bitops.h.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/qemu/bitops.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 7e2d5c9..181bd46 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -12,7 +12,9 @@
 #ifndef BITOPS_H
 #define BITOPS_H
 
-#include "qemu-common.h"
+#include <stdint.h>
+#include <assert.h>
+
 #include "host-utils.h"
 
 #define BITS_PER_BYTE           CHAR_BIT
-- 
1.9.3


