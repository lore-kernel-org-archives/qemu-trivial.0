Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dO4tq-0007vE-Fx
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2017 12:24:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dO4tn-0007tA-W4
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 12:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dO4tn-0002zg-74
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 12:24:04 -0400
Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241]:33049)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dO4tn-0002yo-2b; Thu, 22 Jun 2017 12:24:03 -0400
Received: by mail-it0-x241.google.com with SMTP id x12so3893643itb.0;
	Thu, 22 Jun 2017 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=bhLNiDRU/EIEyq9QAqIYhsWlDjpm+naKpGN9Lr+/Pwg=;
	b=U1vjr2n+nZIY3tBB52AOZBrb4bPiE617V7e5xLnF/8BkzVxvrmYDpjNVl5pCTisV6U
	nNHuWPTGBBkFDsbufUP9M2psp3l4bQ0m7IPRQdhjTChp/m7Q4X83nbvvJTvkyFo+k/0F
	OC65EM0+otRl38/c+QQpxeGH6YF3fC6aNrBFskLYTdjc/jsuIOBZNiTqrRcwB83sX0wu
	vXONsfD/bSFcWSCB0eLuM2BydXR50i4BYNdcMjJe97bVb9f6zWjRIrIjvDB1wr3aUKPH
	S32ch+Tg9DBv2b+5QTHRXiWAvAeI1OfAKcJfnXxWoQBDkSs8vhrW+b5sjUIU4EOTtHjx
	M5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=bhLNiDRU/EIEyq9QAqIYhsWlDjpm+naKpGN9Lr+/Pwg=;
	b=BbiKVShXo17UuXArAJdSHaK2i4dw5LjDdoxx8bW8kWSFWi3Gsa8FFtlKzrt6KmQD4z
	MLSipCieEzcb3N6W9g0uDS5pJ8wnXAskX1wQiHPm5Tp81nhZbe6jUiKXgmdblyzGlh6j
	Ny1N6rDDp0rGTwiYCL4yW9PSMWO8rnVuck+E+Fr9EP69ahswsgJTT1jK0i6mT1RJ2Otf
	Q8OuX/lQ9IKJGtFXgCjuwYK2u1Vq5InRDDnpUOW+WLfhGygqZjeujAoe6/ZNxUi8ysXg
	IeL2/YPTTsF0Tz61k9VovyRCfU/olbGx1QudI0rsF11OsHoiAbGW+z/GE5RHtFKhD7/I
	JXNA==
X-Gm-Message-State: AKS2vOwTuXVKr5/JIuq5huoxZThs2B0OaPXpOECtj0aDyS0McCfVb2VR
	ft/OL5HO8Q3Hqox9G3WIuoR0cS49Zg==
X-Received: by 10.36.106.5 with SMTP id l5mr2862097itc.95.1498148641033; Thu,
	22 Jun 2017 09:24:01 -0700 (PDT)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.107.139.135 with HTTP; Thu, 22 Jun 2017 09:24:00 -0700 (PDT)
In-Reply-To: <CAFEAcA_kp1tVEd3km1+S7yCLtnVsRko6TQwPZL8xjqV3PVBu5w@mail.gmail.com>
References: <20170531120049.14111-1-n54@gmx.com>
	<26b48c35-b6cc-708d-c4d2-b26a9382e10a@msgid.tls.msk.ru>
	<CAFEAcA_kp1tVEd3km1+S7yCLtnVsRko6TQwPZL8xjqV3PVBu5w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 22 Jun 2017 13:24:00 -0300
X-Google-Sender-Auth: BRdSFppBkjxzYdWV-MnyBbH4LEQ
Message-ID: <CAAdtpL72EXWFzd6cEgBk_WDdn2Ue=XVU3=2g=WUoPo6uum22fg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, Kamil Rytarowski <n54@gmx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
	peter.maydell@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] ivshmem-server:
 ivshmem-client: Build when eventfd() is available
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
X-List-Received-Date: Thu, 22 Jun 2017 16:24:05 -0000

On Thu, Jun 22, 2017 at 12:54 PM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 5 June 2017 at 15:29, Michael Tokarev <mjt@tls.msk.ru> wrote:
[...]
>> $ ../configure --disable-system --disable-linux-user --static
>> $ make V=1
>> ...
>
> Why are you trying to build with both system emulation QEMU
> and linux-user QEMU disabled anyway? That doesn't leave very
> much left to build...

Hmm the only point would be to build libqemuutil.a...

Should the ./configure script return an error if $target_list is empty?

