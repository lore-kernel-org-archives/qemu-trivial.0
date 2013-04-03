Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UNF3X-0007Sz-Iv
	for mharc-qemu-trivial@gnu.org; Wed, 03 Apr 2013 00:12:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF3U-0007Og-Ek
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:12:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF3T-00080B-2L
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:12:12 -0400
Received: from mail-pb0-f54.google.com ([209.85.160.54]:54728)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UNF3S-0007zz-T1
	for qemu-trivial@nongnu.org; Wed, 03 Apr 2013 00:12:10 -0400
Received: by mail-pb0-f54.google.com with SMTP id xa7so617636pbc.13
	for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2013 21:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=qXM1Wy/qFhIGW2X260FSa02TF81vb3H+F2SYFAp49hU=;
	b=DgY2wwll9kJMNZgu6lSPvRhTLpAKAZzw9vDwP9oB3RiPs9rrhNF49kghFcD/tzNZHl
	vERSLyqJJuCEEa3rDinhRybEHJxO6Q0Xax5wKC5iynM2eKAXTet2n/8JXPg/Zlqcsqqx
	i9mBpBqvDA88MwN+Y2Ge3x95+6cs+tyftpeQPMJWELKM3av+pkRQ2Q9TDlVBemP9W0c7
	XOrLtuqotpqPKFaKA2Mw3rJc7Q1/FsvbEy9sm+zz/N+kHU3cnHlUqL3V/8gt9tdxh/Dp
	ctwvQgsCLqVVF1Ky5A81Yw5Mm7y2hNF+swSh4q2RSoA8rgM6XrQ3G5gvuD5Zd3wO2iK5
	KyDw==
X-Received: by 10.66.102.98 with SMTP id fn2mr767490pab.192.1364962330287;
	Tue, 02 Apr 2013 21:12:10 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id cy4sm4259634pbc.13.2013.04.02.21.12.07
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 21:12:09 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Wed,  3 Apr 2013 14:09:19 +1000
Message-Id: <85c9e7a919a37a94fd01c5165aa20849c08530cc.1364961975.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
References: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
References: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQnHmAGo33wL6KP+4gmUBwVWLdMYvArAQQyTTfO70cAXSfROkatxQt2CiFo7F/zV9bb+WDxE
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.54
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v1 4/4] m25p80: Add debug message for no bdrv
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
X-List-Received-Date: Wed, 03 Apr 2013 04:12:14 -0000

If there is no backing bdrv, let the debugging developer know about it.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/hw/m25p80.c b/hw/m25p80.c
index f8aa0e9..812cae0 100644
--- a/hw/m25p80.c
+++ b/hw/m25p80.c
@@ -605,6 +605,7 @@ static int m25p80_init(SSISlave *ss)
             return 1;
         }
     } else {
+        DB_PRINT_L(0, "No BDRV - binding to RAM\n");
         memset(s->storage, 0xFF, s->size);
     }
 
-- 
1.7.0.4


