Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQuZD-0005eC-B3
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jun 2018 09:03:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQuZ1-0005VD-Qx
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2018 09:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQuZ1-0000eT-20
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2018 09:02:51 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:36763)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fQuZ0-0000e3-SY
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2018 09:02:51 -0400
Received: by mail-ot0-x243.google.com with SMTP id c15-v6so1559826otl.3
	for <qemu-trivial@nongnu.org>; Thu, 07 Jun 2018 06:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=T6SkuW74gC4LzYm5NcOSw7I7i5GQ8vfEFwiNNiEsM4g=;
	b=jj+pO5mjL0nnoWepYELvLCcz6aNuDjGorkWVDqfPOw4lT0ha9UP5YRe88PUNungDlg
	r4LA4tBLFGZxNEcJcPBB4pDQl3XNZgCxdNgRbBarbRURKLOBIsOKrkeOtIu7SqZsHwkO
	0xnUyaw4DFSEaTjIbeiRzPE/5pUaY7qL6u4Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=T6SkuW74gC4LzYm5NcOSw7I7i5GQ8vfEFwiNNiEsM4g=;
	b=tbgP99L+inAIEI61eAC5PN776RTShiLeMXHJN7olaWmHb5ps/CmxD3pk0a1LO8vEOC
	a6X7AQGljCyV3DaPhZAQemEVfNt72BWoUw07CbBvoS8id3TnBVKMfBtLk3STMMa+NmGm
	Jv8sVwoZB3wBERIs/KXtVDA4sFDFUg9uP9ErJTWCcwhBzo0BtcaHhw3FgmWrZE5b3GHn
	PJGGT1XWxzjSWGiir2+dzQy3YnAfRzIcOgwSm/y9ihk8OyrbJM6sa/vBWKlR/HGNMrnh
	mI4JZ2PFFMSVQyq6Y68NtDvuQyam8uF5Te49mSuyKEUlvgoqjiSCt2FkBV7ou8tsoeki
	snUw==
X-Gm-Message-State: APt69E2luhpwbLfAhzznm6Ceb7dwjdjka8gU14o8RiKML4wvJYkXe13a
	ObPd5EzYyX2zPaM89I2cZqd9TTJL5EKoIjYnJZeD8Q==
X-Google-Smtp-Source: ADUXVKIiWc4mR9FASren1pPFdmrUYuuCpjLJRwJvSsST6brn31ssiKu2/kAQhgLeyfvl+vQWhp1uxsNX6TOeveieVVI=
X-Received: by 2002:a9d:16d0:: with SMTP id
	s16-v6mr1015350ots.294.1528376570052; 
	Thu, 07 Jun 2018 06:02:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 06:02:29 -0700 (PDT)
In-Reply-To: <20180606191801.6331-1-f4bug@amsat.org>
References: <20180606191801.6331-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jun 2018 14:02:29 +0100
Message-ID: <CAFEAcA9mDByYZixijY8OwbgJQpsh5TztGcJhAyaNFxE_X6o7mA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Corey Minyard <cminyard@mvista.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-trivial] [PATCH] hw/i2c: Add trace events
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
X-List-Received-Date: Thu, 07 Jun 2018 13:03:01 -0000

On 6 June 2018 at 20:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> $ qemu-system ... -d trace:i2c_recv,trace:i2c_send
>
> 4486@1528311614.709959:i2c_recv recv(addr:0x50) data:0x00
> 4486@1528311614.709994:i2c_send send(addr:0x50) data:0x05
> 4486@1528311614.710060:i2c_recv recv(addr:0x50) data:0x02
> 4486@1528311614.710161:i2c_recv recv(addr:0x50) data:0x40
> 4486@1528311614.710185:i2c_send send(addr:0x50) data:0x02
> 4486@1528311614.710233:i2c_recv recv(addr:0x50) data:0x08
> 4486@1528311614.710380:i2c_recv recv(addr:0x50) data:0x0d
> 4486@1528311614.710396:i2c_send send(addr:0x50) data:0x1f
> 4486@1528311614.710437:i2c_recv recv(addr:0x50) data:0x40
>
> or
>
> $ qemu-system ... -d trace:i2c\*
>
> 4486@1528311614.698315:i2c_event start(addr:0x50)
> 4486@1528311614.698338:i2c_recv recv(addr:0x50) data:0x82
> 4486@1528311614.698349:i2c_event finish(addr:0x50)
> 4486@1528311614.698354:i2c_event start(addr:0x50)
> 4486@1528311614.698357:i2c_send send(addr:0x50) data:0x11
> 4486@1528311614.698377:i2c_event finish(addr:0x50)
> 4486@1528311614.698380:i2c_event start(addr:0x50)
> 4486@1528311614.698402:i2c_recv recv(addr:0x50) data:0x04
> 4486@1528311614.698485:i2c_event finish(addr:0x50)
>
>  Makefile.objs       |  1 +
>  hw/i2c/core.c       | 25 ++++++++++++++++++-------
>  hw/i2c/trace-events |  7 +++++++
>  3 files changed, 26 insertions(+), 7 deletions(-)
>  create mode 100644 hw/i2c/trace-events



Applied to target-arm.next, thanks.

-- PMM

