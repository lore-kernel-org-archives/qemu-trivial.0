Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNUMF-00024q-1e
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:00:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMC-00024d-2b
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUM9-0002gG-T4
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:15 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:50005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNUM4-0002B9-ND; Sun, 14 Oct 2012 16:00:08 -0400
Received: by mail-lb0-f173.google.com with SMTP id gj3so2850165lbb.4
	for <multiple recipients>; Sun, 14 Oct 2012 13:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ETefh8jeUeKGZCvSKfLtu8qWsOCjmB9TRvs+B/XGZTE=;
	b=qiTISdvqrGAGdJRqeeYqM5ll/Qvi3yQyQKByWpw9GcehcirvqITxao25djxXa2c7iL
	eTfn+ZCXicwLctEylZ0+6lu9dMYD44uAcXu8soIQWP+R65D0tAYf2hGQ3ScstpnqCIP9
	Gza52gefOOI9jG/w5dLcBUieEsx+Pf6Hf/BYwTBQ1LczkESYUkZ4mXHAa7o7yuGFHjj6
	96uDYJYMFXtrAzltAPGPH/urFEVIx83izXjtGn6pHeLmd8zkBHTLIzis2gkapAXkrAs9
	dCXl1iTyUw0saOAljCz3i8rjHnQOj0zXjFBW758a4E+/IEmhL0tdV5OpSu9qfmiaAGDQ
	tuMQ==
Received: by 10.112.48.10 with SMTP id h10mr3424926lbn.105.1350244804412;
	Sun, 14 Oct 2012 13:00:04 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id r8sm3941759lba.15.2012.10.14.13.00.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Oct 2012 13:00:03 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 14 Oct 2012 19:58:52 +0000
Message-Id: <5b00067f06c987f4ef2f95029a533acaacfeed05.1350244587.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH 04/11] tap-win32: avoid a warning
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
X-List-Received-Date: Sun, 14 Oct 2012 20:00:17 -0000

Avoid a warning about missing declaration.

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 net/tap-win32.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/net/tap-win32.c b/net/tap-win32.c
index f1801e2..7964b45 100644
--- a/net/tap-win32.c
+++ b/net/tap-win32.c
@@ -30,6 +30,7 @@
 
 #include "qemu-common.h"
 #include "net.h"
+#include "net/clients.h"
 #include "sysemu.h"
 #include "qemu-error.h"
 #include <stdio.h>
-- 
1.7.2.5


