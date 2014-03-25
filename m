Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WSXvl-0002PB-1G
	for mharc-qemu-trivial@gnu.org; Tue, 25 Mar 2014 16:26:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WSXva-0002AU-GV
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 16:26:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WSXvR-0002SA-Sg
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 16:26:30 -0400
Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236]:65522)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>)
	id 1WSXvA-0002N1-IO; Tue, 25 Mar 2014 16:26:04 -0400
Received: by mail-pb0-f54.google.com with SMTP id ma3so954917pbc.13
	for <multiple recipients>; Tue, 25 Mar 2014 13:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QeO5D1GvxVbxuYJWW8GC30gaNnWmvnh5pa/Z/BFQB80=;
	b=bFr0YTEdvetL6lCSaRmvWD6Uw2DJRKw4ThPoFPc2vB77f2h98x1YoI0AX2FmX/NWct
	tOAh1X62doU2duKX3o5SBeIp8aPVW/MUW6pMc2kLXgN3BUqzY0JhZ8c8XdgCByDJs/2F
	fugSK+B49CeNr7Bi2BdFrjL1d4+oKu+HLZ/im1IVW1zLW055IdVT0oF34DpHqcS+/uzg
	UsyiU6OSFOY8ydiFsHymqX8v7RKZUsy+8F4VV5kWWDEMV8sGygrADiFzr2L37I5iw3Vr
	n050WBNUsBGx5/qHr/BmaeSIHLw/N4sWIVfi2gp7L6NdRBG0GfDJYbPGNhQ5Met7gb8F
	j4uw==
X-Received: by 10.69.17.230 with SMTP id gh6mr40328484pbd.0.1395779162951;
	Tue, 25 Mar 2014 13:26:02 -0700 (PDT)
Received: from prasad-desktop ([117.195.17.216])
	by mx.google.com with ESMTPSA id
	ha11sm48587447pbd.17.2014.03.25.13.25.58 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Mar 2014 13:26:01 -0700 (PDT)
Received: by prasad-desktop (Postfix, from userid 1000)
	id 90768A008F3; Wed, 26 Mar 2014 01:55:54 +0530 (IST)
From: Prasad Joshi <prasadjoshi.linux@gmail.com>
To: prasadjoshi.linux@gmail.com
Date: Wed, 26 Mar 2014 01:55:53 +0530
Message-Id: <1395779153-4536-1-git-send-email-prasadjoshi.linux@gmail.com>
X-Mailer: git-send-email 1.8.1.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::236
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, pl@kamp.de,
	qemu-devel@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com,
	eblake@redhat.com
Subject: [Qemu-trivial] [PATCH] qemu-img: Release refernece to
	BlockDriverState
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
X-List-Received-Date: Tue, 25 Mar 2014 20:26:39 -0000

Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
---
 qemu-img.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qemu-img.c b/qemu-img.c
index 2e40cc1..3d110d9 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1809,6 +1809,7 @@ static ImageInfoList *collect_image_info_list(const char *filename,
         if (err) {
             error_report("%s", error_get_pretty(err));
             error_free(err);
+            bdrv_unref(bs);
             goto err;
         }
 
-- 
1.8.1.2


