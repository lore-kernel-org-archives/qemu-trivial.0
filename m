Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fdx2S-0005kD-IJ
	for mharc-qemu-trivial@gnu.org; Fri, 13 Jul 2018 08:19:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdx2Q-0005id-6H
	for qemu-trivial@nongnu.org; Fri, 13 Jul 2018 08:19:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdx2P-0004WX-DH
	for qemu-trivial@nongnu.org; Fri, 13 Jul 2018 08:19:06 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:40077)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdx2P-0004WK-86
	for qemu-trivial@nongnu.org; Fri, 13 Jul 2018 08:19:05 -0400
Received: by mail-oi0-x244.google.com with SMTP id w126-v6so61814200oie.7
	for <qemu-trivial@nongnu.org>; Fri, 13 Jul 2018 05:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FA3spH+mscuTs8+IB52chR3iH5IocanxFYCoGh47LO0=;
	b=AOdG+bNxoDNEbOepMdTzWURe/PKu9jbM8Go4rw3cKcc2nLoH5qlQcLeS6JYOkLTFst
	CqsuHFE1dti7jb7Q8hj+8x9G4eNxqkQfdfFDMK1WWP5IvXUnpZoTw7u21tFlOgQnJbzy
	yEmtTzy72AGEonWuFi7dl+eBMuD9T6YB5Zf0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FA3spH+mscuTs8+IB52chR3iH5IocanxFYCoGh47LO0=;
	b=H53Ak1w9PeowniB+/U50HYdiKSaw6j8YnFY5FLh3KJK1jhj5it3l8/zcP9ekkM69r1
	3AZp2pu0v1E66xlr6yk31A4n38xs6v5ohastxB8Ek1P3A4XS0WBR0+A+kx8JjiFOEPdx
	jHjIyfuR6iWnWMSLZikxQ2Vdcorjcn/WUdQqChehaO/zNP55ESRq56EnntZ8ZEn4beUW
	hdlyECDdT5+CchgzEh/wS42HaqA9E/LlHzA6ZXsHsUV8v4S9rdsSfjVMsNPO92iWAErN
	hM432tGGS7ohwjw0Evh0R/AQzm83SaUixUK2d3w69/JfPS8BSbfWRaOkJKXtkGkCOGg5
	Igfw==
X-Gm-Message-State: AOUpUlHvv9zQTtKtMDw3ONYPuXeCqzUYZnFGFcB87PKnbXAyiQZH7DE7
	QlUFzVGk2UIdnGYn9ejdULkl8w89Z4jnZhVatAfJjA==
X-Google-Smtp-Source: AAOMgpdZ0Q6tCnu6NTA1Cf9TkMWF+G3SGT/0etqb58GblkIfQzlorD0W4o9f1bXMYibSZQ9FrwUd++iL6GMykx+uHJo=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr7105431oih.102.1531484344614; 
	Fri, 13 Jul 2018 05:19:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 13 Jul 2018 05:18:44
	-0700 (PDT)
In-Reply-To: <20180713121727.6095-1-sw@weilnetz.de>
References: <20180713121727.6095-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jul 2018 13:18:44 +0100
Message-ID: <CAFEAcA-RG1FLcYKcsFAphPq=yx-gijh3zO-othSiR8pO86_b5w@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-trivial] [PATCH v2] docs: Fix some typos (most found by
 codespell)
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
X-List-Received-Date: Fri, 13 Jul 2018 12:19:07 -0000

On 13 July 2018 at 13:17, Stefan Weil <sw@weilnetz.de> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> v2: Rebased, so the recently applied fixes are no longer included.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

