Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcUmX-0006Z6-MV
	for mharc-qemu-trivial@gnu.org; Fri, 10 Oct 2014 03:38:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XcUmQ-0006YR-0J
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 03:38:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XcUmJ-0000xM-Px
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 03:38:25 -0400
Received: from mail-lb0-f180.google.com ([209.85.217.180]:37817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XcUmJ-0000xF-JA
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 03:38:19 -0400
Received: by mail-lb0-f180.google.com with SMTP id n15so2525087lbi.39
	for <qemu-trivial@nongnu.org>; Fri, 10 Oct 2014 00:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lKZLjeMwio8WlLYGGW2JHbpLuy4tngpi0hBOiQwANE0=;
	b=VZgvJ7A4eb22W70SrrIYsO05nHnehyhUR05I+577cCLM5yiU77M3Ddzyja1Lyodqtr
	rSM/0fHVH5f7LzfqJf6xAJEQHjtcMxy2wU3S1vgS58S86AQV8uf14uTlRuv9DRgryF8d
	VgwJxxLdzYwz9yCaFJzUHLB0Us1ux12q426a7gLrFHQ+zThicG1dbWfDV3507885+V3k
	R1yMUqWT9/DW5GDpOeUY7JBcjrNCxIckqOx87ro/UPdr+kLEwzzukOlH4ZopUQc6LlQL
	Muniyb8EAle14k/Vl8cS/MZi8EHHdoKM2PjXqZWwIZ1u0ssAtKOhBj4/Nva3Wat+uEgP
	WQcA==
X-Gm-Message-State: ALoCoQm0KBSgtXE8eQ3nTdINQeu0SvDAtFgdEF9WtUW5ljnwnfQpm9uIYoJse/rPPWxM6iYv52/Z
X-Received: by 10.112.52.165 with SMTP id u5mr2601188lbo.80.1412926698424;
	Fri, 10 Oct 2014 00:38:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Fri, 10 Oct 2014 00:37:58 -0700 (PDT)
In-Reply-To: <54373C63.1010005@gmail.com>
References: <54369514.5000004@gmail.com>
	<CAFEAcA_NOfN=vr98+yqE7B+M88ZDWD_OwxG+noMzGcNjNFwwPw@mail.gmail.com>
	<54373C63.1010005@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Oct 2014 08:37:58 +0100
Message-ID: <CAFEAcA83aUuhBQ+Pu+Ott+W3ar20pKQN7vSmZfLaBoBGSwQ1mg@mail.gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.180
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	"rth@twiddle.net" <rth@twiddle.net>
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
X-List-Received-Date: Fri, 10 Oct 2014 07:38:32 -0000

On 10 October 2014 02:54, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> I use the latest upstream gcc (which pulled from master in 2014-10-0?).
> In my memory (not quite sure), the older version gcc may not notice
> about this warning.

Hmm. I'll see if I can test with that gcc.

> But for me, the warning (compiler worries about) sounds reasonable, and
> it's harmless to be fixed (after have a look, for me, they are declared,
> but never be used).

It's a library. Other users of this code upstream will use these
constants; it's just that we don't happen to.

>> The reason I'm reluctant to make changes to these files is
>> that they're pulled in from a different upstream project
>> (libvixl) so we should only fix critical problems in them,
>> or it makes new versions harder to update to.
>>
>
> Originally, I first try the Xilinx branch (Xilinx-master from Xilinx
> github), yesterday, and found this issue, then I try upstream main
> branch, found the same issue.
>
> For me, when add the related patch (which will use these variables in
> 'libvixl'), then declare and set them in the related headers, again.
> That will let other reviewers and readers easier understanding.
>
>  - removing them at present, is easy understanding.
>
>  - add them again when really need them, is also easy understanding.

But it's all changes which we would have to carry locally
and then re-make every time we updated to a new libvixl.
I definitely don't want to do that unless it's absolutely
required.

thanks
-- PMM

