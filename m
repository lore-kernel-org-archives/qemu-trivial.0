Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Uzn-0001MB-Q6
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:45:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzi-0001HC-6l
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzh-00033h-HL
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:30 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:51380)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzf-000328-1l; Tue, 17 Oct 2017 12:45:27 -0400
Received: by mail-qk0-x241.google.com with SMTP id 17so2814073qkq.8;
	Tue, 17 Oct 2017 09:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+4xGzTShXIQc7ZXsAcrFUkbfQuVmtugKUapqLCht0D0=;
	b=qu3lE9rG8DB+yoQE9jFvJf3aDxd9Hzr/iVVBySsE1Ao7NVDgWDn2oNvHIhmtC+8nuG
	cLSEhCl0oZMlFVeV2qAQ6eeBWFSUw7Uv2yTmLeMGzmz9+p1EcKO9bzcmPe/SyfigUvu9
	5Y3ovtXpWVuNqoF994iz53c8cOwR2u3llxL86N1hwiXS/CUSjewiBtwYrqdh6vQxg3BB
	rNNYpbj4zh/3v5A6EUpYk03XXde13ciI95aMynMpNgi18ASt6cH0tjVWhlhR9asxtltR
	Ob19t4gD1B4Ouzmco2jcasItvJfRZBCvljgM/zZ9DyVCIK+7DgAsgkpGyLfEY29ng5Cp
	RACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+4xGzTShXIQc7ZXsAcrFUkbfQuVmtugKUapqLCht0D0=;
	b=Ljt/CYVqxaK5M70SsukbjMSbIKw5gyL2YO7uwMiva6mZX+zXjEuPqcJL3Wx8SN4YtY
	jLp3TLof2n7uhVOhnwSSmxsTsGwjAzGSzmfmhJ1BWVnOdKMpyArRJNBrwev/bEVuiSA4
	CT9c9y1U5kkWY2FOmR2DBBRVus4M5tDWRpIBV2gD34rP18MOv0ZBICUgTmpNV2OB2Cux
	3qNoXgg9K17IQDxEqDxXHjNwm5x6ag32ZE29q2xezXffYCrmmWm1/8PtkSzO9Xr3beSy
	vvBR0CO5M4UH5QXiNCW3XeY07gyBRo0+LfFt1XFW1mdTVTtaquxSMh+rBmq7OqeHs49k
	Ydiw==
X-Gm-Message-State: AMCzsaVUSswW4qKlG/zj3KTJAX5ksYNYiBtHaqA+qPrvhOiXbwVGq8y0
	gKKfbq3hGCUk+z8If8Wsl08=
X-Google-Smtp-Source: AOwi7QAJk8YRaoXIoeQw+RaCXpw6cGxocXAewWkljieKa6cxR5oh17cCQ5d5NjnoE9fLSdillC/0xA==
X-Received: by 10.55.215.153 with SMTP id t25mr20307645qkt.285.1508258726455; 
	Tue, 17 Oct 2017 09:45:26 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Eduardo Otubo <otubo@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:43:47 -0300
Message-Id: <20171017164426.25277-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v3 03/42] MAINTAINERS: add an entry for the
 i8257 (DMA controller)
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
X-List-Received-Date: Tue, 17 Oct 2017 16:45:34 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 331f7391c1..0706b474e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -856,6 +856,7 @@ F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
 F: include/hw/i2c/pm_smbus.h
+F: include/hw/isa/i8257.h
 F: include/hw/timer/hpet.h
 F: include/hw/timer/i8254*
 F: include/hw/timer/mc146818rtc*
-- 
2.15.0.rc0


