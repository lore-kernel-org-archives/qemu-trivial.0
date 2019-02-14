Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guLoi-00036N-Fv
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 13:33:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guLof-00033O-VV
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 13:32:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guLof-00066D-2c
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 13:32:57 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37672)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guLob-00063N-BC
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 13:32:55 -0500
Received: by mail-ot1-x343.google.com with SMTP id b3so12204781otp.4
	for <qemu-trivial@nongnu.org>; Thu, 14 Feb 2019 10:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w3FewEHIskVwdM1fVFbtI7yvMVn6gUPgga8xGq8O56I=;
	b=VtTzkNWDwzFVOWKfR1b18gBRdpK/7CwBnpMatQ6tvLue47nUuN08IcRHBDAeWiuTXd
	DOO2lqbR3l5WVIOsVJJoPB/9vIFE5NEMC5R0Ymk4Cju+FZZjFXlftStpda1cgUFneioE
	hrWa/4jTg1XbmjP9B/57etQMb6hv42y+U1V7EI6Phoa1Zt2grZg8PdERnXJc465f9Vhz
	GSdC8SXm9Upcq9S2w0aYRwAxaFTNz3U8BgZu+dRFcul9K23HKHNOaCNPHtYxkkQehzIe
	L5aW8czWpg/oepeCY4F2VdsbpiyItdbsHTSXtdV9W7elN/gs8J+gpccUfHd+4VYRBRZ8
	XLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w3FewEHIskVwdM1fVFbtI7yvMVn6gUPgga8xGq8O56I=;
	b=UD1UiGABtKCbvuAtcvpeovUz6dMer9AUIWeqBYDBw7lUESHG/0fPPIoXu8k5F/e5h1
	Z13iVmv0ovCUJAzZIkgV/BWEiAChWmJJ3QxcLi19XDSOKh1Y5ADX4IOL1HO6yrgbnYc1
	WUDv/0D4PFmEE7PzCzzCqZKMCR77bf+1aE0OSoyLpEe2ayPTkyS42CJFNAiKNfzM5RzW
	+KFggwb465GanBuWKcer5EjPBX5KzMPvZv8mpO8nwGpcxFvIT9p9rvgML2erNVum2Fq8
	OYbwn2unUXwjplYUVxMnYxm8UkgFxXf2WTQAlJry8gGh3cfucywrqVAGylGgQU94AHzG
	Z4GQ==
X-Gm-Message-State: AHQUAuaFYNN0jnWJUGJj+3lCV02sCXedxtl4QSGumVERiYSJrxysFR0k
	6K3UKDrEttVkF1qTV10F0FevK+MuiQODpKgv+bKmIg==
X-Google-Smtp-Source: AHgI3IaVxqGQCZR/KfJ/wggbgQcRFhPvGcLBcKm92utYUKi3Y2ulNNo+IQn2XpIRSO7TiCccVjljNQCtkm7R2NUWh2o=
X-Received: by 2002:aca:af53:: with SMTP id y80mr3338833oie.170.1550169171832; 
	Thu, 14 Feb 2019 10:32:51 -0800 (PST)
MIME-Version: 1.0
References: <20190214104717.3543-1-laurent@vivier.eu>
In-Reply-To: <20190214104717.3543-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 18:32:40 +0000
Message-ID: <CAFEAcA-G99JfUUtW+pkHT3-TOTo4ENYZYbxyitRR9Rwbau1s1A@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, kvm-devel <kvm@vger.kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Libvirt <libvir-list@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Kamil Rytarowski <kamil@netbsd.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/14] Trivial branch patches
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
X-List-Received-Date: Thu, 14 Feb 2019 18:32:59 -0000

On Thu, 14 Feb 2019 at 10:58, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 0b5e750bea635b167eb03d86c3d9a09bbd43bc06:
>
>   Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2019-02-12 10:53:37 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 96566d09aa105ee04cbc1c9539cf8a9a40e8e422:
>
>   configure: improve usbfs check (2019-02-14 11:46:30 +0100)
>
> ----------------------------------------------------------------
> - some configure updates (HAX/NetBSD, remove "wav", -Waddress-of-packed-member)
> - remove deprecated options
> - some trace and error cleanup
> - typo fixes
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

