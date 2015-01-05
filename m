Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y8CiS-0008VX-BQ
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jan 2015 13:49:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y8CiQ-0008TK-9l
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 13:49:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y8CiL-0001fs-Uo
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 13:49:22 -0500
Received: from mail-lb0-f169.google.com ([209.85.217.169]:58531)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y8CiL-0001eq-Or
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 13:49:17 -0500
Received: by mail-lb0-f169.google.com with SMTP id p9so18347472lbv.0
	for <qemu-trivial@nongnu.org>; Mon, 05 Jan 2015 10:49:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IcP/+7t6z5JKQdyAK8jzvjm6KoN2d9qNlQseqw215Qk=;
	b=NwUTkWJSIQg/ymOsgYEgifQgIzxMmS4sED1a8zq8L2AyrnoE1lY33EE/8ZgzL2W9Au
	2m9OEmC4zetoAG98nbzOtR/ww3i07ekxZXJPh0WGcRNC5Ygkol9JjPVXT94la/FwO2tY
	UxJxJRKg4dsR54ipnN0HoIUnXP7lmJdbJ5P1JZUrAxQ6Z5ffinqM3igHV0apqPgkfVxk
	HBpCO8/wwDFSR/AnqKXvNFsH4cHEpcRHEsXdy9I+qsheJErlWg0gVCwETAUr2kxwIdSU
	01LP2J6VveCvwoBCMTjnI+WKCiU9t1LDDh6w6UaFNbSvGlkktW880IMNQZDJATTShY9x
	3BDA==
X-Gm-Message-State: ALoCoQm8KZdycGqh79BWsf3K8OEB6YgsXx8P/iQZLJ5kZZ/THztUt4ZDMVlzMtMKr07W8MaeP8W9
X-Received: by 10.153.11.170 with SMTP id ej10mr94737675lad.24.1420483756941; 
	Mon, 05 Jan 2015 10:49:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.52.38 with HTTP; Mon, 5 Jan 2015 10:48:56 -0800 (PST)
In-Reply-To: <54AADADB.6000400@invlim.com>
References: <1418862393-10691-1-git-send-email-dmorrison@invlim.com>
	<CAFEAcA9RHCGaGHk4zZWMa4BAWR0OV5sAxan3AjrR=G-NaiJ58g@mail.gmail.com>
	<54AADADB.6000400@invlim.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jan 2015 18:48:56 +0000
Message-ID: <CAFEAcA88qRievX1Ps4w4kotrRJefnvzXepcYpFnM6iRL-EaRYA@mail.gmail.com>
To: David Morrison <dmorrison@invlim.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.169
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Ethan Hunt <proljc@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-openrisc: bugfixes
 for debugging with GDB+Qemu on OpenRISC
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
X-List-Received-Date: Mon, 05 Jan 2015 18:49:23 -0000

On 5 January 2015 at 18:41, David Morrison <dmorrison@invlim.com> wrote:
> Hi, Peter,
>
> Thanks for the response.  I'll split out the changes into separate commits
> and resubmit.  I do have one question here:
>
>>
>>> diff --git a/target-openrisc/mmu.c b/target-openrisc/mmu.c
>>> index 750a936..bbd05f1 100644
>>> --- a/target-openrisc/mmu.c
>>> +++ b/target-openrisc/mmu.c
>>> @@ -219,7 +219,7 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs,
>>> vaddr addr)
>>>       hwaddr phys_addr;
>>>       int prot;
>>>
>>> -    if (cpu_openrisc_get_phys_addr(cpu, &phys_addr, &prot, addr, 0)) {
>>> +    if (cpu_openrisc_get_phys_nommu(cpu, &phys_addr, &prot, addr, 0)) {
>>
>>
>> This looks wrong -- we won't do the virtual-to-physical
>> translation on the addresses provided by the debugger if
>> we use the _nommu() function. You definitely need to be
>> doing a v-to-p translation here somehow.
>>
>
> I was similarly puzzled by this.  However, I've been comparing Qemu to
> or1ksim, which does not appear to do translation for the debugger

Well, it depends what semantics you want to define for the debug
stub. "Addresses are always physical addresses" isn't unreasonable
as a choice, but it's not what QEMU has picked -- we always use
virtual addresses if the MMU is enabled.

> Moreover, in Qemu if you perform the translation and use GDB to debug, it
> returns bogus values for the memory read, whereas not performing the
> translation appears to work correctly.

Are you trying to give gdb physical addresses? That isn't
the way we define the gdbstub to work: you need to give
it virtual addresses.

-- PMM

