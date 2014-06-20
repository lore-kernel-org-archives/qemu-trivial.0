Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WxwoB-0006Mj-VU
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jun 2014 07:16:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wxwo6-0006Hi-3D
	for qemu-trivial@nongnu.org; Fri, 20 Jun 2014 07:16:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wxwnx-0001IT-JF
	for qemu-trivial@nongnu.org; Fri, 20 Jun 2014 07:16:34 -0400
Received: from mail-la0-f41.google.com ([209.85.215.41]:47139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wxwnx-0001IA-Co
	for qemu-trivial@nongnu.org; Fri, 20 Jun 2014 07:16:25 -0400
Received: by mail-la0-f41.google.com with SMTP id hz20so2282418lab.14
	for <qemu-trivial@nongnu.org>; Fri, 20 Jun 2014 04:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KkqQP6JXy1UKYji3lJQ3m/ZYXgle0XbisIWBDG/+PZE=;
	b=lKhWs+6hNMCrouPfvRqxv7Aa6OMaXNfDb7NKWv53htMI4TpubToG7Q+SHFMd3zJsbA
	ERfnJCnIDcncf5aRIosivgKNxHan8vokQCo/GB14YHyvHVTARo0Ez7dzU3L2P2vbqiBB
	FBJkKso1HF6l3FpQxkq+ykC4WIUzYEcjRkPkWlXfyYA10inJ0mOpskK0SFEzUaq374II
	1mg16mGhm6FVAETNXKjI5d4nlMH3JL1N30ECbz9EotPOFWj3ZygR4GVqJn1XnyIVa2xK
	b7d3pOdMVnizIxrXs9dEHm9IU0u2jO+yMalJzcM1wPFI8lxMTHL9X7eo3dfNWf6UHbNt
	yZHA==
X-Gm-Message-State: ALoCoQlI9kUSDLPy2FZdIMh0Cx1X2AV2bYSfzU5Ju2yB7YVadUwGDPd4k4CjQeXZP4IoouMhv6Oe
X-Received: by 10.152.10.168 with SMTP id j8mr2062807lab.37.1403262984204;
	Fri, 20 Jun 2014 04:16:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Fri, 20 Jun 2014 04:16:04 -0700 (PDT)
In-Reply-To: <1403262794-19963-1-git-send-email-hunterlaux@gmail.com>
References: <1403262794-19963-1-git-send-email-hunterlaux@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jun 2014 12:16:04 +0100
Message-ID: <CAFEAcA_Z-tgCNGaxEoyOq9jn4DDGH3_icGB-fPAbt4-8z=0+vw@mail.gmail.com>
To: Hunter Laux <hunterlaux@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.41
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] Add support for the arm breakpoint
	syscall
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
X-List-Received-Date: Fri, 20 Jun 2014 11:16:38 -0000

On 20 June 2014 12:13, Hunter Laux <hunterlaux@gmail.com> wrote:
> OABI arm used a software interrupt(0xef9f0001) for breakpoints.
> Since 2005 gdb has used the break instruction(0xe7f001f0) for EABI.
> Apparently Steel Bank Common Lisp still uses the swi instruction.
>
> This is the kernel implementation:
> http://lxr.free-electrons.com/source/arch/arm/kernel/traps.c#L598
>
> Signed-off-by: Hunter Laux <hunterlaux@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

