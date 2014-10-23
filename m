Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhGDm-0005CB-LU
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 07:06:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhGDe-0005Ag-I1
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 07:06:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhGDa-0007Ts-7L
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 07:06:14 -0400
Received: from mail-la0-f44.google.com ([209.85.215.44]:65468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhGDa-0007Tj-0z
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 07:06:10 -0400
Received: by mail-la0-f44.google.com with SMTP id hs14so627408lab.17
	for <qemu-trivial@nongnu.org>; Thu, 23 Oct 2014 04:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NS+/xLL0QYOSeajCoRDqIiTGHDf5LD6GcrxDRtxeatQ=;
	b=Y9v53ZkNHohtG9NcgDny2EC9D5zR85PSLZ/Ui5M+jprztUxRVEBw2zJk8FNiHd+dnE
	HLYNLliKjkFhpWenEwgNodYK6HTs0tBG0S5vw3DHuCQyCBx/LPxM7nQXreIemoK+tdPv
	jwmtuP70AvSy3kPt7/UgRJXEJeoy2T4zHOAPlBVitEcVtFfHZMho+DRnX0etfBRLMV5V
	SsaNeR/2aO8lL26KBZMSMdAWFh545GFsWv0EQrN5+sA8PdjP8Jqk7FYaDbkMyakjztc7
	ecLfEC6KM+WWFIKfFmKW+lGZwc3N8ir5x/vlDhP39Z1LXtbCvG9U+XjcCi+Psi1kb4QH
	bz3w==
X-Gm-Message-State: ALoCoQlCyC6jaI1fZJemcox1JezgURUCLw3yvKrSPcEdoHEWTDR+Rdyui/5z7Fij4TPqcBDKyHmU
X-Received: by 10.112.66.166 with SMTP id g6mr4140143lbt.69.1414062368545;
	Thu, 23 Oct 2014 04:06:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Thu, 23 Oct 2014 04:05:48 -0700 (PDT)
In-Reply-To: <5448D7FD.60501@msgid.tls.msk.ru>
References: <54369514.5000004@gmail.com> <5448B7C6.8070604@msgid.tls.msk.ru>
	<CAFEAcA-Zg-MUFCnJBeuSjbXyc9Y7W4rLQZ0DXXHJ_ZWKLDo8mw@mail.gmail.com>
	<CAFEAcA_o827huyJeqJty4eBUnXQSRmrP3n967ugr2q7HcJLrhw@mail.gmail.com>
	<5448D7FD.60501@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Oct 2014 12:05:48 +0100
Message-ID: <CAFEAcA9ckGufD2kGREp2zKY8ODUYuAZOXvvC+WJxe0BDqgr8-w@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.44
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Chen Gang <gang.chen.5i5j@gmail.com>, "rth@twiddle.net" <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] disas/libvixl/a64/instructions-a64.h:
 Remove useless varialbe to avoid building break with '-Werror'
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
X-List-Received-Date: Thu, 23 Oct 2014 11:06:20 -0000

On 23 October 2014 11:27, Michael Tokarev <mjt@tls.msk.ru> wrote:
> On 10/23/2014 02:09 PM, Peter Maydell wrote:
>> On 23 October 2014 10:02, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 23 October 2014 09:09, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>>> Applied to trivial (with subject fixup), thanks!
>>>
>>> Please don't -- as I said, I have a libvixl update in my queue,
>>> and these will conflict. I'll apply an appropriate variation of
>>> this patch to my target-arm tree.
>>
>> ...or maybe I just *thought* I'd said that, since I can't find
>> a mail in this thread where I did; sorry.
>
> You did, in a "v2" version.  Which I overlooked really, and tried
> to apply the original v1 (which has you reviewed-by as a temp.
> workaround).  Oh well.. :)

Oh yes. I actually prefer v1, so I've applied it (with a tweaked
commit message) to target-arm.next. When libvixl 1.7 appears we
can just drop this change.

-- PMM

