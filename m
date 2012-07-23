Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1StOMT-0000WT-NL
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jul 2012 15:32:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1StOMR-0000Uy-GX
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 15:32:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1StOMQ-0002Y9-Gf
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 15:32:07 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:49471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1StOMQ-0002Y2-9u
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 15:32:06 -0400
Received: by bkcji1 with SMTP id ji1so4791903bkc.4
	for <qemu-trivial@nongnu.org>; Mon, 23 Jul 2012 12:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=sekQgO9vkFtCiZxlwmZQ23eT43jxvqXwtzlev1RrmcM=;
	b=NZeUPRnY4G5f9MIkRY7DYnKEnWoNqQwTKfJXg/AspS3DNmGx4ahe7wFeC49Nymlfq2
	/teBLBvAwxfWe6JzQl8x9Qk1y1g023ag4a94CgjHBUb0byJzgPdnHPEjyt9sZa1iSWGf
	Mv9UKHtD6nJTB0SkiqBuZaMzMaJMtFajnEIWZiXu1/sXAkJWvdWG2yngYqukYQr+eJlL
	gMnF+cNzIHVioE9wfUiC1PZF8AYv7ZkVHcwn+T/p08ahy1TibEezVHCi8JewmX97JRDD
	oWbLQgQClJ5tahGH0Zb3AxdLeN+BUhTakZwDnSyQmWy/eZdI01ewBxDuXVnsAh1nagfG
	GXHQ==
MIME-Version: 1.0
Received: by 10.205.122.147 with SMTP id gg19mr8496282bkc.73.1343071924925;
	Mon, 23 Jul 2012 12:32:04 -0700 (PDT)
Received: by 10.204.102.14 with HTTP; Mon, 23 Jul 2012 12:32:04 -0700 (PDT)
In-Reply-To: <CAFEAcA-UC5Pmt-oMJx0okH2F6EWNY5XDmURq2EqXnPJuOBAL0w@mail.gmail.com>
References: <1342546459-21993-1-git-send-email-i.mitsyanko@samsung.com>
	<5005A904.5000006@samsung.com> <5005AFA5.6080101@weilnetz.de>
	<CAFEAcA9t5qDGvOBTL0eb+nRZGdiNBBwqd020Gz+80ovGm3t+hA@mail.gmail.com>
	<5005BBD7.1000905@weilnetz.de>
	<CAFEAcA9n7+UVp9W20x8zs71cPxZWBu8o1FQxVSwq8o6TdGZ0BQ@mail.gmail.com>
	<CAAu8pHvJVj=cU-q9gjrGinPT97O+60L4vipzYMVeWy+T2o3cuA@mail.gmail.com>
	<CAFEAcA-UC5Pmt-oMJx0okH2F6EWNY5XDmURq2EqXnPJuOBAL0w@mail.gmail.com>
Date: Mon, 23 Jul 2012 20:32:04 +0100
Message-ID: <CAFEAcA8JjMuoJYjQLnZ7pn-kDDRwy+iJfhLsrLitx+bbC3i6UQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Blue Swirl <blauwirbel@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkSZuqnqZC5s4pnxADn5EVx/HRhIjMrWajE76stXIx/pBZ1drJTtZeBopB1etHtg/RIYaKk
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Igor Mitsyanko <i.mitsyanko@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: fix ALSA
	configure test
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
X-List-Received-Date: Mon, 23 Jul 2012 19:32:08 -0000

On 23 July 2012 18:45, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 23 July 2012 18:40, Blue Swirl <blauwirbel@gmail.com> wrote:
>> On Tue, Jul 17, 2012 at 7:28 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> The trouble is that the warnings and errors here don't cause the
>>> build to fail noisily; that's a big distinction IMHO.
>>> I suppose we could make compile_prog do something like:
>>>  * run the compile test
>>
>> Unfortunately that would break cross compiling.
>
> Sorry, that was slightly unclear phrasing. By "run the test"
> I meant "do the check that we can compile the test code"
> "run the binary produced".

Gah. Missing 'not', should read:
# By "run the test" I meant
# "do the check that we can compile the test code", not
# "run the binary produced".

-- PMM

