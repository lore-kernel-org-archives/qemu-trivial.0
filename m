Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYt0N-0006Fx-R8
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2012 01:32:51 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1TYt0I-0006Dq-Uy
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 01:32:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1TYt0F-0008RP-IS
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 01:32:46 -0500
Received: from mail-pa0-f45.google.com ([209.85.220.45]:50949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1TYt0F-0008Qx-CN
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 01:32:43 -0500
Received: by mail-pa0-f45.google.com with SMTP id fb10so834409pad.4
	for <qemu-trivial@nongnu.org>; Wed, 14 Nov 2012 22:32:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=e/spYbE6JXpgTr6rorz8ReW1+4Q5DbsK/34952FyAVk=;
	b=NtzCrKLmMal073MvQKVv3eENvLDnZEnNO1ewNmK4yKoARQ7bRXfa1UD6MZoF4zgAY4
	9r98ReruD4ikKQ2xeBISgqI4y9qXZnVXsaJrCWKen+Mlchc7jV1H2ykp7dk5Na71Vgwi
	eqbpJUVLhGcapzhCT1aqnFdEdISDya2Umeb59zfXoeXL72CSSr6cq0K1B7C/ghIH+jld
	yY0VOxvpAvmQZlb056ZxABzshcWg72UhOTnmKMsLhb1khyyFegIfjSjvMUs+0ej6AeHG
	kj/kdpn4of8Au0KQQlVjccbfUko4e0iSIFiAA3UX5H5eZgXD1lkzn2RYb4M7sjVpmIyM
	DHpQ==
Received: by 10.66.87.163 with SMTP id az3mr322797pab.62.1352961162205;
	Wed, 14 Nov 2012 22:32:42 -0800 (PST)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id mn5sm9018440pbc.12.2012.11.14.22.32.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Nov 2012 22:32:41 -0800 (PST)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2012 16:32:53 +1000
Message-Id: <1352961173-16498-1-git-send-email-peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
X-Gm-Message-State: ALoCoQm3wb8VDjD6qZpa9LrPztbkk4+75uE4E8pw88Su1tSxZWn+SW3etjfavgDTYuoPuZjfaO89
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.45
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH] sd: Send debug printfery to stderr not stdout
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
X-List-Received-Date: Thu, 15 Nov 2012 06:32:50 -0000

Some debug printfs for SD are coming up in stdout. Redirected them to stderr
instead.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
 hw/sd.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd.c b/hw/sd.c
index 3c34d43..607edba 100644
--- a/hw/sd.c
+++ b/hw/sd.c
@@ -1439,8 +1439,8 @@ send_response:
         int i;
         DPRINTF("Response:");
         for (i = 0; i < rsplen; i++)
-            printf(" %02x", response[i]);
-        printf(" state %d\n", sd->state);
+            fprintf(stderr, " %02x", response[i]);
+        fprintf(stderr, " state %d\n", sd->state);
     } else {
         DPRINTF("No response %d\n", sd->state);
     }
-- 
1.7.0.4


