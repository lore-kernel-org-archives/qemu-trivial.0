Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SS7dY-0007cd-BF
	for mharc-qemu-trivial@gnu.org; Wed, 09 May 2012 10:13:04 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SS7dN-00077K-3W
	for qemu-trivial@nongnu.org; Wed, 09 May 2012 10:13:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SS7dG-0000zg-Q5
	for qemu-trivial@nongnu.org; Wed, 09 May 2012 10:12:52 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:49240)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SS7d4-0000wP-Dl; Wed, 09 May 2012 10:12:34 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SS7cz-0003Jb-Gc; Wed, 09 May 2012 15:12:29 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2012 15:12:29 +0100
Message-Id: <1336572749-12718-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Jim Meyering <meyering@redhat.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] qga/commands-posix.c: Fix typo in error
	message
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
X-List-Received-Date: Wed, 09 May 2012 14:13:02 -0000

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB: might trivially textually conflict with Jim Meyering's
strncpy fix here. (I spotted this typo in the context lines
for his patch...)

 qga/commands-posix.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index d58730a..0878ec7 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -789,7 +789,7 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             strncpy(ifr.ifr_name,  info->value->name, IF_NAMESIZE);
             if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
                 snprintf(err_msg, sizeof(err_msg),
-                         "failed to get MAC addres of %s: %s",
+                         "failed to get MAC address of %s: %s",
                          ifa->ifa_name,
                          strerror(errno));
                 error_set(errp, QERR_QGA_COMMAND_FAILED, err_msg);
-- 
1.7.1


