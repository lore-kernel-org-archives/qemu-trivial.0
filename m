Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxy2-0004yB-6R
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxy0-0004vf-5c
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxz-0004Iq-ED
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:40 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33954)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxw-0004Eo-Vm; Fri, 28 Jul 2017 01:37:37 -0400
Received: by mail-qt0-x242.google.com with SMTP id i19so11808730qte.1;
	Thu, 27 Jul 2017 22:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vpvaiyHIXtnwfpQCNAcHXRCDzhp3ConJvo4wwHhFezA=;
	b=dYiz9cE1w8BRnFz8KwfrSgvx9PxYJHyUP0uGNbB2V+r2ANNkpPuGdymmIPHsBMJqHH
	nvQHW72XlGwVnCONJwAj5APaEeWQYXBSzDr202xTmuov95NAQRm6FG3d7LKaBMQuGKB+
	9Zl/xBrRe/cZiJRteMQIdTmcq/bcKalP/EM2VvgRh/9eVb0qDHrOy+P8yovsaAxT6Mea
	akJXCK4GSsxBhxhuqWoHYKcwE8iLBJOX33x3voN5sLeqgQwcEuY8NiTxzvIDGwgG9j4n
	x5vCUjQwgZSofQGuA67vF7MJQjlSFYBxwEoGAA5b/Ruj1gplCXJDzfjyr12f3iE4RXN+
	e01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=vpvaiyHIXtnwfpQCNAcHXRCDzhp3ConJvo4wwHhFezA=;
	b=WosJ/d1nCAyeqeraENonVBMoBU/Dr0MMztGb37WyaVt775/9h3w6acgDUDOpA/IAZl
	f+12M+1eKP1R6eJr5j7EI3lyyLhuTBOs/M+rqaFX3Gb+/k17s4vAUJwHuiSZGiOnCoRi
	juvWt+73bSzzpVTL4SyVLIWSn/xyeEq0+VDJqrwYn5qOW1Wo2VbETr4RqiyVKY20zSUF
	EMojMD4wzxvH71sarpZaIvrGnEyxGrwj2CFWiCTTYEF8QECgKyHX0YfHFWUF3W2m8A5r
	y4cG5SRmrvhQZa756ElNmB8FcyuKiP1DL+FiqJhQ6+r06wLKIWDocyf8tClsfywTE0ko
	NE5g==
X-Gm-Message-State: AIVw112KL8kv8HEGTCOnEHuRtkJca1MUuEEFscDyUSHIVt4ilxPyAM/Z
	uUOlWj8IPRKiIQ==
X-Received: by 10.200.9.45 with SMTP id t42mr9068523qth.289.1501220256567;
	Thu, 27 Jul 2017 22:37:36 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:55 -0300
Message-Id: <20170728053610.15770-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 32/47] MAINTAINERS: add missing UniCore32
 entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:41 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7997c90be8..6d805b081d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -253,6 +253,7 @@ S: Maintained
 F: target/unicore32/
 F: hw/unicore32/
 F: include/hw/unicore32/
+F: default-configs/unicore32-softmmu.mak
 
 X86
 M: Paolo Bonzini <pbonzini@redhat.com>
-- 
2.13.3


