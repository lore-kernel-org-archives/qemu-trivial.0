Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn3qb-0007rC-Jx
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 10:56:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gn3qZ-0007qt-Dq
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 10:56:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gn3qY-0007g7-OF
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 10:56:47 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:33495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sourav.jb1988@gmail.com>)
	id 1gn3qW-0007ex-O8; Fri, 25 Jan 2019 10:56:46 -0500
Received: by mail-pf1-x444.google.com with SMTP id c123so4959797pfb.0;
	Fri, 25 Jan 2019 07:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TTpRtE73zn9+9XaAgwkTXd6X+SweJAaNdeUuT7cud4Q=;
	b=noDmVd7HKeCq5XMB6KcNrX9oPg5Op95rl7BBz135AcLZLbQxzcRzGr3RjjlLqpacv3
	IG7ojydAhUd7d99AkgtA/mOkJmkrBB7JyommlAnCYBwzlGmBZgBVXKjh12rSweCwLYUX
	21ngabjaibeK8PeojY8KiQffsQ6yc9uPQDMjEa0xLeCCY7LQ4+xqF6w56BVqZbaBRkvg
	ArvKtXNhELKb5bKCTNae6GFO5i5a00jYDsv43Ae7CjT4eGZtSY88AuLqbntm1x9VDdUC
	edyt2zE6ffug64DjzxchFWYw2VpVgaIyWbMXxMcT0wVEKM2fiQ2BqVW5lVbSfukM7dJ7
	OfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TTpRtE73zn9+9XaAgwkTXd6X+SweJAaNdeUuT7cud4Q=;
	b=Af1a3Et6HMZ1GEkz3UW555cmbcqFNoEoXOzhv1+KYDEfDPwskcQCYftF+tgqVrCPBg
	iANryqio7wI089nZIQitCWkqKAqvbh74+HWm4QaVxcpZEeC7dLBI6OsIcDI+vZg6OCF2
	cUfe5WjuPmhczyS0MrcTYXMioa7KjiGyzL2LQpoHChcxIeIH7WJBu+k8V8it1t00CiDd
	Snxu/EC7c8uc1snW6ik74+v5SzDn03+W4r01kyJGv/ARgo1vEyTxeD39jSYMXWNPOriy
	/xzVRvHiTDD5pEzpCLmt6rtjWoTBdV78i/b/xGTVxTJdEQVio6cHRwuz+zjmEna5wNp2
	68ow==
X-Gm-Message-State: AJcUukfySc/UolreKGdVPpplmctsbseQ/ewIhJXN2EbxGyKTw29JgB+U
	peIgDRmAm0PuPEJwdj6aFBufyqxi5J0=
X-Google-Smtp-Source: ALg8bN7JGpDJhZYVAOEl1hPsp7HYhes3Fyjr40tNzMTGHQRlWQpOeGtdRZOApxDy1e3tbOhK0sPV3w==
X-Received: by 2002:a63:e344:: with SMTP id o4mr10287195pgj.158.1548431802602; 
	Fri, 25 Jan 2019 07:56:42 -0800 (PST)
Received: from localhost.localdomain ([27.7.213.28])
	by smtp.gmail.com with ESMTPSA id
	j6sm46557634pfg.126.2019.01.25.07.56.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 07:56:41 -0800 (PST)
From: kumar sourav <sourav.jb1988@gmail.com>
To: qemu-trivial@nongnu.org
Cc: joel@jms.id.au, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 25 Jan 2019 21:26:30 +0530
Message-Id: <20190125155630.17430-1-sourav.jb1988@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-trivial] [PATCH] hw/arm/nrf51_soc: set object owner in
 memory_region_init_ram
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
X-List-Received-Date: Fri, 25 Jan 2019 15:56:48 -0000

set object owner in memory_region_init_ram() instead
of NULL.

Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
---
 hw/arm/nrf51_soc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 1630c27594..3a1c7e200c 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -89,7 +89,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
     }
     memory_region_add_subregion(&s->container, NRF51_FLASH_BASE, &s->flash);
 
-    memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &err);
+    memory_region_init_ram(&s->sram, OBJECT(s), "nrf51.sram", s->sram_size,
+                           &err);
     if (err) {
         error_propagate(errp, err);
         return;
-- 
2.17.1


