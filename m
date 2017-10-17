Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0C-0001m7-IV
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V08-0001h7-BH
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V07-0003Ge-Mc
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:56 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:44429)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V00-0003CY-8R; Tue, 17 Oct 2017 12:45:48 -0400
Received: by mail-qk0-x244.google.com with SMTP id r64so2845432qkc.1;
	Tue, 17 Oct 2017 09:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gHdLRvpDVFNy+qKKL3ixK7mNa6loNMIqjMR1Oh9hAEY=;
	b=i1H44hC723aEbE9wF5mdlnt5UVupndXTs6JaXwCyAmQFVcQvfd7GOjyEbnNdtxsQwd
	Cw6LG/pHIWgMMKHqOC5EXJLFECxS+LCzT5LzPBVYHY7ojNljpM0oseCT6ptnbccKAcWs
	YYqlVZltp1pCFS84xJlFxxjn6ChGwIHoUuaGTJmZeedTTSiQIEZh8KvffiYgRPOGezRO
	xdIxxkSWsWTTedLxtJe+zVL0HPJcrm6nbwTFPxfypk3fiHk8eIBBWrn7WxSmR4f8YvWg
	mnMa5HLTtzGsiknuZzJ2iQS6EVba2eBbVv5o+jhBfkdpb2UFpQRn7Ng520pAzfkF0vPe
	FMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=gHdLRvpDVFNy+qKKL3ixK7mNa6loNMIqjMR1Oh9hAEY=;
	b=JOWaGoX9nbVXXe60y/uhbFMk0zOQBqOqJOeOnt6Ahdb0RXjougQiU/Ncy9mv9trADZ
	DA0Vx+vlVSV90xHw5QF6iuzxL6FiqKDU88Xk2c8H+Vi0MDgvlZvt2sPv5JMVri/l5p0A
	8FgM81iwg/nfjKbyAuWuZgBj4ktAp7vGl/FgTgj8TgHikseK2qGvEdHQY0CUZ3wAQMGC
	FSZilJ+OEeVbmHJ6JjXgLJhWekgWMXZ23T7aThVWfV9/v+uEzTVjz501Vy5vMxOM+1XW
	hPCto9uXxtnconA0xjG+SuqoLtnZL43ofmlaPJpvPFXR+c+kXvMG0lZ+mLMRQEa6zFoW
	6POw==
X-Gm-Message-State: AMCzsaX54e/f6kVSFcYPEDeLq+z8SSVbPvftolxUzdAN+NajYt9QQCBs
	BgPdOZIyHWqT2fC0J6IXgOY=
X-Google-Smtp-Source: AOwi7QBuY7nVH59uTpAVxy4qd5w3Xw06926WIt49VoZ4yfpyqKKnQbq3mXxYzfd0Qfgr4CwegTmAfg==
X-Received: by 10.55.176.4 with SMTP id z4mr20400079qke.159.1508258747690;
	Tue, 17 Oct 2017 09:45:47 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:43:55 -0300
Message-Id: <20171017164426.25277-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 11/42] block: remove "qemu/osdep.h" from
 header file
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
X-List-Received-Date: Tue, 17 Oct 2017 16:45:57 -0000

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 block/dmg.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/dmg.h b/block/dmg.h
index b592d6fa8b..2ecf239ba5 100644
--- a/block/dmg.h
+++ b/block/dmg.h
@@ -26,7 +26,6 @@
 #ifndef BLOCK_DMG_H
 #define BLOCK_DMG_H
 
-#include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "block/block_int.h"
 #include <zlib.h>
-- 
2.15.0.rc0


