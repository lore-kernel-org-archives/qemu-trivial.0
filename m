Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxT-0004QP-0D
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxO-0004Mz-8T
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxN-0003Wz-33
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:02 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36457)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxM-0003WU-W4; Fri, 28 Jul 2017 01:37:01 -0400
Received: by mail-qt0-x244.google.com with SMTP id c15so6554700qta.3;
	Thu, 27 Jul 2017 22:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ow6sLwsYe3Fik1BlBA/zGzHFruEbF4xFmDdlrk0knq0=;
	b=qSKpkbGSiHZNfJPFwHAfmtoUgvNWaN3TCDTIcKzntIzsREFgZc53Upg7KJGjbbBwm/
	5pkcnle7hELmtmqh0L0T/f3641cm+ZKYX7+rAFFykSI1OR+ir+8QWFwRrzTUUrUizff2
	HP9WHC/8h73OAB0SBJI8t05zWi6zXkiEoqm6oGO7mPFke9MHHI50AVxPx2pUeqxlY+49
	PLZJaavxLTuvdTgDwXr4PNJFFBc2cu3ruaCm4EXkd6ZgUr70u/gTyVkk85MAYIO7ziik
	J96wc74IfroS1RemUWomE0bSgTglyrl89QwfG2GqI61tjzVG2rGgf4RS9m6oL9rJPM6m
	fY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Ow6sLwsYe3Fik1BlBA/zGzHFruEbF4xFmDdlrk0knq0=;
	b=ErshUu2dtPObqGaPB30jqHgAHqA0Yv8NIaN2TuZHlX3uV97i4TsZB3MHi46xX3szFH
	Tn0uVMusjkAtM+mOZDnxDfb5633taKyqoF+xs7t5uGz/eJXUGOReSr8/LjoT6BwgSAom
	rOJodn6FcdtPWvyZzubur9dZqnVMeCDmARDZF7yLmTjwRvUmaqpH/jZG6ZvOlpsQX3SL
	KfYz9/5VdAQchMZgnUYY8DSZKTGOsOYEFrH8ogAK/jnZynb3W8/8pjzcbT9YD6zEZosp
	bEnmcI+K3EzvYcMdjVk0REMiuRT0jZCXgjKOc5RQNECFIqr+gPdxYZMnMenBeBcUi2HC
	EhMQ==
X-Gm-Message-State: AIVw1135C2DBaU5e9YIo8LtesrH3R11xZkgNCJl5FRSvytaGFHSoSrNl
	Zb40vt4Rzg0KPBmw+Akmhw==
X-Received: by 10.200.48.2 with SMTP id f2mr8681165qte.0.1501220220582;
	Thu, 27 Jul 2017 22:37:00 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>
Date: Fri, 28 Jul 2017 02:35:39 -0300
Message-Id: <20170728053610.15770-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 16/47] MAINTAINERS: add missing entry for gdb
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:05 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9670a3901a..653c2a1db1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1320,6 +1320,7 @@ L: qemu-devel@nongnu.org
 S: Odd Fixes
 F: gdbstub*
 F: gdb-xml/
+F: scripts/qemugdb/
 
 Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
-- 
2.13.3


