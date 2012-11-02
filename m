Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TUBnN-0003QZ-SL
	for mharc-qemu-trivial@gnu.org; Fri, 02 Nov 2012 03:36:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TUBnL-0003K2-RH
	for qemu-trivial@nongnu.org; Fri, 02 Nov 2012 03:36:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TUBnK-0003M1-Kb
	for qemu-trivial@nongnu.org; Fri, 02 Nov 2012 03:35:59 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:55995)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TUBnI-0003Kd-F2; Fri, 02 Nov 2012 03:35:56 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	B85157280030; Fri,  2 Nov 2012 08:35:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id YdHicTda-Cfh; Fri,  2 Nov 2012 08:35:55 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 24B14728003A; Fri,  2 Nov 2012 08:35:55 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri,  2 Nov 2012 08:35:54 +0100
Message-Id: <1351841754-26483-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 78.47.199.172
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] s390x: Spelling fixes (endianess ->
	endianness, occured -> occurred)
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
X-List-Received-Date: Fri, 02 Nov 2012 07:36:01 -0000

Replace also "write into" by "write to".

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

I think "write to" is better, but I am not sure about this,
so please wait until a native speaker has reviewed that patch.

Regards
Stefan Weil

 hw/s390x/sclp.h        |    4 ++--
 hw/s390x/sclpconsole.c |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/sclp.h b/hw/s390x/sclp.h
index fe89dad..231a38a 100644
--- a/hw/s390x/sclp.h
+++ b/hw/s390x/sclp.h
@@ -51,7 +51,7 @@
 
 /*
  * Normally packed structures are not the right thing to do, since all code
- * must take care of endianess. We cant use ldl_phys and friends for two
+ * must take care of endianness. We cannot use ldl_phys and friends for two
  * reasons, though:
  * - some of the embedded structures below the SCCB can appear multiple times
  *   at different locations, so there is no fixed offset
@@ -60,7 +60,7 @@
  *   alter the structure while we parse it. We cannot use ldl_p and friends
  *   either without doing pointer arithmetics
  * So we have to double check that all users of sclp data structures use the
- * right endianess wrappers.
+ * right endianness wrappers.
  */
 typedef struct SCCBHeader {
     uint16_t length;
diff --git a/hw/s390x/sclpconsole.c b/hw/s390x/sclpconsole.c
index 0ec5623..fece878 100644
--- a/hw/s390x/sclpconsole.c
+++ b/hw/s390x/sclpconsole.c
@@ -179,8 +179,8 @@ static int read_event_data(SCLPEvent *event, EventBufferHeader *evt_buf_hdr,
 }
 
 /* triggered by SCLP's write_event_data
- *  - write console data into character layer
- *  returns < 0 if an error occured
+ *  - write console data to character layer
+ *  returns < 0 if an error occurred
  */
 static ssize_t write_console_data(SCLPEvent *event, const uint8_t *buf,
                                   size_t len)
-- 
1.7.10.4


