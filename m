Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bJSIv-00089m-Jz
	for mharc-qemu-trivial@gnu.org; Sat, 02 Jul 2016 17:18:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bJSIs-00089f-QC
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 17:18:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bJSIo-0005xh-IZ
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 17:18:17 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:64295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1bJSIo-0005xd-8A; Sat, 02 Jul 2016 17:18:14 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue103) with ESMTPSA (Nemesis) id 0LkjTw-1btt2h38pY-00aZFs;
	Sat, 02 Jul 2016 23:17:52 +0200
To: Peter Maydell <peter.maydell@linaro.org>
References: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
	<CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
	<164e58f5-7dcc-bc9f-286f-98b5de56c1cb@vivier.eu>
	<CAFEAcA9mk9Z=M+tahGE7JBiQ_zidqF1pj=13eLr0GcxHcSis3Q@mail.gmail.com>
	<cc5798cf-4e88-f1e7-f3ca-45482e0822bb@vivier.eu>
	<CAFEAcA976boeHjzyHMr_83cq+uezzBq=SCWePW-9780UAp=kHA@mail.gmail.com>
Cc: "Wirth, Allan" <awirth@akamai.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Timothy Pearson <tpearson@raptorengineering.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <caf50e5d-791a-4ed2-0af1-54f96df35ae8@vivier.eu>
Date: Sat, 2 Jul 2016 23:17:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA976boeHjzyHMr_83cq+uezzBq=SCWePW-9780UAp=kHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:9vXTMP7pK/fQkFWt5WQJn3UGBSPVbQZmWvMB+OukzKRQ6vhmB9H
	WfsNp3/2z3muI9Z1Ymdkxu7eVpGL/aAxwCDNygQy/PC1+x5xrn8qJEkMlgadvFXuuvmymg+
	CxEyHFvBskTTTd1HEdZKCsXrbTFzOagErnezWKaSWFYNZx6JKFUALt5hh0ef/gfNNke3JoR
	e01E+Yold4AWYbm+kbbKw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:p13iIhbwFps=:f7t+5RHSdOkGKXvCJqLPyq
	+qvc++C9NcrVOxuFS4SBmHEdmPvA5M0g+IY0a4kAgzjSEBc0comz0vanM3otu6P4Uq+UnJjc5
	jsLEejk8jLgs4Q58w/5Q5AmOymuyBGjRwP+rs0qwJQG5uGiWttIbeiaESYK+rQJS+YXufTaZz
	URkA4SVsOuem+tWcTvTIDrMr7pbEctWsfAnk9sioLJiiSiyvOgpSmBjewhVJGpaX6pN9Hz+2a
	UDHH3PhTWS+eg0vYAfuuO7Hlhv0zFvFhGXWuydS7ox0ROVGZK4+F0TO85PQ2BLaL2yUaSgZgo
	3GeYR/fJ2ZPK98n4CUEmoAP5mI1b4rR4Y9+H/Rv0ajcRXC+V33DwYKN8odCHjlUDaujXUZyYF
	tzRQEHHuszQDAY1f5B3V/boyw1mCn6k25/3vwOVPH4eVjUUzGOMJgELg36wI6/EBS0szWxeKX
	lW73p2RMicBqUgVNxX/o2uANJLbTMoRXxDStbVX4IdymA2dNtOHYhDoxYNMAzCWG6HIiqxANe
	IfqbrbR63L6rSa9ns0ShLgbADutadd8jX39qJAXg/q+z3PoKFtRj4iKxffJL5fkIQLSjg+mZo
	fLHxH6vj8qbNwJvUHh+c1h4chyX3Ylety2RLSODdFXc0MWf2XwKBllmxnsp+DIL901ZDQEuli
	hqG9PDUbay8zAK292s4zTn/nyNur7Sf/fkVBgW55Yqi6yIJxQ9n2JBBt8YwCNwy4oeh+JltWO
	s1iKg1fILMAWpkxv
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: fix signal()
 syscall on x86_64
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
X-List-Received-Date: Sat, 02 Jul 2016 21:18:20 -0000



Le 02/07/2016 à 22:12, Peter Maydell a écrit :
> On 2 July 2016 at 17:41, Laurent Vivier <laurent@vivier.eu> wrote:
>> Sadly, this can't work:
>>
>> sparc/sparc64/cris use sys_select for NR_select AND NR_newselect.
> 
>> Not sure all is correct, but it's what I've found:
>>
>>             | __NR_select    | __NR__newselect
>> ------------+----------------+-----------------+
>> arm         | sys_old_select | sys_select      |
>> ------------+----------------+-----------------+
>> aarch64     | sys_select     |        -        |
>> ------------+----------------+-----------------+
>> alpha       | sys_select     |        -        |
>> ------------+----------------+-----------------+
>> cris        | sys_select     | sys_select      |
>> ------------+----------------+-----------------+
>> m68k        | sys_old_select | sys_select      |
>> ------------+----------------+-----------------+
>> microblaze  | sys_old_select | sys_select      |
>> ------------+----------------+-----------------+
>> mips        | sys_old_select | sys_select      |
>> ------------+----------------+-----------------+
>> mips64      | sys_select     |        -        |
>> ------------+----------------+-----------------+
>> openrisc    | sys_select     |        -        |
>> ------------+----------------+-----------------+
>> ppc         | sys_old_select | sys_select      |
>> ------------+----------------+-----------------+
>> s390x       | sys_select     |        -        |
>> ------------+----------------+-----------------+
>> sh4         | sys_old_select | sys_select      |
>> ------------+----------------+-----------------+
>> sparc       | sys_select     | sys_select      |
>> ------------+----------------+-----------------+
>> sparc64     | sys_select     | sys_select      |
>> ------------+----------------+-----------------+
>> tilegx      | sys_select     |        -        |
>> ------------+----------------+-----------------+
>> unicore32   | sys_select     |        -        |
>> ------------+----------------+-----------------+
>> x86_64      | sys_select     |        -        |
>> ------------+----------------+-----------------+
>> i386        | sys_old_select | sys_select      |
>> ------------+----------------+-----------------+
> 
> Hmm. Looking at current Linux git master, I get
> slightly different results. The only architectures which
> define __ARCH_WANT_SYS_OLD_SELECT are:

Where is defined this __ARCH_WANT_SYS_OLD_SELECT?

>  arm, m68k, mn10300, x86
> and no others use sys_old_select.

You're right, NR_select is sys_ni_syscall for:

microblaze, mips32, sh4, ppc64

arch/microblaze/kernel/syscall_table.S:	.long sys_ni_syscall		/*
old_select */
arch/mips/kernel/scall32-o32.S:	PTR	sys_ni_syscall			/* old_select */
arch/sh/kernel/syscalls_32.S:	.long sys_ni_syscall	/* sys_oldselect */
arch/pwoerpc/include/asm/systbl.h:SYSX(sys_ni_syscall,sys_ni_syscall,ppc_select)

but I have supposed that it was set to sys_old_select for older kernel.
[but in 1.3.48, it is already sys_ni_syscall for mips... so we must
really manage that as ENOSYS)

In x86, old_select is used for the 32bit version, not for the 64bit:

entry/syscalls/syscall_32.tbl

82      i386    select                  sys_old_select
compat_sys_old_select


> So I think we have the following behaviours:
> 
> (1) Define neither NR_select nor NR__newselect
>  (and use pselect6 syscall for select):
>  aarch64, openrisc, tilegx, unicore32, presumably any future arch

They use:

kernel/sys.c:

#undef __SYSCALL
#define __SYSCALL(nr, call) [nr] = (call),

void *sys_call_table[__NR_syscalls] = {
#include <asm/unistd.h>
};

It's not very clear, but I think they use NR_select with sys_select:

include/uapi/asm-generic/unistd.h

#define __ARCH_WANT_SYS_SELECT
__SYSCALL(__NR_select, sys_select)

> (2) only define NR__newselect, it is new select:
>  mips, mips64, sh, s390
> 
> (3) Only define NR_select, want that to be new select:
>  alpha, x86_64, s390x
> 
> (4) NR__newselect is new select, NR_select is old_select:
>  i386, m68k, arm if kernel is not CONFIG_AEABI
> 
> (5) NR__newselect is new select, NR_select is defined but
>  if called returns ENOSYS:
>  microblaze, arm if CONFIG_AEABI, ppc64
> 
> (6) NR__newselect is new select, NR_select is a bonkers custom
>  thing that tries to autodetect the calling convention:
> http://lxr.free-electrons.com/source/arch/powerpc/kernel/syscalls.c#L86
>  ppc32 (but only native 32-bit; 32-bit compat support
>  on a ppc64 kernel is category 5, so I vote for ignoring
>  this weirdness and calling ppc category 5)
> 
> (7) NR_select and NR__newselect are different numbers
>  but both are new select:
>  cris, sparc, sparc64
> 
> which is a pretty confusing mess, but I think it equates to:
> (0) if defined, NR__newselect is always new select
> (1) if NR_select is defined, the choices are:
>  (a) NR_select is old_select:
>    i386, m68k, arm
>  (b) NR_select is defined but should ENOSYS:
>    microblaze, ppc
>  (c) NR_select defined and is new select:
>    everything else (alpha, x86-64, s390x, cris, sparc, sparc64)
> 
> and I think we should handle that by having the code in syscall.c
> be something like:
> 
> #ifdef TARGET_NR_select
>     case TARGET_NR_select:
> #if defined(TARGET_WANT_NI_OLD_SELECT)
>         /* some architectures used to have old_select here
>          * but now ENOSYS it.
>          */
>         ret = -TARGET_ENOSYS;
>         break;
> #elif defined(TARGET_WANT_OLD_SYS_SELECT)
>         /* code for old select here; maybe factored out to
>          * its own function: ret = do_old_select() ?
>          */
> #else
>         /* select is new style select */
>         ret = do_select(...);
> #endif
> #endif
> 
> where TARGET_WANT_NI_OLD_SELECT and
> TARGET_WANT_OLD_SYS_SELECT are #defined in
> linux-user/$(ARCH)/target_syscall.h by those
> architectures that need that behaviour
> (microblaze, ppc for the first; i386, m68k, arm
> for the second).
> We could just not define TARGET_NR_select for
> microblaze and ppc, of course, but that might
> be confusing and easily accidentally reverted.
> 
> For openrisc, sh and tilegx we incorrectly define
> a TARGET_NR_select which the kernel doesn't, so
> we should delete that from our headers.

I think they really exist (from asm-generic/unistd.h)

> I think overall that produces a reasonable separation
> of "what behaviour does my architecture want" from
> the implementation of the various behaviours, and
> means the default will be correct for any architectures
> we add later (only the oddball legacy cases need
> to request special behaviour).

I agree.

Thanks,
Laurent

