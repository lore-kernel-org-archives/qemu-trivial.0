Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eOzRH-0008S2-Uv
	for mharc-qemu-trivial@gnu.org; Wed, 13 Dec 2017 00:18:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzRG-0008Qg-67
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 00:18:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzRF-0004Tq-AL
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 00:18:38 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35542)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eOzR9-0004Qv-1q; Wed, 13 Dec 2017 00:18:31 -0500
Received: by mail-qt0-x242.google.com with SMTP id u10so2361976qtg.2;
	Tue, 12 Dec 2017 21:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=88ecjEgcsQIfCP+k/SXC4oWCMR94MxwRRYySEdUNKrc=;
	b=WpeZA8Mbk3LtmkrgKfGlQPiklEjtw2NLuVHZotqctAFktyP1FBc8otUinYE5ENtzSb
	0w701tP2mXtkaG74zXBF4xSnB45jN39E11dhxbwwGbitIuhqfukCKwcRNoJ32URw5EwI
	Hipq6R5lWC8WpacXZ+Xpgl5XnVKdMvHYKd3xhEPRAh12sGIZVDfwDG5wOHRcVdRae5Ks
	uWrc6aW49y/oOWnGziEyLdM9f5KJd+VqkIesANauNFZabhhy7ja5Gebj4wDpCbtNJq68
	XXoTFkRAOGAA/8SqYh039dphaFRPuHyRhWrMiePuHD7foABL1L3HNxOnVNbz0R+LQKau
	DJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=88ecjEgcsQIfCP+k/SXC4oWCMR94MxwRRYySEdUNKrc=;
	b=GdwWs9VPYmXtH/EhXTGjt0YmDOk/xx7RcSN5etkqIhA2us0igqt1UmXLd8sXxrJan+
	ttMX0EcFwHjhMsYuuhSKebOcs+ipzJctcx2wMX2g8xyqOKpgBliwDD/TXbq57OOlGmkj
	GLMz8xoqVJD4hGYyv3Cqq3QP2InzP8NpQapYC1u6SMH9Z49jrD+dDgSScItdnC6+z00j
	rPEigAJs1cD0tj+dWRTRF6Dyf+Hf0W3EL35+ivQKjAAii4LRT0x13T+eDeW/Nny98dUa
	XLK1mzZuDB8MNBOUC4qTInbnA59jTqOq6CyELwCCL1YyuR6P+SLIoMelKDSSTGBTLmKM
	nP5A==
X-Gm-Message-State: AKGB3mIWRzwbEnzrGMM0q7Uxjuwwm5FHrc7pdSpVcQco7cYgoTGk1NmW
	yoLOKM6l0Zr6CTzNxiCPzL4=
X-Google-Smtp-Source: ACJfBov7/toeycWwkDI0N94T99j7EeZTZzKTDwNPikxHWeZX2dE2mHkqpxMk0/2S+T9IsDSu3BiCMA==
X-Received: by 10.200.6.4 with SMTP id d4mr9262174qth.15.1513142310625;
	Tue, 12 Dec 2017 21:18:30 -0800 (PST)
Received: from x1.local ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id d15sm522318qkc.26.2017.12.12.21.18.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 21:18:29 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 13 Dec 2017 02:17:33 -0300
Message-Id: <20171213051736.17755-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171213051736.17755-1-f4bug@amsat.org>
References: <20171213051736.17755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 1/4] MAINTAINERS: add "hw/registerfields.h"
 in Register API entry
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
X-List-Received-Date: Wed, 13 Dec 2017 05:18:39 -0000

Orphan since afb3141c660

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0255113470..7edfa25542 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1538,6 +1538,7 @@ M: Alistair Francis <alistair.francis@xilinx.com>
 S: Maintained
 F: hw/core/register.c
 F: include/hw/register.h
+F: include/hw/registerfields.h
 
 SLIRP
 M: Samuel Thibault <samuel.thibault@ens-lyon.org>
-- 
2.15.1


