Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QRxYE-0007y1-FI
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jun 2011 22:22:22 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QRxYB-0007x2-5E
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2011 22:22:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QRxY9-00028T-RU
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2011 22:22:18 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:36326)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QRxY5-00026L-Sv; Wed, 01 Jun 2011 22:22:14 -0400
Received: by vxb37 with SMTP id 37so379314vxb.4
	for <multiple recipients>; Wed, 01 Jun 2011 19:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	bh=swR/LZLDRlllh1eddIxBC58ro5Y2fOeW/zk2oNVN9d4=;
	b=thMhyYinSjexkUUaqGzKu9IydgaPvWJKrJQEvu71Yj1Arl2Tu/cnwC94XsUqFS+E86
	ZMszwqHmGos11y0sADPRbjth0c4ZMsao+bNGW8MEGIwAd2ffLdsC8oP3P2rHusbL3nYN
	Fd+33E6pbuiIX5Rswqf6tCVFJaBj5lJ+nv8Gg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	b=RIE+r4jvFfQt0INN0ld+SbgOTm/yXNg6vUmtdBpeNRQTLMPapdSDSecGwaexV8C4AR
	BcHcrnfYUqbQ1WCZYKw56YpGXC3vhx1gmdJWB4VKbeFv49TBOIKo7ln9a8MVKrnN89JR
	28zxVP9/F99PlQ72//tljP42ZCagrLltIav0g=
Received: by 10.52.90.48 with SMTP id bt16mr255530vdb.141.1306981332374;
	Wed, 01 Jun 2011 19:22:12 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id da4sm61115vdb.21.2011.06.01.19.22.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 19:22:11 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 Jun 2011 22:21:30 -0400
Message-Id: <1306981290-17308-1-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.220.173
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH] Fix compilation warning due to missing
	header for sigaction
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
X-List-Received-Date: Thu, 02 Jun 2011 02:22:21 -0000

Fix the following warning by including signal.h directly in qemu-common.h
----8<----
iohandler.c: In function ‘qemu_init_child_watch’:
iohandler.c:172: warning: implicit declaration of function ‘sigaction’
iohandler.c:172: warning: nested extern declaration of ‘sigaction’
----8<----

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 qemu-common.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/qemu-common.h b/qemu-common.h
index b851b20..39fabc9 100644
--- a/qemu-common.h
+++ b/qemu-common.h
@@ -39,6 +39,7 @@ typedef struct Monitor Monitor;
 #include <sys/stat.h>
 #include <sys/time.h>
 #include <assert.h>
+#include <signal.h>
 
 #ifdef _WIN32
 #include "qemu-os-win32.h"
-- 
1.7.5


