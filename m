Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTDpt-0003yF-VB
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 13:11:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WTDpn-0003mO-Ga
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 13:11:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WTDpj-0006zn-1M
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 13:11:19 -0400
Received: from mail-la0-f45.google.com ([209.85.215.45]:59162)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WTDpi-0006yq-R4
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 13:11:14 -0400
Received: by mail-la0-f45.google.com with SMTP id hr17so2841372lab.4
	for <qemu-trivial@nongnu.org>; Thu, 27 Mar 2014 10:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HIXaU+UKasxTg2AQfIsr3lDs9MV8s7jMLfirxAPWqUw=;
	b=FdWjau3WHdcIw0fYs4CT4+G0d6kVZsg5Y+GOVMdlOJ713zaYfSeyocI9CMz1F2k7Y4
	dpNj6DJ7OLKv7VLau39fVUXmCmeSE/YYKKi432HXuCWwDkXSq0pns0Qnk701+BG5iZGB
	bwaFTegw2mXjTY19hyCANKUo3tNbvWweqXOEzPJfm5VKE6p8zccwiW3wSwVnlBpeRUaf
	6Crg147hWb32rkzniEzkg+XA3KyhhsaY88EIqQtjhrCIunQwssWbshgJAvxEBW0NxoTE
	I1E16L9sr9oc3eWNT9xV2KyWuWaKlR+9jzBRCqtKni9nyBWwqj0qDhyd9gWFrFb+tLiO
	nUoA==
X-Gm-Message-State: ALoCoQmOj10Dw4RGkzY5b+dPpZHk1IdGmdQ3i0ZfZSDHpmnp0BAQfuYlOPmaI/pmfrnavo/ACw5b
X-Received: by 10.152.235.3 with SMTP id ui3mr1668689lac.2.1395940273862; Thu,
	27 Mar 2014 10:11:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Thu, 27 Mar 2014 10:10:53 -0700 (PDT)
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Mar 2014 17:10:53 +0000
Message-ID: <CAFEAcA_uH9gFn2Ap683J7aGYugGRFGK_Czk+PvgqmD8=a2coPw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL for-2.0 00/23] Trivial
	patches for 2014-03-27
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
X-List-Received-Date: Thu, 27 Mar 2014 17:11:24 -0000

On 27 March 2014 15:28, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's another trivial-patches pull request, for 2.0.
>
> I removed -m-to-QemuOpts conversion patches, what's left
> are either really trivial stuff (some `static const' designators
> from Stefan Weil, some duplicate statement removals from Prasad Joshi),
> minor documentation fixes (and addition of coding style section),
> one bugfix for KVM_GET_DIRTY_LOG ioctl return check by Mario Smarduch,
> and a large(ish) series of shift-into-sign-bit by Peter Maydell.
> Everything appears to be fine for 2.0.
>
> Please consider applying or pulling.
>
> Thanks!
>
> /mjt
>
> The following changes since commit bea4acda3bff00e98cb00d5354f23de9e74a928f:
>
>   Merge remote-tracking branch 'remotes/mcayland/qemu-sparc' into staging (2014-03-27 10:54:17 +0000)
>
> are available in the git repository at:
>
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-03-27
>
> for you to fetch changes up to 3768d505adcd6c3fe819432d7dabd312995fa678:
>
>   linux-user: remove duplicate statement (2014-03-27 19:22:49 +0400)
>
> ----------------------------------------------------------------
> trivial patches for 2014-03-27
>
Applied, thanks.

-- PMM

