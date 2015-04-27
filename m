Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymica-0001b6-CL
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 08:58:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YmicY-0001Xc-JK
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 08:58:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YmicR-0008Mi-AT
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 08:58:46 -0400
Received: from mail-ig0-f177.google.com ([209.85.213.177]:36302)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YmicR-0008MK-6A
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 08:58:39 -0400
Received: by igblo3 with SMTP id lo3so61022093igb.1
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 05:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kzP5y0NSH4980n0V8r6Arn6+El29kLk/D0Q3tV+BtWc=;
	b=HcFfJ/9E8ATsDo/qLpTWa+Xugv8mYKJ3a7UX0MNt8LO3XHS91gSQumHBAcjvLwhpUO
	xxZJ00V4Z2xwV48PWLvECYemrjKn+zPUPvlTiid8haDuQJ9vAXCoCKDPPZ3LUd6N4OZo
	sRGekE6AuKKdn6XfSTLdOERgDkA5dgYIPwNE0+27RsOAp4X/wNHPnJfGnKB/fYslBk7h
	nNEIIV4qTKzxqJPEfznfnMRMLSiSK/qcAVcSniX0Voj1OmJhEiGDxtw8WRppfSFJHLbZ
	vLXflKYx14nTNdSUpPFeifK8fV10rDS/cfq82qr11mgqwTFMPW5Dk6CfBGH+SIj1WP4/
	vSBQ==
X-Gm-Message-State: ALoCoQmzdB5Bou3sewRbThgZ0dNsNzN50QNjUeWOt/n15J+HiTpweqaLz8/r901ib2+7+Qov7wLP
X-Received: by 10.50.114.9 with SMTP id jc9mr6063165igb.49.1430139518693; Mon,
	27 Apr 2015 05:58:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.136.220 with HTTP; Mon, 27 Apr 2015 05:58:18 -0700 (PDT)
In-Reply-To: <553E2571.2000700@msgid.tls.msk.ru>
References: <cover.1430096379.git.crosthwaite.peter@gmail.com>
	<a07c62df4232de834d97e01a981281c68d97fbbc.1430096379.git.crosthwaite.peter@gmail.com>
	<553E2571.2000700@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2015 13:58:18 +0100
Message-ID: <CAFEAcA-a==mJ2kfb6E=So+agg1uZ9VsWMNYwS0BwzEM+RKUAWQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.177
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH target-arm 2/2] arm: cpu.h: Delete unused
	cpu_pc_from_tb()
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
X-List-Received-Date: Mon, 27 Apr 2015 12:58:47 -0000

On 27 April 2015 at 13:02, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 27.04.2015 04:38, Peter Crosthwaite wrote:
>> No code uses the cpu_pc_from_tb() function. Delete.
>>
>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> ---
>>  target-arm/cpu.h | 9 ---------
>>  1 file changed, 9 deletions(-)
>>
>> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
>> index 7069103..c9c5d30 100644
>> --- a/target-arm/cpu.h
>> +++ b/target-arm/cpu.h
>> @@ -1874,15 +1874,6 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>>
>>  #include "exec/exec-all.h"
>>
>> -static inline void cpu_pc_from_tb(CPUARMState *env, TranslationBlock *tb)
>
> This function is also used in target-tricore/cpu.h, and is mentioned
> in comments in tcg/tcg.h.  Should these be removed as well?

The tcg/tcg.h comment should be updated:
 * Otherwise, we gave up on execution of this TB before it started, and
 * the caller must fix up the CPU state by calling the CPU's
 * synchronize_from_tb() method with the next-TB pointer we return.
 * (falling back to calling the CPU's set_pc() method with tb->pc
 * if no synchronize_from_tb() method exists.)

That's a bit clunky though, which suggests we should
have a cpu_synchronize_from_tb() inline function in qom/cpu.h
which does the
        CPUClass *cc = CPU_GET_CLASS(cpu);
        if (cc->synchronize_from_tb) {
            cc->synchronize_from_tb(cpu, tb);
        } else {
            assert(cc->set_pc);
            cc->set_pc(cpu, tb->pc);
        }

bit that cpu-exec.c currently open-codes.

-- PMM

