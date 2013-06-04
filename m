Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ujxm7-0001JH-St
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 16:24:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1Ujxm0-00018N-PU
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1Ujxlw-0005qP-7L
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:24:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63633)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1Ujxlm-0005oA-GT; Tue, 04 Jun 2013 16:23:50 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r54KNnYb005958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 4 Jun 2013 16:23:49 -0400
Received: from garlic.sbx07344.newyony.wayport.net (vpn1-5-107.ams2.redhat.com
	[10.36.5.107])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r54KNeZf022345; Tue, 4 Jun 2013 16:23:44 -0400
From: Alon Levy <alevy@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue,  4 Jun 2013 16:23:35 -0400
Message-Id: <1370377419-31788-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/5] oslib-posix: add qemu_pipe_non_block
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
X-List-Received-Date: Tue, 04 Jun 2013 20:24:10 -0000

Used by the followin patch.

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 include/qemu-common.h |  1 +
 util/oslib-posix.c    | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index cb82ef3..c24d75c 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -232,6 +232,7 @@ ssize_t qemu_recv_full(int fd, void *buf, size_t count, int flags)
 
 #ifndef _WIN32
 int qemu_pipe(int pipefd[2]);
+int qemu_pipe_non_block(int pipefd[2]);
 #endif
 
 #ifdef _WIN32
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 3dc8b1b..bc2ce2e 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -188,6 +188,25 @@ int qemu_pipe(int pipefd[2])
     return ret;
 }
 
+int qemu_pipe_non_block(int pipefd[2])
+{
+    int ret;
+
+    ret = qemu_pipe(pipefd);
+    if (ret) {
+        return ret;
+    }
+    if (fcntl(card->pipe[0], F_SETFL, O_NONBLOCK) == -1) {
+        return -errno;
+    }
+    if (fcntl(card->pipe[1], F_SETFL, O_NONBLOCK) == -1) {
+        return -errno;
+    }
+    if (fcntl(card->pipe[0], F_SETOWN, getpid()) == -1) {
+        return -errno;
+    }
+}
+
 int qemu_utimens(const char *path, const struct timespec *times)
 {
     struct timeval tv[2], tv_now;
-- 
1.8.2.1


