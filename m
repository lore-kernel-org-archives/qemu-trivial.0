Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y4Rhe-0003GJ-0B
	for mharc-qemu-trivial@gnu.org; Fri, 26 Dec 2014 05:01:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y4Rhb-0003DM-D5
	for qemu-trivial@nongnu.org; Fri, 26 Dec 2014 05:01:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y4RhY-0003tM-6d
	for qemu-trivial@nongnu.org; Fri, 26 Dec 2014 05:00:59 -0500
Received: from mail-lb0-f177.google.com ([209.85.217.177]:35846)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y4RhY-0003tG-0D
	for qemu-trivial@nongnu.org; Fri, 26 Dec 2014 05:00:56 -0500
Received: by mail-lb0-f177.google.com with SMTP id b6so8403230lbj.36
	for <qemu-trivial@nongnu.org>; Fri, 26 Dec 2014 02:00:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cnxyWxGIU+sN2kR5pO9pkysI881+1ufhaQMSCaj93Dc=;
	b=IxCUHFGQWs2KNvvEUPOaS6Yuq2L5S8oh/Xf6vONqRBFswp+MTyQbwi5W90+eAko3jN
	laTrYVM4cPnxZW9ydgoa5zF4d4WJvGb8b01U3iE2BpKvTMTOb1cEoSesuLdYSFnUPcd3
	AgPxkhYHb67pE4QpG7FYoWmRotQn/W+KM01N3sIqBqFvEAY2cTZhUw1h9dK4ToB2UGRp
	9RBwi/V3OLBRm7YXkOMqspfGSypEOPprdjbf45m0HzbQiKACWvTe4PHQN/XZAR2CwKdL
	HBcE4hXOFQsh7v3ueWoJVSz5pNI3I16f87/b14P2fJPmFoCkpUyMUxWy3C+gwtJzM9gT
	hJxA==
X-Gm-Message-State: ALoCoQnrXiZqcE+WWr7v90XiTajjWgIILuO01U9H16yfKz/QhMtKXqgbpVSyVovAcUG6FyEoe/t2
X-Received: by 10.152.43.103 with SMTP id v7mr42958129lal.29.1419588055111;
	Fri, 26 Dec 2014 02:00:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.52.38 with HTTP; Fri, 26 Dec 2014 02:00:34 -0800 (PST)
In-Reply-To: <1419581126-12927-1-git-send-email-tiejun.chen@intel.com>
References: <1419581126-12927-1-git-send-email-tiejun.chen@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Dec 2014 10:00:34 +0000
Message-ID: <CAFEAcA9yR2FPUF-T_ehMS4Yd0SL91mVADYwhDAuxCbkhQnNZiA@mail.gmail.com>
To: Tiejun Chen <tiejun.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.177
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, kvm-devel <kvm@vger.kernel.org>
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
X-List-Received-Date: Fri, 26 Dec 2014 10:01:00 -0000

On 26 December 2014 at 08:05, Tiejun Chen <tiejun.chen@intel.com> wrote:
> We should avoid to set irqfd{} unconditionally.
>
> Signed-off-by: Tiejun Chen <tiejun.chen@intel.com>

Is there a hot path that we use this on such that the difference
in code order matters at all?

thanks
-- PMM

