Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmU8p-0006cT-Rv
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 15:22:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UmU8k-0006bO-PK
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 15:22:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UmU8j-0000Wo-Be
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 15:21:58 -0400
Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c]:34731)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UmU8j-0000WS-4v
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 15:21:57 -0400
Received: by mail-la0-f44.google.com with SMTP id er20so7308410lab.31
	for <qemu-trivial@nongnu.org>; Tue, 11 Jun 2013 12:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=AMf8A+dM1qDjyqf1mKyXeMEJNtyPF/PIWv6g6h7XeTU=;
	b=C24WbH21qWn8WL50GFY6tCh1TcOB0UUlH0LhEKUO+OFWXGO9fK83kir2fCI2rEfc8M
	GnWQ6wOKutb3YefYKRw6PzFJ6rNR5iX4nLUud+Y0uJGi1l332KykUr6sR7WR9tU1uU0z
	JYz9Sp8Gg2grJtKEe9uYnAywrBR7zGWYLFB/Tb/sYQWg4XzRDz1W87c87N7EFVRug/Ty
	udzKHCTtbw42PFPl9U10NNiTrCyl5XggcEXBHJs07EI7TTk1Vc5vza9XZvclt6rNQPE2
	tU6ii2Q+sDcrW37HprdsKA8OiLVcfnI53oESsXY7jPcQ0/BHLzFygLzQOctEchX4nWps
	tEIg==
X-Received: by 10.152.116.7 with SMTP id js7mr7989935lab.7.1370978515626; Tue,
	11 Jun 2013 12:21:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.138.200 with HTTP; Tue, 11 Jun 2013 12:21:35 -0700 (PDT)
In-Reply-To: <51B76A28.5030008@msgid.tls.msk.ru>
References: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA88zpSQTLWSwu6ci7rytTMxkWWqjE4jfb=0Svj+9P8NsQ@mail.gmail.com>
	<51B7183E.6070203@msgid.tls.msk.ru>
	<CAFEAcA8g7Ck_vdAraiEsKdYBi=VM8PRTCrA9UnA6GAa+JgXUoQ@mail.gmail.com>
	<87ehc8tvd5.fsf@gmail.com> <51B76A28.5030008@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jun 2013 20:21:35 +0100
Message-ID: <CAFEAcA8qdw+_6VkC1SNj5J9w-XHaeM+gPymFOoO1PGQfhXTMHw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkaQntyTTmCiun7c5vkjhLel7UZOVoBzCqpBTklRSy9ZGrqUSuDQBj3ih3ecpUm9O4W8o4R
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22c
Cc: qemu-trivial@nongnu.org, "M. Mohan Kumar" <mohan@in.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] configure:
 explicitly disable virtfs if softmmu=no
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2013 19:22:01 -0000

On 11 June 2013 19:19, Michael Tokarev <mjt@tls.msk.ru> wrote:
> FWIW, I still don't understand what Peter Maydell dislikes
> in a simplest case I posted initially, where we merely ignore
> (disable) virtfs in case !softmmu.

It just seems to me that rather than fixing a bug in the
makefile (it still tries to build docs for the tools even
when the tools aren't being built) you're trying to tweak
the configure script to avoid generating the combinations
of config values that trigger the makefile bug.

-- PMM

