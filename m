Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVi5s-0005nv-9v
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 11:03:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVi5k-0005ez-I1
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 11:03:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVi5g-0006tr-OT
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 11:03:08 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:41242)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVi5g-0006tm-FU
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 11:03:04 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVi5d-0001Xu-5X; Tue, 16 Feb 2016 16:03:01 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 16:03:01 +0000
Message-Id: <1455638581-5912-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Kashyap Chamarthy <kchamart@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] qemu-options.hx: Improve documentation of
	chardev multiplexing mode
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
X-List-Received-Date: Tue, 16 Feb 2016 16:03:14 -0000

The current documentation of chardev mux=on is rather brief and opaque;
expand it to hopefully be a bit more helpful.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
There was some discussion on #qemu yesterday evening about multiplexing,
and "make the docs a bit less confusing" was one suggestion...
---
 qemu-options.hx | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 2f0465e..6b46dd4 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2162,8 +2162,26 @@ All devices must have an id, which can be any string up to 127 characters long.
 It is used to uniquely identify this device in other command line directives.
 
 A character device may be used in multiplexing mode by multiple front-ends.
+Specify @option{mux=on} to enable this mode.
+A multiplexer is a "1:N" device, and here the "1" end is your specified chardev
+backend, and the "N" end is the various parts of QEMU that can talk to a chardev.
+If you create a chardev with @option{id=myid} and @option{mux=on}, QEMU will
+create a multiplexer with your specified ID, and you can then configure multiple
+front ends to use that chardev ID for their input/output. Up to four different
+front ends can be connected to a single multiplexed chardev. (Without
+multiplexing enabled, a chardev can only be used by a single front end.)
+For instance you could use this to allow a single stdio chardev to be used by
+two serial ports and the QEMU monitor.
+
 The key sequence of @key{Control-a} and @key{c} will rotate the input focus
-between attached front-ends. Specify @option{mux=on} to enable this mode.
+of a multiplexed character device between attached front-ends.
+
+You can have more than one multiplexer in a system configuration; for instance
+you could have a TCP port multiplexed between UART 0 and UART 1, and stdio
+multiplexed between the QEMU monitor and a parallel port.
+
+There is currently no support for multiplexing in the other direction
+(where a single QEMU front end takes input and output from multiple chardevs).
 
 Every backend supports the @option{logfile} option, which supplies the path
 to a file to record all data transmitted via the backend. The @option{logappend}
-- 
1.9.1


