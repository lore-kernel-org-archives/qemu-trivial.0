Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGsdP-0002NS-VV
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 11:35:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGsdJ-0002MJ-Ke
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:35:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGsdD-00059K-46
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:35:09 -0400
Received: from mail-la0-f48.google.com ([209.85.215.48]:63404)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGsdC-00055U-UT
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:35:03 -0400
Received: by mail-la0-f48.google.com with SMTP id er20so4683742lab.7
	for <qemu-trivial@nongnu.org>; Tue, 03 Sep 2013 08:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ne2SAaRMSzfRz0ypAA4B8tnQIR0+DKBP1wGJF9pjZlk=;
	b=XHH58N1dyyECdgZS4A7hriZZplgQ1VOOGjRX7QnjsULS7CNQOyzEB3TwaHEhUbtKRX
	5cMPWP8uNw1L3w+OBuxTupea0fE39XlKvvth/+QvHAr0nRn7x6k1iHKrtjXXBt5AwfB/
	fnUmfKjWq2dPbvZoEhgDLVhuDGiV90WCerYUt2MjjRy3TwJ26qW+MrwBVx6HQavHiqrN
	VzTSJW/Xg6z4MKH+Eq+/guyS4C4QoaIbQluIQPTW7WnmKTaYFxcFCrVUwa+Vs+KZ8nZh
	jrxN6RbQ8yX2ruMOsQaSf92E99pGEdeSRzX+n2OXVWKwmHbeWGsQczPs4+hH/T+eoL1q
	p9QQ==
X-Gm-Message-State: ALoCoQka/ZBNP0uj3Kn7/XcJF3kaKi3ShWdNDJnSz2GkeSqf1wLc/dTrlfGWf6ZZoHzMFsrGHpld
X-Received: by 10.152.3.201 with SMTP id e9mr12188471lae.24.1378222501788;
	Tue, 03 Sep 2013 08:35:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.169.70 with HTTP; Tue, 3 Sep 2013 08:34:41 -0700 (PDT)
In-Reply-To: <52260025.3050704@ozlabs.ru>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
	<5225AC9A.2090601@ozlabs.ru> <5225BD32.8030001@siemens.com>
	<52260025.3050704@ozlabs.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2013 16:34:41 +0100
Message-ID: <CAFEAcA8b26fm17sUZ=aUeETVD9q2AahkXQDLQWuRJGM9JMMqkQ@mail.gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.48
Cc: kvm-devel <kvm@vger.kernel.org>, Gleb Natapov <gleb@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-headers: update to
	3.11
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
X-List-Received-Date: Tue, 03 Sep 2013 15:35:14 -0000

On 3 September 2013 16:28, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> On 09/03/2013 08:42 PM, Jan Kiszka wrote:
>> This shouldn't be routed through trivial in general as things broke too
>> often in this area.
>
>
> Sorry for my ignorance, but this is The Kernel, it is already there, broken
> or not, even if it is broken, qemu cannot stay isolated, no?
> This is a mechanical change, no more.

The classic way for things to break is that a header
update accidentally reverts something (because a
previous update was from kvm-next and this one is
from mainline, for example). Accidental updates against
a kernel which is neither kvm-next nor mainline are
the other common "broken" version of a header update
patch.

-- PMM

