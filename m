Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WHZhE-0000Fg-5z
	for mharc-qemu-trivial@gnu.org; Sun, 23 Feb 2014 09:06:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WHZh5-0008BO-Mh
	for qemu-trivial@nongnu.org; Sun, 23 Feb 2014 09:06:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WHZgz-0005Yg-SF
	for qemu-trivial@nongnu.org; Sun, 23 Feb 2014 09:06:11 -0500
Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b]:36684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WHZgn-0005XF-V0; Sun, 23 Feb 2014 09:05:54 -0500
Received: by mail-pd0-f171.google.com with SMTP id g10so5206605pdj.30
	for <multiple recipients>; Sun, 23 Feb 2014 06:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=asXj50yESmDWpggqI4R/sxg1nm9Iicr+AMKnoe/4gJI=;
	b=sNSAB3i8I2lRzqAHexswGPc1TDLJAYQP5MbxKuLNVF0NrxDJdEJ+n47GjfJX2jzYdw
	d4IwHxPObUaZhziGbxYnSf+MhTfwL9FMKgzfcTjoBTfU7+AoQuoky2S0jkf6CCpakyTN
	man7RyGFkcx2dzBD/kTQBDHvyLnN6meT4OtALbY1/58VsRVdVyenksEk20hs85zOzBFu
	cbJO9G4yf5RsodASjNpfqFbN8/FiCQSufTdhgkqmJLFFbNXc1wqWYqHzMVzM7jcZIcCW
	R4HEDSY+LBMgyfK4xzsW/1xKkfopSqcczYwByilCGJ3iWltGy0RwswTREeRZYU7CeoJA
	0F2w==
X-Received: by 10.67.3.68 with SMTP id bu4mr19487444pad.144.1393164352220;
	Sun, 23 Feb 2014 06:05:52 -0800 (PST)
Received: from localhost.localdomain ([41.109.154.83])
	by mx.google.com with ESMTPSA id
	vn10sm40526164pbc.21.2014.02.23.06.05.49 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 06:05:51 -0800 (PST)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 23 Feb 2014 15:05:41 +0100
Message-Id: <1393164341-7196-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22b
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] balloon: Fix device name in error message.
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
X-List-Received-Date: Sun, 23 Feb 2014 14:06:17 -0000

Also fix trailing whitespace.

Signed-off-by: Hani Benhabiles <hani@linux.com>
---
 balloon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/balloon.c b/balloon.c
index e321f2c..b66710a 100644
--- a/balloon.c
+++ b/balloon.c
@@ -125,8 +125,8 @@ void qmp_balloon(int64_t value, Error **errp)
         error_set(errp, QERR_INVALID_PARAMETER_VALUE, "target", "a size");
         return;
     }
-    
+
     if (qemu_balloon(value) == 0) {
-        error_set(errp, QERR_DEVICE_NOT_ACTIVE, "balloon");
+        error_set(errp, QERR_DEVICE_NOT_ACTIVE, "virtio-balloon-pci");
     }
 }
-- 
1.8.3.2


