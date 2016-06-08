Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAf5O-0002b1-5G
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 11:08:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAf5M-0002YJ-FF
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 11:08:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAf5K-00071e-GM
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 11:07:59 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:32959)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAf5K-00070y-Ca
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 11:07:58 -0400
Received: by mail-vk0-x22c.google.com with SMTP id d64so15301208vkb.0
	for <qemu-trivial@nongnu.org>; Wed, 08 Jun 2016 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2PoQyr0BjLHbdbxM8CPwpGYiaDs1YKDHa3nPFP/Wbzk=;
	b=WaSw33SSPccKuKVDMUXVfrvuFooSN54uLrUXJ1cqqv7Vt+taKhqa9dnoIC7iizd/ho
	+WYHFCJN47v3ODdBjfWdFDWOTeTdIhHDn+uNAeBL/AZurO+fGJBxUkcmGMUb7aZfPW32
	+qmhEtOIYPMQI9EHXHHWyJmkJsM4QRtWloFMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2PoQyr0BjLHbdbxM8CPwpGYiaDs1YKDHa3nPFP/Wbzk=;
	b=e67hyXhzHP1pV6I8A5Bdy64u19IrE9rQZkR8g8p/Vpcu87D09hTZ8Tjns3PXZJAmt/
	p+2YYAORctMKLqUNHOQOU0rdxkdDOAfvDyaanjiYBZtgfU19rO6orOnv0pqPFs44ZKLN
	e5p5zxJ0uPtFQ06gDPESzljXOIESSiQ7qnCR1OWkOdXktoXsSEVlcQA4n8lWxQMPoPih
	cpDHRz6xDuk8NrvPrv3sP1Ke0ixVC21MGJwxglQHGzfYYrhLo2jw9g8FUVXxvMkpuamu
	5bj82ersFkekiMxLDIQxaN1ec8cH1CGgPTRF9QtuabMoxDSMPsDm3nC2yhdVAZ/gGVlG
	yfUw==
X-Gm-Message-State: ALyK8tIRQNoIQ9tncVlc8vvTQu3LOLRAvNIT9IHN9B4HyZ+/FJoynIlZ1hG3TRcsZ4jZM0EJKKE5xeN4RwNB3geL
X-Received: by 10.31.142.202 with SMTP id q193mr2619671vkd.37.1465398476894;
	Wed, 08 Jun 2016 08:07:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Wed, 8 Jun 2016 08:07:37 -0700 (PDT)
In-Reply-To: <57582628.9060306@redhat.com>
References: <1463404220-5945-1-git-send-email-sw@weilnetz.de>
	<alpine.DEB.2.00.1606081305490.10382@tp.orcam.me.uk>
	<57582628.9060306@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Jun 2016 16:07:37 +0100
Message-ID: <CAFEAcA8O_ML0UcFjwgD2R9gwY1WB2y_+aQsyd7xuJGYKkqrffw@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: "Maciej W. Rozycki" <macro@imgtec.com>, Stefan Weil <sw@weilnetz.de>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Use $(..)
 instead of deprecated `..`
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
X-List-Received-Date: Wed, 08 Jun 2016 15:08:01 -0000

On 8 June 2016 at 15:05, Eric Blake <eblake@redhat.com> wrote:
> On 06/08/2016 06:16 AM, Maciej W. Rozycki wrote:
>> On Mon, 16 May 2016, Stefan Weil wrote:
>>
>>> This fixes these warnings from shellcheck:
>>>
>>>     ^-- SC2006: Use $(..) instead of deprecated `..`
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>>
>>> More warnings from shellcheck for configure and other files
>>> will be handled by later patches.
>>
>>  Unlike `..` the $(..) Bourne shell construct is not fully portable, some
>> implementations do not recognise it.
>
> All POSIX implementations support it. The only shell that doesn't is
> from Solaris /bin/sh, and that pre-dates modern OpenSolaris which has
> (finally) modernized their shell.  And I don't think we have anyone
> actively trying to build qemu for Solaris (we have bug reports for
> mingw, BSD, and Mac OS, but I haven't seen anyone complaining about a
> failed Solaris build).

We did have somebody some years back, and as I recall what
we said was roughly "this is the 21st century and we assume /bin/sh
is POSIX".

thanks
-- PMM

