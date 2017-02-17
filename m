Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1celrS-0001C6-MV
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 11:58:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1celrQ-0001AT-RT
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 11:58:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1celrQ-0000zC-0R
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 11:58:20 -0500
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f]:34914)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1celrP-0000yU-Q1
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 11:58:19 -0500
Received: by mail-wr0-x22f.google.com with SMTP id c4so33322061wrd.2
	for <qemu-trivial@nongnu.org>; Fri, 17 Feb 2017 08:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i5/ZywD431YS/gc0C568CXvsuOvj8DxDZCC8WUHthR4=;
	b=bVZmcZLDA3b5WJ+ioSJizslqEIsZvxt/+pLIXDnWPAWCxyP8fJfGC96tCSVT+niJPk
	9UeIGzPGQdAi+LX6zWAaVveFD+GIQh/HmoGgqF5HN+pjIeLZc9x2KLA6PNrz9Qg4h3LJ
	s8le7SVSo1s/1qmt3Ac1libmOx6shd3EvYqVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i5/ZywD431YS/gc0C568CXvsuOvj8DxDZCC8WUHthR4=;
	b=FQ8brmk6xzfNm6MkxWktu1eRM16+dXb83fti4IOmuy1MRSx3Wzkv033X4KqCsvCBAq
	trylAZhSvnNDOnA6K0RuKw/Gz7RZMQkT56Hqv4f+4gQ2MTo/7VyA+GgZIKjwqb6yXFUz
	2DUIkekCwvAi3TRYMwFt7l9Rz1VEUbYoCKcAsZuSr2DQzfH/GQtkLYpgiIKtQfmG6mxr
	7QTagKH5AkCQ08tD82hjB+j62v7BMP+uaCIIdex8/0z7PvTEJceS/wCpx/Y/b1DFTAJy
	nmxIVag1BjmGwIBVXbLb842oU+3jS1yixTRThyGwENG9dOHZkkQoYzC8EP4AiCzlt2hq
	CEmA==
X-Gm-Message-State: AMke39lJhtOaBujkpABRP9Ix9yU13/gAwX6CcjZuasYw779qDEdq8wSg+v5NGrhz1ZIUvBPbZXPuO7eXfKjtzcdk
X-Received: by 10.223.133.68 with SMTP id 62mr7282245wrh.195.1487350698644;
	Fri, 17 Feb 2017 08:58:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 08:57:58 -0800 (PST)
In-Reply-To: <7c4d6c25-3b1c-61ec-1eda-6c5e7cee8755@redhat.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<e19aed34-77c2-f588-351d-2daa8a099ae9@redhat.com>
	<CAFEAcA-3TkmaJXpG2RpzBPKmj+JKGK5EBwPvXWkwR=Qkobq-Sg@mail.gmail.com>
	<7c4d6c25-3b1c-61ec-1eda-6c5e7cee8755@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 16:57:58 +0000
Message-ID: <CAFEAcA_3jE9F92F6+p6eDfmPwV2LL=fKV-htfTHpCoCOAgJAMg@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, Chad Joan <chadjoan@gmail.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::22f
Subject: Re: [Qemu-trivial] [Qemu-devel] Fix build break during
 configuration on musl-libc based Linux systems.
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
X-List-Received-Date: Fri, 17 Feb 2017 16:58:21 -0000

On 17 February 2017 at 11:20, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 17/02/2017 11:18, Peter Maydell wrote:
>> Defining _XOPEN_SOURCE is easy enough, and I think we should
>> do it unconditionally. We should check what effect this has
>> on the BSD hosts though I guess. (You could argue that we
>> should be defining _XOPEN_SOURCE anyway for the benefit of
>> the non-glibc BSD/Solaris/etc platforms.)
>
> Sounds good, then I think we should define it to 700 just like glibc does.

Unfortunately this idea turns out to break OSX compiles,
because on OSX saying _XOPEN_SOURCE=anything disables
all the non-X/Open APIs (which you get by default, and
some of which like mkdtemp we use).

Looking at the manpage for Solaris
https://www.freebsd.org/cgi/man.cgi?query=standards&apropos=0&sektion=0&manpath=SunOS+5.8&format=html
it seems to also go with "_XOPEN_SOURCE means *only* those
functions", though its mechanism for saying "and the other
stuff too" is different (define __EXTENSION__).

So perhaps we'd better stick with "only define this for
Linux hosts".

thanks
-- PMM

