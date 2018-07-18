Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ffroF-0002a7-Cp
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jul 2018 15:08:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffroE-0002Zr-44
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2018 15:08:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffroD-0002Ha-55
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2018 15:08:22 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:39185)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffroC-0002HL-Uv
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2018 15:08:21 -0400
Received: by mail-oi0-x243.google.com with SMTP id d189-v6so10840350oib.6
	for <qemu-trivial@nongnu.org>; Wed, 18 Jul 2018 12:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eP9EAfkO8IYTauco7jKm76ovhu5kp5sMcgsQ8wDnyQk=;
	b=IkMoSzC4YGtamGGsZ+ECnE3kvpXUeerTyoEwjH7nYj4u0Hql+yMgUq7syqQnE44F9x
	+ciYQf5ID7Jq8fuDTiMjup5JYwyOnpgqbD0HbkRW2pJc9RD3v7JzIeODNvG0oo52RE8a
	me5+N+3Xs50eY+TfZtyAk6RKRuJBNXPuQM63U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eP9EAfkO8IYTauco7jKm76ovhu5kp5sMcgsQ8wDnyQk=;
	b=HgN0Y4k0ujmzHnxof/5JfXo1HYZl+yIWXwq04DxPlmZKe2JHqVBvHB9HjmGpYl+s3y
	0/fni01kyLhmnJMMzo44OT2czn1uLyRicP2vyYEz+tyCUejySU59zM0C49YPLCIEbSzv
	/Jn2LwI1+K2HkJ2LXUe0oKxkKxzySW3M+IaROhvpNrFrBct9Th22+jS3m9ybAdB1r69K
	bbWXUJhOAJNr0tssZQyUPONGcyoxuKS1gM4ijeq41wwba5t/IAaXVkBH5Ab2rqcBzp75
	P72ztM4dtp2XmwCdwi5Cs9bsik4Vdzp5KajnXFHVRMXO8FX0QsCkbmrMc4Tl/Pe3C1V/
	Xnmg==
X-Gm-Message-State: AOUpUlEW1nhxSH4SXov6le9cPAfNOwChxReSM/HRr7WABha3r1TP8fMH
	P+/AdZDhtUJpyvVmT+dc+s9CoOadfsITk1Bk3rbUwg==
X-Google-Smtp-Source: AAOMgpeFR4RDnc7vd6Lhqb5SMA39IVwPgoW12n/jPzfqzQFZOYrze023cVTqWTx4ZyLlWsCoom/ILpwXijO6o5uIk60=
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr6989522oia.11.1531940900305; 
	Wed, 18 Jul 2018 12:08:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Wed, 18 Jul 2018 12:07:59
	-0700 (PDT)
In-Reply-To: <20180718170428.GT9812@redhat.com>
References: <20180712192603.11599-1-sw@weilnetz.de>
	<20180718162111.GR9812@redhat.com>
	<255cc07f-8eb7-0839-2001-e6ead4f3d969@weilnetz.de>
	<20180718170428.GT9812@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Jul 2018 20:07:59 +0100
Message-ID: <CAFEAcA-qaDKwG1Use+WG-ocBMd7h3irDQNBYsq_jyE1u8fRA2Q@mail.gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developer <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Support
 pkg-config for zlib
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
X-List-Received-Date: Wed, 18 Jul 2018 19:08:23 -0000

On 18 July 2018 at 18:04, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wro=
te:
> On Wed, Jul 18, 2018 at 06:59:25PM +0200, Stefan Weil wrote:
>> Am 18.07.2018 um 18:21 schrieb Daniel P. Berrang=C3=A9:
>> > .... this fallback support for non-pkgconfig scenarios can be entirely
>> > deleted, just leaving the error_exit message.
>>
>> I have no objection. Thank you for the investigation of the zlib
>> history. Removing old unneeded code is always good, but maybe that's
>> something which could be done after release 3.0.
>>
>> Or would you suggest to do it now? Then I can either send an updated
>> patch (v2), or whoever pulls that patch can make that trivial modificati=
on.
>
> If we're ok with adding support for pkg-config in 3.0, I think it is
> reasonable to drop the fallback check at the same time.  I think it
> this stills qualify as a bug fix patch in terms of our freeze rules,
> since we're specificially aiming to fix build problems on one of our
> supported platforms.
>
> So personally I'd suggest sending a v2 with the fallback dropped.
> for 3.0

I would favour doing that part in 3.1. This feels like the
kind of change that we're all pretty certain is safe that
then turns out not to be for some case or other, and it's
easier not to have to fix it up later.

thanks
-- PMM

