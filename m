Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZvve-0001pB-T8
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 05:14:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZvvd-0001p0-7L
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 05:14:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZvvc-0006bO-Dt
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 05:14:57 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:35414)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZvvc-0006at-7C
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 05:14:56 -0400
Received: by mail-wm0-x232.google.com with SMTP id c184so46354431wmd.0
	for <qemu-trivial@nongnu.org>; Tue, 25 Jul 2017 02:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=emuOkOaDVOT1/587mIhf4k5cAPTE6tU4efH0AVeqXBw=;
	b=aW0E5KAL6Ycjdw7eS+Yn2ileWO8xHCZMTiptibnPZB5Xt1UeAkwnuYJRgGkUEIWyYg
	QurBEI0ZhyN9VtN9osKeF49ynxy8lQIZv83OXHzn/HiKU1SGroqOE6twFPY4+GdzmvKF
	aM8AaaBtRXh+m72tszk6abvoM4r0Et5S10F1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=emuOkOaDVOT1/587mIhf4k5cAPTE6tU4efH0AVeqXBw=;
	b=QiWG7y5Tbe8YbPJ2pN4sTMc1KUyATyfxuXVISjeiSGz3YLMps3qZy07sTOPthaKxu/
	bKXT/n57tVY7WNn9APHPUaF3VI7BPsEJwUC9/pJw1VGx5iV+3s0bNz2mFAEW+w4rP7vJ
	jWK9JUyze67mjiMl/SfAKL5KDwS+Xafo4zMdbsrCXvH2XpIoc2gOus/8eiR/2Y8H5gZM
	sOU4xJByBXUmdwTTfcGFdE8mNu2fSYLP5l8yzucqQoe/x05iUnTBRU31QG9XKmeScu1P
	iErwx/1amOwArsCzjvvNGUJFFKyxO+ALPsQ71r8w0DJAz1vQnJJWA0bZfCj2CQP3McG5
	UPAg==
X-Gm-Message-State: AIVw110jEIt54yTvwo5HcJM3oysj5/BJZ+Xwok2FxpIpOI7BBTKdf5GW
	HoX4HaoaOn1XXSNgqaD1vkGFUkjULPII
X-Received: by 10.28.198.206 with SMTP id w197mr7468238wmf.86.1500974095102;
	Tue, 25 Jul 2017 02:14:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Tue, 25 Jul 2017 02:14:34 -0700 (PDT)
In-Reply-To: <20170725061158.10745-1-f4bug@amsat.org>
References: <20170725061158.10745-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jul 2017 10:14:34 +0100
Message-ID: <CAFEAcA8QV9iScELrbOYXGmsZ2GeU9bYoNaO4mGHtNHgP8aOeWQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Fam Zheng <famz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-trivial] [PATCH] Makefile: add
 all-user/all-linux-user/all-softmmu meta-targets
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
X-List-Received-Date: Tue, 25 Jul 2017 09:14:58 -0000

On 25 July 2017 at 07:11, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Useful to build a whole set at once.

You can already do this by not specifying a --target-list=3D
option and using whichever of --disable-system and
--disable-user you need to skip the ones you don't want,
can't you?

thanks
-- PMM

