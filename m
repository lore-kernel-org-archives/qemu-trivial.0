Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1biT8k-0000nv-Os
	for mharc-qemu-trivial@gnu.org; Fri, 09 Sep 2016 17:15:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1biT8j-0000mu-J8
	for qemu-trivial@nongnu.org; Fri, 09 Sep 2016 17:15:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1biT8i-0005yj-L9
	for qemu-trivial@nongnu.org; Fri, 09 Sep 2016 17:15:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1biT8e-0005uL-CP; Fri, 09 Sep 2016 17:15:08 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D61CFC05AA46;
	Fri,  9 Sep 2016 21:15:06 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-63.ams2.redhat.com [10.36.116.63])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u89LF4kk007472; Fri, 9 Sep 2016 17:15:05 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Date: Fri,  9 Sep 2016 23:15:04 +0200
Message-Id: <1473455704-27274-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 09 Sep 2016 21:15:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add include/sysemu/cpus.h
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
X-List-Received-Date: Fri, 09 Sep 2016 21:15:14 -0000

This header seems to belong to the guest CPU section since it
contains prototypes for cpus.c.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc69977..9d17cb3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -83,6 +83,7 @@ F: include/exec/cpu*.h
 F: include/exec/exec-all.h
 F: include/exec/helper*.h
 F: include/exec/tb-hash.h
+F: include/sysemu/cpus.h
 
 FPU emulation
 M: Aurelien Jarno <aurelien@aurel32.net>
-- 
1.8.3.1


