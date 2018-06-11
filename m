Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBQq-0004ce-Gm
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:15:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQj-0004XT-Tu
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:15:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQi-0002MK-PS
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:15:33 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:44980)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBQg-0002KS-K4; Sun, 10 Jun 2018 21:15:30 -0400
Received: by mail-qt0-x243.google.com with SMTP id l33-v6so18850133qta.11;
	Sun, 10 Jun 2018 18:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pB9xotNj0vNTTfKJzkMDjEv63Jk1EugwaLjez3Mksuw=;
	b=l+8/L9wehIomXazz1uR7sbrvs2YDFRwImBAhPKqSJSlnK8IJXQ8sQyF5RCC018KhEc
	3Z1Z+LOQ75Dj+ifXP2WnCUpqssPWSZOAJT6OucqrlaF8Z78nkSnnocMYHTuHxFAyEF6Z
	A/R3M06bxrJbvaVIWkDksWbzyLGis4Y89Eh+Ffcl6ZZBvIo/LyzSrOLOfm4VrYIUWHR1
	esyNrXRTJeCAKEUqKbC85i2fzBA2QFF0z4jGSkYTI6E6ZygjUfy8QXISeLN+7zSn3RDC
	OvPbS1AQg5H9lZFeHOa2YjCZU0zLORW80Pzus+fqm+DFUOvu7j7VexuI6hj+RjwLta1z
	EbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pB9xotNj0vNTTfKJzkMDjEv63Jk1EugwaLjez3Mksuw=;
	b=WD1hB1xbtVU27HKY8d12k24ZOiksdi1Dam0DjARcsxneo3P6HFqvAz+NqJRsbimAKp
	rKx4dXB1ElyGln0TvM7hSsptX5L5v0YgVvMGlGrFZxq9CLg4qWxuvKLmDcpmCLYtSzBG
	bwl6zFj0mL6hZl+l28rsKFITEnOiXOrasMb7lpA7u9T2LJIQ3+CV3igZ0bWEOdet26Xd
	blQu3SpW9yYjn1MiFCZn97xdcjho/2XZ/ncZp6X1zvP2wsHq+NtTuabeFUSYpp8r+P98
	z8Zl8MtnP/Gaj3ZHW8JWDlFjtUJGZJns7qRcewkQyZMIEsr5JOdr6GeCbTegDTvevFTh
	bLAg==
X-Gm-Message-State: APt69E33WkdTai55M4uMSeXf2ucUu60VauKoCgqQ+2TF+3JPMIYhhoRv
	BDATuLRTfHTMIbRg0oNW1Js=
X-Google-Smtp-Source: ADUXVKJHyot0Z448n5qmVdO8tabR3V9omIW6tOq4B2L53275jzNpvjAhVh+A7ZHNny04Yl6Rbq/43Q==
X-Received: by 2002:a0c:96ed:: with SMTP id
	b42-v6mr13447558qvd.135.1528679730186; 
	Sun, 10 Jun 2018 18:15:30 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.15.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:15:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:VDI)
Date: Sun, 10 Jun 2018 22:14:23 -0300
Message-Id: <20180611011501.10235-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v4 02/40] vdi: Use definitions from
 "qemu/units.h"
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
X-List-Received-Date: Mon, 11 Jun 2018 01:15:37 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/vdi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/block/vdi.c b/block/vdi.c
index 668af0a828..35b51dc5c5 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -50,6 +50,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qobject-input-visitor.h"
@@ -83,9 +84,6 @@
 /* Command line option for static images. */
 #define BLOCK_OPT_STATIC "static"
 
-#define KiB     1024
-#define MiB     (KiB * KiB)
-
 #define SECTOR_SIZE 512
 #define DEFAULT_CLUSTER_SIZE (1 * MiB)
 
@@ -250,7 +248,7 @@ static void vdi_header_print(VdiHeader *header)
     logout("heads       0x%04x\n", header->heads);
     logout("sectors     0x%04x\n", header->sectors);
     logout("sector size 0x%04x\n", header->sector_size);
-    logout("image size  0x%" PRIx64 " B (%" PRIu64 " MiB)\n",
+    logout("image size  0x%" PRIx64 " B (%llu MiB)\n",
            header->disk_size, header->disk_size / MiB);
     logout("block size  0x%04x\n", header->block_size);
     logout("block extra 0x%04x\n", header->block_extra);
@@ -434,7 +432,7 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     } else if (header.block_size != DEFAULT_CLUSTER_SIZE) {
         error_setg(errp, "unsupported VDI image (block size %" PRIu32
-                   " is not %u)", header.block_size, DEFAULT_CLUSTER_SIZE);
+                   " is not %llu)", header.block_size, DEFAULT_CLUSTER_SIZE);
         ret = -ENOTSUP;
         goto fail;
     } else if (header.disk_size >
-- 
2.17.1


