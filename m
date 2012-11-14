Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYT3Q-0007kI-LT
	for mharc-qemu-trivial@gnu.org; Tue, 13 Nov 2012 21:50:16 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYT3M-0007j9-4n
	for qemu-trivial@nongnu.org; Tue, 13 Nov 2012 21:50:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYT3J-00009F-2E
	for qemu-trivial@nongnu.org; Tue, 13 Nov 2012 21:50:12 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:15602)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TYT3I-0008JB-IM
	for qemu-trivial@nongnu.org; Tue, 13 Nov 2012 21:50:09 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 11B002DB;
	Wed, 14 Nov 2012 10:49:57 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:mime-version:content-type; s=
	rsa1024; bh=SWI9hZWBSwIDrnI14Bvhbctu5+U=; b=qappXlAdLTPMeI3k1ZKs
	IvT8QlUUv4BOEN0vGzt4rmJQNvyronM/KVorQODaMVt7q2s/mgmwfuNH105zsOnn
	rjb2jsrkFk9QyQKB5pbJGoptjateXj48+d578JRDABY+/eVBezHtTteQJGuJtcM4
	THDNFeKd31jbP9tjD9YMriE=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id F297D2DA;
	Wed, 14 Nov 2012 10:49:56 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qAE2ntUO063854;
	Wed, 14 Nov 2012 10:49:55 +0800 (CST) (envelope-from chenwj)
Date: Wed, 14 Nov 2012 10:49:55 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: qemu-trivial@nongnu.org
Message-ID: <20121114024954.GA63683@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: chenwj@iis.sinica.edu.tw
Subject: [Qemu-trivial] [PATCH] Possible wrong microMIPS opcode encoding
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
X-List-Received-Date: Wed, 14 Nov 2012 02:50:15 -0000

Hi all,

  While reading microMIPS decoding, I found a possible wrong opcode
encoding. According to [1] page 337, the bits 13..12 for MULTU is
0x01 rather than 0x00. Please review, thanks.

[1] MIPS Architecture for Programmers VolumeIV-e: The MIPS DSP
    Application-Specific Extension to the microMIPS32 Architecture

Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
---
 target-mips/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-mips/translate.c b/target-mips/translate.c
index f6fc0c2..01b48fa 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -10385,7 +10385,7 @@ enum {
 
     /* bits 13..12 for 0x32 */
     MULT_ACC = 0x0,
-    MULTU_ACC = 0x0,
+    MULTU_ACC = 0x1,
 
     /* bits 15..12 for 0x2c */
     SEB = 0x2,
-- 
1.7.12.3

