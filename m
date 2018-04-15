Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rIs-0004Co-D3
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:43:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIq-0004BU-Qp
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIq-0008Rd-3x
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:24 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35905)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIq-0008RO-04; Sun, 15 Apr 2018 19:43:24 -0400
Received: by mail-qk0-x242.google.com with SMTP id a202so1987932qkg.3;
	Sun, 15 Apr 2018 16:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2OfE9BTBr49jJi9yG3PZ7JL9EJombaOFRk1dSRh7A9Q=;
	b=ZQb8xDQPNe2Ds552F3wCbZ2IsnQ2QVouiSsfEVCNESdjMqrNcPY7HuC9Tq2eRb8930
	ERerAQDbUihgAB4VeJsuStM8+RQwAIg727Ae9DS52skoeCFw6+Pzl5HzA0gyrUdbp/Hd
	oC8CGSAm4pXW0UjhX9wPnYMB3Gzv/EdT+UJVrvBAYTgtXIvS/HU0zermdf41RyKE/QiU
	/0emJRGghifbbq6MQpM5bwYRxGEIUaf2K/YSCJcyeK06QRvFNyfJzERugbyzfQdDRw2G
	6vj2SyiIq1K8RH8yBGDAdAQfOcSSLj+RuCiQe9mjEEBCj6LMiB25lzbWWewqy3DCfNaa
	bQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2OfE9BTBr49jJi9yG3PZ7JL9EJombaOFRk1dSRh7A9Q=;
	b=CdElnCopzS3FfHVsaXDyTh3QxG9O7ubvWsYoJ/MJgpC6BgNEj7bQ856ywBbMi2t3nV
	opJvohy2U3aCaRaUozyjAQMI2qh6rRtFifQpFYaanVwHYKDHWrC7Kj1m0/YLo78AXjfW
	066OU/ZdkoJqTW4jxP28eW8gKypu152Ze2zegN44WAFWtSnL9sP3i0fDmIijVYOYouf0
	hQV6E3k50OjwyoptEjWjvYm+GU7RUWmhNCC8DqpW0wwov1qvHb8C7qLFZ2+oR2IqNXp+
	5soqef6knmrofjwey9RardRaWDFHgjFVNDExUrc61XdyiRh0Ix8ocK2rneDfSClUTOoh
	aiiw==
X-Gm-Message-State: ALQs6tBJ5RWxDwWGdXvmxsoeWHFUt2zfNs1YG6BkSAUR+udvanUYQyWD
	h5nBXivr4uNistj/wgnKBwbShmny
X-Google-Smtp-Source: AIpwx4+txmzINV868F7nf57J9Ja2t6ljdJrW8kp9tQzdhOB8oh7Uk2heOaPKAqNx6ZGP8oHAtxrccA==
X-Received: by 10.55.25.196 with SMTP id 65mr14968427qkz.64.1523835803380;
	Sun, 15 Apr 2018 16:43:23 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.43.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:43:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Date: Sun, 15 Apr 2018 20:42:28 -0300
Message-Id: <20180415234307.28132-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v3 02/41] hw: Do not include
 "sysemu/block-backend.h" if it is not necessary
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
X-List-Received-Date: Sun, 15 Apr 2018 23:43:25 -0000

Remove those unneeded includes to speed up the compilation
process a little bit. (Missed in 7eceff5b5a1fa)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/cris/axis_dev88.c | 1 -
 hw/sh4/r2d.c         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index 9ccc4350a5..1775e53e25 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -34,7 +34,6 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "boot.h"
-#include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 458ed83297..f5f3deab37 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -40,7 +40,6 @@
 #include "hw/loader.h"
 #include "hw/usb.h"
 #include "hw/block/flash.h"
-#include "sysemu/block-backend.h"
 #include "exec/address-spaces.h"
 
 #define FLASH_BASE 0x00000000
-- 
2.17.0


