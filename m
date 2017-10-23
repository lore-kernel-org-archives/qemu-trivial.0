Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6cW4-0000ZE-A0
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 09:11:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e6cW1-0000X7-IO
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 09:11:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e6cVv-00086R-Kg
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 09:11:37 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:50963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e6cVv-00085e-EL
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 09:11:31 -0400
Received: by mail-wr0-x243.google.com with SMTP id p96so3441391wrb.7
	for <qemu-trivial@nongnu.org>; Mon, 23 Oct 2017 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3Jz9ap/eE3yRLs8IkG8EUBuLug+HrQhxdNIrmJYeeJE=;
	b=kChPsecNUljJwBHED+3T92z6JdQpnvXZJWnyejbrHMlE7EjeJ9UD612guJa2g/Fg49
	9Xn+6FyoKsNeef9ug70W0u55MdkB25/5ue7g17cY25AtKZtTdFpWXhigMTB3dSNgkUa0
	0WsHJnQERcOj3dxINoShmp+H27K22tFfQZPb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3Jz9ap/eE3yRLs8IkG8EUBuLug+HrQhxdNIrmJYeeJE=;
	b=LiGj4VqUk8sf4b+BliTw7t+BLPwsHqrZ7tZcslF1A31MG0JHuEsWJEAbokfCxaQe+S
	PlGlnrHTv3vsMw+aDX4pQSxSaiG/zcA+VxkyWOjAtfqpdcbgUdcxTjFLV/Ues/poBOjz
	FugBQ3jdDBGLEH50Nh96gnW+3vjg747lglVewTEmzecnAq8qAYgJukeUQ62RikN0wY3d
	dCILLs9EDhn8qwd0M2ea502Rvqu2f5Lt91t7oKkreOxDRllrWQp/lQzQbuQTXAnz/S7R
	Thksb/NLTwl9hfX4aUMJjqFqkmBCxG5HBbfth5oq7OvUPbY1Ep0SAWtABdIQ09RYiw3x
	EpmQ==
X-Gm-Message-State: AMCzsaUlB7h11kzQ5hAcr0QGEZnkZhtJ98D1zU0HvaRmNax7bbKI46kD
	47NUwCJqvqph9d9UhYojQZRIs4arpkT7oYxUuPj+CQ==
X-Google-Smtp-Source: ABhQp+TfCiTVKaY9pekMkaZMKYulth2mTztdMr1xcoo3n/ajRAiHYxDoFjU7Jv0VsuBRFNAyPtz21XAHrzyD7/TpjjE=
X-Received: by 10.223.171.161 with SMTP id s30mr5075796wrc.194.1508764290251; 
	Mon, 23 Oct 2017 06:11:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 23 Oct 2017 06:11:09 -0700 (PDT)
In-Reply-To: <20171023122719.17199-1-Jason@zx2c4.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Oct 2017 14:11:09 +0100
Message-ID: <CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-trivial] [Qemu-arm] [PATCH] hw/arm/virt: support 4 serial
 ports
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
X-List-Received-Date: Mon, 23 Oct 2017 13:11:38 -0000

On 23 October 2017 at 13:27, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> The QEMU man page says:
>
>        -serial dev
>            This option can be used several times to
>            simulate up to 4 serial ports.
>
> However, the ARM virt machine erroneously only provides 1 serial port.
> This patch fixes it by populating 4 of them.
>
> But, unfortunately, this patch doesn't actually work. Sending it to the
> list as inspiration for somebody on the ARM team who might be able to do
> this more properly.

This is really the documentation being wrong -- that is actually
a PC specific thing. In QEMU generally, -serial can be used
for as many serial ports as the machine model provides, up
to a maximum of four.

Why do you want more than one serial port in the virt board?
If there's a good reason we can add more, but mostly I only
expected that one would be needed, for the console.
(If you're using the TrustZone/EL3 support then there's
a second UART for the Secure world.)

thanks
-- PMM

