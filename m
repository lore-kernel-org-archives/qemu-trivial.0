Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xcdrv-0004Tv-As
	for mharc-qemu-trivial@gnu.org; Fri, 10 Oct 2014 13:20:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1Xcdrs-0004Sa-Cu
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 13:20:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1Xcdrq-0008Tk-QG
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 13:20:39 -0400
Received: from mail-oi0-x232.google.com ([2607:f8b0:4003:c06::232]:51483)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>)
	id 1Xcdrn-0008Sr-T4; Fri, 10 Oct 2014 13:20:35 -0400
Received: by mail-oi0-f50.google.com with SMTP id i138so7322746oig.37
	for <multiple recipients>; Fri, 10 Oct 2014 10:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2f5ejQ47i6gIp03s1axodgLUjRvmoDUL/sCawYds/I8=;
	b=nprR+YJeFqhmBa/fdGKl9iJOUhGgFeWY8X5GARdquZWhHo+sQT+bHMVJbiNPWB9aMC
	SaCKAw1BM0fHh42IjWOrnDDjYx7wpCsSpa8wiNrJlGnQ8vH3ttr6w5iu8muKjWF64jsg
	YhiK5822WeQE2D3m/ac5ofb7bno96C3hezey0EDrwMgwRpxCqQ6WtRYnuivRDhfXW3DU
	r+Fr7JhzqEda+mSfp0h8RuxIOhEisim/Cg7CDTdQw4eIp7S3jVE8whXWEVihF0xM2I5r
	lPxQPXZ/6xI+rJFyASZQWR6d+wOh3lJRixFFPsiJK1zYxEXP335CBU9sRa6pJa/H/L4z
	CWow==
MIME-Version: 1.0
X-Received: by 10.182.20.146 with SMTP id n18mr6097755obe.26.1412961634583;
	Fri, 10 Oct 2014 10:20:34 -0700 (PDT)
Received: by 10.76.104.231 with HTTP; Fri, 10 Oct 2014 10:20:34 -0700 (PDT)
In-Reply-To: <CAFEAcA8=Ku5NwK8jqeHpB1ygHEh4JW_RgVpBnLUBSe30KFFRRA@mail.gmail.com>
References: <1410723393-17812-1-git-send-email-peter.maydell@linaro.org>
	<CAMo8Bf+80_-=GVZbhy4URKLYThmc+h_ooVbTfvSjTL+dGwDvgg@mail.gmail.com>
	<CAFEAcA8=Ku5NwK8jqeHpB1ygHEh4JW_RgVpBnLUBSe30KFFRRA@mail.gmail.com>
Date: Fri, 10 Oct 2014 21:20:34 +0400
Message-ID: <CAMo8BfK+qk_wXUrGY8jTEm3wfXbbP1=aJaBrZOhysUT-iGSjtQ@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c06::232
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] target-xtensa: mark XtensaConfig structs
	as unused
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
X-List-Received-Date: Fri, 10 Oct 2014 17:20:41 -0000

On Fri, Oct 10, 2014 at 8:24 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 14 September 2014 21:29, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> On Sun, Sep 14, 2014 at 12:36 PM, Peter Maydell
>> <peter.maydell@linaro.org> wrote:
>>> The XtensaConfig structs will be defined but not used if they are
>>> for the opposite endianness from that of the binary being built;
>>> keep the compiler from complaining about this by marking them
>>> with the 'unused' attribute.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> This works, although it's a tad ugly. If anybody wants to suggest
>>> something better...
>>
>> Fine for me.
>>
>>>  target-xtensa/core-dc232b.c | 2 +-
>>>  target-xtensa/core-dc233c.c | 2 +-
>>>  target-xtensa/core-fsf.c    | 2 +-
>>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
>
> Thanks. I guess we could put this one in through
> -trivial ?

Yes, please.

> Patchwork url:
> http://patchwork.ozlabs.org/patch/389115/

-- 
Thanks.
-- Max

