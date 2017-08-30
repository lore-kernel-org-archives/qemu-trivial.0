Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAxm-0005Jh-3I
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:55:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxg-0005DF-HV
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:55:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxf-0007Zi-Rc
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:55:48 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36531)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxd-0007Wh-EC; Wed, 30 Aug 2017 17:55:45 -0400
Received: by mail-qk0-x242.google.com with SMTP id l65so6401130qkc.3;
	Wed, 30 Aug 2017 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0lrX+2zmS/E/Mg9DUDtpbSnHfrsMuZMmPaZOxWswPzs=;
	b=M3HWq5F4xVrcpAbJt7H32dBaOfEQ04ernV191kRlVq0FoxjnMKoTRHbd36aSXkuIc2
	Xjmao34m8bcc9jX0nQUB2fjrx9enlApiNjN/OziNL19YOJ3U75cBjIvNlAt8q7slEm07
	mwncPO2pjWj5bYwWG7V5FZj+zZNb6vae5kV5hvvJmHIZRlGHD6WlXvsZ0zxVQERhl7oF
	bI8oSrNHMCZDVxk/NI3NSvwIwtzzHvc8fjOkSQZFnsoYZ6FVIna38LshsHbatD20tIyd
	CjV/SXO4618Y6Req2J2Tvna7s6W0tmSmLVWW/4W35iSFm6udk3UTn/5Bti1XxEMse6y/
	GEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=0lrX+2zmS/E/Mg9DUDtpbSnHfrsMuZMmPaZOxWswPzs=;
	b=DOuJdWMQP9xYXn3MDJAJ4aOgIzCU+NrmcnVjLShSQCuJJ2/9HHkK7iBgXTbfhrXBEo
	6k0BIdlOpuO0SFo5pVoDX4K1v5l6o0sO/NpWEV34aLHlv1Zir/JU6N5dN7bh/rGfLHq4
	caZcr4MLsH1czjwZG5RNnf6LWGCtT8gUQZk6gpbauRsrSP9B3wMu/184bdywi/Q6DC6T
	ZyQP53ZnxvEvHMNguz8xSauPheN28kzYroZqK0NNCDl1MbrFap1mQl/xEfIkdC3olAfR
	HfE2RqenQbrnwKuZAlXT7rf6gl5hMGvzL0/qPTP2l1moR4MhJC08ql5Zek+22aN6yxnX
	/lNA==
X-Gm-Message-State: AHYfb5iXDFqKC9PRqbj19DsV2/RqHGP0IRZjV07vRVEE4C5Nt0HAoVZ6
	VBT7h16cjh9GKg==
X-Received: by 10.55.126.195 with SMTP id z186mr1077195qkc.210.1504130144872; 
	Wed, 30 Aug 2017 14:55:44 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.55.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:55:44 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 30 Aug 2017 18:55:08 -0300
Message-Id: <20170830215523.25278-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v2 02/17] MAINTAINERS: add missing Versatile
 PB entry
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
X-List-Received-Date: Wed, 30 Aug 2017 21:55:52 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b363e1b9c9..5b7891addc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -515,6 +515,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/versatile*
+F: hw/misc/arm_sysctl.c
 
 Xilinx Zynq
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
-- 
2.14.1


