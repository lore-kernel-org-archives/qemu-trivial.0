Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abUeF-0006aE-Fy
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 09:54:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUeC-0006Wu-QG
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 09:54:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUeC-0006r0-3q
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 09:54:36 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34801)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUeB-0006qj-Kg
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 09:54:36 -0500
Received: by mail-vk0-x236.google.com with SMTP id e185so23709620vkb.1
	for <qemu-trivial@nongnu.org>; Thu, 03 Mar 2016 06:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=StTOi8lJEXKuo7t3AzhVRAr2GOdwPBbbVCthA4ryKas=;
	b=CJx5TY8x878WBgZT+XqQBzbA0cZx6Rwjfy4/uNOokhvxBJlyc3k1DRWVJ5rWmsLS32
	6XCFyBB8bPKfo4wMpSvu2Iwo0oZfiJLca77W3BpbNCbCzxVfHQbvONkq8gqkMgaxGDOE
	7eWsxO2ZvxsurdAx2ylelezOwjR6Si6Y7cads=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=StTOi8lJEXKuo7t3AzhVRAr2GOdwPBbbVCthA4ryKas=;
	b=nA0NBzUKKKFOyVS5MHuosQKOstg7+4/3wP6IimfHFk+zI2v7c4ayQoPuvhToU1nCb3
	q1iNZ8hhWQkwPQMkQFKVLI1rhcjXJm52PpaUEj5p4x8bBWexlQjoWZNalx7qJrRAyMZ6
	FUkK/y4KB0fD7RLOFvDk7SIEU6b9OkG9tSH8f0gzY4tZwlwal8qGdDCjuq7ojXSj3J7M
	8TOU+djSzNnWFtoGKOmcu2ibuEifl6rBALm8cttb1s4ceX+T05M9GoWkF83VErWfq5ZY
	VVvA98Dxl4OWDm7+hrfB85MFLYuDd8l3/A/OSOl4XxORoLYpy5jvvjjpllUZLzQv2Bfk
	rVRw==
X-Gm-Message-State: AD7BkJKi9LbAYL9QFRYpdrB7slhrA7aHbIkkbh0+gU72X4bTYPB8CbNYGu4bXpeVx7Hz4LXRGIIXRFgyaAsQqFAK
X-Received: by 10.31.107.194 with SMTP id k63mr1926678vki.27.1457016874962;
	Thu, 03 Mar 2016 06:54:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 06:54:15 -0800 (PST)
In-Reply-To: <56D84E0E.5000801@redhat.com>
References: <1456392739-30336-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<CAFEAcA944NgbOvv3mYH2xvEup2V-UevPXPfew=Y2N7sYkvvxpQ@mail.gmail.com>
	<56CF020A.8030704@cn.fujitsu.com>
	<CAFEAcA9=u6FiqNTw25x3k5uLKZ9QnDqsho2BdfqZ-ybjfRa_fA@mail.gmail.com>
	<56D84E0E.5000801@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 14:54:15 +0000
Message-ID: <CAFEAcA9B7XF75n3PAtwVdygBe6sUoD4g96URRiXPgk94N5AHQw@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Cao jin <caoj.fnst@cn.fujitsu.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] doc/memory.txt: fix typo
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
X-List-Received-Date: Thu, 03 Mar 2016 14:54:37 -0000

On 3 March 2016 at 14:45, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 25/02/2016 15:24, Peter Maydell wrote:
>> Probably what happened
>> was that when the API was being designed it started off with an
>> 'unaligned' field, and then later the field name and semantics
>> were changed but the docs weren't updated to match. My point was
>> that just changing the name without looking at the behaviour we're
>> actually implementing isn't correct.
>
> Peter, are you okay with adding your S-o-b and authorship to
> this patch?

Yes.

thanks
-- PMM

