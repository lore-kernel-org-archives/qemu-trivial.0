Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XCeHu-0002BV-Ay
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jul 2014 20:32:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XCeHm-000290-Ae
	for qemu-trivial@nongnu.org; Wed, 30 Jul 2014 20:32:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XCeHg-0006Su-26
	for qemu-trivial@nongnu.org; Wed, 30 Jul 2014 20:31:58 -0400
Received: from mail-pd0-f175.google.com ([209.85.192.175]:48926)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XCeHf-0006Se-T7
	for qemu-trivial@nongnu.org; Wed, 30 Jul 2014 20:31:51 -0400
Received: by mail-pd0-f175.google.com with SMTP id r10so2374840pdi.34
	for <qemu-trivial@nongnu.org>; Wed, 30 Jul 2014 17:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=8ibjZnpSAAFfC0WiR9hqU8sFCOgOch8P3LwT60rzxG8=;
	b=Xi4d0dJWhtCIuKx4QLzfmZY6RcNpp3Yhebc1+ua2khXDqLm1acGHlTpU2N/iGwdDPA
	BLreNum2fY5Ki/ZL0QQcuj5e/irBaJi65GAzGn1RcOFAX0kSVyH1pgORx7rH+UiAUorn
	it7bhoerAA/u32yBWIWrcL4ONhDbWCb1+S87kLA5/6ZJT+ti6x1b364Pyi096EICGQ97
	xvp4R4Sxefzbx3WZhcEhXqBz+q4eiYiVJhQEhRoBsvoj2DP/qbrjekdhY3MorYk2rZgK
	LY0X2a671ANj0AN4Msuu7nMP53uD6gSoRzkTJSUXXoRi5PntXa6q/hFb9+8ZY4NSSEvw
	d64Q==
X-Gm-Message-State: ALoCoQnrw54IHQ7ub42O7lBilEoOJMyW+n4nls3kYHFt7y2coLFijKbf8/RBa48WjRS+BCMOsD7C
X-Received: by 10.70.36.135 with SMTP id q7mr8513090pdj.79.1406766710107;
	Wed, 30 Jul 2014 17:31:50 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPSA id mj9sm5465496pdb.44.2014.07.30.17.31.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Jul 2014 17:31:49 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Wed, 30 Jul 2014 17:31:18 -0700
Message-Id: <fcfc06335c0f3eaecacd2ac8396c232142ff4774.1406707320.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 2.0.1.1.gfbfc394
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.175
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v1 1/1] hexdump: Add null guard on output
	file.
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
X-List-Received-Date: Thu, 31 Jul 2014 00:32:04 -0000

To avoid callsites with optional output having to NULL guard.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
Noting in-tree is affected by this yet, but I though I'd get this
out of the way straight-up rather than elongate other series.

 util/hexdump.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/util/hexdump.c b/util/hexdump.c
index 969b340..b607236 100644
--- a/util/hexdump.c
+++ b/util/hexdump.c
@@ -19,6 +19,9 @@ void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t size)
 {
     unsigned int b;
 
+    if (!fp) {
+        return;
+    }
     for (b = 0; b < size; b++) {
         if ((b % 16) == 0) {
             fprintf(fp, "%s: %04x:", prefix, b);
-- 
2.0.1.1.gfbfc394


