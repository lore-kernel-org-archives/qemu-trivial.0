Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePght-0001c7-PV
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:30:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghq-0001Yf-4Y
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghp-0003Cb-Aw
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:38 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:46818)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghl-00030l-N6; Thu, 14 Dec 2017 22:30:33 -0500
Received: by mail-qk0-x243.google.com with SMTP id b184so8877569qkc.13;
	Thu, 14 Dec 2017 19:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=g3GbvBlD7/fDLjwTioFswSOZyl5iBvnB5etQn30JqMg=;
	b=U27lJ6J1cv+o4PaOYWVMrmvQ+DfuRSHO64UPlzVuK3pSny36QmaqCz3B+qAyF43/1a
	mw4iMpzsd5UymOKSYfUnusGXNPZXWmoXQPqhriDv/MsJsikg0TkEu/b/2EXxbA5jyk3O
	hxaCrMd2tMJiyBcw6MesxgGPBVnjPXeY7pWoIlfNyT1ussBNLdzvzYA/sgGj4VjsBI7X
	W/ueWeR8x30lRvdtL46Xu03iTKr9/wzXwUQ6DYh3PiqMB/N0csfhg4M/W3bNOiSvH4QD
	Bey5gixkn5YfAHUDi2R580ErSYt296AqCIsRg9HoFOOWsG703aO6A+jg6V0w8YHsNNCc
	LMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=g3GbvBlD7/fDLjwTioFswSOZyl5iBvnB5etQn30JqMg=;
	b=fAmKASlsYOaNuA0A6/tdaK+TjoHhtolkJVL68eYsRCY61kH393dRvDZVtWSSVdjQD7
	HaUshfJ+vr1KtwonEn69TiI+EVJlMPSCXUQIpvO+Jv97YVxYV2q21m5bAF8dXuGkHDsc
	4+MgemHZoIII9G1zV5oLqR0x6ouRDnSsd2rfgcDAsg7Mwxa04i2kjtFh/O5Go/vJmrTy
	lgBUJRM58C4v8FUxG4JBsb2DRqFQjun7cwlfrz+hNByjMVK4F289XXJT3/RO5N4To7LR
	LVSGthX3haQb93kTCXF8Euukx66/XZUgK93wRKgghdUlUJmL2Xg/ZNAxt/XhKKnlLXf9
	v8kw==
X-Gm-Message-State: AKGB3mIOB2Zt4WJ+YNbN0a99h4IbgiagEAc6zZqWcmxkya9vwxsroL9o
	OHLamDuOmi5WAnULEDFb1dw=
X-Google-Smtp-Source: ACJfBosWkdzihS+c6l8ZiSB/kWsO1HHeFySMiXM1g9CD9q7jIvz0oHGzS17wUX9Bvn0ruTX8jsQbaQ==
X-Received: by 10.55.152.129 with SMTP id a123mr18986143qke.142.1513308633181; 
	Thu, 14 Dec 2017 19:30:33 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.30.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:30:32 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:29:35 -0300
Message-Id: <20171215033015.738-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v4 03/43] MAINTAINERS: add an entry for the
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
X-List-Received-Date: Fri, 15 Dec 2017 03:30:40 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb1646fbfe..31c673d60a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -877,6 +877,7 @@ F: hw/timer/hpet*
 F: hw/timer/i8254*
 F: hw/timer/mc146818rtc*
 F: include/hw/i2c/pm_smbus.h
+F: include/hw/isa/i8257.h
 F: include/hw/timer/hpet.h
 F: include/hw/timer/i8254*
 F: include/hw/timer/mc146818rtc*
-- 
2.15.1


