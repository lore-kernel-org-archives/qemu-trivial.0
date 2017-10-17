Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FVx-0006jv-Ox
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:13:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVw-0006ic-A5
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVt-0004aG-5m
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:13:44 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:51257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FVr-0004YS-1R; Mon, 16 Oct 2017 20:13:39 -0400
Received: by mail-qk0-x243.google.com with SMTP id 17so17518qkq.8;
	Mon, 16 Oct 2017 17:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jsSYnS+pieiKhjh0pSRYsozy3igSZBWnMnniuZZM2w8=;
	b=WuG84c8y8215nINJPxaCtkfrxFQjhVp9rBu4VxwhCillGCaipSiPbvnD9xj+OZzZ4I
	o8AI6MIyFzDCXcSi+hxxJpjCItIwXew0HMMOWAXxnvow3nVPASzgPR2+DmyahscChkUA
	RjCk/vsnOFJYB7DFkDmnIMmay2Ts618pgm3W5UzSeF02dtRJD3tnPKk6QdmP2zlYsU/D
	sWMI4yClj1NXRm1dDOJ6A632Le2DM5SRXoBkbBqN5T2wDcXrCLRW6eZCZhvwvA9X2ZGQ
	wJu8LQGvHaPeLX/GTENZTgPp63TNpbI8SsEsGOfAVkfifmaj6/szokkwQfStUtPKp3vf
	Cu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jsSYnS+pieiKhjh0pSRYsozy3igSZBWnMnniuZZM2w8=;
	b=IU8fHVXNq0WyWq3cFqBJDpTqAOk9P7kt0C/B2MBTc1+mlBHZWdHVXM6/i0LoL6JAH3
	uQwZqKfK2sy/y3SBxofSSEqwsOaXufu480Z8Xv/DA/x91Sn9d044rNPiW61pcg3yeZwQ
	hz+IDn6tJJGTmLCmCvr5HOcKz1cv6YU0JrBaSUMRmYEv97FVXF+CCGHc+oRiWDQN1v1B
	K2dLW73jfPNRNBwLarWP8Fg9+P6jOqbEXj8S4HjjW31HufYPu0ZbwW3zW5BcoLhSCZRX
	JYvrYVWcbPUCOWOKWDE/B+DPCGKA/t2mZXo6wn1PX01ITzszVUVtTW3+i53CT7Iaf719
	nxTA==
X-Gm-Message-State: AMCzsaW4DphQ+aDc8ZNNpNGg36XN8PPvwtYRBmScaOo8RjACBx5xr8OJ
	2e5eXC6zV3EzjtxWdklIvXo=
X-Google-Smtp-Source: ABhQp+Sk9hmnfEn0JjCd7wP6Gff87b6v6MwpyvEjWGpA+s+bZTwwvUO0O8ErDU6aSImnWK91Zr8B0Q==
X-Received: by 10.55.164.215 with SMTP id n206mr15483644qke.85.1508199218652; 
	Mon, 16 Oct 2017 17:13:38 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.13.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:13:38 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:54 -0300
Message-Id: <20171017001209.32276-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v2 24/39] hw/i2c: remove old i386 dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 00:13:45 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i2c/pm_smbus.c   | 1 -
 hw/i2c/smbus_ich9.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
index 6fc3923f56..a044dd1b27 100644
--- a/hw/i2c/pm_smbus.c
+++ b/hw/i2c/pm_smbus.c
@@ -19,7 +19,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/i2c/pm_smbus.h"
 #include "hw/i2c/smbus.h"
 
diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index e47556c9d8..007cb6701d 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -26,7 +26,6 @@
  */
 #include "qemu/osdep.h"
 #include "hw/hw.h"
-#include "hw/i386/pc.h"
 #include "hw/i2c/pm_smbus.h"
 #include "hw/pci/pci.h"
 #include "sysemu/sysemu.h"
-- 
2.15.0.rc0


