Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RoPRp-0001Yl-Ix
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jan 2012 20:08:49 -0500
Received: from eggs.gnu.org ([140.186.70.92]:53527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RoPRn-0001Pe-82
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2012 20:08:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RoPRm-0006By-12
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2012 20:08:47 -0500
Received: from mout.perfora.net ([74.208.4.194]:60121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1RoPRi-0006Al-JG; Fri, 20 Jan 2012 20:08:42 -0500
Received: from illuin.austin.ibm.com ([32.97.110.59])
	by mrelay.perfora.net (node=mrus0) with ESMTP (Nemesis)
	id 0Lm2Tx-1SO1NT34ld-00ZepC; Fri, 20 Jan 2012 20:08:39 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Fri, 20 Jan 2012 19:08:27 -0600
Message-Id: <1327108107-16600-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
X-Provags-ID: V02:K0:YC73A1HGkC2eB2Q1YFZ2IEga1FAofYDp9862szpWODd
	7+ZmmuqPYQMHhfo+7mh9SQDjqSZpd8RLn1qILPKWjdjN3QTmAl
	lQb1kY8UbL/fTtNXihNoikncxYOdN+iG63W5KWyhkw+ZYzMldH
	+wYkwRHsb/I9B+NnUJOYlA0G9GOJOK5+CZsuOGE9x5cjaZ536Y
	UdE4ZJ8temNAjW+0B0aqPG2j+02j5cBHHGCDDDshEYv6p3uvSj
	jAlgSsKXmeawXCBGg+jIXgr9XrI5hVSlrVyQJ5NQ/4zJh7VG//
	tmxqgzna3Ja6fT57o0z+aLfNQyOTrpCtLDvorQfkjpNebFsXMm
	hterHGSXF3Co3Oc+8YvR085JCKr5DaLF+TUu4nbFY85+ufz5B4
	/rO+d2wI3ApGuZXI1K7Sj93JhwxSSrjtZo=
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.208.4.194
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] main-loop: Fix SetEvent() on uninitialized
	handle on win32
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
X-List-Received-Date: Sat, 21 Jan 2012 01:08:48 -0000

The __attribute__((constructor)) init_main_loop() automatically get
called if qemu-tool.o is linked in. On win32, this leads to
a qemu_notify_event() call which attempts to SetEvent() on a HANDLE that
won't be initialized until qemu_init_main_loop() is manually called,
breaking qemu-tools.o programs on Windows at runtime.

This patch checks for an initialized event handle before attempting to
set it, which is analoguous to how we deal with an unitialized
io_thread_fd in the posix implementation.

Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 main-loop.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/main-loop.c b/main-loop.c
index 692381c..62d95b9 100644
--- a/main-loop.c
+++ b/main-loop.c
@@ -164,7 +164,7 @@ static int qemu_signal_init(void)
 
 #else /* _WIN32 */
 
-HANDLE qemu_event_handle;
+HANDLE qemu_event_handle = NULL;
 
 static void dummy_event_handler(void *opaque)
 {
@@ -183,6 +183,9 @@ static int qemu_event_init(void)
 
 void qemu_notify_event(void)
 {
+    if (!qemu_event_handle) {
+        return;
+    }
     if (!SetEvent(qemu_event_handle)) {
         fprintf(stderr, "qemu_notify_event: SetEvent failed: %ld\n",
                 GetLastError());
-- 
1.7.4.1


