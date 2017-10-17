Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FUz-0005lK-Re
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:12:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FUy-0005jx-FA
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FUx-0003h5-ME
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:44 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:56807)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FUr-0003aZ-G4; Mon, 16 Oct 2017 20:12:37 -0400
Received: by mail-qt0-x241.google.com with SMTP id z28so28430qtz.13;
	Mon, 16 Oct 2017 17:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GNG6lPxow5POZreNwO2ghqugC0ouul2u9Zvj9geqPUg=;
	b=UISCTZ0RZNQzV66UZ2k5DWj2GdnO2s5RcZVmLFRTHfZm3TgZyOKny5H6dVcFpcpL+d
	8xqEjOQKxX/k4VQ3Kn0lYePm2SpfyCkZn5bjk2bkZW0f2NQpuZ237l9eAOAXU42kONPg
	I1p4mX/to9lvF/7PBkyDcf+2gXQzHhyXuLTAkJaISv+yJD0XG2cu4Tamr8spFYNwW+vm
	NOQVspr0SUAsLPWJsQAma0a7an9tTC4ugfn8Z0QByvloVY5mc4WIvps5In+N8YQcjtdi
	bfOs4JWcC+8twYv9Pynx0FsfTzF8P06iIWrIHj9BUm3kak3LPnDxz6KQsSnVU7c6lvaC
	SgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=GNG6lPxow5POZreNwO2ghqugC0ouul2u9Zvj9geqPUg=;
	b=CgiNiK7j7Nk4FrVb4IG5nic31KRW7eMNrGY6HLGVNJpkQou23GodRX+OgCdeIscEVY
	smKNHKsExDh7SnuOlNLNxONsnRLPWSIqOAZEiAvt7MJsrOV3WUvXvrZp/yA7qz5b+ik/
	1HVGDS1Ew+UQ4gbRuDogPq+8WF/NVz/trxt45qoA+GOF54B8pHthDNgnWPvP+cTDdrbn
	Zvw5NeKJ9oiAemkD2soRTK+Xf0FZqS5okaCegJYOxp/N4lnp+1ALsT4iCO0jTaNc/lN2
	Q1I9Sfd1KKKDjipywn+Zzd1O76oj+ysOTR3PimToUL557vMgq2ii1c4xbZ1jP2h93Ht1
	Wp5A==
X-Gm-Message-State: AMCzsaWByC24/7ipgBcVY55PbXweOaZMXvnN3gBulxFiuHnRJ/grX5h2
	1ShvRDDKzZvCFWM788k/SJfllRYf
X-Google-Smtp-Source: AOwi7QCo7vv+g0kxhR7HAVMqGK3xPPehvhw02RNmn05G/grj0jhU4TmlE6rOuckcCSMCCyOtEgOllQ==
X-Received: by 10.237.62.45 with SMTP id l42mr17354995qtf.46.1508199157033;
	Mon, 16 Oct 2017 17:12:37 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.12.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:12:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:31 -0300
Message-Id: <20171017001209.32276-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v2 01/39] MAINTAINERS: add entries for
 i2c/ppc4xx_i2c
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
X-List-Received-Date: Tue, 17 Oct 2017 00:12:45 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9cff9737d3..6f56c1349b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -954,7 +954,9 @@ M: Alexander Graf <agraf@suse.de>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/ppc4*.c
+F: hw/i2c/ppc4xx_i2c.c
 F: include/hw/ppc/ppc4xx.h
+F: include/hw/i2c/ppc4xx_i2c.h
 
 ppce500
 M: Alexander Graf <agraf@suse.de>
-- 
2.15.0.rc0


