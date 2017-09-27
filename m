Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dxLld-0004tb-F9
	for mharc-qemu-trivial@gnu.org; Wed, 27 Sep 2017 19:29:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dxLlb-0004sM-4p
	for qemu-trivial@nongnu.org; Wed, 27 Sep 2017 19:29:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dxLla-0001Xn-5y
	for qemu-trivial@nongnu.org; Wed, 27 Sep 2017 19:29:23 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:45267)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dxLlZ-0001XH-Ss
	for qemu-trivial@nongnu.org; Wed, 27 Sep 2017 19:29:22 -0400
Received: by mail-wr0-x22d.google.com with SMTP id m18so19062705wrm.2
	for <qemu-trivial@nongnu.org>; Wed, 27 Sep 2017 16:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Si34v+173DwH+WjUMAR/r3RpMgcgSGwxybn8hAh/gck=;
	b=au7QKQ2heuKX8RjJ/pUMWNPb5afMnBss7xvX5/kmX2LoA1vRbMrb2DpgHqKUIS/2eh
	LAu7qStvVE7F3jhC+mAVHM16VZE94nnIu+1pXN0q7f/H0YliLwG6LEJau4sKoWWu5EMI
	Olc96Zp5lEuGqeAP7bcQJt+xYOmmTDyUUtB4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Si34v+173DwH+WjUMAR/r3RpMgcgSGwxybn8hAh/gck=;
	b=WqprpqqQhFGEPfgZdPrHRK+NJ9Bhvqh2d+blV2ereQUCuRm+p9Ww6QwD8mrO//UP63
	E/XQFeqMy1LSyx484DtwWIVy4WD/hxFbt7TzkG6UjN+yI99662tNmg3Nlma+p1H0OzLE
	Dntego7MAv7fuO0r/BR3qyfmLjzlebiTpk852jJJGqKzpNfygElSK7dpV7x+qzyomDqV
	u0ROML8mST8tfdYVSzPqEo/e5YrI3dTkPYWjA7t83dQ2rpARSwPBpSVzI+z8mk070rDC
	+v241JRMIL+O9FePKIElHJJK9gaVsNGwFDG5N9qnzInu1mAY08Hm2GjsfOV0UKedI6n4
	Ftmg==
X-Gm-Message-State: AHPjjUgVY2PldF8DKz6Tp80Op12XfxNG+osX6HzY/pA/cvIAZU9AOoRB
	AeJ/f3A0VZl4X1XsRL93SD6wvvkRddBz4XxY6GOcCg==
X-Google-Smtp-Source: AOwi7QAKU6zTaLlmOqOrAQhVXXYbPJyMxXY7tb7IlAADc2MSfN33w2TyWKekMFdF0KpaB+cReN8JNj6Tw+lzNil/QOE=
X-Received: by 10.223.142.82 with SMTP id n76mr3100787wrb.272.1506554960640;
	Wed, 27 Sep 2017 16:29:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Wed, 27 Sep 2017 16:28:59 -0700 (PDT)
In-Reply-To: <20170928020110-mutt-send-email-mst@kernel.org>
References: <1506049617-25716-1-git-send-email-thuth@redhat.com>
	<513bbb2d-280b-92f8-b45f-89963f7118e2@msgid.tls.msk.ru>
	<20170926223046-mutt-send-email-mst@kernel.org>
	<CAFEAcA-dWVfX2i7ZYdHVg3G_kSSM6Gos8TRk=dfYYML4Jrn9HQ@mail.gmail.com>
	<20170928020110-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Sep 2017 16:28:59 -0700
Message-ID: <CAFEAcA98PbN50zeR5guO4ZB3PXCwwb_65irQzkYzdtHfNR-33A@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@redhat.com>, 
	Victor Kaplansky <victork@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/boot-sector: Increase
 timeout to 600 seconds
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
X-List-Received-Date: Wed, 27 Sep 2017 23:29:24 -0000

On 27 September 2017 at 16:14, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Tue, Sep 26, 2017 at 08:35:59PM +0100, Peter Maydell wrote:
>> On 26 September 2017 at 20:31, Michael S. Tsirkin <mst@redhat.com> wrote:
>> > Please do not apply this, trivial is not appropriate for functional
>> > changes like this.
>>
>> It's not a functional change, it's just bumping a test timeout.
>> If you think we should be doing something else that's fine (as
>> with any other patch), but in principle I think this is totally
>> fine as a -trivial patch.

> OK. I'd rather not see it applied as-is though.

Oops, looks like it's already hit master (07897000194a).
I can revert it if you feel strongly about it, but my personal
feeling is that the timeout needs to be long enough that you
don't hit it in any configuration. Usually if you're running
tests yourself then you'll notice it's stuck before it
hits a timeout -- the timeout is just so that fully automated
test runs don't hang forever.

thanks
-- PMM

