Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXbTg-0005ih-85
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 15:46:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1XXbTY-0005Uy-L4
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 15:46:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1XXbTS-0007H9-H6
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 15:46:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1XXbTF-0007Dc-Mv; Fri, 26 Sep 2014 15:46:25 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8QJkJ1u008899
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 26 Sep 2014 15:46:20 -0400
Received: from localhost (ovpn-113-54.phx2.redhat.com [10.3.113.54])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8QJkIjr005595; Fri, 26 Sep 2014 15:46:19 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 26 Sep 2014 16:46:04 -0300
Message-Id: <1411760764-18292-4-git-send-email-ehabkost@redhat.com>
In-Reply-To: <1411760764-18292-1-git-send-email-ehabkost@redhat.com>
References: <1411760764-18292-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH 3/3] bitmap.h: Don't include qemu-common.h
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
X-List-Received-Date: Fri, 26 Sep 2014 19:46:51 -0000

This will avoid unexpected circular header dependencies in the future.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/qemu/bitmap.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
index 1babd5d..8c50d70 100644
--- a/include/qemu/bitmap.h
+++ b/include/qemu/bitmap.h
@@ -12,7 +12,10 @@
 #ifndef BITMAP_H
 #define BITMAP_H
 
-#include "qemu-common.h"
+#include <glib.h>
+#include <string.h>
+
+#include "qemu/osdep.h"
 #include "qemu/bitops.h"
 
 /*
-- 
1.9.3


