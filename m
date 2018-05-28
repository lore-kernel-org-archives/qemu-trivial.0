Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRZd-00085K-Rd
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:29:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZc-00083f-6a
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:29:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZb-0001x8-CK
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:29:08 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:40064)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRZZ-0001vo-F5; Mon, 28 May 2018 19:29:05 -0400
Received: by mail-qt0-x241.google.com with SMTP id h2-v6so16558581qtp.7;
	Mon, 28 May 2018 16:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OlLTdaBuQV1N986qp4Bqfm3u8jwr17KelpDjot4V49g=;
	b=vOMaCiVnpQX/RMXmLTMiQI4+iCSduK04VDbyI9voK5/C5d09ZnllEjHpA1rGj+BcAO
	Q9rQWj97KdMUXACrjjDdA7hW1Skg2igfdjbleWA12U+V52gWwFEFsK/6E9Isn3ryfofH
	E63O2cvfqDtpuynxbnKT0EcXlqoupneeVPBsRG5zfu/eWp7W77/tFwPpA1QcAGkVzDuw
	DWS6KNePUaabNoZjgnY0RLL/3mipLik5HPULPhtYPx2UICIjZivoUf3aSagIcgMXLrBW
	ZkIUMdTJIbLML6RHQRfc1jsjCXNvQoV1tCTAaqhLZxLQhje5WtUY3bkYHZgfVfllwo9r
	X7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=OlLTdaBuQV1N986qp4Bqfm3u8jwr17KelpDjot4V49g=;
	b=QgG6jiDx8KrfPVSFh/AkDo5+SpoNTSHOIgFXpG9Pj3ZsfqvyrFjvBAShE+f6mmhfNf
	5HM5YwHzi8ZNkZPPXyabFlXSywEipJTyPuZ9S7pucknPda1/mmjsr8mwBi+kCOf1Na4A
	Jm6Rp/nydzsPMUvmyVY5eEZkfcZKN3JcnNqrmyglmWVSdc3IyjaIhMaZrXO5isxqF7cB
	iuN1nSdL+Ttqpo6rU9XRc8Hvb+VBAYfB1iLX6G1qmsJx+CNsFJo8fpmrWp/pyXT6s8+e
	C6Sahurlm/l5KoZPOGhitZYBWGf1QTHm8Z16710WV8n+yN+Z9Iiq6yhtg36q4X12eyE/
	lY1g==
X-Gm-Message-State: ALKqPwfHYO6BK7z9NRLHkm289BlJclxot6FxMo/pCZxDjuS9l05eEoT1
	Emkiq3rQh3CrHJ9yQsz8WUY=
X-Google-Smtp-Source: ADUXVKLb5R+C6oky4thpmyHXZCjpVZyyoHNOgnq9lRuJN3er/eWtGpMv6RjPSNl9+bVAks5NihKzDQ==
X-Received: by 2002:aed:2423:: with SMTP id
	r32-v6mr14632909qtc.418.1527550145029; 
	Mon, 28 May 2018 16:29:05 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.29.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:29:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org (open list:IDE)
Date: Mon, 28 May 2018 20:27:18 -0300
Message-Id: <20180528232719.4721-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v4 20/21] hw/ide: Remove unused include
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
X-List-Received-Date: Mon, 28 May 2018 23:29:09 -0000

There is no need to include pci.h in this file.
(Continue f23c81073a cleanup).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 866c659498..cc9ca28c33 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -25,7 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
-- 
2.17.0


