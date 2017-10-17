Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVj-0006V5-A2
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVg-0006S5-B4
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVf-0004PZ-Hu
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:28 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:45795)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVc-0004Hi-3L; Mon, 16 Oct 2017 20:13:24 -0400
Received: by mail-qt0-x243.google.com with SMTP id p1so70410qtg.2;
	Mon, 16 Oct 2017 17:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=99iKmIqlXnTuP5F8/tUJPGMUeGCX1paUzqbbgtVSTbA=;
	b=dVG2aUDBrMDIVdLLvc5iDUiMfUNOq+A6MJ55f2VwyM69nEUlqbyu9w5tmWkNSUJczL
	hqj5d5bB9nLx2ZbOkSbOuYgwWQeM4LElnS7B6AO9cBlN/Ke9SurNHv9sxCNGQ89aGKtA
	+wMmd5ZgT1bHt9Q592u/9EandS2CQwl2SAg4qfm8NSyIPC7szdub2zradJEVEtA8PQgl
	1gD8EhT4V2RZKn4NWATDOiJf539HakYQyeS5RhRlELNEMmrpyy9oQQJZnqXdMXAzKvde
	hGrVIwPHCyFbMkjrZsZ3h2bHcEtv7zYdqZjc25ffl3FLGGA4MQjW6Iq7pC4jOf05JkRF
	FviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=99iKmIqlXnTuP5F8/tUJPGMUeGCX1paUzqbbgtVSTbA=;
	b=Nbhs61OqDp92kdZXf2gukQEC74ETgZnFcw4TMcdqFM+i5gxo/CRZVmIQbSg0mX7bZ7
	TBSHXoJcuXNO6ngMEgbyqdOtillMmRv+K1nX+Yo3jWzrqlG+3aSScOESwEZxpbKPW92U
	8vyj2KlFGUF+izddN8+AiEp9stJ5xMQfXIaXnKSoMmjLR70g7iHWEfJCh1GiWWlYJc+3
	l2SVRZUIASSzCkoScr5oUBj7tmfhp9dv4BaGOKp5w63DolBPfFxopg7bCNk/5cvnpxJ0
	t12rKUS3eJLqGxEsftUXWKeRJPYPOIjEYMW9wFV+PhHxNZ29blpH3E8hlPnfnMr71i0R
	TJTA==
X-Gm-Message-State: AMCzsaX1URx75soJdmE9Ujd2rIfSzPRUD7HY2CK7s8QQq2YvqWacoDjD
	q5DuES2J5kBfFZjyKXPL88w=
X-Google-Smtp-Source: ABhQp+QWwynOz9V3Pf7dgqi3mAi2pIGbECpywc00u5px4aEmB/muspXZsGAw7KKfOhpe3xUCWMCemw==
X-Received: by 10.237.37.142 with SMTP id x14mr12878897qtc.6.1508199203735;
	Mon, 16 Oct 2017 17:13:23 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:48 -0300
Message-Id: <20171017001209.32276-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2 18/39] numa: remove unused #include
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:29 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 numa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/numa.c b/numa.c
index 100a67febf..ebc553b5d9 100644
--- a/numa.c
+++ b/numa.c
@@ -29,7 +29,6 @@
 #include "qemu/bitmap.h"
 #include "qom/cpu.h"
 #include "qemu/error-report.h"
-#include "include/exec/cpu-common.h" /* for RAM_ADDR_FMT */
 #include "qapi-visit.h"
 #include "qapi/opts-visitor.h"
 #include "hw/boards.h"
-- 
2.15.0.rc0


