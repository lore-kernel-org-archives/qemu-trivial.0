Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAyF-0005u2-GW
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:56:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAyD-0005pw-ME
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAyD-0007xP-1p
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:21 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34232)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAyB-0007wV-2n; Wed, 30 Aug 2017 17:56:19 -0400
Received: by mail-qk0-x243.google.com with SMTP id a77so6405104qkb.1;
	Wed, 30 Aug 2017 14:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Zc39DKFvdE7Ft5F7k9EmUNwygbx0KM3U0cVoXJwqOUw=;
	b=Q799zmbWDhZL6BqwB+M2fCSD97pT3nSNoks1OHvzxvSBgceG6A8Zr1eWKNwfJZnVD4
	LSvEgqEKtRUDK94hzvgXYvw4qvgU5a+N5G0m5YMK1I7dIyMG+oTut83Jyctw+kS9YdCH
	22eNmSE/+3nAVVa317g1g0I5fiSWvWBTAn6I38HX4ZGLuLEu5wOP+PgUlEYUY3cUz+Ha
	+8keIaiBMsBrtHi9aWRBAI5goYaociq3xk1Tq84w25rqyGYHPCevnKXYNG/huPJsqlag
	KSV6EclFNJmuuJq9Z5pQ3g+NFkzjqCkFW2aPb/Vl7+7EnAYHwlmRL1oTFyoBfp9bh1U2
	uh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Zc39DKFvdE7Ft5F7k9EmUNwygbx0KM3U0cVoXJwqOUw=;
	b=fO94O17rxxKic5V94Q1yiM8FV/UxXsHETojxZ1XDLd04cUcy+D0HN3WltcDwxuwuab
	22pc4jgTjOVoauLR4Xi45+zqAhW/BV2nlAQRYVMgsnGV5/zmKl3p3Tl1iJ5XUtlHqRWa
	P1j26WZqgDXTDngyRx/w5/3z8PCs0bFnP30KkvN7TF3mirTMmEzudUTR/Z6jCpIWWAk5
	TS3ox7tr5YmYZ6TOyyxU8uR7IJir1qy7gmQXtfHn/VXaZPg9NQJKoWDpCRuFbtRL5t+F
	n9qrq51SuwL+FcTMhROWnVPzrfsMHasysqNK+ORKTBnv8M6JXeFNYvbWQ1PhloVdebWQ
	3HKA==
X-Gm-Message-State: AHYfb5hpw7qcFgpPkC8OxYAcEvoGGIQ3SFjghGGE3812tCVq3N324yKM
	jcQIKCrcW5O5yg==
X-Received: by 10.55.127.1 with SMTP id a1mr1095036qkd.335.1504130178471;
	Wed, 30 Aug 2017 14:56:18 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.56.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:56:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Daniel P . Berrange" <berrange@redhat.com>,
	Longpeng <longpeng2@huawei.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 30 Aug 2017 18:55:21 -0300
Message-Id: <20170830215523.25278-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v2 15/17] MAINTAINERS: add missing
 Cryptography entry
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
X-List-Received-Date: Wed, 30 Aug 2017 21:56:22 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b77590dc8..7a0c00550e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1526,6 +1526,7 @@ S: Maintained
 F: crypto/
 F: include/crypto/
 F: tests/test-crypto-*
+F: tests/benchmark-crypto-*
 F: qemu.sasl
 
 Coroutines
-- 
2.14.1


