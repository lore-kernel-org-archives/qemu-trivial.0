Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ciQag-0001MX-O0
	for mharc-qemu-trivial@gnu.org; Mon, 27 Feb 2017 14:04:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ciQae-0001Ke-OD
	for qemu-trivial@nongnu.org; Mon, 27 Feb 2017 14:04:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ciQad-0005mz-9v
	for qemu-trivial@nongnu.org; Mon, 27 Feb 2017 14:04:08 -0500
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:34127)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ciQad-0005mr-3O
	for qemu-trivial@nongnu.org; Mon, 27 Feb 2017 14:04:07 -0500
Received: by mail-wr0-x22a.google.com with SMTP id l37so14787496wrc.1
	for <qemu-trivial@nongnu.org>; Mon, 27 Feb 2017 11:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HOhWqs/A48eaA6cjIjQIc1Kmuw/lqoqUEoS1CWc5HzM=;
	b=KR3E5uIVYfhG2KvgskbWmgnHhKxphXj7gSy6uoUH0THpHnZbsxeZLgd4lF1OTOZAyp
	JD6Lhr5LssSt5FMWmo52khbOW2+60IegBcUJiagPPB/vDvvMB/GYvQ2lvWn0AiBfozWz
	bihDjcOJ6WBsFYO4jnS2HTh30Lu+iucrUYtjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HOhWqs/A48eaA6cjIjQIc1Kmuw/lqoqUEoS1CWc5HzM=;
	b=N/QfPaxl4abBAeDkpGMFETd+tsURaJheQQDAfQB6cWrFAphGQDje/9uBp3AqOl3t9G
	aUeMoqoRAQ0W7D3cdXigglCgQyIuKeNbi85utS6bKJEJexuh8YCFwdfgKMUfyQpJucSl
	SeaY7hzw9XfHk7BdWUa++k04wV2D15R+iIzLAQ0Hgw2AodcpJxUDcMXPfVvvCIBztw9i
	ECWN7696VaIEE8nIugLXjiPwXYrRnhBzkLf8Mh24HA571hDX50sF3DYq6aa/9g0MGI+4
	8FXmat7HCeiBCRTJpkJpqCd2rWPS061slM95sqx1ZSrKx1IcIp2eOiFbGVpE7MNMCfVm
	s+uw==
X-Gm-Message-State: AMke39lw4/yItShEafiQoogh+FSu73Aa5S0fQ7JosgAfQvoUjj4rmHXlnPfP18mWfFKA2/4zlxucIG1n9XavesHT
X-Received: by 10.223.150.205 with SMTP id u71mr14229481wrb.195.1488222245945; 
	Mon, 27 Feb 2017 11:04:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Mon, 27 Feb 2017 11:03:45 -0800 (PST)
In-Reply-To: <7df56441-6efd-e178-a31d-e77d6d594319@msgid.tls.msk.ru>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<7df56441-6efd-e178-a31d-e77d6d594319@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Feb 2017 19:03:45 +0000
Message-ID: <CAFEAcA_yGs=TA6f6AbwbsjQRW0xH8m6URQuM_6vUg5B9WUGt-w@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 00/14] Improvements for
 SM501 display controller emulation
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
X-List-Received-Date: Mon, 27 Feb 2017 19:04:09 -0000

On 27 February 2017 at 18:11, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 26.02.2017 03:17, BALATON Zoltan wrote:
>> Second try, addressing review comments.
>
> So.. I'm not sure what to do with this :)
>
> I can apply it to -trivial, but this smells a bit unfair
> on my side, while on the other hand, is there any more
> appropriate tree?

I think it's a bit of a stretch to argue that
"1089 insertions(+), 741 deletions" is "trivial", but
the difficulty is that sh4 isn't really very maintained.
Since the purpose seems to be to improve ppc emulation
somehow it could perhaps go via the ppc tree, but I dunno.

I have said I'll try to review this (since I looked at
v1), but I don't think I'm going to get to this before the
softfreeze deadline, I'm afraid. If you want to go through
and review it all feel free -- you probably have as much
knowledge about sh4 and this device as I do :-)

thanks
-- PMM

