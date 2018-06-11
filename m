Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBSA-0005oY-Tr
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:17:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBS8-0005mU-SY
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBS8-0003LN-2H
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:00 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:36654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBS4-0003Ju-Jc; Sun, 10 Jun 2018 21:16:56 -0400
Received: by mail-qt0-x231.google.com with SMTP id o9-v6so18851900qtp.3;
	Sun, 10 Jun 2018 18:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2779Hd17IuJPuKOkYEf9nnwvCJwDv36V8Dy+I1+c9rU=;
	b=UwpNcjHoi2NlLXL0oSAtpaLgGAxIcEsVloxkYWUN2nrgqSWgMtt8BVTky7sbX0kzD0
	wnkohRtlqsfzQ/jBgqkyDJAmjEC9nnbIFw+5bFPatGkaIWt2fKAZ+9vZwIhPxEsk664K
	+6yXJxxggFuVwXiF2XvQW9g/uR3yXPokeWhqYxo+Q1/Ifl+TfHJ7971v2PFJ6bRh4VMw
	6khH28ZVcmdMbC04VlsbKO5ZPokLtdAa/5VrOZJD1fDCM4qJXYiCT/dhn2QkJMmNJJ+A
	7x1NS59S0zK3Lpe6+OGuEHo5WSb+qSUnDVilt1ZqFuj2BZpgUh/VDfF86XbucqCMPQWj
	Yp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2779Hd17IuJPuKOkYEf9nnwvCJwDv36V8Dy+I1+c9rU=;
	b=ac+1C1sdaiwTESSJFGFszQg+qik3+FSi9N0yfr1hsjkTAuoJk0+T/V+HkgdIogW03i
	RUncYDqV3IcA3HbckAinob1Xzle9s3Unbbeig0iT4JKVkR6t6LLumWX2FmbE/NdprpXN
	EmYVoGn4Ffw7f4evm/G71GJTeAw+U4xsIcZUHDJAsZpmoiaoPQat5YnQuX5bKeuJuyZS
	B/IVC5J8cTtUqfcU0IjAoK4XAd4sHWHQuVWsr4O/uxvC3pc7M57iPIrYDJM8aNYOVWw0
	9MboPluP+YzCJyuW9d1ogcL9LoVW22GgQhulf4loecN6GugPhBdE7xtk/Ko9wB4jx3EK
	5drA==
X-Gm-Message-State: APt69E0hw4XLzLXSfYpio/Grx9UkqpOl3hlFwdwYyzAnHfJYo4zZcoQA
	uUnSo9MdewdVeQAxFFueyYk=
X-Google-Smtp-Source: ADUXVKKslPrsUa3V/hRwdhzChJZkXUGzYyuqFNiLBHU2VJaGeKm5A9joUly8j0W/G19fEIlnXaPl3Q==
X-Received: by 2002:aed:22ae:: with SMTP id
	p43-v6mr14513247qtc.200.1528679816144; 
	Sun, 10 Jun 2018 18:16:56 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.16.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:16:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Sun, 10 Jun 2018 22:14:47 -0300
Message-Id: <20180611011501.10235-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: [Qemu-trivial] [PATCH v4 26/40] hw/cris: Use the IEC binary prefix
 definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 01:17:01 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/cris/axis_dev88.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index 56ee398ee5..191292eebf 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -242,7 +243,7 @@ static const MemoryRegionOps gpio_ops = {
     },
 };
 
-#define INTMEM_SIZE (128 * 1024)
+#define INTMEM_SIZE (128 * KiB)
 
 static struct cris_load_info li;
 
-- 
2.17.1


