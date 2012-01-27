Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqnA9-0008GL-Tv
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 09:52:25 -0500
Received: from eggs.gnu.org ([140.186.70.92]:53162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RqnA3-0008F7-0a
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 09:52:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RqnA1-0008QT-Oa
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 09:52:18 -0500
Received: from mout.perfora.net ([74.208.4.195]:53330)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1RqnA1-0008QP-HA; Fri, 27 Jan 2012 09:52:17 -0500
Received: from illuin.morrigu.org (adsl-99-62-40-129.dsl.aus2tx.sbcglobal.net
	[99.62.40.129])
	by mrelay.perfora.net (node=mrus2) with ESMTP (Nemesis)
	id 0LlDry-1SQP9z45VG-00azgX; Fri, 27 Jan 2012 09:52:14 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jan 2012 08:52:01 -0600
Message-Id: <1327675921-27979-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <20120127054101.GB17836@stefanha-thinkpad.localdomain>
References: <20120127054101.GB17836@stefanha-thinkpad.localdomain>
X-Provags-ID: V02:K0:Z6Lpc7YstoTTm5tlqI5zAW9KgyQfqg5sTbmug5eAxVg
	kInfM/Fh9W2/oEyLcqjtA1v3ggOU7KHrbq9c5JuYQ/FVqTGIdo
	KKRh99sHFsFkxY+Awv2e3Bi3mkMhsnFP44rixgB7+Jrh90Xz0D
	tFXL5aJS7yjz1NnPxPJyzHbl30IXnGdz9RTBRcRVGLSIGQBQ83
	p/yBiD4/FE9yy8N0yJzESFNcG6pyasvpSzjts5sln9LnYYt1fz
	OqjxLNaVyvSDT+md/LRwuXuDBwNAR6Kou0/4taxrJa5Y9fTVjL
	mXBk28nN/QcFL3JAY7c/AdWJbBmvWxq/yOdoIWFvZdmPM9Flbp
	4Dc+1bRo4JIyrTXmffJe6t9vnbCFWxpuRLbJO9w6LdkTQ2bYWf
	9cWsc3unr060uznqb9f01B2tWgkzY5SGNc=
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.208.4.195
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH v2] main-loop: Fix SetEvent() on
	uninitialized handle on win32
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
X-List-Received-Date: Fri, 27 Jan 2012 14:52:24 -0000

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
 main-loop.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/main-loop.c b/main-loop.c
index 692381c..db90ace 100644
--- a/main-loop.c
+++ b/main-loop.c
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


