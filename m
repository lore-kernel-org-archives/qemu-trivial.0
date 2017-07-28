Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxM-0004LX-SZ
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxJ-0004Gt-4w
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxI-0003OG-EE
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:57 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxF-0003Jr-Pk; Fri, 28 Jul 2017 01:36:53 -0400
Received: by mail-qk0-x242.google.com with SMTP id v76so8643847qka.5;
	Thu, 27 Jul 2017 22:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3K6fPsHT5+hUUrHsgGGpzO2B9gTtBKx2oAVSu12bsZU=;
	b=spgp3l8G4VlL/NuaYK5NpBiPViDJCKZia9a9bdqqZk8UIN8EoXXsNglusrUf172QZ3
	4P/NduLF4sRD1Cq92AXu11g8PMnr+BY5vTKRzp6MfQRfqhMOt5SAtPTjnCun66zX91Fs
	a1JSlGVAWytEudjCQ/4iFrLgQDSg+e4u4aasIp4i8duM6tS0LClPZ/nR9Z2GHfVzvYYt
	hoqdiTnf7cUfyHIB0BjQrvGsNa+ikUdqw0qNak58u6LHTzM4juNGj2Fx8DzkC3kXh0i1
	JLxTVJ3i8YVGtJp5HIV5x9scKhcfdhnVPOOZC2i8o0b8xis41j5uzmVmAb3IoFMTwbWJ
	MZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=3K6fPsHT5+hUUrHsgGGpzO2B9gTtBKx2oAVSu12bsZU=;
	b=J7+l2jfPSxGdqnHh4luA603V+tHnsFzKMuMLnkTG5oVIKb0b6E/Ua2GbaQhLCRKvsx
	ZZIkp8ARNatGK8MaRCpCX6ylIiUXw+26YSgNSLymT4lpSMC09OQ9lDPMgh8oZYuU7IWe
	97bYbxxMjLq90giYkjNDmY681DcPcbW0sKFA8FIcH40C/KsuhtOFoYafTp6NUu3oE5EE
	Lcn17N9qpaPTUHsTOssDTmOwGlzHBHJ+moYbbsWCOY7gG9B5qVW8VmLu9fW4LOhW4uV/
	7xomItAp+gcj9UAImvISu+vdliMlVqtZHyrB6SDQc1sZDqwEfP1W5cI0X+OpycwByHUu
	//+w==
X-Gm-Message-State: AIVw110S36yLpyM1wvjPqkhfgRlwHjCcaXgacX4iRjMWTl9W856Gpmqm
	Jqj3lIJzTBLmQyc2qcm4VQ==
X-Received: by 10.55.110.133 with SMTP id j127mr9006368qkc.92.1501220213353;
	Thu, 27 Jul 2017 22:36:53 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Amit Shah <amit@kernel.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:36 -0300
Message-Id: <20170728053610.15770-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 13/47] MAINTAINERS: add missing entry for
 virtio/rng
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:58 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a9f950248a..842c66c325 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1103,6 +1103,7 @@ F: include/hw/virtio/virtio-rng.h
 F: include/sysemu/rng*.h
 F: backends/rng*.c
 F: tests/virtio-rng-test.c
+F: include/standard-headers/linux/virtio_rng.h
 
 virtio-crypto
 M: Gonglei <arei.gonglei@huawei.com>
-- 
2.13.3


