Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCy67-0003iw-PY
	for mharc-qemu-trivial@gnu.org; Wed, 28 Mar 2012 14:59:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1SCy33-0003OM-Cr
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 14:56:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1SCy31-000665-LR
	for qemu-trivial@nongnu.org; Wed, 28 Mar 2012 14:56:44 -0400
Received: from goliath.siemens.de ([192.35.17.28]:27913)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1SCy31-00065o-5p; Wed, 28 Mar 2012 14:56:43 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id q2SIucjO026047;
	Wed, 28 Mar 2012 20:56:38 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q2SIuc6v019047;
	Wed, 28 Mar 2012 20:56:38 +0200
Message-ID: <4F735EE6.4080106@siemens.com>
Date: Wed, 28 Mar 2012 20:56:38 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.28
Cc: Stefan Weil <weil@mail.berlios.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] w32: Undefine error constants before their
	redefinition
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
X-List-Received-Date: Wed, 28 Mar 2012 18:56:49 -0000

Avoids lots of warnings.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 qemu_socket.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/qemu_socket.h b/qemu_socket.h
index fe4cf6c..51ad210 100644
--- a/qemu_socket.h
+++ b/qemu_socket.h
@@ -8,7 +8,9 @@
 #include <ws2tcpip.h>
 
 #define socket_error() WSAGetLastError()
+#undef EWOULDBLOCK
 #undef EINTR
+#undef EINPROGRESS
 #define EWOULDBLOCK WSAEWOULDBLOCK
 #define EINTR       WSAEINTR
 #define EINPROGRESS WSAEINPROGRESS
-- 
1.7.3.4

