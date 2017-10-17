Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V0Y-00029x-FJ
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:46:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0V-00026u-Ej
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0U-0003U1-Q9
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:46:19 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:47853)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4V0S-0003St-To; Tue, 17 Oct 2017 12:46:16 -0400
Received: by mail-qt0-x243.google.com with SMTP id z50so4918213qtj.4;
	Tue, 17 Oct 2017 09:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=L0zjNG/KJCrWqUy4/vjewFYt4qrERV93FJ02IL6gHSs=;
	b=qmV69AWTqWUS+VIa/3aby4WQaAcHcjPkzhHgc1Y33TDsIg6TkrWeXW6qyJCjin8GlM
	XPi9bAjJ6DHXRF/V7ar2HXmgtMSEPk7c1okgwDLLSWGzUcaJa5Qc0LGeKxKR/jtoL8z0
	Gc+MURQjoGPlwNvIQZHFaKNGnNlEYRZyLPKQ0A3OPvCYDAXDJlIOEUCoPEFCqgulp1at
	n2f0KEXK6KaRUG2un6V+4bDVb/zg43YqRmzPSnvGDotabQ6Y27PJb51YY/1IlUuy+y3z
	YM9ig0JeMZtpAF+IfgWf+cBJ+m5DmJWvnFoonwumQ54zUzi4cukjrq86lFkB7bufOCUQ
	HKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=L0zjNG/KJCrWqUy4/vjewFYt4qrERV93FJ02IL6gHSs=;
	b=ZmaliJy714ST4cCBHXxUkMwmI2nTvmqOvxWnFk2oaHxGr4FwHSAg3WwVLE5FWP8sCA
	xYYuc1WbYkXwMJriqD3K3gTJn6iDth0Q66qkTsvw9UB+NEX/yVt+Y2ZOyJjQEtWXzwLD
	I1QtRQ6qXkQqaf+79KMV0EuLiirkMmXKoTlvOxXfR2TeAITyan8S8rNQmyr3LObBs+5t
	ZwTR5wJ1X7KeuFgg5SyHqksfAJykZvO5fLajaOVaOJkNezOn0yEc9c0G3+p/vL7Auawb
	YCOCyAAg+2tI5/tTrdBU9RHCxPP0dBjBVP9svd6ThaymfxBRiK/JoQTk7E8lxKLjjsHN
	mcNQ==
X-Gm-Message-State: AMCzsaV7uc4aLYlSVn8IVPFDj1dfTPW/2MtP+A8e8tgwqHkGODHOcRny
	AqBahMSL+C8ovW/e3C3ic3k=
X-Google-Smtp-Source: ABhQp+RoslbYXH452qIvr09uTtx6L+bwofTTNsWKxCeqjlXjvZxKdo0cvZW8I58R7syU5PYz5IMAwA==
X-Received: by 10.237.37.8 with SMTP id v8mr21480573qtc.275.1508258776438;
	Tue, 17 Oct 2017 09:46:16 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.46.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:46:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:44:06 -0300
Message-Id: <20171017164426.25277-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v3 22/42] hw/ssi/aspeed_smc: remove unused
 #include
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
X-List-Received-Date: Tue, 17 Oct 2017 16:46:20 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/aspeed_smc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 992617fd3a..5059396bc6 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -27,7 +27,6 @@
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
-#include "exec/address-spaces.h"
 
 #include "hw/ssi/aspeed_smc.h"
 
-- 
2.15.0.rc0


