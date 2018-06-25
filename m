Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQps-0000um-34
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:43:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQpq-0000sk-8q
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQpp-0007RG-Ds
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:43:10 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:43531)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQpn-0007QR-JI; Mon, 25 Jun 2018 08:43:07 -0400
Received: by mail-qt0-x241.google.com with SMTP id y89-v6so11726247qtd.10;
	Mon, 25 Jun 2018 05:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/uhxOdbA+vgV5vCA97X72xVbXYK5Fo2EDSVbEPo8dWg=;
	b=RwklFawJiyk5buTMG40SZs9/tgIgRa2E+1e9W8ULAiAG66nM32WcP1gc+7Di5Yp92G
	R1bwWRoQHjuqx0Cvh97PE7watYEBJBsM3BgBnp0sO/NS/wcY0NP9JmTzKIr5gyLZiCQY
	AOADc15a44YFZytlDFTXnrJVCHLPo3a0RBRDY+cjheCXHr56OtY4IIY27F/ZvvCyWxGG
	QzB0fU4PgTZFQnWLhHBqOgUDPeGL/PyTL82bdd4oc4kNcdzlateNFSPZPRa6gfuaVDxi
	uW9JyLDYFhdC08a/Tbe5spVFZirWHg9UhSJMOx7LrFqlyn6weGt+p+7H638Akdb+wh++
	OEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/uhxOdbA+vgV5vCA97X72xVbXYK5Fo2EDSVbEPo8dWg=;
	b=o78gBuiZYK8REoyRB7BzLDeN7KgXwmAS+1A4JSbGIFtND4tgXoGWo4hmXPWIhjkgQz
	4nKWx4WJ4KMIU9nKBcAIeGvZ05M/F7Ht+8WIJUX/Rh69JS0ecwBzxmPrO+w9pgM3HGvJ
	liJpRTgjyyX4sSitDi484BzcYU6RM9AiT+MBt5ECxZW0OtUKJ4kocABXrtC4Dr/1gIyA
	wL3iQV5JszkdWDHoKdIkPxzm84R8TK0ruIipGtKvptxV2gTAYZNhl7FHE6FKbz+HSaqH
	rTDOSAb/A9gifC7fzCMr500Hk6CDj76X5hfTExYxcptEeJOEVoD/h49YGx8ulfBbA3GE
	+9Tg==
X-Gm-Message-State: APt69E0Ij6ADUE1jXcNv0Ofaa1qViuyz/zAq3/M93SFpW+r9d2prnCu+
	mquK3/pHBietj66LhqHU2IY=
X-Google-Smtp-Source: AAOMgpf2LggXBLrLvXgDgAf4kJKdlu/ak7i+GVK0YBzZPasIoxNof7sqSidljSA4AD0hLKnA32HcSw==
X-Received: by 2002:a0c:b311:: with SMTP id
	s17-v6mr3902475qve.243.1529930587025; 
	Mon, 25 Jun 2018 05:43:07 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.43.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:43:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:VDI)
Date: Mon, 25 Jun 2018 09:41:54 -0300
Message-Id: <20180625124238.25339-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v5 02/46] vdi: Use definitions from
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
X-List-Received-Date: Mon, 25 Jun 2018 12:43:11 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
---
 block/vdi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/block/vdi.c b/block/vdi.c
index 1d8ed67dbf..6555cffb88 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -50,6 +50,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qapi-visit-block-core.h"
@@ -83,9 +84,6 @@
 /* Command line option for static images. */
 #define BLOCK_OPT_STATIC "static"
 
-#define KiB     1024
-#define MiB     (KiB * KiB)
-
 #define SECTOR_SIZE 512
 #define DEFAULT_CLUSTER_SIZE (1 * MiB)
 
@@ -434,7 +432,8 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     } else if (header.block_size != DEFAULT_CLUSTER_SIZE) {
         error_setg(errp, "unsupported VDI image (block size %" PRIu32
-                   " is not %u)", header.block_size, DEFAULT_CLUSTER_SIZE);
+                         " is not %" PRIu64 ")",
+                   header.block_size, DEFAULT_CLUSTER_SIZE);
         ret = -ENOTSUP;
         goto fail;
     } else if (header.disk_size >
-- 
2.18.0


