Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQ0mr-0001MM-Ji
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2011 13:25:25 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0mp-0001GS-8O
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:25:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0mo-0003j0-Ei
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:25:23 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:40388)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QQ0mm-0003hY-MT; Fri, 27 May 2011 13:25:20 -0400
Received: by mail-qy0-f173.google.com with SMTP id 36so3938014qyk.4
	for <multiple recipients>; Fri, 27 May 2011 10:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=qd/e5F9GHYmOPhvUldrNaVt8aX3SUUDs2MPBYm1/Cdw=;
	b=Gnh55gNJQwpyRNnYtxZuY3pDIxufLYIe4YR6XCme+qTP3uEWmG+twig216J2Vrr4wr
	kxK0+yqzvSgiV8MiQ9SeUJ6XduVNb88Hrj3HHUbzKSDONUXRW/iNI4fZU3GYCHAa4iwV
	lELHJbbRbDPCg6PjXqmEHifugVjxBvbdheGu8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RLwa/VWnjWwcrIy6v8aQHWXKCejQZhIw+EzQ3/hL3vQazaVeQft1eOAdo0YhEusLtz
	4ydxK9Zlsb52a2/ipJIhabqH5MZJCvaZ/2zt4RKlsZj8qrS5bCe9blHAPJgRB9z5hRae
	JG7O2he9vIYjN70JHfsOG3JaQ9wFYQoM0D88s=
Received: by 10.224.80.193 with SMTP id u1mr1790886qak.261.1306517120535;
	Fri, 27 May 2011 10:25:20 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id e28sm1198569qck.30.2011.05.27.10.25.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 10:25:19 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 May 2011 13:22:31 -0400
Message-Id: <1306516951-31105-7-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
In-Reply-To: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH 6/6] Avoid compilation warning regarding kvm
	under darwin
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
X-List-Received-Date: Fri, 27 May 2011 17:25:24 -0000

----8<----
qemu/target-s390x/helper.c:32:23: warning: linux/kvm.h: No such file or director
----8<----

kvm.h, which is included right after this line, already includes linux/kvm.h
with the proper CONFIG_KVM guard. Remove redundant include.

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 target-s390x/helper.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/target-s390x/helper.c b/target-s390x/helper.c
index c79af46..5dc42f1 100644
--- a/target-s390x/helper.c
+++ b/target-s390x/helper.c
@@ -29,7 +29,6 @@
 #include "qemu-timer.h"
 
 #if !defined(CONFIG_USER_ONLY)
-#include <linux/kvm.h>
 #include "kvm.h"
 #endif
 
-- 
1.7.5


