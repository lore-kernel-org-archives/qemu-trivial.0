Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sx8Dk-0005xQ-US
	for mharc-qemu-trivial@gnu.org; Thu, 02 Aug 2012 23:06:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1Sx8DL-000511-FX
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 23:06:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1Sx8DH-0006Cs-DR
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 23:06:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49440)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1Sx8DB-000689-UK; Thu, 02 Aug 2012 23:06:02 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7335xCr001753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 2 Aug 2012 23:06:00 -0400
Received: from dhcp-8-167.nay.redhat.com ([10.66.7.126])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7335pTW024767; Thu, 2 Aug 2012 23:05:57 -0400
From: Amos Kong <akong@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  3 Aug 2012 11:06:21 +0800
Message-Id: <1343963182-28297-2-git-send-email-akong@redhat.com>
In-Reply-To: <1343963182-28297-1-git-send-email-akong@redhat.com>
References: <1343963182-28297-1-git-send-email-akong@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: aliguori@us.ibm.com, quintela@redhat.com
Subject: [Qemu-trivial] [PATCH v2 1/2] remove unused include of error.h
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
X-List-Received-Date: Fri, 03 Aug 2012 03:06:15 -0000

Signed-off-by: Amos Kong <akong@redhat.com>
---
 qemu_socket.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/qemu_socket.h b/qemu_socket.h
index 4689ff3..1a2f517 100644
--- a/qemu_socket.h
+++ b/qemu_socket.h
@@ -27,7 +27,6 @@ int inet_aton(const char *cp, struct in_addr *ia);
 #endif /* !_WIN32 */
 
 #include "qemu-option.h"
-#include "error.h"
 #include "qerror.h"
 
 /* misc helpers */
-- 
1.7.1


