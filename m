Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WYjrM-0008LZ-Ap
	for mharc-qemu-trivial@gnu.org; Fri, 11 Apr 2014 18:23:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1WYjrE-00088o-MG
	for qemu-trivial@nongnu.org; Fri, 11 Apr 2014 18:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1WYjr8-0002SK-In
	for qemu-trivial@nongnu.org; Fri, 11 Apr 2014 18:23:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1WYjqv-0002R7-Qx; Fri, 11 Apr 2014 18:23:18 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3BMNGWS020542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 11 Apr 2014 18:23:16 -0400
Received: from colepc.home.com (ovpn-113-175.phx2.redhat.com [10.3.113.175])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3BMNAgY005398; Fri, 11 Apr 2014 18:23:16 -0400
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Apr 2014 18:23:02 -0400
Message-Id: <210ccd3412637c29794a2ea5a01de55515069cff.1397254448.git.crobinso@redhat.com>
In-Reply-To: <3caf3e0c72bb14174e254547ebdc9e0e57fd5378.1397254448.git.crobinso@redhat.com>
References: <3caf3e0c72bb14174e254547ebdc9e0e57fd5378.1397254448.git.crobinso@redhat.com>
In-Reply-To: <3caf3e0c72bb14174e254547ebdc9e0e57fd5378.1397254448.git.crobinso@redhat.com>
References: <3caf3e0c72bb14174e254547ebdc9e0e57fd5378.1397254448.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/2] tests/.gitignore: Ignore test-rfifolock
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
X-List-Received-Date: Fri, 11 Apr 2014 22:23:42 -0000

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index 3aa1e95..c71c110 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -23,6 +23,7 @@ test-qmp-input-strict
 test-qmp-input-visitor
 test-qmp-marshal.c
 test-qmp-output-visitor
+test-rfifolock
 test-string-input-visitor
 test-string-output-visitor
 test-thread-pool
-- 
1.9.0


