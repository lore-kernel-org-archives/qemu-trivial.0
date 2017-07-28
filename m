Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxx-0004sZ-07
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxt-0004pT-1U
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxs-000498-Bh
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:33 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33626)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxq-00045z-8f; Fri, 28 Jul 2017 01:37:30 -0400
Received: by mail-qt0-x241.google.com with SMTP id u19so9231583qtc.0;
	Thu, 27 Jul 2017 22:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=86XhLP3miOAXCuHJ5JZfCdHVGPq7IRkJwqc4o1orHrQ=;
	b=dby73J1x3zK3SiDRc6LK5iK1LGqlL9R5tBNZsMsXbSTBIJtVktp7a46s+D+99rTCc/
	tYQIgpTBD5pU3e1ULNWhBDgQ0RaYftuMT2ns7imk5fQhV1ebKN24TRvarKPjvm+U6UuT
	qZyQvxe3rZBllpbs//NQAVn45cRU22WRxRmmIOeYqlrA9hfUisClfnysUExOcbNzvXVP
	6SfnJYX2HrhxjUBaU6Kt8SMwBubswbRRcFkSTaPpN7Mw6Yrd2ikzSFVnSAXIcroPfAr/
	zOBHhuQGXeR/i1Z4bK6ZzxZbxdvF+NxGuoH/mKBRGo7jqp+8EwwzJwFVUSN4RmjWUWvB
	F/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=86XhLP3miOAXCuHJ5JZfCdHVGPq7IRkJwqc4o1orHrQ=;
	b=cgKxoA7s4SghcXVuIyGp8+nMZXkt/xq33NhATr9lyXbFGT0obCt/q1+py4nRtE/GsC
	VwEFknyd5gU0PkfeCbtVDK8wIqpFp30g2u9eAxEJRjJSEC2s5FBY0qHzpfB4ZxLpdfbN
	GY3DXh9LjmstcY/NoP9tRCemTBv1Is20LSAQgSmEPbMWPfnAhPlgP1a/SURlMs5T2vvu
	VQcbwyFo5M3BLlA8n7ZbMd+X/IULdqZb2GbFv3QGAN8V3trC6Hj+WFQbyKsxN2SBFN7S
	sZys2GtHTjMQi1/qhgBrfR9PwveFanVKV5dHohCDVWbY2zRMImH5XlWRx0H5oCNfSQsw
	fKXQ==
X-Gm-Message-State: AIVw112QyXRWIMc2x+kWb7cgD9IoAy4EqeWKFFDlZXjR4+v5KXFU/gr/
	a4ZnB7r4M40cnQ==
X-Received: by 10.200.13.142 with SMTP id s14mr8382154qti.276.1501220249856;
	Thu, 27 Jul 2017 22:37:29 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:52 -0300
Message-Id: <20170728053610.15770-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 29/47] MAINTAINERS: add missing SH-4 entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:35 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a0da13bcd..bb1cb1fc1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -235,6 +235,7 @@ F: target/sh4/
 F: hw/sh4/
 F: disas/sh4.c
 F: include/hw/sh4/
+F: default-configs/sh4*-softmmu.mak
 
 SPARC
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
-- 
2.13.3


