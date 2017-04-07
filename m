Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cwcG7-00089q-3Z
	for mharc-qemu-trivial@gnu.org; Fri, 07 Apr 2017 18:21:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwcG3-00086W-Q8
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 18:21:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwcG2-00056v-TK
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 18:21:31 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34306)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwcFz-00055Q-4Y; Fri, 07 Apr 2017 18:21:27 -0400
Received: by mail-qk0-x244.google.com with SMTP id p68so11961435qke.1;
	Fri, 07 Apr 2017 15:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=b0Zx4R2huULvyqsmzKH8JZcKV7QLs3Zq9TqOuJkiEjE=;
	b=rg+6fIT1Fi+dDhgvBCyVZvR0MLQaP14FpqiQJtN0F/JoIX3Usaiz5kqgZorKbGus0Z
	ApJBlT+GhZKZJ7ONWBDk+XifVs7nRdzVbH4ScRYK2nKBr4oC4h/yELmr0dMM82KR+6sV
	ir2/M5/ZeWIz7oYyEA8j8z/gcqkVzWPtQKmxQ1zYVsY9xYVOttuYDbiHkLNsRh9B8EuD
	1NoNJ2Seb0vpZmdwkS2xSNjbcQJ09GDz2UGy0PXxNp9n/aqcyRwl8yPzxyjZYOZzOTz4
	kf5SE2nqGg4PXalvIP7RfVu6datjzDXKSbcy5pfDDht1YDKrqSKFcj/+0zHt5l/DmkGb
	abBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=b0Zx4R2huULvyqsmzKH8JZcKV7QLs3Zq9TqOuJkiEjE=;
	b=k5N/YAgp9FkvUlZguC0K53u/HgJrNyCeW1/8FN/TIfSo8qRY+SgCMjDNFHPJVHF4sB
	oiuY/NnHeVfC0laSTcb6/r6BNOVdrWS8dSBAey3CTHtiOOKtmxPh+hytWm9A/JJvD7j4
	QpFsT0KHp+Q9OGFGI+v0zsSsEXs6lYYp8XttbJpG+Xnc/XpAwWNSM2NxrJNdY2prjvq3
	Zi12wxew2tU2F2DYUT9NIT0eCeWqXHRS7RrAxODWxqv90V6thzKSh6h5TOF1G5ZbCwS0
	PnSZaYhtfIu1DKgjkPzrZNrcQscC47Onoon8MpkCH7ertBKtTnlExDPGHf5Jc54JQhEi
	WTVw==
X-Gm-Message-State: AFeK/H3FBo6PQ0WNLYrxvp7vXAEeX3fXxEeTo/D6PHVz3tuWO2nIVrdQYQAYZ3DxSXp+og==
X-Received: by 10.233.239.19 with SMTP id d19mr29791783qkg.256.1491603686574; 
	Fri, 07 Apr 2017 15:21:26 -0700 (PDT)
Received: from yoga.lan ([138.117.48.226]) by smtp.gmail.com with ESMTPSA id
	d133sm1442146qke.9.2017.04.07.15.21.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Apr 2017 15:21:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  7 Apr 2017 19:20:15 -0300
Message-Id: <20170407222016.15308-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170407222016.15308-1-f4bug@amsat.org>
References: <20170407222016.15308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v2 3/4] qga: fix compiler warnings (clang 5)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Apr 2017 22:21:33 -0000

static code analyzer complain:

qga/commands-posix.c:2127:9: warning: Null pointer passed as an argument to a 'nonnull' parameter
        closedir(dp);
        ^~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-posix.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 915df9ed90..fc45102a1e 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2124,9 +2124,11 @@ static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool sys2memblk,
          * we think this VM does not support online/offline memory block,
          * any other solution?
          */
-        if (!dp && errno == ENOENT) {
-            result->response =
-                GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
+        if (!dp) {
+            if (errno == ENOENT) {
+                result->response =
+                    GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
+            }
             goto out1;
         }
         closedir(dp);
-- 
2.11.0


