Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XUizC-0006en-3g
	for mharc-qemu-trivial@gnu.org; Thu, 18 Sep 2014 17:11:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <adelinatuvenie@gmail.com>) id 1XUdTo-0003gr-OB
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 11:18:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <adelinatuvenie@gmail.com>) id 1XUdTi-0006c2-5v
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 11:18:44 -0400
Received: from mail-we0-x22f.google.com ([2a00:1450:400c:c03::22f]:44919)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <adelinatuvenie@gmail.com>) id 1XUdTh-0006b3-VW
	for qemu-trivial@nongnu.org; Thu, 18 Sep 2014 11:18:38 -0400
Received: by mail-we0-f175.google.com with SMTP id w61so1097324wes.34
	for <qemu-trivial@nongnu.org>; Thu, 18 Sep 2014 08:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type;
	bh=5mO2zyBOoW7+hQPxg1W0c/jmz4GAYWrWXf7X4tJuDxE=;
	b=cE3zeFPJAy4l9Kg7qDn5vb/yiaaMDBFAZfQii7DUuP8nJUqS+ZsNneEcQ9YK4VYP/Z
	E41RnEgik1HcU1kQjUSTSovcQ995NES2ajBEBh5mo5/XRUd/jBubcgmIBnXE6ziOf9tT
	biAmwv9cl6/SU4YnTFq+nykws6/ZyK+lqR2FYWIAUZjywhu0SwJQGNGdYZ5H7BDp/hku
	llJ659pPSE/hffUn8HQBEBuTKNtcww18JgtOJqwvoEL1ZUZnXjsFr5x0zltZT7xaw2O/
	npuGr0oEeytb/SJLD8X73IsybniA8coGrs80qxQXHed+UvxRhjK3wAmdQR6fgqhgDjCo
	dJdg==
X-Received: by 10.180.105.41 with SMTP id gj9mr2365585wib.3.1411053512219;
	Thu, 18 Sep 2014 08:18:32 -0700 (PDT)
Received: from localhost.localdomain ([89.46.161.178])
	by mx.google.com with ESMTPSA id ec2sm3321441wib.19.2014.09.18.08.18.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Sep 2014 08:18:31 -0700 (PDT)
From: Adelina Tuvenie <adelinatuvenie@gmail.com>
X-Google-Original-From: Adelina Tuvenie <atuvenie@cloudbasesolutions.com>
To: qemu-trivial@nongnu.org
Date: Thu, 18 Sep 2014 18:17:44 +0300
Message-Id: <1411053464-12666-2-git-send-email-atuvenie@cloudbasesolutions.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1411053464-12666-1-git-send-email-atuvenie@cloudbasesolutions.com>
References: <1411053464-12666-1-git-send-email-atuvenie@cloudbasesolutions.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------1.9.1"
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22f
X-Mailman-Approved-At: Thu, 18 Sep 2014 17:11:28 -0400
Cc: Adelina Tuvenie <atuvenie@cloudbasesolutions.com>, aliguori@us.ibm.com
Subject: [Qemu-trivial] [PATCH 1/1] qemu-img: Cannot create fixed vhdx image
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
X-List-Received-Date: Thu, 18 Sep 2014 15:18:50 -0000

This is a multi-part message in MIME format.
--------------1.9.1
Content-Type: text/plain; charset=UTF-8; format=fixed
Content-Transfer-Encoding: 8bit


When trying to create a fixed vhd image qemu-img will return the
following error:

qemu-img: test.vhdx: Could not create image: Cannot allocate memory

This happens because of a incorrect check in vhdx.c. Specifficaly,
in vhdx_create_bat(), after allocating memory for the BAT entry,
there is a check to determine if the allocation was unsuccsessful.
The error comes from the fact that it checks if s->bat isn't NULL,
which is true in case of succsessful allocation,  and exits with
error ENOMEM.

Signed-off-by: Adelina Tuvenie <atuvenie@cloudbasesolutions.com>
---
 block/vhdx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


--------------1.9.1
Content-Type: text/x-patch; name="0001-qemu-img-Cannot-create-fixed-vhdx-image.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline; filename="0001-qemu-img-Cannot-create-fixed-vhdx-image.patch"

diff --git a/block/vhdx.c b/block/vhdx.c
index 796b7bd..5bf292e 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1593,7 +1593,7 @@ static int vhdx_create_bat(BlockDriverState *bs, BDRVVHDXState *s,
                 bdrv_has_zero_init(bs) == 0) {
         /* for a fixed file, the default BAT entry is not zero */
         s->bat = g_try_malloc0(length);
-        if (length && s->bat != NULL) {
+        if (length && s->bat == NULL) {
             ret = -ENOMEM;
             goto exit;
         }

--------------1.9.1--



