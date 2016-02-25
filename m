Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aYwqP-0006Sr-D6
	for mharc-qemu-trivial@gnu.org; Thu, 25 Feb 2016 09:24:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYwqM-0006SD-LJ
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 09:24:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYwqI-0006VT-Pg
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 09:24:38 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYwqI-0006VB-L9
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 09:24:34 -0500
Received: by mail-vk0-x232.google.com with SMTP id k196so49100826vka.0
	for <qemu-trivial@nongnu.org>; Thu, 25 Feb 2016 06:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5uMN3vAukPvVs1oAMTt6imIfbDWMqQnYLUzphKz7jOE=;
	b=FAqnv4S5zVNCw89EUjvcjEY0siO7D7R0/i8v/U2BXaNp0G8lIc0Xi+Bi7uRiqZ11nl
	uFIRxhxj8nW1MclTfgmKPf6fqAERCYeiLtrpdKlALNLorWIq9ctFl7FawPTzlegmVZWS
	H2i3SNKrSBX0RD3QneM4ADSA9MIVMpQi6MzNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5uMN3vAukPvVs1oAMTt6imIfbDWMqQnYLUzphKz7jOE=;
	b=S+gPvSz+mdH+XSLquIHIKkRX4Y5uUY+MkO2yjZMXK4Aui9qapijgnjqJdg0jaFOqqt
	MShgLhPdlpqKZPgg/Ib51CZzo5k2ahp0qArYdIOWpZqflwY1Z9pUJJJcVkBdizz45Spp
	yTFmDhWAmwTlXFahAn9wLbqe0GAEJhVKL+OQT8FQ7x64tZXxA204z5bYQFN4bVXmrK69
	rXsPGWnwBYZGeg6op/COh8ZFCgclK4+R5YbY7b1YW2ROjit5zTDV5tPuHumU2mLr8kcj
	X8HkNzrh128uZC+CZWRzLRZD1ROE+raLvTo75XN6AA9E/9YgWblpmuW5jNmISdDDsBqa
	cTAA==
X-Gm-Message-State: AG10YOTIcgtwOm99NvHRvyLyjBH1qDq7YDa8gtcPR7wydYWr8G9hUh1mLjf5ocy4xjF2/a2jrxA9Ji4Ucw5ZPw3D
X-Received: by 10.31.141.2 with SMTP id p2mr37606973vkd.37.1456410273069; Thu,
	25 Feb 2016 06:24:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 06:24:13 -0800 (PST)
In-Reply-To: <56CF020A.8030704@cn.fujitsu.com>
References: <1456392739-30336-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<CAFEAcA944NgbOvv3mYH2xvEup2V-UevPXPfew=Y2N7sYkvvxpQ@mail.gmail.com>
	<56CF020A.8030704@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 14:24:13 +0000
Message-ID: <CAFEAcA9=u6FiqNTw25x3k5uLKZ9QnDqsho2BdfqZ-ybjfRa_fA@mail.gmail.com>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
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
X-List-Received-Date: Thu, 25 Feb 2016 14:24:39 -0000

On 25 February 2016 at 13:30, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:
>
>
> On 02/25/2016 06:00 PM, Peter Maydell wrote:
>>
>> On 25 February 2016 at 09:32, Cao jin <caoj.fnst@cn.fujitsu.com> wrote:
>
>
>>> diff --git a/docs/memory.txt b/docs/memory.txt
>>> index 8745f76..1a3ad622 100644
>>> --- a/docs/memory.txt
>>> +++ b/docs/memory.txt
>>> @@ -297,7 +297,7 @@ various constraints can be supplied to control how
>>> these callbacks are called:
>>>    - .valid.min_access_size, .valid.max_access_size define the access
>>> sizes
>>>      (in bytes) which the device accepts; accesses outside this range
>>> will
>>>      have device and bus specific behaviour (ignored, or machine check)
>>> - - .valid.aligned specifies that the device only accepts naturally
>>> aligned
>>> + - .valid.unaligned specifies that the device only accepts naturally
>>> aligned
>>>      accesses.  Unaligned accesses invoke device and bus specific
>>> behaviour.
>>
>>
>> This doesn't look like the right change, because (a) a field named
>> unaligned which you set true to specifiy that unaligned accesses
>> are invalid would be very confusing and (b) the comment in the
>> header file says that 'valid.unaligned' means that the device does
>> support unaligned accesses.
>>
>
> the reason that I think it is a typo is: from the pattern ".xxx.yyy", this
> section looks like a explanation(or detailed comment) of struct
> MemoryRegionOps`s fields, isn`t it? If yes, all the others match with the
> structure, except this /.valid.aligned/

You're certainly right that the documentation as it stands is wrong.
I don't think this is a simple typo though. Probably what happened
was that when the API was being designed it started off with an
'unaligned' field, and then later the field name and semantics
were changed but the docs weren't updated to match. My point was
that just changing the name without looking at the behaviour we're
actually implementing isn't correct.

> I admit that, the description like ".valid.unaligned specifies that the
> device only accepts naturally aligned accesses" looks very confusing. But
> from the only caller memory_region_access_valid(), I think the original
> maybe not quite good? how about this:

> /.valid.unaligned specifies that the device accepts unaligned accesses.  If
> false, Unaligned accesses invoke device and bus specific behaviour/

I would suggest:

  - .valid.unaligned specifies that the *device being modelled*
    supports unaligned accesses; if false, unaligned accesses will
    invoke the appropriate bus or CPU specific behaviour.

(the idea being to make the text parallel to the existing
.impl.unaligned docs so it's clear what the difference is.)

thanks
-- PMM

