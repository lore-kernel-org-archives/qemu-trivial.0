Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bLEgJ-00028E-KN
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jul 2016 15:09:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bLEgF-00025V-RU
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 15:09:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bLEgD-0001DU-6d
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 15:09:46 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:51890)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1bLEg5-0001C1-PY; Thu, 07 Jul 2016 15:09:38 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104) with ESMTPSA (Nemesis) id 0M6ETS-1bVcsW11WU-00yAu8;
	Thu, 07 Jul 2016 21:09:18 +0200
To: "Wirth, Allan" <awirth@akamai.com>, Riku Voipio <riku.voipio@iki.fi>,
	Peter Maydell <peter.maydell@linaro.org>
References: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
	<CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
	<164e58f5-7dcc-bc9f-286f-98b5de56c1cb@vivier.eu>
	<CAFEAcA9mk9Z=M+tahGE7JBiQ_zidqF1pj=13eLr0GcxHcSis3Q@mail.gmail.com>
	<cc5798cf-4e88-f1e7-f3ca-45482e0822bb@vivier.eu>
	<CAFEAcA976boeHjzyHMr_83cq+uezzBq=SCWePW-9780UAp=kHA@mail.gmail.com>
	<20160707184944.GA30964@beaming.home>
	<a5c0b701-1e1a-198e-359e-f78cf2d97065@vivier.eu>
	<9DF3E0FA-AEF0-479C-891A-B1280DF2808F@akamai.com>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Timothy Pearson <tpearson@raptorengineering.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3605d35f-bb1a-e1b8-86ca-13e72992011e@vivier.eu>
Date: Thu, 7 Jul 2016 21:09:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <9DF3E0FA-AEF0-479C-891A-B1280DF2808F@akamai.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:/AslCTybiAV8XyFW9Fjy43bB2w2QkwSjzwERqDXdsEoQguwGU1F
	fUAKKZP9J0R6yHHvXunTAVPgSwiLkyW1yJx7DYSRibtQZ2TmW1sDqwFvWQ53LzNcfG8cGlL
	dSta25oTr2PMf1HyeRrnAiiZU4YFW7QdK6NDUZRgjHBtaOA3zABUozqliZhHLFKt0QkppOO
	/hU7lkhWLNUAVAJHJZETw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Oran+64dNRk=:2kqu+0LwMvur5WXI9CjYbg
	j/EeLjub6gkcwSw/5ZmS3lALQBYReBW2nXzigP7siNS7n+vPp6oja8w42zN9IZ2kI40tJMXX9
	IuhFirBvtxWRd63dbg9u5unC8U6A7t3JwDEKxNMfxhkYajZ/900B+1R0Cu0eVcOKo+esOhrn7
	cMsOaJGfBDSyM2cSZaQ+zfcItSlJ7WnkMoD8GefuSfloHhC3cZj32vF9ZA7cq7JCYWGRcAFLe
	Xk0LOyL43qLtd2b0zbeniJr+zRK2r1pOJr0JCkPQWEFZ0NcKryGRMH9jE52J15dfLfDphsNNT
	9KoFWegmJr0IVewxrU368sMhuM3Ckn4LS2mfeHc+z7oJOAaDdAjs6eRxrAzx1h9EvjvbKlIPw
	xxaLWCIf7d/iRQhuvvWrBv+yvRFqGEeCTE/38mCEjGwsQ/cgPga9qYKtC+ZWDhTD4Ig3XdT66
	4aiqxgMAPvLIk1FYco8x6NV5UlCx7iG0Smpv0EiGYVaD105SDRaks3gG/qk3l8eZMSyGL11HP
	x6ZTJhp5HZOqkj8ltpPT7NBPs9s4MFTZN5XWGCNNGiKpD30JCmXR62lOXYKFCsR9hyEwCV9WG
	Q6RpYLp24rUcE1A4Z3TMJO1IWAUWqj369fOAcLy/tg3xa0MfiW9/+SaWw3Wo39O3d9jZcC02m
	yJMk52hjzoZC/9lIvqbdjSjVVjNyraui+iRES4ssM5eAdupGY5LoJqoQcEpi+rnl/+MQisD30
	gutKXR8QEYJHtDsj
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
X-List-Received-Date: Thu, 07 Jul 2016 19:09:51 -0000



Le 07/07/2016 à 21:04, Wirth, Allan a écrit :
> 
> 
> On 7/7/16, 3:02 PM, "Laurent Vivier" <laurent@vivier.eu> wrote:
> 
>>
>>
>> Le 07/07/2016 à 20:49, Riku Voipio a écrit :
>>> On Sat, Jul 02, 2016 at 09:12:09PM +0100, Peter Maydell wrote:
>>>> On 2 July 2016 at 17:41, Laurent Vivier <laurent@vivier.eu> wrote:
>>>>> Sadly, this can't work:
>>>>>
>>>>> sparc/sparc64/cris use sys_select for NR_select AND NR_newselect.
>>>>
>>>>> Not sure all is correct, but it's what I've found:
>>>>>
>>>>>             | __NR_select    | __NR__newselect
>>>>> ------------+----------------+-----------------+
>>>>> arm         | sys_old_select | sys_select      |
>>>>> ------------+----------------+-----------------+
>>>>> aarch64     | sys_select     |        -        |
>>>>> ------------+----------------+-----------------+
>>>>> alpha       | sys_select     |        -        |
>>>>> ------------+----------------+-----------------+
>>>>> cris        | sys_select     | sys_select      |
>>>>> ------------+----------------+-----------------+
>>>>> m68k        | sys_old_select | sys_select      |
>>>>> ------------+----------------+-----------------+
>>>>> microblaze  | sys_old_select | sys_select      |
>>>>> ------------+----------------+-----------------+
>>>>> mips        | sys_old_select | sys_select      |
>>>>> ------------+----------------+-----------------+
>>>>> mips64      | sys_select     |        -        |
>>>>> ------------+----------------+-----------------+
>>>>> openrisc    | sys_select     |        -        |
>>>>> ------------+----------------+-----------------+
>>>>> ppc         | sys_old_select | sys_select      |
>>>>> ------------+----------------+-----------------+
>>>>> s390x       | sys_select     |        -        |
>>>>> ------------+----------------+-----------------+
>>>>> sh4         | sys_old_select | sys_select      |
>>>>> ------------+----------------+-----------------+
>>>>> sparc       | sys_select     | sys_select      |
>>>>> ------------+----------------+-----------------+
>>>>> sparc64     | sys_select     | sys_select      |
>>>>> ------------+----------------+-----------------+
>>>>> tilegx      | sys_select     |        -        |
>>>>> ------------+----------------+-----------------+
>>>>> unicore32   | sys_select     |        -        |
>>>>> ------------+----------------+-----------------+
>>>>> x86_64      | sys_select     |        -        |
>>>>> ------------+----------------+-----------------+
>>>>> i386        | sys_old_select | sys_select      |
>>>>> ------------+----------------+-----------------+
>>>>
>>>> Hmm. Looking at current Linux git master, I get
>>>> slightly different results. The only architectures which
>>>> define __ARCH_WANT_SYS_OLD_SELECT are:
>>>>  arm, m68k, mn10300, x86
>>>> and no others use sys_old_select.
>>>>
>>>> So I think we have the following behaviours:
>>>>
>>>> (1) Define neither NR_select nor NR__newselect
>>>>  (and use pselect6 syscall for select):
>>>>  aarch64, openrisc, tilegx, unicore32, presumably any future arch
>>>>
>>>> (2) only define NR__newselect, it is new select:
>>>>  mips, mips64, sh, s390
>>>>
>>>> (3) Only define NR_select, want that to be new select:
>>>>  alpha, x86_64, s390x
>>>>
>>>> (4) NR__newselect is new select, NR_select is old_select:
>>>>  i386, m68k, arm if kernel is not CONFIG_AEABI
>>>>
>>>> (5) NR__newselect is new select, NR_select is defined but
>>>>  if called returns ENOSYS:
>>>>  microblaze, arm if CONFIG_AEABI, ppc64
>>>>
>>>> (6) NR__newselect is new select, NR_select is a bonkers custom
>>>>  thing that tries to autodetect the calling convention:
>>>> http://lxr.free-electrons.com/source/arch/powerpc/kernel/syscalls.c#L86
>>>>  ppc32 (but only native 32-bit; 32-bit compat support
>>>>  on a ppc64 kernel is category 5, so I vote for ignoring
>>>>  this weirdness and calling ppc category 5)
>>>>
>>>> (7) NR_select and NR__newselect are different numbers
>>>>  but both are new select:
>>>>  cris, sparc, sparc64
>>>>
>>>> which is a pretty confusing mess, but I think it equates to:
>>>> (0) if defined, NR__newselect is always new select
>>>> (1) if NR_select is defined, the choices are:
>>>>  (a) NR_select is old_select:
>>>>    i386, m68k, arm
>>>>  (b) NR_select is defined but should ENOSYS:
>>>>    microblaze, ppc
>>>>  (c) NR_select defined and is new select:
>>>>    everything else (alpha, x86-64, s390x, cris, sparc, sparc64)
>>>>
>>>> and I think we should handle that by having the code in syscall.c
>>>> be something like:
>>>>
>>>> #ifdef TARGET_NR_select
>>>>     case TARGET_NR_select:
>>>> #if defined(TARGET_WANT_NI_OLD_SELECT)
>>>>         /* some architectures used to have old_select here
>>>>          * but now ENOSYS it.
>>>>          */
>>>>         ret = -TARGET_ENOSYS;
>>>>         break;
>>>> #elif defined(TARGET_WANT_OLD_SYS_SELECT)
>>>>         /* code for old select here; maybe factored out to
>>>>          * its own function: ret = do_old_select() ?
>>>>          */
>>>> #else
>>>>         /* select is new style select */
>>>>         ret = do_select(...);
>>>> #endif
>>>> #endif
>>>
>>> I agree, this seems to be the best way to fix select properly.
>>
>> Ok, if no one is already working on that, I'm going to send a patch
>> according to Peter's comments.
>>
>> Laurent
> 
> I was hoping to, but I do not think that I will get around to it anytime soon.

If I provide a patch, could you test it for your test case?

Thanks,
Laurent

