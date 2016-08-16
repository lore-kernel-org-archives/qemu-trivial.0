Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bZev9-00085T-Ol
	for mharc-qemu-trivial@gnu.org; Tue, 16 Aug 2016 10:00:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZev7-000841-EE
	for qemu-trivial@nongnu.org; Tue, 16 Aug 2016 10:00:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZev6-0008Uu-6M
	for qemu-trivial@nongnu.org; Tue, 16 Aug 2016 10:00:45 -0400
Received: from mail-ua0-x234.google.com ([2607:f8b0:400c:c08::234]:36378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bZev5-0008UQ-Vv
	for qemu-trivial@nongnu.org; Tue, 16 Aug 2016 10:00:44 -0400
Received: by mail-ua0-x234.google.com with SMTP id 97so122656938uav.3
	for <qemu-trivial@nongnu.org>; Tue, 16 Aug 2016 07:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bZYtgkzvPwUEDv52QzzDiMQf1kVmXXBwonV5cdESmqA=;
	b=LrgcSFK6MdPSSd/tptsSLVWm4GhHYF80iFAo8Jn6+E4xDGeT96kOY66VT8FK+0vmlz
	Sn53XJVnkfNWrwdO/CTmDbLVj5sQk6gkeBzT3W/l8cawYx7jcbrMhGb4djLfoBfM8Mo4
	LQxaoJ+rCnWi6/2z6WKrgg40Mitm0zhtKlI18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bZYtgkzvPwUEDv52QzzDiMQf1kVmXXBwonV5cdESmqA=;
	b=jaIIVf3iEvXAtZYFdz3waMl51/+8kQ/7hZvS691T9YULZvSrzX/wx9cpMEXGLNc47S
	G3KEvoOO6gbXaKr4rF7QsFhJbnDItR5uL/EeAGNhlqL/68T2ite5Lqqd9sqQ5CIwIpyT
	FAdUCix2SfWZTT1nN1blYXZ/eGIKsc+DiHJqmRTUQRnQpViJ2HlL0Qoj2F45Ixo3We8N
	jZZg/hbKiKCfqrg6fjDLF02k0Z2Wlw/3kovy3S2299ACmwVmUlUps5hWBlynjIpruWxH
	CSJf1CZhXDerkisPGbEErywXfS57ujNAefroeWOnxiDpZBWPK5qqXqCOtjB0jy9sxcz4
	TYhA==
X-Gm-Message-State: AEkoouvNGv9cBjqKVExcLiZwaynDMxE2TevrunEOzr9xh5rmVw47o+WhcOjKsDAI80DlMvFN6FPaF9UI1gd5A3xL
X-Received: by 10.159.35.47 with SMTP id 44mr4566798uae.38.1471356043344; Tue,
	16 Aug 2016 07:00:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.149 with HTTP; Tue, 16 Aug 2016 07:00:22 -0700 (PDT)
In-Reply-To: <209727639.3312728.1467317746061.JavaMail.zimbra@redhat.com>
References: <1467315396-3628-1-git-send-email-jsnow@redhat.com>
	<209727639.3312728.1467317746061.JavaMail.zimbra@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Aug 2016 15:00:22 +0100
Message-ID: <CAFEAcA_Tg6L-2GpB8+Z9N2mCapq3gDciXQ4g-sz+_09oeXObwA@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::234
Subject: Re: [Qemu-trivial] [PATCH] Remove left shifts of negative signed
 integers
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
X-List-Received-Date: Tue, 16 Aug 2016 14:00:46 -0000

On 30 June 2016 at 21:15, Paolo Bonzini <pbonzini@redhat.com> wrote:
> GCC correctly puts this warning under -Wextra, and promises not to ever
> make use of this facet of undefined behavior.  The only correct patch
> is the one that disables the warning for clang, and possibly adds
> -fwrapv.  In GCC, -fwrapv correctly silences ubsan's left-shift
> and signed-overflow warnings.  In Clang, this is reported at
> https://llvm.org/bugs/show_bug.cgi?id=25552.  It's a heavy hammer
> but it's the safest options as compiler evolve.

James Molloy kindly wrote a patch for clang which fixes PR25552
(so -fwrapv silences the compiler warning and the sanitizer
warning), and that has now been committed to clang. So I'm now
happy that both clang and gcc agree that -fwrapv is the way to
give you a well-defined C dialect with the shift semantics we
want. Post-2.7 we should add -fwrapv to our compiler flags
(we'll want to keep -Wno-shift-negative-value for the benefit
of clang versions without the 25552 bugfix).

thanks
-- PMM

