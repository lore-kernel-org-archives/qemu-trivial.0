Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5unJ-0003Lb-Vl
	for mharc-qemu-trivial@gnu.org; Sun, 04 Aug 2013 05:40:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V5unD-0003DW-MA
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 05:40:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V5un2-0006Xz-Va
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 05:40:03 -0400
Received: from mail-la0-f48.google.com ([209.85.215.48]:32937)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V5un2-0006Xc-Oc
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 05:39:52 -0400
Received: by mail-la0-f48.google.com with SMTP id hi8so1355837lab.21
	for <qemu-trivial@nongnu.org>; Sun, 04 Aug 2013 02:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ZAsctjx7wIIv5d5+9R9DoIpL5ylEz2BKh6+qR1ea26Y=;
	b=nvE91Z40QRpPhq6jpn70/fIgL6uxFa/c6SUQOnFabFkcw2rMGEUJmnvIqZUJ2rNGFG
	zrlSXwB5aRW5L8wIgWSPjPAh5PDvxe2ck2Zkjo1WA2Zp23+bFNEM7KKJnuVdMeMHsm8P
	dhEBh5dWceFE/lmIH/B3dv2fSvPApSqrgf66ESv5YdFtlIOPcTJLmhRFtAMs+JCLDit6
	mhFcCpWDbQsROIkOQ11w9DVWinlBtDY7cbQMl68/agXrwWy/Odld6gn0vFBh40rpd3Ko
	ZGyKCYKs6MCNW3V6h6qdrW/BMumLO8vdjskCOQxOv0evE2+FRiTFSnp/0xzGqGppygX+
	0ZPQ==
X-Received: by 10.152.22.65 with SMTP id b1mr6242855laf.46.1375609191304; Sun,
	04 Aug 2013 02:39:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.13.2 with HTTP; Sun, 4 Aug 2013 02:39:31 -0700 (PDT)
In-Reply-To: <358B0F62-7043-432E-8B49-F95CD1B82443@gmail.com>
References: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
	<CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
	<358B0F62-7043-432E-8B49-F95CD1B82443@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Aug 2013 10:39:31 +0100
Message-ID: <CAFEAcA8Gh+jys24Ejjp+6ccTxQFhmvdhmfvzEO_B04yzredL=A@mail.gmail.com>
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmtY989Q5+I91DYbyl8PfVS4L5Q6FdHcnrt5AkFVV9AiaSwDnAGN2d+7014VPrrq/mJEcE7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.48
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, afaerber@suse.de,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Adds the ability to use
 the command key in the guest operating system.
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
X-List-Received-Date: Sun, 04 Aug 2013 09:40:08 -0000

On 4 August 2013 00:43, Programmingkid <programmingkidx@gmail.com> wrote:
>
> On Aug 3, 2013, at 7:06 PM, Peter Maydell wrote:
>
>> On 3 August 2013 23:52, G 3 <programmingkidx@gmail.com> wrote:
>>> This patch adds the ability to use the command key in the guest
>>> operating system. Just add -command-key 55 to the command line
>>> options sent to QEMU to use this feature.
>>>
>>> I have checked the patch by sending it thru checkpatch.pl this time. I also
>>> made a bunch of style changes to more closely match QEMU's suggested coding
>>> style.
>>>
>>> signed-off-by: John Arbuckle <programmingkidx@gmail.com>
>>>
>>> ---
>>> ui/cocoa.m |  114
>>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
>>> 1 files changed, 104 insertions(+), 10 deletions(-)
>>
>> This definitely isn't "trivial".
>>
>> I'm also really unconvinced that this is the right way to handle
>> this: adding a new cocoa-UI-only command line option which takes
>> a magic number looks very odd.

> Why don't you think it is trivial?

It's over 100 lines long; it's not "obviously correct"; it adds
a new command line switch; cocoa.m has a listed maintainer.

> The way of how to handle send the command key into the guest operating
> system has already been discussed. This way lets the user decide at
> runtime how best to handle the command key. The magic number you talk
> about is actually a virtual key value. Every key has their own
> virtual key.

Right, but I don't have to specify anything about any other
key on the keyboard, why should command be special?

> Do you have your own idea as to how to handle the command key?

"Should the QEMU UI use the menu-accelerator key for menus or
should it pass it through to the guest" is a generic UI front-end
problem; any solution should not be specific to a single UI,
we should handle it the same way for all front-ends.

-- PMM

