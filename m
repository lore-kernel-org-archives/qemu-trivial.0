Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBR9-0004wD-K9
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:15:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBR7-0004td-9M
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:15:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBR6-0002gn-Gp
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:15:57 -0400
Received: from mail-qt0-x234.google.com ([2607:f8b0:400d:c0d::234]:46274)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBR1-0002cN-P1; Sun, 10 Jun 2018 21:15:51 -0400
Received: by mail-qt0-x234.google.com with SMTP id h5-v6so18821133qtm.13;
	Sun, 10 Jun 2018 18:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=E70dtblfVfhO6wmbl0ejCoJouwpMVSuWo7ui6CXQ6Ro=;
	b=SyhwJbarnNK7TfrurWE+7kX0rrWFtMZ6D1Nq9s8vMG85nEtSXWEOBX7r17L1VKsN5x
	Zm8lA9Aps2c/XEdYtQI8fvwiIeskbgju4CjU8Nkfjpzi8GahYpf17uk4VTML5t6hHReY
	+QkNAqiwhOhTE50IkLCiVKzBN5l5WFXw35SYtu7GWugz1rU5F7rzQuzkab+wm4559Jfe
	SQ5XCSuNCco8QS55h3l5ar8RBo295zf0sSFrM5L+jFoXoIDHQYxNg9Ggrsd1tW1UZxIz
	kWvDX1eC1+ILwGMwoc5GZdxfKIddMvotGeu4mglaDVBiTnigiVz6eD9wz4Ujoym/otmI
	p8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=E70dtblfVfhO6wmbl0ejCoJouwpMVSuWo7ui6CXQ6Ro=;
	b=hd78eR3t57qMng0bIq/GbQLYjpFZKw9WIlDQf5kxcUw6Sdnlycm+qLKCnq/dclZl9G
	C2nDo/ePtQsnTgiHpPSbNf+fKp7+C/D3VVqafUKSkukaNLRStPIZ+pHsjlMu6Tgy9I0m
	y5FbUFtRYDf2TbNGSAhnWSVxvLYWuceFjIOcn7hwxwjvIvk3byVPaOxqy8sTEBLoMDiW
	mglCISTPcN85vwK37YKt8vpac5Foa8YNr8IJBBrmigjoBCfa8fzSH8jyK6kczjAoHhru
	e0FxRMYprgLld4jD2FR2sKPdeYsQq3X2jB7r4yy+ocRJbOOnhKaMBoEYjaCof/L2NwNz
	soSA==
X-Gm-Message-State: APt69E1SXk8LBC4Ih1cf+b+64NFUJkhtPHfTnYCi8lgsH2nWkyy5Wwni
	9Raqv8Ru8b8q/WPipGxk8lYIXKg2
X-Google-Smtp-Source: ADUXVKI7x1Kch2Hr9s3HAWnGNJBQl778n2sPG6qpXbDyIrhbdm7GRnhNsRJwY5yGNddRHU984jcQHg==
X-Received: by 2002:aed:3541:: with SMTP id
	b1-v6mr14267015qte.68.1528679751315; 
	Sun, 10 Jun 2018 18:15:51 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.15.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:15:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun, 10 Jun 2018 22:14:28 -0300
Message-Id: <20180611011501.10235-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::234
Subject: [Qemu-trivial] [PATCH v4 07/40] hw/ivshmem: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 01:15:58 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/misc/ivshmem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 16f03701b7..9a9f990867 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -17,6 +17,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "hw/hw.h"
@@ -1302,7 +1303,7 @@ static void ivshmem_realize(PCIDevice *dev, Error **errp)
     }
 
     if (s->sizearg == NULL) {
-        s->legacy_size = 4 << 20; /* 4 MB default */
+        s->legacy_size = 4 * MiB; /* 4 MB default */
     } else {
         int ret;
         uint64_t size;
-- 
2.17.1


