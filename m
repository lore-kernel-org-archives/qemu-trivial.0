Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fqyAi-0007rX-UQ
	for mharc-qemu-trivial@gnu.org; Sat, 18 Aug 2018 06:09:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqyAf-0007oB-H4
	for qemu-trivial@nongnu.org; Sat, 18 Aug 2018 06:09:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqyAe-0004BG-QT
	for qemu-trivial@nongnu.org; Sat, 18 Aug 2018 06:09:25 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:43663)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqyAe-0004AS-Kn
	for qemu-trivial@nongnu.org; Sat, 18 Aug 2018 06:09:24 -0400
Received: by mail-oi0-x243.google.com with SMTP id b15-v6so18137268oib.10
	for <qemu-trivial@nongnu.org>; Sat, 18 Aug 2018 03:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vQAWqTXLgfaKFL0rqvEB6vaQEfuuyRILZ48ntXlsbFU=;
	b=XPuy2OjlFSphEiRF2wFJZZauBBtMEkCQdThYNdybMnAR9LvRDAZ2skVjVO2iTd6Mnk
	V26L07V9pgEpB4rFaNYKWU2ORP5iuqr6fN45BoYiF797n/ZUDRgM7VgCXF+kmA9bSgAC
	vJWPB46DAqU6wjcSWN+1rKCIHrMMSJwNp/NIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vQAWqTXLgfaKFL0rqvEB6vaQEfuuyRILZ48ntXlsbFU=;
	b=SsQjHcb6VgHbWozV/IUbFo/AsruRn6Rz47Q3vfiFq8CMZtccFXftjf3j0SqALwx0qT
	/l6rvNJEsGdAssFr+VYOnGwfb9Y8D0TIxMT/qrkvw+9DVvNQKLKC6F8pX29EOLQPSZu0
	ZGYNZeViElKgZ3sxXWwnNuvLaEjMdtPg/gmXBFqV5q9EDtYtPgxXoSre1MCtmhnJpwk3
	kNLWS4evQhh7LMCS4nPlHeOW5Fyw4B4AMMPps/d5fv47jLwxiV7Mh+XgaeJGMx5tgPCt
	ygHDXWPFX/1GPV9LPQRnNlgcUtOFL/8FswnuaKR3BR817/rMAsgLYk5aq0UbrS33mPoK
	cyVg==
X-Gm-Message-State: AOUpUlGF+gB2hoI2wvJqWjcW8S3CZr055pWj045318SpfiMAjzUpVAJN
	zfMBOZ74DyUCIdkKrnfQgcKU3r+77sM2vONh34Ar/w==
X-Google-Smtp-Source: AA+uWPwxTValGxuue/hhf+rBjxOLiYr5HUa6PJW0taLlmm6XdVhWE55yPwkSo11xXCzg/bQzxA1JsYCY9T3wCvQhNEg=
X-Received: by 2002:aca:4204:: with SMTP id
	p4-v6mr5747274oia.242.1534586964177; 
	Sat, 18 Aug 2018 03:09:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Sat, 18 Aug 2018 03:09:03
	-0700 (PDT)
In-Reply-To: <CADS1RdSn1rVnXbWxB6+DmMOEgEsCLA-ZX3tZBA9FXWoAFsegPg@mail.gmail.com>
References: <1534507843-4251-1-git-send-email-hans-erik.floryd@rt-labs.com>
	<CAFEAcA_Ki4Sqke3qExAihjx+x9XpX2e6DJG0ua-VEvdes_gKBw@mail.gmail.com>
	<CADS1RdSn1rVnXbWxB6+DmMOEgEsCLA-ZX3tZBA9FXWoAFsegPg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Aug 2018 11:09:03 +0100
Message-ID: <CAFEAcA-XQ7U2yqLHMr9-ZbdaiLEspRmo37QT2UQVTTKwW_v5tg@mail.gmail.com>
To: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] sdhci: add i.MX SD
 Stable Clock bit
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
X-List-Received-Date: Sat, 18 Aug 2018 10:09:26 -0000

On 17 August 2018 at 18:56, Hans-Erik Floryd
<hans-erik.floryd@rt-labs.com> wrote:
>
>
> Den fre 17 aug 2018 19:51Peter Maydell <peter.maydell@linaro.org> skrev
>>
>> (Your indentation was off-by-one -- we use 4-space indent -- but I fixed
>> that.)
>>
>> -- PMM
>
>
> Thanks! I think i fixed that in a new patch so please ignore v3.

You don't need to resend, I've already taken this version with a fixup.

-- PMM

