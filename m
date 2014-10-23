Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhEIl-0004lX-L6
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 05:03:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhEIf-0004lI-Ji
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 05:03:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhEIa-0007SB-Ja
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 05:03:17 -0400
Received: from mail-lb0-f172.google.com ([209.85.217.172]:42671)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhEIa-0007Rh-DJ
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 05:03:12 -0400
Received: by mail-lb0-f172.google.com with SMTP id b6so465155lbj.31
	for <qemu-trivial@nongnu.org>; Thu, 23 Oct 2014 02:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XpZYPfxLX+1BoMTtlslbSndjnBtVT1uPcqEa0pgpCWI=;
	b=A3/+siKlaOHY7wYH3IU90KBVjKX0Wh9E/u9klFwaz2B+R9OJDP2dKOcP+XT21H4nrL
	4kT8GMfC6ppoVodAbN2U7+VywC2YTg9ZBQT3Fzwt2UWWYpjbgrs5fqjzU88ksDcbXFPp
	nPxdZrWtxctEyMbFdS02wNvGnyPt51eFjMKG9EADDBJ8tlEqQh6tbzrI1JKZ2uyVXnNW
	CGvhqcr428SGIz0CATOl3kmkcpbfiC1pX9VTk4Vu7xRuyNceVxAINiAXnNdEdUzynQnC
	KgfTLN1WddrbymXP8sw9760qXxn9ltHod4cyIohTIibVZBD4jdamuwRvdnn2BIFctHvX
	FVxA==
X-Gm-Message-State: ALoCoQk8hFiuEPvcUlrbOKEABIyCGj+WR0CIYkw+XbNxuSrMta2JatzFPFzrvWht/o3xYzih85Iq
X-Received: by 10.153.4.44 with SMTP id cb12mr3731102lad.10.1414054991329;
	Thu, 23 Oct 2014 02:03:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Thu, 23 Oct 2014 02:02:51 -0700 (PDT)
In-Reply-To: <5448B7C6.8070604@msgid.tls.msk.ru>
References: <54369514.5000004@gmail.com> <5448B7C6.8070604@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Oct 2014 10:02:51 +0100
Message-ID: <CAFEAcA-Zg-MUFCnJBeuSjbXyc9Y7W4rLQZ0DXXHJ_ZWKLDo8mw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.172
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Chen Gang <gang.chen.5i5j@gmail.com>, "rth@twiddle.net" <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] disas/libvixl/a64/instructions-a64.h:
 Remove useless varialbe to avoid building break with '-Werror'
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
X-List-Received-Date: Thu, 23 Oct 2014 09:03:22 -0000

On 23 October 2014 09:09, Michael Tokarev <mjt@tls.msk.ru> wrote:
> On 10/09/2014 06:00 PM, Chen Gang wrote:
>> The related variables are useless, need be removed, or can not pass
>> microblaze building, after fix it, can build microblaze, successfully.
> ...
>
> Applied to trivial (with subject fixup), thanks!

Please don't -- as I said, I have a libvixl update in my queue,
and these will conflict. I'll apply an appropriate variation of
this patch to my target-arm tree.

thanks
-- PMM

