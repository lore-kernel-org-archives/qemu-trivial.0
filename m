Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1celqQ-0008Vz-08
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 11:57:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1celqN-0008SF-Hf
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 11:57:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1celqM-0000Wt-C1
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 11:57:15 -0500
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:35672)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1celqM-0000We-4S
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 11:57:14 -0500
Received: by mail-wr0-x230.google.com with SMTP id c4so33305416wrd.2
	for <qemu-trivial@nongnu.org>; Fri, 17 Feb 2017 08:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ki21cDc8G0ZSo0IthGBaegnSG+k4EYGYSoUpBFgov6Y=;
	b=SEVT0ea7kTxbRX6XsEUTELB/bUg7rX0JjHmUCHpRw0SDCLhXOT4hJzB5aBVpNLni4A
	5B6llaDdOWH0tYVQTI8T8uDcK3GzN1oqLZVKSkSWintlP8yExSmggWAOJAsS/vR7J1AT
	3C/aHRWqO/WtpwprxAV5ZBerH9W+MrOZSNSEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ki21cDc8G0ZSo0IthGBaegnSG+k4EYGYSoUpBFgov6Y=;
	b=FiVJwKj0qv1Q9LPOvSj3i6B1ZsC83Kytw9JKHPkjKGUJko36Gc3HfhzOWeAJqc4rxK
	kpG4u6K0pIAAfem2sbILlZuoRDmjdPD+D7gz+///DBnXdU5SJV5EHUgHX/nEc8ixx+W0
	L1aOwiTSiH+H82QXaWuCKuJGlKZOC3ljSqldmdkiXFkO/ENGkXecBCQ/6Z3G5SAw2etO
	wEjcj7OmxN2Czefya/95VV3bcMX5IIqtzCHI1kVrcMEblL4zKjcCeTcD0W+epHN1NXvD
	QUlggy78QUP0gmeFzYkEkNpo2zIvTh49JaS+YLzHFuOnz1R2BqUB+hE1WfymbZ+xxV8x
	zRtg==
X-Gm-Message-State: AMke39l5Trr5eFDDdb5h6TJOfMYiziAiDWZFi43Xtxnh/87OC8cl2IpiX/utVfUtckvsPnZee7kYE/bXLf+I1SX/
X-Received: by 10.223.136.152 with SMTP id f24mr6969075wrf.187.1487350632874; 
	Fri, 17 Feb 2017 08:57:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 08:56:52 -0800 (PST)
In-Reply-To: <CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
	<CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
	<6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
	<CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 16:56:52 +0000
Message-ID: <CAFEAcA97jqn5XBYgWq4OKLs7ofXrf9aT6+KZP4JdNUkfpOgqzw@mail.gmail.com>
To: Chad Joan <chadjoan@gmail.com>
Cc: Eric Blake <eblake@redhat.com>, Fam Zheng <famz@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::230
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
X-List-Received-Date: Fri, 17 Feb 2017 16:57:16 -0000

On 17 February 2017 at 16:54, Chad Joan <chadjoan@gmail.com> wrote:
> Regarding the signature: IIRC, setting up certificates on a machine using
> gpg can be quite time consuming and learning-intensive if you've never
> needed to do it before.

There is no requirement for gpg (except for maintainers submitting
pull requests). When we say "We need a signed-off-by" what we mean
is literally "your commit message must include a line of the form
Signed-off-by Some Person <some.person@wherever.com>".

I agree that gpg is terrible as a UI and we definitely don't
want it in our patch workflow for submitters ;-)

thanks
-- PMM

