Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxyUO-0007Mj-Lq
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 10:08:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YxyUI-0007KI-Se
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 10:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YxyU9-0004rG-V4
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 10:08:46 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:34707)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YxyU9-0004qX-R3
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 10:08:37 -0400
Received: by ieczm2 with SMTP id zm2so39108893iec.1
	for <qemu-trivial@nongnu.org>; Thu, 28 May 2015 07:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KnI8LqeFhK7pJFaXyE7F4DlFN0RHQHMaRubjie3GVkI=;
	b=Vr62iNs/ch0kf2EPNBEab8/trMZibBRXf9x5GP1Ke5WBRcGXzcr1rVT/595Ewgy+kO
	ogO+ZK9RapeCW/MYgva+PzcqUvqSlk/GWvpgwIKCCeDisLEPMHu/AZGegVY5JhzefEuP
	gqDGpFxddbbQAzw6+hMTV7t8eQ9gWyf14N7fXAvmFeOxjRgVB3Jh+UMlAt0TDTw1u+1e
	LcLjI7XRWGJYhaBKtlSw1w8m19O18lFYAIe1RSFTzADJsdsr56PEhHOhMKbBb7ARAnmz
	kz14uOXITy6qWegGBSjNsB9OmWWYSDbzbLt1SuiyFSE+iURRNZMe8Ja7ZLT4+LA1GjCW
	vT/w==
X-Gm-Message-State: ALoCoQmMQVG/tIJMRb81ODvorEmZ2HYdc2yJSUHNoZAw+Iz5BCUT6VqtJcKjF10jVhvWze5Ra71R
X-Received: by 10.107.131.141 with SMTP id n13mr3646897ioi.74.1432822116701;
	Thu, 28 May 2015 07:08:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.181.6 with HTTP; Thu, 28 May 2015 07:08:16 -0700 (PDT)
In-Reply-To: <87iobckdaw.fsf@blackfin.pond.sub.org>
References: <1432632341-5201-1-git-send-email-chenhanxiao@cn.fujitsu.com>
	<5566FCBA.2000500@msgid.tls.msk.ru>
	<87twuwaoju.fsf@blackfin.pond.sub.org>
	<55670998.1030505@msgid.tls.msk.ru>
	<87iobckdaw.fsf@blackfin.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2015 15:08:16 +0100
Message-ID: <CAFEAcA9ZBW1Ba1-=G33wCi6FyKPb__c3Hzt0x02pND=Cp3VStQ@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.223.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs/writing-qmp-commands:
	fix a typo
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
X-List-Received-Date: Thu, 28 May 2015 14:08:51 -0000

On 28 May 2015 at 15:05, Markus Armbruster <armbru@redhat.com> wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
>
>> 28.05.2015 15:12, Markus Armbruster wrote:
>>> Patches must be posted to -devel for review.
>>>
>>> If you accept patches sent just to -trivial, then the only post to
>>> -devel will be your pull request, where it most probably won't get
>>> review.
>>
>> Obvious typo fix in comment or doc don't really need a big review.
>> That's where the "too trivial" border can be drawn.
>
> I don't want us to get into the "is this trivial enough to go in without
> review" business.

Yes, in general I agree. Nothing in our documentation says "send only to
-trivial", and it's not a very big deal to ask for a resend on the
odd occasion somebody does it by mistake.

thanks
-- PMM

