Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axfhG-0004Q4-Gx
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 15:09:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1axfh8-00049E-7G
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 15:09:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1axfgw-00013a-H0
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 15:09:12 -0400
Received: from mail-yw0-x242.google.com ([2607:f8b0:4002:c05::242]:36106)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1axfgv-0000d6-A5; Tue, 03 May 2016 15:09:06 -0400
Received: by mail-yw0-x242.google.com with SMTP id u62so2839655ywe.3;
	Tue, 03 May 2016 12:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GmCMZLTB4JWU7vexDYD19JMHoFTVGgLeBHvLsz68BQg=;
	b=CPO7A/Frl/l6pOUaMB147NlNAn9APeQMCUfgTbpNXyivORU4NEuvIw/x/JJiD2BuqX
	aQHbKNHRkmby+2G3L8r23c9A121dgVqGm8jUqY9TUIpHP2J+fuWQSptBB8UwBalIzcwf
	ECyB9HAOm5th7cKzXJ3JgD3mzdfDzAV8p9Zb+a8xSkaaxRC0yo8Ag+xP1p1ZBzAzVa4y
	Ah68LPXNznCnGuDYPT1E9iyl+292m7/tGVdkfatZnOUG+y2wfzSs+82o7Aha5/VnEebt
	fRRahRPJDy74w8g3eOnABUYj5CRFfIyn6fLdOqEExQPgM7BkpGb7sm0AxsCgIfgNW26H
	kCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GmCMZLTB4JWU7vexDYD19JMHoFTVGgLeBHvLsz68BQg=;
	b=Oh9cl/Gq2N2FnNR5u1I8xdyPx80F4idn5ijo+l4v20Ie6Ll17MpTzzlY0BDsDL2PBi
	aXqyPhlQmZi5tVjHHprbajg74yl3B2QTjmXkTHx/y0BiqkpZoLFd6f7JBSzJEKQ1MrVf
	nX1N/ssFDMb3l13UL4C9U0MSgLxb07lvuFV3KXMT+eR3uNBmtGYpjfmf1jCD0Y8RGU+R
	KiC5I4Euibs3z9nxxg24AU1HRylZpDtZeJoXjjH7r9SrpngNgGHNsUUgbm+9qcojfIhM
	UMJcnqScG09Et9lnEbN0UFUXNXRc6If58ibtZYBO86FgpvFbD4+LrB3O9Nl6fLK9LY2h
	fQbg==
X-Gm-Message-State: AOPr4FXhVKMSMA+HSBb0ycfwSCcMMUWxA9E1emXUXjleFXsXKCluKIz/MeOUsDSdy2unAFsFyXO/XanMV+2wVA==
X-Received: by 10.176.69.183 with SMTP id u52mr2185542uau.30.1462302514232;
	Tue, 03 May 2016 12:08:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.184.134 with HTTP; Tue, 3 May 2016 12:08:04 -0700 (PDT)
In-Reply-To: <CAFEAcA9U5fshvjmTRBbsS9CMJMfyLwO799C2p9zYg9GkZWSaUA@mail.gmail.com>
References: <1459861743-4514-1-git-send-email-haris.phnx@gmail.com>
	<CAE_WKMyO1LjEZ_T5-O7=X=MOpSe7AqTeXTOOkfiZ114bGjNeDQ@mail.gmail.com>
	<5728E097.1060507@freebsd.org>
	<CAE_WKMy6tMKUFhdwV9T1ejBFHe=SeVeOfzZnFYyUCe8zNXAYZA@mail.gmail.com>
	<CAFEAcA9U5fshvjmTRBbsS9CMJMfyLwO799C2p9zYg9GkZWSaUA@mail.gmail.com>
From: haris iqbal <haris.phnx@gmail.com>
Date: Wed, 4 May 2016 00:38:04 +0530
Message-ID: <CAE_WKMy8psLGVykrG1mr+Tk4awRPsRoWjtkWKg12d6c00tX0_w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Sean Bruno <sbruno@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] Changed malloc to
 g_malloc, free to g_free in bsd-user/qemu.h
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
X-List-Received-Date: Tue, 03 May 2016 19:09:24 -0000

On Wed, May 4, 2016 at 12:32 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 3 May 2016 at 19:10, haris iqbal <haris.phnx@gmail.com> wrote:
>> On Tue, May 3, 2016 at 11:02 PM, Sean Bruno <sbruno@freebsd.org> wrote:
>>> If this is the only patch needing review for the bsd-user code, please
>>> put me down as Reviewed by.
>>
>> Sorry, I am a newbie. Just to confirm, should I send the patch again
>> with "Reviewed by : Sean Bruno" line?
>
> No, you don't need to resend. When bsd-user patches are collected
> up to be applied then the person who does that will apply the
> reviewed-by tag.
>
> (If you needed to resend a patch for some other reason, then if
> the patch hasn't changed then you should add the reviewed-by
> tag when you resend it. But there's no need to resend purely to
> add the tag.)

Thanks for the reply, much appreciated.

>
> thanks
> -- PMM



-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962

