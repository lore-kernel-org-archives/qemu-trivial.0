Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ejSCD-0002nJ-5A
	for mharc-qemu-trivial@gnu.org; Wed, 07 Feb 2018 11:03:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ejSC7-0002jP-3r
	for qemu-trivial@nongnu.org; Wed, 07 Feb 2018 11:03:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ejSC2-0003mJ-II
	for qemu-trivial@nongnu.org; Wed, 07 Feb 2018 11:03:35 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58116 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1ejSBt-0003gt-NQ; Wed, 07 Feb 2018 11:03:21 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DEA67C6BB;
	Wed,  7 Feb 2018 16:03:11 +0000 (UTC)
Received: from red.redhat.com (ovpn-122-122.rdu2.redhat.com [10.10.122.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 921A02166BAE;
	Wed,  7 Feb 2018 16:03:04 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Wed,  7 Feb 2018 10:03:02 -0600
Message-Id: <20180207160302.15651-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 07 Feb 2018 16:03:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 07 Feb 2018 16:03:11 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] Drop unneeded system header includes
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Feb 2018 16:03:39 -0000

<memory.h> is a non-standard obsolete header that was long ago
replaced by <string.h>.

<malloc.h> is a non-standard header; it is not obsolete (we must
use it for malloc_trim, for example), but generally should not
be used in files that just need malloc() and friends, where
<stdlib.h> is the standard header.

And since osdep.h already guarantees string.h and stdlib.h, we
can drop these unusual system header includes as redundant
rather than replacing them.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Based-on: <20180207124009.12376-1-armbru@redhat.com>
([PULL 00/20] Miscellaneous patches for 2018-02-07)

 target/i386/hax-windows.h | 2 --
 target/i386/hvf/x86_mmu.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/target/i386/hax-windows.h b/target/i386/hax-windows.h
index 004f8676949..20e2f85407b 100644
--- a/target/i386/hax-windows.h
+++ b/target/i386/hax-windows.h
@@ -20,8 +20,6 @@
 #ifndef TARGET_I386_HAX_WINDOWS_H
 #define TARGET_I386_HAX_WINDOWS_H

-#include <memory.h>
-#include <malloc.h>
 #include <winioctl.h>
 #include <windef.h>

diff --git a/target/i386/hvf/x86_mmu.c b/target/i386/hvf/x86_mmu.c
index c6be2cca357..d5a0efe7188 100644
--- a/target/i386/hvf/x86_mmu.c
+++ b/target/i386/hvf/x86_mmu.c
@@ -17,7 +17,6 @@
  */

 #include "qemu/osdep.h"
-#include <memory.h>
 #include "panic.h"
 #include "qemu-common.h"
 #include "cpu.h"
-- 
2.14.3


