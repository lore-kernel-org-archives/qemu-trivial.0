Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aYsj0-0002UR-TH
	for mharc-qemu-trivial@gnu.org; Thu, 25 Feb 2016 05:00:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYsiw-0002U9-DP
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 05:00:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYsit-00015G-B5
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 05:00:42 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:32939)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYsit-000155-6N
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 05:00:39 -0500
Received: by mail-vk0-x22a.google.com with SMTP id k196so43259918vka.0
	for <qemu-trivial@nongnu.org>; Thu, 25 Feb 2016 02:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JmyL0a8X8bmiPr9UzmB/iUTz+4Azh7I5y2xeM0hY1Z0=;
	b=YnRUVXRDUCA8tp7Me3k8BwxmO2srBDyI2I9gfru1ZEPXD3zFgU60JvkPzCEgnbkAh6
	Aki1oMEGB4CEdaYMnhQmMv0hQL3LabWlywpyY/E9fx3Jswiq/35jDWGt/tYGmm8heV4M
	mqLAFa20MBtQOPI3V63elFgwLMtiMaY+BTtSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JmyL0a8X8bmiPr9UzmB/iUTz+4Azh7I5y2xeM0hY1Z0=;
	b=SiAOLS1e+J1s8p5X1oUP6jpNzecY+dCYgZ08VWhrUMXpMPerZuMiCY/8Ddp2Uw/OSw
	/uuI/s8YTqBxg7gbi/dcgtHkKZ1/syX9WWs41bScSljFmqW66Nq820dcu9mB+Z8vcj9g
	5GD/XsAp+K8C/em5ofUfTWJMKmcZJD2dMm21f3+7MACswwXJoux/wGAMSGOEwHYSyOc9
	dzgJYR6RUPa7Q388xPAAuoOFYKAVoYCqItgcs3k6N9aBrPm06H0p3XhgQ3rv9kbr3CaJ
	DKOZgeQ6FMGtERg2vJRZQki2/sij0QRcxHSOpCrSpsdgtTxprSjfhRr+ngDvq2l2fryN
	6G9w==
X-Gm-Message-State: AG10YOQdh9XDb/Lj1sl1N5/UJvUnlR9lWWLUpgdes6KlRUh9UCJmRTo3IXBgIgqdOrOjpZey/WET4Z1Zju2zx2PX
X-Received: by 10.31.52.147 with SMTP id b141mr36223724vka.82.1456394438588;
	Thu, 25 Feb 2016 02:00:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 02:00:19 -0800 (PST)
In-Reply-To: <1456392739-30336-1-git-send-email-caoj.fnst@cn.fujitsu.com>
References: <1456392739-30336-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 10:00:19 +0000
Message-ID: <CAFEAcA944NgbOvv3mYH2xvEup2V-UevPXPfew=Y2N7sYkvvxpQ@mail.gmail.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] doc/memory.txt: fix typo
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
X-List-Received-Date: Thu, 25 Feb 2016 10:00:46 -0000

On 25 February 2016 at 09:32, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:
> to match structure MemoryRegionOps definition
>
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
> And there seems are some out of date content in this file, like
> "cpu_register_io_memory()" mentioned in the last line, which is removed several
> years ago in commit 97161e177. I am sure how to modify it, So I take the
> liberty to CC the guys in the cc-list(get list from get_maintainer.pl).k

The part that says
# - .old_mmio can be used to ease porting from code using
#   cpu_register_io_memory(). It should not be used in new code.

could be changed to say "has been used to ease porting from code that
used to use cpu_register_io_memory()" if you like. The information
here is not wrong, really, just the tense.

(There are just 32 uses of old_mmio left in the codebase, which
hopefully we may eventually get rid of.)

>  docs/memory.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/memory.txt b/docs/memory.txt
> index 8745f76..1a3ad622 100644
> --- a/docs/memory.txt
> +++ b/docs/memory.txt
> @@ -297,7 +297,7 @@ various constraints can be supplied to control how these callbacks are called:
>   - .valid.min_access_size, .valid.max_access_size define the access sizes
>     (in bytes) which the device accepts; accesses outside this range will
>     have device and bus specific behaviour (ignored, or machine check)
> - - .valid.aligned specifies that the device only accepts naturally aligned
> + - .valid.unaligned specifies that the device only accepts naturally aligned
>     accesses.  Unaligned accesses invoke device and bus specific behaviour.

This doesn't look like the right change, because (a) a field named
unaligned which you set true to specifiy that unaligned accesses
are invalid would be very confusing and (b) the comment in the
header file says that 'valid.unaligned' means that the device does
support unaligned accesses.

>   - .impl.min_access_size, .impl.max_access_size define the access sizes
>     (in bytes) supported by the *implementation*; other access sizes will be

We also seem to be missing documentation of valid.accepts.

thanks
-- PMM

