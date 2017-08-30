Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAy8-0005lq-3U
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:56:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAy5-0005jL-PE
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAy5-0007sj-2Y
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:13 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAy3-0007rI-2e; Wed, 30 Aug 2017 17:56:11 -0400
Received: by mail-qk0-x244.google.com with SMTP id m4so6405871qke.4;
	Wed, 30 Aug 2017 14:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ViIbAOoTclWfnySU1nDRjDPEiT6VWchB3vHa0itNm2Y=;
	b=PEFzXnHZKdmTpU0Iah4JEGw6yNotbDejT8z6sG8Y+l1T4UXzuN0yjTJUjxNZAGpIKK
	8kivMZ/8Fa93W6NDVHLW5MzH8UAhGpOvUjtneav+PEd0p9XGnN7Mif4Qr7RePO4q/2ga
	oUcBt64GgPc1DCsZTmVYW00qHj3v/ikutrRigTJtxoGxVXemrrZYKFsbfgMS+JGmh/Kc
	nEXEu4X69eqDucFYK+ZZgt4G2uSonX847Pf0Y7c2b25ZVp0B6/QGv0KUXae1qowlvWAx
	t7zqwWNH/I1du3NfVNWOIp/5Av+blNh0WE81fdOfW3kaAMOry7cZ9QM3YLd2dFpv54sa
	F0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ViIbAOoTclWfnySU1nDRjDPEiT6VWchB3vHa0itNm2Y=;
	b=VVj9uDFP9bvqpuv6p8Tq+ZzORneEpDTny+OIzto9sfhGk4UV2vXF9TRdbdrAXJR1aR
	DnpEecocaLMF4m23ZqfWltVqwc64FEl3s8w20oQXucDDEjPM93ZEia90PenyM5xC3F10
	Tg3Vgh+JGpPAWREHO3QY1Dm26rLU2kUQ72xfarLGiki5VCxpm8EP0QXIBKVwW7v7lc++
	KV/5h7EWjGdorUW3s2jzbfdgqmSOAoeE2ck979FlvMai+4BRKpV4WlJi/cFOestZcigb
	MMK0Lmc9w9TGzOXaOpJOmwuR8Cv+5KIABDhdxK4vOFSVq149deuCNgQwMvMZZZc7E4PS
	wM/A==
X-Gm-Message-State: AHYfb5ggi2+G8+fshiQ8z+LkkqlBcD31pMGa47+m3kWRhm7mDzYJkDuM
	RhWERY+iwKqCZw==
X-Received: by 10.55.165.209 with SMTP id o200mr1054886qke.297.1504130170526; 
	Wed, 30 Aug 2017 14:56:10 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.56.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:56:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Hannes Reinecke <hare@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Wed, 30 Aug 2017 18:55:18 -0300
Message-Id: <20170830215523.25278-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v2 12/17] MAINTAINERS: add missing megasas
 test entry
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
X-List-Received-Date: Wed, 30 Aug 2017 21:56:14 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa74b7254b..20d65dca73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1118,6 +1118,7 @@ L: qemu-block@nongnu.org
 S: Supported
 F: hw/scsi/megasas.c
 F: hw/scsi/mfi.h
+F: tests/megasas-test.c
 
 Network packet abstractions
 M: Dmitry Fleytman <dmitry@daynix.com>
-- 
2.14.1


