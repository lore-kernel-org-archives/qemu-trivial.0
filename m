Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ4W-0004T8-9U
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:40:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4P-0004N9-K5
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:40:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4M-00031f-VL
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:40:49 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35397)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4G-0002tW-58; Fri, 22 Sep 2017 11:40:40 -0400
Received: by mail-qt0-x243.google.com with SMTP id l25so884927qtf.2;
	Fri, 22 Sep 2017 08:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Af1G8FHXfLulJHqSYj/NVfOciaELlTqnZKXKhGvVzc0=;
	b=uIdzlnmFAvCCuY8xacO8bZ2D5BERlsNg+PEye94S+4IHuNtOkWbtPd+gkhqSk/nTwc
	8OV4rmJhrxZqCXTY7E3YWb2pp3Viw6eplERI9sB3QXFgQDit9d2+KIIctQ6xLCZzXQmc
	j6iniFcyaGOuqHSeGow9veKISokcHIz6m/ubX+nVVHJkPtPhmaF2hN9zJnH7LUeMtN+f
	W2FJoX3AQl2hiowE6ru40No3SPITZUTjVHHLSv3zykkNAj9uvVrPZN5Cp+IYDil3E6tq
	qveo6TNVcwLrXm/BCqSstyE6YYGskhWSg4fwdxWTH1I9Mq95TmDAWzldwCBYM9xvOt3l
	gnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Af1G8FHXfLulJHqSYj/NVfOciaELlTqnZKXKhGvVzc0=;
	b=P8EP0YVRwzDuiE/hWgxCsoKTj72KaWDGUOjtxex5Yt6MFQMhUPTxgIeBGtTdSK2np+
	Ltr6hquCvwDVxpguedNE0RCh19pHbki5ktxPstRe3oR6XaAbpNY1lp4WoSkS22Mnu1V7
	Q56HlNb+CBJcMLw6qITHp3LaSNIgphEbVLwishzsRqfBN/2OPP4x6upTqhTAGCeLve4s
	JSVSoyVUCxAcYcHr3/I6f983lgnE2fLLbD9kA5A5JA6u0QM8S0hlRplyjAf9TPUpZS17
	BqFKQJFX0BqEKTjaonTJrMG9PwgTuNhCB1A3vJR7d3C6rDIuWBqRwmEBdqnT0YpCzfR3
	e4sw==
X-Gm-Message-State: AHPjjUjzbbZDadD2+wDvEQbdItB8QtxxpDQAOAewfqqWAVF1bIL2efzN
	QbsEK3GbndMGc7hmGxpr82fuvnVnNSE=
X-Google-Smtp-Source: AOwi7QD3o4i2V4nuvyS0P3V2TZCYhi7wxddTvyH/lZnsScvtzv0EQV97QhU5mdGYkRlGmt0+9o16FQ==
X-Received: by 10.200.55.178 with SMTP id d47mr8861484qtc.217.1506094839470;
	Fri, 22 Sep 2017 08:40:39 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.40.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:40:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:43 -0300
Message-Id: <20170922154014.29350-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 03/34] block: remove "qemu/osdep.h" from
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
X-List-Received-Date: Fri, 22 Sep 2017 15:40:53 -0000

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.14.1


