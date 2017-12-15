Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgjS-000331-7d
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:32:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjM-0002yo-Do
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjL-0005mM-Dt
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:32:12 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36919)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgjJ-0005h5-C8; Thu, 14 Dec 2017 22:32:09 -0500
Received: by mail-qk0-x244.google.com with SMTP id i130so8869549qke.4;
	Thu, 14 Dec 2017 19:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DanuE5ZbXUKamMD7yjD4he+LNGrkUz0lKkX8qZ/aEc0=;
	b=p3mwB3TslSlPpuRzytvTUT+82spMlhORu9zBzd0x6LiMYRDV3P0o19s1VvCXfw8cFi
	SK2C1nA91tsW4YhHnOjbDhiPpZ2IpNrWYszJvWSjbcJqFjgGRB5Y7lcosJ2iY1ovnUA4
	NCdbSdHmA/KC6+2QpNH92lsGJkAlO/neh7uNLMbl6MmkPmIywSKwpxj96G1fGuaMZ0/S
	ETrVPh+wIJEng5i4blbf3Z5K6CTfiquaB8/z3S56LgJ1f1exZ9QsfpO8zqrVYkT4a9xG
	V7kckam8//fiTUu6mD7NJMQ708YlYMg0WNKsl+ArsRimjISSA/zyFGrPlqC5HsMK4Ohd
	3wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=DanuE5ZbXUKamMD7yjD4he+LNGrkUz0lKkX8qZ/aEc0=;
	b=PiEPapw2+R86Y7pJ46q1AOMJc2RPpbeT5JKHMY3JPRYhzBVXGvELpaPdw/dm8jIMiQ
	xw5fHD63KZhH6OW0cVTS0QEUV1H3IZPJ9PAuGq+O/zzEm/uuorVRgffbnM9NakQL+ye7
	1q+Vx1K1PSwDFpxV04Q/s68Eu4CerOBrlU0YBQ2R80QWmmkLgFdJ+CZaNslg0SqGoMmY
	TtI8AdIvNyKlnIrv0v9ABfjmV58sOeUaRVODMXXHkGQeW+0Qr2fhYVMCH8otVfdRLobE
	tOsUgg2kMGVDhY1WC9oxHaiAxqtH9Ij11FrxoMqp2CsQ9PDHx913xaOzgF2/z67ItmNH
	wvLw==
X-Gm-Message-State: AKGB3mKfckT8VFpO2B7BXzlx3R8AaevOTNwPPp4yqTqJ5Q35KlVYcJHT
	sWxqmxJQzhJy7i4hg+VWCWQ=
X-Google-Smtp-Source: ACJfBot1nsYyAbqUhXPa5X+oiSv0Bw5Y2dLPU02GX3NNhlTdMC+AU2dpYeguhdl1KkDzccN8EqeYpA==
X-Received: by 10.55.53.75 with SMTP id c72mr16370649qka.2.1513308728921;
	Thu, 14 Dec 2017 19:32:08 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.32.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:32:08 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Date: Fri, 15 Dec 2017 00:30:00 -0300
Message-Id: <20171215033015.738-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v4 28/43] hw/tpm: remove old i386 dependency
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
X-List-Received-Date: Fri, 15 Dec 2017 03:32:14 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
---
 hw/tpm/tpm_passthrough.c | 1 -
 hw/tpm/tpm_tis.c         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
index c440aff4b2..d904d8e33f 100644
--- a/hw/tpm/tpm_passthrough.c
+++ b/hw/tpm/tpm_passthrough.c
@@ -29,7 +29,6 @@
 #include "sysemu/tpm_backend.h"
 #include "tpm_int.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "qapi/clone-visitor.h"
 #include "tpm_util.h"
 
diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index 42d647d363..3c38fd8b2c 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -29,7 +29,6 @@
 #include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/pci/pci_ids.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
-- 
2.15.1


