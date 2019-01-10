Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghdCd-0007Rb-QY
	for mharc-qemu-trivial@gnu.org; Thu, 10 Jan 2019 11:29:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ghdCb-0007RG-VI
	for qemu-trivial@nongnu.org; Thu, 10 Jan 2019 11:29:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ghdCY-0008Oc-7Q
	for qemu-trivial@nongnu.org; Thu, 10 Jan 2019 11:29:04 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:38540)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ghdCW-0008Mz-So
	for qemu-trivial@nongnu.org; Thu, 10 Jan 2019 11:29:00 -0500
Received: by mail-ot1-x330.google.com with SMTP id e12so10452556otl.5
	for <qemu-trivial@nongnu.org>; Thu, 10 Jan 2019 08:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mseTLoi6+NUkPoJ7mEjoD8fCy0pwkUHMDt95vmkqp0k=;
	b=dEKScDCM4P8fRJB68G+iUOWz9S3NXI5NZPpZwwrPaFz0mXAGvfcET1nv2r72eapDXQ
	AuGkAAuTen3usGbMG0XVuZ7vRiJ/7fp1cSJVRMoLQzEiHOaDbPonsbN5U4hdzBQGkCV6
	hfEsJo74W764JL41ADnP1pMi9XVmjDlnvDo9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mseTLoi6+NUkPoJ7mEjoD8fCy0pwkUHMDt95vmkqp0k=;
	b=TW61TavOoOUXrDABE/DHC7IhoMaQEUGJfY/eVY9OgPJWwljba4ns46qOwII0jXyaza
	ye0ShQFtb25E6HLpCGxU90BCv6/ZnTjQpSiKxZt+XSLLjHh//0PK6Ton8Q1J9mYwof3A
	vbE45IyTb1kjYfQxmTbcYkO+fxh3MbDnv1sB660OEIz+Tfm7TGsymhABNg0JFrJ3Q+va
	NADH/vLjFLuTFutqWb3CYzfmcKzrm5RQmoZPoJmRyY0iKFpMdRWSi0fBCkY6O+QMhANj
	cxEFCEGoCzXKVcA+hMegM2Ml9EOPdwQvMGgAmmcP8H1z0URQO+Xrnk3XDLJPOM+S3114
	u3+g==
X-Gm-Message-State: AJcUukffqEjyotJC/YJOZ6uAVa1wZoGC1IKFpS78WSl+Ytf7Z9iR3n1f
	NbWJaTBzDOyJeTpf+PzWB/trc/VaLjt37bUGvP8Fpg==
X-Google-Smtp-Source: ALg8bN5nOhyfnLM+uEt6JgQDIZPqQkudUz/4LV0GXVhzze0nhh126T90YZTLXhP7fBkL384ef4s+2rGNZwYL0bW0i+s=
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr7597378oth.317.1547137739547; 
	Thu, 10 Jan 2019 08:28:59 -0800 (PST)
MIME-Version: 1.0
References: <20190109130844.5172-1-laurent@vivier.eu>
In-Reply-To: <20190109130844.5172-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jan 2019 16:28:48 +0000
Message-ID: <CAFEAcA86x-Mp+uf5bj=FkcgXdVpmwZ=hquTNZv6_+UBd7avKaw@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Laszlo Ersek <lersek@redhat.com>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=83=C2=A9?= <philmd@redhat.com>, 
	Michael Tokarev <mjt@tls.msk.ru>, qemu-ppc <qemu-ppc@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	John Snow <jsnow@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::330
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/6] Trivial patches patches
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
X-List-Received-Date: Thu, 10 Jan 2019 16:29:07 -0000

On Wed, 9 Jan 2019 at 13:23, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 147923b1a901a0370f83a0f4c58ec1baffef22f0:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20190108-pull-request' into staging (2019-01-08 16:07:32 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-patches-pull-request
>
> for you to fetch changes up to 34bec7a8d04f23d6258dcf338894956b945673a5:
>
>   ioapic: use TYPE_FOO MACRO than constant string (2019-01-09 11:33:47 +0100)
>
> ----------------------------------------------------------------
> Trivial patches for 4.0 (2019-01-09)
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

