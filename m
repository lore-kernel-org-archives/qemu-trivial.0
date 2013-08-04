Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V62ix-0004mI-Ao
	for mharc-qemu-trivial@gnu.org; Sun, 04 Aug 2013 14:08:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V62io-0004e5-VF
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 14:08:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V62id-0004m3-1q
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 14:08:02 -0400
Received: from mail-la0-f41.google.com ([209.85.215.41]:51551)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V62ic-0004lW-Qg
	for qemu-trivial@nongnu.org; Sun, 04 Aug 2013 14:07:50 -0400
Received: by mail-la0-f41.google.com with SMTP id ec20so1542207lab.28
	for <qemu-trivial@nongnu.org>; Sun, 04 Aug 2013 11:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=xMPBhoEJNsUz9vfmPH85OkfKcXfeO0kIdRABXpWdQlI=;
	b=iuVesVTHoGxr+n504sCz99YYENfqEJoAUnBVxVRDA7bsXkdoQrrDwTCTGlxd8yqfYG
	mVUR1B2ELLHP8hA4sQtnRelSF41PfrRjZf+pyM0UTXYj7soxRuqzgjb4zWu03hrgAQ8S
	aBKUn0AiRa647hKpxwfxkQgl/vNZpWo5NfQOa2Y9SIHFWPr5dfeHKH6xNVDdznKG9HMD
	q/fNG9oaiqK5hyGHeqS6Fz16DLQMgIM9fqyo/4nHIIHt5F4SFSq6tj9CkUBMka4Q8Crm
	BuspQ4APKSFPd7A7j0sBrYSzNlfAQ4ocoOmpqlkXux8XMh37nIdfhBEMJzOsxxposlt5
	ti1Q==
X-Received: by 10.112.156.1 with SMTP id wa1mr7130016lbb.70.1375639669653;
	Sun, 04 Aug 2013 11:07:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.13.2 with HTTP; Sun, 4 Aug 2013 11:07:29 -0700 (PDT)
In-Reply-To: <9A748A2F-42CF-4600-AE57-5B013DBC02F2@gmail.com>
References: <CAKyx-3MMkqKw3GXxSR=NizeBHhE+pYyONUX+0mtOgu5h3kix9g@mail.gmail.com>
	<CAFEAcA8VPg-WDf+Xf3j=7Q--NJgc1+2n6zg6M=pX+idkA-zyEw@mail.gmail.com>
	<358B0F62-7043-432E-8B49-F95CD1B82443@gmail.com>
	<CAFEAcA8Gh+jys24Ejjp+6ccTxQFhmvdhmfvzEO_B04yzredL=A@mail.gmail.com>
	<9A748A2F-42CF-4600-AE57-5B013DBC02F2@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Aug 2013 19:07:29 +0100
Message-ID: <CAFEAcA81WMKSYnPWFrAF79qOxumtLRHEQjif1RSMO4yxvVc1-A@mail.gmail.com>
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQm1nIvyz1HykYwtxOjD+/sGMkAsw67Nkpnw0EIZZU3hfpGn/EG99H/WYpANbIB3ncpcuYjo
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.41
Cc: qemu-trivial@nongnu.org,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	qemu-devel qemu-devel <qemu-devel@nongnu.org>
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
X-List-Received-Date: Sun, 04 Aug 2013 18:08:09 -0000

On 4 August 2013 18:53, Programmingkid <programmingkidx@gmail.com> wrote:
> On Aug 4, 2013, at 5:39 AM, Peter Maydell wrote
>> Right, but I don't have to specify anything about any other
>> key on the keyboard, why should command be special?
>
> The command key is used to send commands to an application. When
> the user runs Mac OS X in QEMU, and the host operating system is
> Mac OS X, this can cause problems.

Yes, I understand the problem. Why is this any different to
the similar issue with the menu-key or the Windows key in Windows
(where you also might want to pass it through to the guest,
or have it handled outside the guest).

>>> Do you have your own idea as to how to handle the command key?
>>
>> "Should the QEMU UI use the menu-accelerator key for menus or
>> should it pass it through to the guest" is a generic UI front-end
>> problem; any solution should not be specific to a single UI,
>> we should handle it the same way for all front-ends.
>
> ?

See above.

-- PMM

