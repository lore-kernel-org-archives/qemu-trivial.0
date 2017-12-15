Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgix-0002ay-5A
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:31:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgiu-0002YR-Ja
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgit-00056d-T6
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:31:44 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:32819)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgir-00053L-3X; Thu, 14 Dec 2017 22:31:41 -0500
Received: by mail-qk0-x241.google.com with SMTP id 63so8865209qke.0;
	Thu, 14 Dec 2017 19:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=s16gv8QEBeo9KdXfZ+4VUo4uI3sdSopeJBrIfY/T2dQ=;
	b=Tz/zllhIu/6lWtVs5Kt2Qp7qd1K23VFNNYg+CStQO4Utdkuh8UlIAXCV0Ec5dEvI4H
	rzB9ik24NYDbpuEQ0eV10nIWh0btErYehRN5Wai/7em6a/pUs3JBbVdQ+s9qgban+QJZ
	+dkiFTeqHUHh+zPjVajYhHZbv14w6JtcGm0+kjQBx0KtBBtq3zbvmvW0L2r6sXHifMXW
	9UGLOh8SdUjvaaCOyfMsbh7MTkGZ1VXx9gFeKDvlviA4rQj4gvceO/jdvuzdQS7BeN6z
	hKMlw1wopcim04SUPcG/3zHN+UEmz35GxOVVXsBblC62AvD4sNhuhGNtif5iZxGQ2iBb
	rndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=s16gv8QEBeo9KdXfZ+4VUo4uI3sdSopeJBrIfY/T2dQ=;
	b=D5RXQRvzCdyXYX1ibaYb3rZL8Ff/RTsppUSdvPZCmDZXY1KN6O1bipVefP1PDZvY2D
	YrNlQhoYtiBjf7VgHOLPH0mnmeRvRauShPRY9AUVHYuekodycpklO279mrXTFaj7+E7L
	8nWMscyJGuA+phaNY1xbUFAIHFfqwZ6+/E8HrkyNxJYHoeE9AIdiORIDEFw8E9htHGvY
	EdzSkt6fU4PlSEgmr7nLRQSkStOQCxlj7EieJeTSYYb3BAv79491eS5d0XIdSJywACM3
	BEoDXxk7TsjrM2JL5Qusx6EU8fii15VWaoEa0YoqhOEC70H5Ayp/FCf9aB7vcq7B8FUL
	m2GQ==
X-Gm-Message-State: AKGB3mLZHFOMGbrCk7wv3Nfh5xokW6RNjAwY8jk7O8mrS98H+9+cWija
	ssJCjjBS13TizsN5hIZ3DDk=
X-Google-Smtp-Source: ACJfBosupLNH7aDfA3gXJGox1Te3HSZhd4q+E7l2/ljHgD3m41j9ZlpleUF33L3kTh4ZhH6olvuOOg==
X-Received: by 10.55.23.24 with SMTP id i24mr19533412qkh.181.1513308700653;
	Thu, 14 Dec 2017 19:31:40 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.31.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:31:40 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:29:52 -0300
Message-Id: <20171215033015.738-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v4 20/43] hw/input/vmmouse: remove unused
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
X-List-Received-Date: Fri, 15 Dec 2017 03:31:45 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/vmmouse.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/input/vmmouse.c b/hw/input/vmmouse.c
index b6d22086f4..65ef55329e 100644
--- a/hw/input/vmmouse.c
+++ b/hw/input/vmmouse.c
@@ -24,7 +24,6 @@
 #include "qemu/osdep.h"
 #include "hw/hw.h"
 #include "ui/console.h"
-#include "hw/input/ps2.h"
 #include "hw/i386/pc.h"
 #include "hw/qdev.h"
 
-- 
2.15.1


