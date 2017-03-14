Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cnncp-0000L7-2l
	for mharc-qemu-trivial@gnu.org; Tue, 14 Mar 2017 10:40:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas@grapentin.org>) id 1cnjYT-00027c-IQ
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 06:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas@grapentin.org>) id 1cnjYP-0004cM-Io
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 06:19:49 -0400
Received: from www145.your-server.de ([78.47.15.66]:60011)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andreas@grapentin.org>)
	id 1cnjYP-0004bt-Bl; Tue, 14 Mar 2017 06:19:45 -0400
Received: from [88.198.220.132] (helo=sslproxy03.your-server.de)
	by www145.your-server.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.85_2)
	(envelope-from <andreas@grapentin.org>)
	id 1cnjYN-0007jv-HK; Tue, 14 Mar 2017 11:19:43 +0100
Received: from [141.89.226.146] (helo=parabola-pocket.hpi.uni-potsdam.de)
	by sslproxy03.your-server.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES128-GCM-SHA256:128) (Exim 4.84_2)
	(envelope-from <andreas@grapentin.org>)
	id 1cnjYM-0002Qi-PH; Tue, 14 Mar 2017 11:19:43 +0100
From: Andreas Grapentin <andreas@grapentin.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Andreas Grapentin <andreas@grapentin.org>
Date: Tue, 14 Mar 2017 11:19:25 +0100
Message-Id: <20170314101925.16792-2-andreas@grapentin.org>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170314101925.16792-1-andreas@grapentin.org>
References: <20170314101925.16792-1-andreas@grapentin.org>
X-Authenticated-Sender: andreas@grapentin.org
X-Virus-Scanned: Clear (ClamAV 0.99.2/23202/Tue Mar 14 05:13:46 2017)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 78.47.15.66
X-Mailman-Approved-At: Tue, 14 Mar 2017 10:40:33 -0400
Subject: [Qemu-trivial] [PATCH 1/1] major / minor macros are to be included
 from <sys/sysmacros.h>
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
X-List-Received-Date: Tue, 14 Mar 2017 10:19:50 -0000

---
 hw/9pfs/9p.c         | 1 +
 qga/commands-posix.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 76c9247c77..d9cfa8900e 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include <sys/sysmacros.h>
 #include <glib/gprintf.h>
 #include "hw/virtio/virtio.h"
 #include "qapi/error.h"
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 73d93eb5ce..9eecdd092c 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 #include <sys/ioctl.h>
 #include <sys/wait.h>
+#include <sys/sysmacros.h>
 #include <dirent.h>
 #include "qga/guest-agent-core.h"
 #include "qga-qmp-commands.h"
-- 
2.12.0


