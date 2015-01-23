Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YEcJZ-000154-Fx
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jan 2015 06:22:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEcJU-0000zi-No
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 06:22:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEcJK-0001KT-TI
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 06:22:08 -0500
Received: from mail-lb0-f177.google.com ([209.85.217.177]:34008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YEcJK-0001KI-MV
	for qemu-trivial@nongnu.org; Fri, 23 Jan 2015 06:21:58 -0500
Received: by mail-lb0-f177.google.com with SMTP id p9so6488133lbv.8
	for <qemu-trivial@nongnu.org>; Fri, 23 Jan 2015 03:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lxYbJbdG20X7rmYZBSk/UJZFffe6MOkZLVhaRcn/cds=;
	b=kTcca0SySzsEQsCGG4W1qPhLCOKyekdmGJTJEEKbcxN2x00cyU5sRQERW2de9QgdmM
	/KPtzXNakPnhitfs4/nJpju8Y8cwlNkRReOludQv/bxQVSITAOl8dM83Np5c+k1NaiZ3
	ODrQOgPqoVs0wasLYQOT7MIK679apGY7027xLdKUoWq0qixXZT0T3ZlYFNSW5lcvtu/B
	0rJRz1b8HZbnicQIs2BBzX5wpgbXPIB4V2jm6+DJskb6cGmNRMKR4MF/iwNW7Bf6XcMP
	Dz3+WjVaS4SOTCu7cnQxG1tzF24YJD4XPG3z/5tjVwnpfqipNx99JPtXyp65bilR8Gx3
	tYnA==
X-Gm-Message-State: ALoCoQluCXNIpahe+zousdyWjkB15BRTKd0ndOVQx//5k1g6iyW409UZO+Zq/H9VE5B7Bd+jSBDQ
X-Received: by 10.112.137.196 with SMTP id qk4mr1932939lbb.33.1422012117794;
	Fri, 23 Jan 2015 03:21:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.21.34 with HTTP; Fri, 23 Jan 2015 03:21:36 -0800 (PST)
In-Reply-To: <54C22918.8040505@sunrus.com.cn>
References: <54C21D76.8050808@sunrus.com.cn>
	<CAFEAcA_NG4E5tc8nQ8EbVDqs=704cnXJZerVAVg-c74VQm5c+Q@mail.gmail.com>
	<54C22918.8040505@sunrus.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jan 2015 11:21:36 +0000
Message-ID: <CAFEAcA9WwAT4ft9Hk0Apoa1MG1PeGOZ660OtK+qvJYeJvVMCGg@mail.gmail.com>
To: Chen Gang S <gang.chen@sunrus.com.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.177
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Chris Metcalf <cmetcalf@ezchip.com>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user/syscall.c: Fix
 typo issue for using target_vec[i].iov_len instead of
 target_vec[i].iov_base
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
X-List-Received-Date: Fri, 23 Jan 2015 11:22:11 -0000

On 23 January 2015 at 10:57, Chen Gang S <gang.chen@sunrus.com.cn> wrote:
>
> Thank you for all of your work.
>
> I plan to let qemu support tile architecture: "can let gcc run testsuite
> with qemu for tile". It is really hard to me, but I should try, it is my
> duty (I met it, and it's within my boarder, although no one pay for me).
> :-)

> Welcome any ideas, suggestions and completions by any members

My single biggest suggestion is to make sure you split the work
up so that you can post parts of it as you go along. Typically
for a target-*/ new port that looks something like
 * initial framework, but no instruction decode (so all instructions
   just throw an illegal instruction exception)
 * support for one or a few simple classes of instruction
 * gradually fill in the gaps of missing instructions

This way you get the benefit of code review on your early patches,
so you can write the later ones in line with the comments you
get on the first patches. We also get to review the code in
smaller and more manageable chunks.

I think the last target code to go in was target-tricore; you
could look back in the git history and the archives to get an
idea of how to structure the patchset and the kinds of review
comment that patchseries received.

thanks
-- PMM

