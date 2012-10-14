Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNVE7-0007GD-9H
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:55:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TNVE5-0007Fx-6k
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:55:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TNVE4-0005Ry-9m
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:55:57 -0400
Received: from mail-ia0-f173.google.com ([209.85.210.173]:44689)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TNVE4-0005Rl-4x
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:55:56 -0400
Received: by mail-ia0-f173.google.com with SMTP id m10so3254665iam.4
	for <qemu-trivial@nongnu.org>; Sun, 14 Oct 2012 13:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=ok9qIR6XEsd1/ytsWfz2WRhgLayVypqgE+62QY1sQYk=;
	b=YNu89hJzns0FDANI4CaKRDbfrHy2/whWZiaPT7XyJ4LD4WR1XLCQdvAymQKjWaJnIP
	rNq/Lpd8iXkgCkjXWSPCqH/X7yIVN6molPThvTwX34OZrDV2g5L4XYG/XbeYKfoviPoQ
	EKf/rNUQe8WNV7KdLrYXzvFt+FkvqZXtPS3E3OVlLfLYuCVYRV09d/8w+WhT4VdUVZ2J
	SxDaXrogoFzUuxynE3zaZWaVencjv/C51x2RQRL3Py63y0ljqXHkS4D+Cq2YrsQ+lvve
	p9U2QamMs6iA36mNnghAqr4Z/jCRV1EnOKvGEmbR8n8hRezkskjty03/1gN6m37ztF2l
	9L4g==
MIME-Version: 1.0
Received: by 10.50.187.194 with SMTP id fu2mr7138948igc.63.1350248155459; Sun,
	14 Oct 2012 13:55:55 -0700 (PDT)
Received: by 10.50.87.105 with HTTP; Sun, 14 Oct 2012 13:55:55 -0700 (PDT)
In-Reply-To: <CAAu8pHtR-jNTnEY0iwEJdihXO8FxKXWcTcnPGQssNJg5jtsBcw@mail.gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
	<9b4ee7a47d8bc116e20f236a1ad9ed73a695123e.1350244587.git.blauwirbel@gmail.com>
	<CAFEAcA_M58F9F-NTY81Fau9_iH_s76f0KHQ_L5TOoC8+naWB6Q@mail.gmail.com>
	<CAAu8pHu5cuBML84JehNbXXsbuJ=3KwauuAvOYP=+VH-Y_GQ+-g@mail.gmail.com>
	<CAFEAcA-f_+CJgKBqW3mGbzDjK2xbBssef=0geyE-kxMZLiK-Og@mail.gmail.com>
	<CAAu8pHtR-jNTnEY0iwEJdihXO8FxKXWcTcnPGQssNJg5jtsBcw@mail.gmail.com>
Date: Sun, 14 Oct 2012 21:55:55 +0100
Message-ID: <CAFEAcA-=WvnX6gYsvaXDvOy0T4yiRV06+sryzzsfdzxJm7u=DQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Blue Swirl <blauwirbel@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQn/UoVMgYSpo6A830gYArG67aSewyROvckh3HrP9hQU34pd0p4vPWYFJOm5kWkqEcuSSdGu
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 10/11] arm: add missing static and remove
	unused functions
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
X-List-Received-Date: Sun, 14 Oct 2012 20:55:58 -0000

On 14 October 2012 21:49, Blue Swirl <blauwirbel@gmail.com> wrote:
> On Sun, Oct 14, 2012 at 8:35 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 14 October 2012 21:33, Blue Swirl <blauwirbel@gmail.com> wrote:
>>> On Sun, Oct 14, 2012 at 8:09 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> In general anything in linux-user/arm/nwfpe is legacy code which
>>>> it's scarcely worth the effort of touching or reviewing.
>>>
>>> Adding 'static' should be only beneficial.
>>
>> Except that it's taken you time to write these patches and it
>> will take me time to review them.
>
> Yes, the benefit may come to the users who may get a slightly faster
> emulator.

If you or any other user would like to find me some test cases
which actually use the FPA floating point emulation at all
I'd be happy to (a) add them to my test collection and (b)
test this patch...

> We, the developers, get the benefit from different things,
> like technical excellence or something else.

One day I might pursue technical excellence by dropping
the nwfpe code completely :-)

-- PMM

