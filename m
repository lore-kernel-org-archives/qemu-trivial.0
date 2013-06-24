Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UrELZ-0007hR-9G
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 17:30:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UrELV-0007dM-KZ
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 17:30:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UrELT-0003WW-D2
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 17:30:45 -0400
Received: from mail-la0-x233.google.com ([2a00:1450:4010:c03::233]:51198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UrELT-0003Vi-76
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 17:30:43 -0400
Received: by mail-la0-f51.google.com with SMTP id fq12so10895103lab.24
	for <qemu-trivial@nongnu.org>; Mon, 24 Jun 2013 14:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=IbaPQH58CEOfAUNjxmseTmeRwW4KusDa315OZOwFNOc=;
	b=Ny4cGBcLr9Y4SJaM1DsTppG60N44AwxCCcHtLVKrfeP4w5Jz14QZl9uDkzRx4hZEtx
	6lza07P/UIJIE9YUL+JjK+UF9hWEkMbmnUamy+1BDwUJZsuaSQ3Vg3+WZQQCq7tw5R6B
	CaMwGCQM7e7bOEIGoDfvFNpLM1rka2MghhhzYsaZTfdTYpOpmZ/Y6WGgezMzpXBQTjrR
	f76rVcRb4qaMGcEBhSNuMtf9cNejujTor/OHiekxHwz8cry0BBuKUDytHaeJ8ibBZg/o
	RUO8GKXK48BnugPQwHtTY5+nNdrxu4YxcOigRu0g6FqKT0mVTjKAox5PzxeIO66pntSM
	ua9w==
X-Received: by 10.112.131.103 with SMTP id ol7mr13341064lbb.70.1372109442104; 
	Mon, 24 Jun 2013 14:30:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.97.146 with HTTP; Mon, 24 Jun 2013 14:30:21 -0700 (PDT)
In-Reply-To: <51C8B6EF.5070108@redhat.com>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
	<51C8B6EF.5070108@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jun 2013 22:30:21 +0100
Message-ID: <CAFEAcA9e212aEL2O-oqKmEMO-cj9o+x_RHTXryyDVg73UhmV3w@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnopzKtN+EslRsHl7kqGXGpqBHui8ndtpIhRTfbI/SMY5D7JUD3cdqFmQb88ZIKM2G/a0Zq
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::233
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tls.h: Enable TLS on FreeBSD
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
X-List-Received-Date: Mon, 24 Jun 2013 21:30:47 -0000

On 24 June 2013 22:15, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Il 24/06/2013 21:21, Ed Maste ha scritto:
>> Signed-off-by: Ed Maste <emaste@freebsd.org>
>> ---
>> I have had this in a local tree for some time, and it is needed by the
>> BSD-user work that is now being proposed.
>
> At this time, qemu/tls.h is really just for cpu_single_env, so I think
> this patch should be applied together with the bsd-user patches that
> need it.

This patch has arrived because I suggested splitting it out from
those ;-) System mode qemu is multi-threaded, so moving more host
OSes into the fold of "these variables behave like the linux host
which is where the bulk of testing happens" sounds like a good idea
to me.

>> As an aside, an abstraction was recently proposed for Open vSwtich that
>> can use any of _Thread_local, __thread, or pthread_getspecific() which
>> may make a convenient reference for someone wishing to implement one of
>> the TODOs: http://openvswitch.org/pipermail/dev/2013-June/028665.html
>
> I and Stefan Hajnoczi have almost the same idea implemented in QEMU
> (except that get_foo() returns a pointer to the variable).  But
> pthread_get/setspecific would be too slow for cpu_single_env, so we're
> just switching to __thread for cpu_single_env (for Linux in our patches,
> but you can add FreeBSD too once it's needed).

I would really like cpu_single_env (and the other thread variables)
to have consistent semantics everywhere (which means "always thread
local"), even if that means "sometimes suboptimal performance".
Reasoning about a variable that might or might not be per-thread
is just painful. Alternatively, we could just drop support for any
host OS that doesn't provide reasonably efficient per-thread data.

-- PMM

