Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjo2G-0005ux-0v
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 09:46:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bjo2A-0005pu-7B
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 09:46:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bjo25-00082Z-Il
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 09:45:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40642)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bjo1u-0007nP-QZ; Tue, 13 Sep 2016 09:45:42 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F57F32B826;
	Tue, 13 Sep 2016 13:45:42 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-35.ams2.redhat.com [10.36.116.35])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8DDje8R029670; Tue, 13 Sep 2016 09:45:41 -0400
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Tue, 13 Sep 2016 15:45:39 +0200
Message-Id: <1473774339-17446-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 13 Sep 2016 13:45:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] tcg: Remove duplicate header includes
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
X-List-Received-Date: Tue, 13 Sep 2016 13:46:03 -0000

host-utils.h and timer.h are included twice in tcg.c.
One time should be enough.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tcg/tcg.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 42417bd..c450c62 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -40,8 +40,6 @@
 #define NO_CPU_IO_DEFS
 #include "cpu.h"
 
-#include "qemu/host-utils.h"
-#include "qemu/timer.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
 
-- 
1.8.3.1


