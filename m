Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqlvT-00008w-ST
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 08:33:11 -0500
Received: from eggs.gnu.org ([140.186.70.92]:59399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1RqlvR-0008Qd-5f
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 08:33:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1RqlvL-0004gC-Ej
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 08:33:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58191)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1RqlvA-0004db-2K; Fri, 27 Jan 2012 08:32:52 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0RDWoJ9006110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 27 Jan 2012 08:32:50 -0500
Received: from lacos-laptop.usersys.redhat.com (dhcp-1-169.brq.redhat.com
	[10.34.1.169])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0RDWm9G029788; Fri, 27 Jan 2012 08:32:49 -0500
From: Laszlo Ersek <lersek@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, armbru@redhat.com
Date: Fri, 27 Jan 2012 14:34:05 +0100
Message-Id: <1327671245-5231-1-git-send-email-lersek@redhat.com>
In-Reply-To: <m31uqluvwy.fsf@blackfin.pond.sub.org>
References: <m31uqluvwy.fsf@blackfin.pond.sub.org>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] keep the PID file locked for the lifetime
	of the process
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
X-List-Received-Date: Fri, 27 Jan 2012 13:33:10 -0000

The lockf() call in qemu_create_pidfile() aims at ensuring mutual
exclusion. We shouldn't close the pidfile on success (as introduced by
commit 1bbd1592), because that drops the lock as well [1]:

    "File locks shall be released on first close by the locking process
    of any file descriptor for the file."

Coverity may complain again about the leaked file descriptor; let's
worry about that later.

v1->v2:
- add reference to 1bbd1592
- explain the intentional fd leak in the source

[1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/lockf.html

Signed-off-by: Laszlo Ersek <lersek@redhat.com>
---
 os-posix.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index 5c437ca..e3ed497 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -348,6 +348,6 @@ int qemu_create_pidfile(const char *filename)
         return -1;
     }
 
-    close(fd);
+    /* keep pidfile open & locked forever */
     return 0;
 }
-- 
1.7.1


