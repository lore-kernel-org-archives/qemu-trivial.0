Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y4ZBB-0002hf-Hd
	for mharc-qemu-trivial@gnu.org; Fri, 26 Dec 2014 13:00:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y4ZB9-0002eH-Uq
	for qemu-trivial@nongnu.org; Fri, 26 Dec 2014 13:00:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y4ZB2-0006lV-Gj
	for qemu-trivial@nongnu.org; Fri, 26 Dec 2014 12:59:59 -0500
Received: from mail-lb0-f178.google.com ([209.85.217.178]:65481)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y4ZB2-0006lK-9m
	for qemu-trivial@nongnu.org; Fri, 26 Dec 2014 12:59:52 -0500
Received: by mail-lb0-f178.google.com with SMTP id f15so9785405lbj.37
	for <qemu-trivial@nongnu.org>; Fri, 26 Dec 2014 09:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=suHP9tvGzSYAQ3xqX/Dp3z/wZ1Ja/QyBrLZCp29BlAA=;
	b=YCVeObloq19/RhPP0I0iKRBBWK8KEcKJoPBYsDhq0+IrTYQ8v5WcmmyfQiN2ut6oOs
	99JYBCpSCVg/QBleUNOqJh3WXyPFl+X/k+pkX0UtZHx8uhqfbex7tnMXtaitwLr6TOOm
	dQdCZG3kJgTLmk6FhIH6ZQTCYAykOUYYVJ+WqgtccZs2wFvZR62NG7F8chVeKjhcE5aJ
	1VSFl/NzIDS56u/DwXyHKSFQuZJbYR0WaYMEDotUCzCacTLegb64sD036dUiM6qDHSYx
	SIvrHKkeJeACHAThDnORiTiAFkcN2xZl/doiCs1MWvtf1nNyoWaliTspPoqZe6z2qctw
	WU2A==
X-Gm-Message-State: ALoCoQngLbr7dKyV5FIPsB+q17+UAPxYQyNvFUIAgXw6WAs5gm4wjycOM483MUyvERWFL5j0nhg1
X-Received: by 10.112.41.234 with SMTP id i10mr45230765lbl.25.1419616790389;
	Fri, 26 Dec 2014 09:59:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.52.38 with HTTP; Fri, 26 Dec 2014 09:59:30 -0800 (PST)
In-Reply-To: <549D356A.4050506@parallels.com>
References: <1419581126-12927-1-git-send-email-tiejun.chen@intel.com>
	<CAFEAcA9yR2FPUF-T_ehMS4Yd0SL91mVADYwhDAuxCbkhQnNZiA@mail.gmail.com>
	<549D356A.4050506@parallels.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Dec 2014 17:59:30 +0000
Message-ID: <CAFEAcA_DTVFUE5QmU3T8DbuZQwhcXPhuxVfEYOTyST3sDL0-PQ@mail.gmail.com>
To: "Denis V. Lunev" <den-lists@parallels.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.178
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Tiejun Chen <tiejun.chen@intel.com>,
	QEMU Developers <qemu-devel@nongnu.org>, kvm-devel <kvm@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] kvm_irqchip_assign_irqfd:
 just set irqfd in case of kvm_irqfds_enabled()
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
X-List-Received-Date: Fri, 26 Dec 2014 18:00:00 -0000

On 26 December 2014 at 10:16, Denis V. Lunev <den-lists@parallels.com> wrote:
> IMHO the patch does not change anything even on hot-hot path.
> the declaration 'struct kvm_irqfd irqfd = {};' will
> result in memset inside.
>
> Thus in order to achieve declared goal author should
> declare
>    struct kvm_irqfd irqfd;
> and perform
>    memset(&irqfd, 0, sizeof(irqfd));
> later after the check.

Mm, but once you're into such microoptimisations as this you really
need to have a good justification for the effort, in the form of
profiling measurements that indicate that this is a hot path.
In this case that seems pretty unlikely, because I'd expect all
the systems where we care about performance will support irqfds,
so we won't be taking the early-exit code path anyhow. (And
not supporting irqfds is leaving much more performance on the
table than we could possibly be talking about in this function.)

thanks
-- PMM

