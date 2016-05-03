Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axfbT-0003dx-JI
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 15:03:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axfbL-0003IP-BC
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 15:03:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axfb0-0005Tr-QE
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 15:03:13 -0400
Received: from mail-yw0-x22a.google.com ([2607:f8b0:4002:c05::22a]:34047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axfaz-0005CP-JX
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 15:02:58 -0400
Received: by mail-yw0-x22a.google.com with SMTP id j74so33703992ywg.1
	for <qemu-trivial@nongnu.org>; Tue, 03 May 2016 12:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iqgaj2cCvH1bw7FCUfp8t/zpLjqCXbDhR9J0vHf2IgQ=;
	b=g9sXUgFXzdTvJWtvo6GpCUQ1Ubxt7V6Rcm5+GTQpMKGxLUOTchLiPSJxre9pnX+obb
	bCc5oxBih7z+9m9zT7pL8/fS4VKMMOhab11EIGfINUUcCNF5Osl/jcygD3LhfnqmqgWq
	aKxwkfkaxqecDGU/rLKhL4IK1FxXuG+Uh3lvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iqgaj2cCvH1bw7FCUfp8t/zpLjqCXbDhR9J0vHf2IgQ=;
	b=eftghPGSW0HhsGCNtnOqSTvDZH1AEb9HYTAupt1hfTxdFBzIpzaCDfCWcX84iqQPwV
	cGRJcrxEUiOmfBULlOwvEjMYBx0RijjgWMjQQnLvQJ6aGtqB0E96zObgbFBymlvQk0nM
	Jh3lPKGBCcRQfJed6OOs81tQvWcMJjmBsj8E/6Dt/H4xjwJbPCLVIQJa7TZJHbC3EEsQ
	a9Gic/ei55srzUyVDhKvz5e9ZGTUDU7++ZPSyz04U7gaQlZQ1ujSmnW9XWIsePqyyaLm
	02kPkaVaZo9jxX9IMffEBmboEI1cL7AXicowngSXIyex/g6dK85WdZotVYA+EEY+juU/
	AHvw==
X-Gm-Message-State: AOPr4FU27B0VV2B3SvitiWO2GRQJKpLtGrhT+5+P0d62c1sIxMvYQtmzHIagrqG7rGmDdt49es28sjFb+fGBZSLi
X-Received: by 10.176.7.35 with SMTP id h32mr2160517uah.17.1462302155530; Tue,
	03 May 2016 12:02:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 3 May 2016 12:02:16 -0700 (PDT)
In-Reply-To: <CAE_WKMy6tMKUFhdwV9T1ejBFHe=SeVeOfzZnFYyUCe8zNXAYZA@mail.gmail.com>
References: <1459861743-4514-1-git-send-email-haris.phnx@gmail.com>
	<CAE_WKMyO1LjEZ_T5-O7=X=MOpSe7AqTeXTOOkfiZ114bGjNeDQ@mail.gmail.com>
	<5728E097.1060507@freebsd.org>
	<CAE_WKMy6tMKUFhdwV9T1ejBFHe=SeVeOfzZnFYyUCe8zNXAYZA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2016 20:02:16 +0100
Message-ID: <CAFEAcA9U5fshvjmTRBbsS9CMJMfyLwO799C2p9zYg9GkZWSaUA@mail.gmail.com>
To: haris iqbal <haris.phnx@gmail.com>
Cc: Sean Bruno <sbruno@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] Changed malloc to
 g_malloc, free to g_free in bsd-user/qemu.h
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
X-List-Received-Date: Tue, 03 May 2016 19:03:25 -0000

On 3 May 2016 at 19:10, haris iqbal <haris.phnx@gmail.com> wrote:
> On Tue, May 3, 2016 at 11:02 PM, Sean Bruno <sbruno@freebsd.org> wrote:
>> If this is the only patch needing review for the bsd-user code, please
>> put me down as Reviewed by.
>
> Sorry, I am a newbie. Just to confirm, should I send the patch again
> with "Reviewed by : Sean Bruno" line?

No, you don't need to resend. When bsd-user patches are collected
up to be applied then the person who does that will apply the
reviewed-by tag.

(If you needed to resend a patch for some other reason, then if
the patch hasn't changed then you should add the reviewed-by
tag when you resend it. But there's no need to resend purely to
add the tag.)

thanks
-- PMM

