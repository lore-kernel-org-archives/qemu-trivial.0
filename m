Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxs-0004nn-0j
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxm-0004i0-74
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxl-000425-F2
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:26 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37485)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxj-0003zj-Il; Fri, 28 Jul 2017 01:37:23 -0400
Received: by mail-qk0-x244.google.com with SMTP id x77so5584144qka.4;
	Thu, 27 Jul 2017 22:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6+KRtwRUgX+gvmVK166T8hy1yPSvn8IBxJTGER7jBbA=;
	b=pCXFA3uuUKdxF+eeIrVGUw/3izxOnMAmZT1qOyTkvFHM3CbKtS+hZko/fAxXh4ZdbK
	TbfRydiWBh03Tm5LcWp9Ykpw4gnadAxCiXUGHoa/gKp9LkvvCHEIr+23Dyyq96+OEocj
	OFKylk28CI3qmayW1c7DD87gkMG9KyitI03WmeS6vqCXb384vG/GqkT+ttLbz60TtGKU
	FYXYob6MZmmZZWL1d9DSgr3c2+3bDX/WnNlkKSUN35pTENW/xDMiuLu4f41nK8VMM/QJ
	IVpurfhCKqKL53/6LRbtPGujyUydlCcTqcELYQpw0GX3fVa3FUMe+0feIFuQy/cGlcrA
	iliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=6+KRtwRUgX+gvmVK166T8hy1yPSvn8IBxJTGER7jBbA=;
	b=a60HPjYaY5aEHxgNRzdO6SN3XopagdmPkK/AIwyFsBYzpEu9ZOLlclZKOrMoZKY4Wt
	f15kYV1TcQTslNWIXwIRTJYfTcLEVpimTMuzvQ4lM4ilQg6Vy1AV4kgmxHODhzOXUuKx
	7AnAdSAYeTImMw4BWSSUxH6vKRTdxl/Qg/tx+UQyCxFLwb2NHi9gKItwqShOeQDaitMW
	pYfaYQ3ePwTFGWpljUN8XPIO4UNx5D0r5MprMjzGrc/av3eyXYjJAR/xUpKFQZn1fl7r
	6ARi40tUjmCtDaTmoi++6bL7ADUu6j+5UhT3aNIdtTJBTxw+O9Up/X075mD4Ydna5VOg
	eiEg==
X-Gm-Message-State: AIVw110NUFg7hyVtpWq2Xzd5n6P+QifdxBjPIgxqPTC1hrT7GbRnPB2a
	MWE7wPyQe0NpyWDHUkqkdg==
X-Received: by 10.55.106.197 with SMTP id f188mr4818753qkc.289.1501220243151; 
	Thu, 27 Jul 2017 22:37:23 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:49 -0300
Message-Id: <20170728053610.15770-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 26/47] MAINTAINERS: add missing NiosII entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:29 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7354afb9f4..a4df19d304 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -199,6 +199,7 @@ S: Maintained
 F: target/nios2/
 F: hw/nios2/
 F: disas/nios2.c
+F: default-configs/nios2-softmmu.mak
 
 OpenRISC
 M: Stafford Horne <shorne@gmail.com>
-- 
2.13.3


