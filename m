Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dQayv-0001aj-Av
	for mharc-qemu-trivial@gnu.org; Thu, 29 Jun 2017 11:03:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayt-0001Z3-KT
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:03:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQays-0006m3-5p
	for qemu-trivial@nongnu.org; Thu, 29 Jun 2017 11:03:43 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34742)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dQayn-0006kO-4G; Thu, 29 Jun 2017 11:03:37 -0400
Received: by mail-qt0-x244.google.com with SMTP id m54so9083082qtb.1;
	Thu, 29 Jun 2017 08:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OAEPjRw41V4kCm95FPXK2/RfbCa9xM8A4lY/4qVQads=;
	b=KLSX/MiQcpbAIIOgQuSNSiNeZP1yjHbcFxYOEGhPtUiEzi+fHWilJZ9/tlYduHoSOv
	4z+2YQBr0Y+N21lZLGjsKp/KUdYRDMYP9zo+muzm5axYDt4Hrj21vvixTvYRr37B2j36
	y6vMcTIZDnODj+RtqB+j0M4FCInUIli4GPmV5x1XN/qH/s6WsR4DwPFn4eukIQzNPnQ9
	4LkSJtL5Qsuk6r/hN4Q6w0bXPsrySV4enRpFUuS5cVDsASE2P26iDxi+A/+WeFmwa7Vi
	xa7LDTtdOrQxaJd035LnYtIkSGBjjzyXmyecd/4rUsyMmc5dLkLKJTI7WGM5GU/DppnW
	6H5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=OAEPjRw41V4kCm95FPXK2/RfbCa9xM8A4lY/4qVQads=;
	b=IqyENtAwlv8X4Zl9JJaMh68Fi3/P6YwqvZnW4cS2BgY+Hdd3J1JE/9rh8QZ00Nyhqk
	0Mo93MgIacD6d6ub3Zy3L/Yh59X7MT6nD6bt3HV4+K65ITxcGQzPx24uRxR0iGlVXlxm
	M8yBZ4KbwFfn7rzMK8MuQwgobnYfF6NDbBclMauzK76jWRGMLMRSDPBYPZHyBA/vmhhJ
	JWnNLRm1PMS+IiXG5OxnqKzI6x/uKen4bgZCuHva4D/kjyDp/Fi+MOCHSCMFnQ212+JZ
	WxZJK4PngPgya3a+IY709lPmYj713toIHJyus/U362tIjhfwK5EMTncvHKqrk3BlVKSb
	mhsw==
X-Gm-Message-State: AKS2vOwiGsm8umetw8K73wRtFaE7EnlqmLnhnZyur+tRZPStHSLH+ma3
	+MOB8Z84UAaoSTcm+6zHSw==
X-Received: by 10.200.34.2 with SMTP id o2mr1714551qto.67.1498748616060;
	Thu, 29 Jun 2017 08:03:36 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id z1sm3873349qkb.37.2017.06.29.08.03.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jun 2017 08:03:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Thu, 29 Jun 2017 12:03:08 -0300
Message-Id: <20170629150308.22766-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170629150308.22766-1-f4bug@amsat.org>
References: <20170629150308.22766-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v2 5/5] MAINTAINERS: add entry for
 "Unimplemented" device
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
X-List-Received-Date: Thu, 29 Jun 2017 15:03:44 -0000

Also voluntary myself as reviewer

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9bad523060..890c25f0a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1155,6 +1155,13 @@ F: docs/specs/vmgenid.txt
 F: tests/vmgenid-test.c
 F: stubs/vmgenid.c
 
+Unimplemented device
+M: Peter Maydell <peter.maydell@linaro.org>
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Maintained
+F: include/hw/misc/unimp.h
+F: hw/misc/unimp.c
+
 Subsystems
 ----------
 Audio
-- 
2.13.1


