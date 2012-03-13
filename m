Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S7WSq-0001Sh-CD
	for mharc-qemu-trivial@gnu.org; Tue, 13 Mar 2012 14:28:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.langsdorf@calxeda.com>) id 1S7WSo-0001KM-4Z
	for qemu-trivial@nongnu.org; Tue, 13 Mar 2012 14:28:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.langsdorf@calxeda.com>) id 1S7WSO-0004DO-DS
	for qemu-trivial@nongnu.org; Tue, 13 Mar 2012 14:28:49 -0400
Received: from smtp120.dfw.emailsrvr.com ([67.192.241.120]:54808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.langsdorf@calxeda.com>) id 1S7WSO-0004Cx-9C
	for qemu-trivial@nongnu.org; Tue, 13 Mar 2012 14:28:24 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp12.relay.dfw1a.emailsrvr.com (SMTP Server) with ESMTP id
	31EC33C1244; Tue, 13 Mar 2012 14:28:22 -0400 (EDT)
X-Virus-Scanned: OK
Received: by smtp12.relay.dfw1a.emailsrvr.com (Authenticated sender:
	mark.langsdorf-AT-calxeda.com) with ESMTPSA id 9F7C53C124B; 
	Tue, 13 Mar 2012 14:28:19 -0400 (EDT)
From: Mark Langsdorf <mark.langsdorf@calxeda.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Mar 2012 13:28:47 -0500
Message-Id: <1331663327-29982-1-git-send-email-mark.langsdorf@calxeda.com>
X-Mailer: git-send-email 1.7.5.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 67.192.241.120
Cc: qemu-trivial@nongnu.org, Joshua Housh <joshua.housh@calxeda.com>,
	aliguori@us.ibm.com, paul@codesourcery.com,
	Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: [Qemu-trivial] [PATCH 1/2] cleanup obsolete typedef
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
X-List-Received-Date: Tue, 13 Mar 2012 18:28:51 -0000

From: Joshua Housh <joshua.housh@calxeda.com>

There are no users of i2c_slave.

Signed-off-by: Joshua Housh <joshua.housh@calxeda.com>
Signed-off-by: Mark Langsdorf <mark.langsdorf@calxeda.com>
---
 qemu-common.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/qemu-common.h b/qemu-common.h
index b0fdf5c..c9e96a8 100644
--- a/qemu-common.h
+++ b/qemu-common.h
@@ -236,7 +236,6 @@ typedef struct MACAddr MACAddr;
 typedef struct VLANState VLANState;
 typedef struct VLANClientState VLANClientState;
 typedef struct i2c_bus i2c_bus;
-typedef struct i2c_slave i2c_slave;
 typedef struct ISABus ISABus;
 typedef struct SMBusDevice SMBusDevice;
 typedef struct PCIHostState PCIHostState;
-- 
1.7.5.4


