Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cefco-0005NT-4i
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 05:18:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cefcl-0005MC-PU
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 05:18:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cefck-0007EV-Na
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 05:18:47 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:35109)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cefck-0007E6-H0
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 05:18:46 -0500
Received: by mail-wm0-x234.google.com with SMTP id v186so10450681wmd.0
	for <qemu-trivial@nongnu.org>; Fri, 17 Feb 2017 02:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ClS02KVbqa4KKi3VERmwUONFQ1ae9DjMwot8mFoPl0U=;
	b=gr8pnh/s2cNCQEwcr/uLDrWzzL2eV0goWggy7+qEP5MMvAY5UbCIaEkJ6LPX0AWPIG
	yUxdwF/n/BaC4Nu/e67LNYFiVqqx6BMLUa5KdvdX+9Wc5jVeEuykqiVkhyE/PQQMcQ73
	AEkX4b/zhuJTksiycj95BJMxCq1dOkFFSCv3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ClS02KVbqa4KKi3VERmwUONFQ1ae9DjMwot8mFoPl0U=;
	b=UAB3ZScN/epWJIjW3ke1u6xEGzQWBrzt7qpU1AUd6hUk4/BK6A9pYISeZeTKxdmjNZ
	F+pb86F701x20rkN9NpGqStbWJVSoNs/2q7SdmA4vIs+PhyrGwU3Hr9J1fUc1oWoAlYE
	xNzyr0PgjBf3AfSllvJN/2fS91YQ603oXmqCxNPFkjbL4SAJ7Oke7IUjfuP6wck3qL0R
	sh+R06XFM8eRH9UddIpF0wrkEBGko8wx33DXb0RIrg8CRvkanVc9Y/GSykgq6gEDIEf9
	PCaqdpO5TSiu1T+rV9IemS6jQ0qLxly2N9nLGzuskWq1xQis/MYHDlSZjePKX49RG0VR
	n+7Q==
X-Gm-Message-State: AMke39nqXOqV94mv76/RGEaB35ulqrXVDGtvbO7ynEwlahvmQA3vT2fcZSSlQEs86qvwzsLwoSMUhwaxk82O9mZP
X-Received: by 10.28.4.10 with SMTP id 10mr2637850wme.142.1487326725447; Fri,
	17 Feb 2017 02:18:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 02:18:24 -0800 (PST)
In-Reply-To: <e19aed34-77c2-f588-351d-2daa8a099ae9@redhat.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<e19aed34-77c2-f588-351d-2daa8a099ae9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 10:18:24 +0000
Message-ID: <CAFEAcA-3TkmaJXpG2RpzBPKmj+JKGK5EBwPvXWkwR=Qkobq-Sg@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, Chad Joan <chadjoan@gmail.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
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
X-List-Received-Date: Fri, 17 Feb 2017 10:18:49 -0000

On 17 February 2017 at 08:56, Paolo Bonzini <pbonzini@redhat.com> wrote:
> So I do think that if musl wants to support _GNU_SOURCE, it should also auto-define;
> however it doesn't, see https://git.musl-libc.org/cgit/musl/tree/include/features.h.

Yes, I agree that this looks like a musl bug. I spoke to a musl
developer I happen to know, and he agreed to submit a patch to
see what the other musl devs think.

In the meantime, we should probably work around this system
bug for the benefit of the existing musl installs in the field.

Defining _XOPEN_SOURCE is easy enough, and I think we should
do it unconditionally. We should check what effect this has
on the BSD hosts though I guess. (You could argue that we
should be defining _XOPEN_SOURCE anyway for the benefit of
the non-glibc BSD/Solaris/etc platforms.)

thanks
-- PMM

