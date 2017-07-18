Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLsk-0001wW-Fz
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsf-0001re-Mu
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLse-0000z1-Rg
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:13 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33857)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLse-0000ym-NC; Tue, 18 Jul 2017 02:21:12 -0400
Received: by mail-qt0-x242.google.com with SMTP id 19so1351981qty.1;
	Mon, 17 Jul 2017 23:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VMwCvG8OO3AEfb8csNViVEhjwop1jPPCxzlanlZM1EE=;
	b=uOl7y+1UVb/TiH0k5F7RwevUolKWWkuNWe7dVxNKEXyRQxSCzhDL037PQC3pJTdmyL
	Ml9bIALZvBuiwsPGx9QyBISPAK22Y5iGUhAKLHlpmjKALfOBaSVlMskmOl8JzjhTvYT7
	m4ruJCqg8G155/RV3xnqFwOAuaF26Yggc0ijYt+hQDuC0aUQjRwg7PbHkqDRFiBrhGrt
	QjtRGMzZNgA3Gkwt+RehncoGDCwcVjhmG9+Yz5h1uaa2nQY1vKQOuundxWrCukr6nVpA
	seyKqnE347+bKP/PZGi3L8BFwZwnumthqIVBWJj4wOJ501tQQzVkhLw+yfLYAWn69MjN
	19cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=VMwCvG8OO3AEfb8csNViVEhjwop1jPPCxzlanlZM1EE=;
	b=NVowxTyWLnQdgK8Vm+TmTG5YwGf47Kvk1LdNBqe5aMOqtpuVJ4aMm7otvawyP6dWA9
	jl68Tu0r4JlOq0/jXw2qwca/bEgSc9Yih4imX9AgroO1nzZtf8NCjkvqB8MkOBIzW5Aq
	ibBP7ZJCqE1R1LmHNcS/m4B6xlveGUGBXCmzu+2L0qXHJL9N6WlXMOkfqm4/rCqJI+cI
	YpVamhono7MkHXs6vazr1q3ou29pSz9pryLQknnAsitl/gEnYzZ1O5bH/flhs1SW08jF
	8dvlVQZ5D3sB/SMUtHLOtWrRhIDqB+lJj7SDGbzpLFFNeEZg3EZHzb38uDaANYVZ2Xm6
	bnOg==
X-Gm-Message-State: AIVw111fsPxv3bGqhQZUMxTu6B+oPwIOqqKQR6QRB+axMfY+FznVINKj
	Sk8eGB2nN/xgK0wCNpw8HA==
X-Received: by 10.200.4.140 with SMTP id s12mr56395qtg.35.1500358872163;
	Mon, 17 Jul 2017 23:21:12 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Michael Walle <michael@walle.cc>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:52 -0300
Message-Id: <20170718061005.29518-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 16/29] lm32: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:16 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/lm32/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/lm32/translate.c b/target/lm32/translate.c
index 692882f447..a9b159a6e3 100644
--- a/target/lm32/translate.c
+++ b/target/lm32/translate.c
@@ -1185,7 +1185,7 @@ void lm32_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
 
     for (i = 0; i < 32; i++) {
         cpu_fprintf(f, "r%2.2d=%8.8x ", i, env->regs[i]);
-        if ((i + 1) % 4 == 0) {
+        if (QEMU_IS_ALIGNED(i + 1, 4)) {
             cpu_fprintf(f, "\n");
         }
     }
-- 
2.13.2


