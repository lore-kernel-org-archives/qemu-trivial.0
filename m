Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RjD7L-0001yJ-6q
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jan 2012 11:58:11 -0500
Received: from eggs.gnu.org ([140.186.70.92]:39544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RjD7I-0001xQ-Rj
	for qemu-trivial@nongnu.org; Fri, 06 Jan 2012 11:58:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RjD7F-0001zS-Tv
	for qemu-trivial@nongnu.org; Fri, 06 Jan 2012 11:58:08 -0500
Received: from e06smtp16.uk.ibm.com ([195.75.94.112]:37972)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RjD7F-0001yx-KH
	for qemu-trivial@nongnu.org; Fri, 06 Jan 2012 11:58:05 -0500
Received: from /spool/local
	by e06smtp16.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanha@linux.vnet.ibm.com>;
	Fri, 6 Jan 2012 16:58:03 -0000
Received: from d06nrmr1307.portsmouth.uk.ibm.com ([9.149.38.129])
	by e06smtp16.uk.ibm.com ([192.168.101.146]) with IBM ESMTP SMTP
	Gateway: Authorized Use Only! Violators will be prosecuted; 
	Fri, 6 Jan 2012 16:58:01 -0000
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com
	[9.149.37.250])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q06Gw0QZ2605080; Fri, 6 Jan 2012 16:58:00 GMT
Received: from d06av09.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q06Gw0BL013062; Fri, 6 Jan 2012 09:58:00 -0700
Received: from localhost (stefanha-thinkpad.manchester-maybrook.uk.ibm.com
	[9.174.219.31])
	by d06av09.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q06Gw09k013053; Fri, 6 Jan 2012 09:58:00 -0700
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: <qemu-devel@nongnu.org>
Date: Fri,  6 Jan 2012 16:57:45 +0000
Message-Id: <1325869065-32182-3-git-send-email-stefanha@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1325869065-32182-1-git-send-email-stefanha@linux.vnet.ibm.com>
References: <1325869065-32182-1-git-send-email-stefanha@linux.vnet.ibm.com>
x-cbid: 12010616-3548-0000-0000-0000009852F9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 195.75.94.112
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 2/2] vnc: fix no-lock-key-sync strncmp()
	length
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
X-List-Received-Date: Fri, 06 Jan 2012 16:58:09 -0000

The no-lock-key-sync option is being parsed incorrectly because of an
outdated strcmp() length value.  Use the correct length so that invalid
option names do not match.

Reported-by: Dr David Alan Gilbert <davidagilbert@uk.ibm.com>
Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
---
 ui/vnc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 6767ada..1869a7a 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2763,7 +2763,7 @@ int vnc_display_open(DisplayState *ds, const char *display)
             password = 1; /* Require password auth */
         } else if (strncmp(options, "reverse", 7) == 0) {
             reverse = 1;
-        } else if (strncmp(options, "no-lock-key-sync", 9) == 0) {
+        } else if (strncmp(options, "no-lock-key-sync", 16) == 0) {
             lock_key_sync = 0;
 #ifdef CONFIG_VNC_SASL
         } else if (strncmp(options, "sasl", 4) == 0) {
-- 
1.7.7.3


