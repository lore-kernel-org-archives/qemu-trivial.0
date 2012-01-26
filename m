Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqXU5-0000mv-PI
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jan 2012 17:07:57 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1RqXU2-0000mm-UA
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2012 17:07:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1RqXU1-00007H-Me
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2012 17:07:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:1973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1RqXU1-00007A-G7; Thu, 26 Jan 2012 17:07:53 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0QM7oV6005666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 26 Jan 2012 17:07:51 -0500
Received: from lacos-laptop.usersys.redhat.com (vpn1-4-99.ams2.redhat.com
	[10.36.4.99])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0QLZQIB009083; Thu, 26 Jan 2012 16:35:27 -0500
From: Laszlo Ersek <lersek@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 26 Jan 2012 22:36:41 +0100
Message-Id: <1327613801-5828-1-git-send-email-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] keep the PID file locked for the lifetime of
	the process
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
X-List-Received-Date: Thu, 26 Jan 2012 22:07:55 -0000

The lockf() call in qemu_create_pidfile() aims at ensuring mutual
exclusion. We shouldn't close the pidfile on success, because that drops
the lock as well [1]:

    "File locks shall be released on first close by the locking process
    of any file descriptor for the file."

Coverity may complain again about the leaked file descriptor; let's
worry about that later.

[1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/lockf.html

Signed-off-by: Laszlo Ersek <lersek@redhat.com>
---
Please keep me CC'd, I'm not subscribed. Thanks!

 os-posix.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index 5c437ca..f4940c8 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -348,6 +348,5 @@ int qemu_create_pidfile(const char *filename)
         return -1;
     }
 
-    close(fd);
     return 0;
 }
-- 
1.7.1


