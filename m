Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxv-0004r3-Hy
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxr-0004n9-B1
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxq-00047k-Lu
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:31 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35824)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxo-00044h-5V; Fri, 28 Jul 2017 01:37:28 -0400
Received: by mail-qt0-x244.google.com with SMTP id t37so8845517qtg.2;
	Thu, 27 Jul 2017 22:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SCpAy1PUaq31NvzuMEbvpVkgMiciinr8/ez46WrYOG8=;
	b=CcrMhMJKpg+8VoiHq0i3L6mvYpcg7Zjy+C49JWuDmX8Z3C/ML0+rC8yuitkTimPqGa
	w+fFyLwkCbZZ04cQe8F/ActzKUzrFDjs9btTF4DHwdxe9WSo7GltObV+0ED3/1MtA4nS
	XdNbvoEXbEieZ9BLzdlf7TlWYaoL0yS6xnZJxRMqEEbDvyz0InN8LxLh1+rM4Q9Yj5V4
	6YLqBQWu+3YmFwEj9NQmPnOnVpyzQCf1DqD5/DCajTmP9N33xd8OeUxnSJ3xjfpHWm8p
	x0ENthMVIRhdqpyI6Q64WklkKFHaCAtm6vjq5vgxg+o4DD/ceL7aA7G4n8US1qnkKF2m
	adUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=SCpAy1PUaq31NvzuMEbvpVkgMiciinr8/ez46WrYOG8=;
	b=rjDQ9Vbr3wxdYXp9xxO9BT4qXjEAoVmBiF1hf7VSJywlbTejWrYYLYbAmY7UHgb9fh
	vb242OL7XUiXAu/MP3/UibLRS+xq3VNPfjOCNz2Qd1YrQ7gAiGDTqc2JUdRFfBqTt33t
	5TjgmIs7nmwoQcaa9hIfs55awooq/KDSOzwpGUOdK7gEsOuIgujfUcyq/EYIm5tj5Dll
	TcWKHbWrdf+F0ztFeNAiAGwmxaZoDV7DmBPBNBPtmwXevLmMxlAMTUP/2kaCUTnHPFKm
	BxN0Sw261vo/97MSNY3Vp0Q1Nq4skrj9oAtnVGvbHNvNa8ewvvtG4avb6MvomMQdyXf/
	Rq8w==
X-Gm-Message-State: AIVw113Mspj24ITB6dk0SwwQ04VPHfMjd0iinf5fWOyOfSZ07CPU9V7C
	LX0TB3BFrafhm2+nZvWp0Q==
X-Received: by 10.200.49.37 with SMTP id g34mr8611108qtb.97.1501220247737;
	Thu, 27 Jul 2017 22:37:27 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
Date: Fri, 28 Jul 2017 02:35:51 -0300
Message-Id: <20170728053610.15770-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 28/47] MAINTAINERS: add missing PowerPC entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:32 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 35a7253e22..9a0da13bcd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -218,6 +218,7 @@ F: target/ppc/
 F: hw/ppc/
 F: include/hw/ppc/
 F: disas/ppc.c
+F: default-configs/ppc*-softmmu.mak
 
 S390
 M: Richard Henderson <rth@twiddle.net>
-- 
2.13.3


