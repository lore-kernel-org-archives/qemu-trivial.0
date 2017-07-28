Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxg-0004dB-LA
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxb-0004ZK-56
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxa-0003on-Cg
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:15 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34090)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxY-0003m1-GY; Fri, 28 Jul 2017 01:37:12 -0400
Received: by mail-qk0-x243.google.com with SMTP id q66so20242167qki.1;
	Thu, 27 Jul 2017 22:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OM5gClitjUe1+sjySvF6nDoCjeeaKUFNnWgQiIJBtX8=;
	b=bRoc3BxmxGp1NZMiJsrVJEbtTR/B9OU8YOtaMoVcfdlCp/NW4UqkqbrSml9511qTfF
	hj49BiyIArHvK1MImic+KemgRTaWsLz/Xn8KtkpztKHNCY+ttoQ/cAP0QuIPwVzOxM6+
	MRoEZ4WGvBCIx7M0FdRPH5l/6mZzj3OU3KdcqDVlYeBIdwr6B40g0f8v12oA0GkoT7DK
	WRbv1S0e+iaZGOGL0pO3e4Ulrr9zwZhOqT5KDjRnPsnL/8ns3zA5Mco6dCN5Jws0Q/7V
	2DT2PA0/ocghEZDjfs+gsde7+lVnJ8HSbN1ZNUWtAwSPNttN4UvzxDHO9H8wh7TS1qfm
	dhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=OM5gClitjUe1+sjySvF6nDoCjeeaKUFNnWgQiIJBtX8=;
	b=F8j/PJ9NzX8s2VFUmxpSlUFTE22tzb0gQhclpOczrtHMwfL1uemqHomWd013igrhSx
	Pq4T6Rhl3M87cLcf/Bd7Jnao/JQ75ZmffTMss9itso+m/hRgMSo5FSrKpv/OQABuEHMK
	lxXIRbBzG/oQH5v4N0uRgObeO0nlvtDCm8mQ1PU+BZKR93Psj0rAKOljD+3x+PXgKxCo
	vFYy6+aXRhg994QpTLXbKAa9ozxGZ67of/5ZUMY8jiTHuqKgqGz83ALilm8M1EfzoC7L
	u2O64RDjCfKsOnrzRQghISizC23+hzBjjpp4RnJf6bnCxe2KKkGeqW3OdOCORve2Mob/
	Ogtw==
X-Gm-Message-State: AIVw113tbUzVvHPJKZTnsm//lV85lDIcpu/9SvAb4ozIKeo3a+fS7pnH
	nMwme+0C0n8PXlWAFVy/1w==
X-Received: by 10.55.16.161 with SMTP id 33mr8983679qkq.312.1501220232102;
	Thu, 27 Jul 2017 22:37:12 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:44 -0300
Message-Id: <20170728053610.15770-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 21/47] MAINTAINERS: add missing CRIS entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:17 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 286ff7e509..14109f4513 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -131,6 +131,7 @@ F: hw/cris/
 F: include/hw/cris/
 F: tests/tcg/cris/
 F: disas/cris.c
+F: default-configs/cris-softmmu.mak
 
 HPPA (PA-RISC)
 M: Richard Henderson <rth@twiddle.net>
-- 
2.13.3


