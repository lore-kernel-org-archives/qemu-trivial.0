Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bJNzp-0004rh-Sa
	for mharc-qemu-trivial@gnu.org; Sat, 02 Jul 2016 12:42:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bJNzn-0004qH-50
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 12:42:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bJNzj-0006QG-0o
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 12:42:18 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:57758)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1bJNzi-0006Q0-J7; Sat, 02 Jul 2016 12:42:14 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue103) with ESMTPSA (Nemesis) id 0MaU9p-1b3dSX43M9-00K7pR;
	Sat, 02 Jul 2016 18:41:57 +0200
To: Peter Maydell <peter.maydell@linaro.org>
References: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
	<CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
	<164e58f5-7dcc-bc9f-286f-98b5de56c1cb@vivier.eu>
	<CAFEAcA9mk9Z=M+tahGE7JBiQ_zidqF1pj=13eLr0GcxHcSis3Q@mail.gmail.com>
Cc: "Wirth, Allan" <awirth@akamai.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Timothy Pearson <tpearson@raptorengineering.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cc5798cf-4e88-f1e7-f3ca-45482e0822bb@vivier.eu>
Date: Sat, 2 Jul 2016 18:41:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9mk9Z=M+tahGE7JBiQ_zidqF1pj=13eLr0GcxHcSis3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:F0UFZNyIrY92wLSfmK0HgF+ZCf9KHwx4epmK5ZOSHbEWCGpThye
	SC9eVTDl1cIsSOQ8HatEVecbrDzWlUzG1WxQCszp8fgk4RyVLKRVuX4b8yDGGZC38iEL9NJ
	D2wpuFNctoq1DcOsFWLPDvB4Dg+KPCwGsi11zmnTY2IiAS4CDuUE2ZcZLEVs4uAz+u/a0sX
	lcR8/YfzDHCoJ5OUBLohA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:zJ3S3H9kP0w=:HH8SjRlJwtK65+mTPk7vVA
	5xb4JHI98J5+xy/xhv4uRRoa5oSL6KkigDLYWFVmy62SNRWqVjsOWTAeRrFcYUBsv8uxKlj1D
	Pdvzo60Rdi/8MKwXL0vUv3nmLI0b6NMBNu0gWybSypT1UpLJkRXX2gOwuP+H9zPbfL2z2HLPz
	oB9smBXDcGYIXTvhdjJQ94g4Qpend1+f31eTOs+KV3FgaO+JbQaQj8jUTeumKpjYgZDEamMYZ
	Q3me3/XR2gPj3SpTPmOKJbTSb1k96ImkZJpFQ5PN9xrRceIX6WoSfcHEEWhbw/jEF+KRV2O1d
	+1GmvhVBsEktNrkvZJk/gAd+xFIjiPNYJbHHaC6SL++F9jW9wDtvKz0YS6K9mQScSxuahGaLK
	JaqnW5RpncFwxTpQEY41pEjX8xkZO9iic4Q1Y7aml7gcf1m9AHTgoVUip64Y0rDFa6EupfHHS
	6pzWy/V8myWaDWeicKolTzCVd06P0OHSwFOU8e6SYUX8HcPIWeyXXTU5ht+0yuOmvka31O7EK
	I1jRRv5wIyZfdo+w8FSPiTB1jgNCMCmxdJkPsHsi7eO6MiMMXhj1AcOAZ8h/SZjU9wcBw6vxY
	y/y7Lvn6pupgAnP7+rAk3ok84CURC4lhXxHxdBxp+ZVwLPsE7lVmMs7kKtbIUBklqbUNbRopS
	0Q5v1KZ8Lbhxm2bNXG6yv5a//2VdICy9LxcZZs9ZVj0mTBb5OEgBE5GOxKQwv+7UTJSJkDIrh
	SPKfbRw7Txixbuyu
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
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
X-List-Received-Date: Sat, 02 Jul 2016 16:42:20 -0000



Le 02/07/2016 à 11:56, Peter Maydell a écrit :
> On 2 July 2016 at 09:20, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>>
>> Le 01/07/2016 à 15:35, Peter Maydell a écrit :
>>> On 1 July 2016 at 12:59, Wirth, Allan <awirth@akamai.com> wrote:
>>>> Linux on X86_64 does not use sel_arg_struct for select(), the args are
>>>> passed directly. This patch switches a define so X86_64 uses the correct
>>>> calling convention.
>>>>
>>>> Signed-off-by: Allan Wirth <awirth@akamai.com>
>>>> ---
>>>>  linux-user/syscall.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>>> index 8bf6205..209b2a7 100644
>>>> --- a/linux-user/syscall.c
>>>> +++ b/linux-user/syscall.c
>>>> @@ -8002,7 +8002,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>>>>          break;
>>>>  #if defined(TARGET_NR_select)
>>>>      case TARGET_NR_select:
>>>> -#if defined(TARGET_S390X) || defined(TARGET_ALPHA)
>>>> +#if defined(TARGET_S390X) || defined(TARGET_ALPHA) || defined(TARGET_X86_64)
>>>>          ret = do_select(arg1, arg2, arg3, arg4, arg5);
>>>>  #else
>>>>          {
>>>
>>> There is a cleaner approach which we should use to fix this:
>>> see my comments in reply to this recent patch trying to do
>>> a similar thing:
>>> https://patchwork.kernel.org/patch/9185927/
>>
>> syscall_nr.h are copies of unistd.h from kernel, so kernel uses also
>> __NR_select and __NR__newselect.
> 
> Ugh, this is complicated. The syscall functions are sys_oldselect
> and sys_select, but the syscall numbers are __NR_select and
> __NR__newselect, and I'm not sure all the architectures are
> using them consistently. For instance alpha in the kernel has
> syscall 358 as __NR_select, but the syscall table directs it
> to sys_select(), not sys_oldselect().
> 
>> I think the fix can be as simple as:
>>
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -8372,7 +8372,7 @@ abi_long do_syscall(void *cpu_env, int num,
>> abi_long arg1,
>>          break;
>>  #if defined(TARGET_NR_select)
>>      case TARGET_NR_select:
>> -#if defined(TARGET_S390X) || defined(TARGET_ALPHA)
>> +#if !defined(TARGET_NR__new_select)
>>          ret = do_select(arg1, arg2, arg3, arg4, arg5);
>>  #else
>>          {
> 
> This looks promising but I guess we need to fish through
> all the kernel architectures comparing their syscall numbers
> and which functions they dispatch to in their syscall tables.

Sadly, this can't work:

sparc/sparc64/cris use sys_select for NR_select AND NR_newselect.

Not sure all is correct, but it's what I've found:

            | __NR_select    | __NR__newselect
------------+----------------+-----------------+
arm         | sys_old_select | sys_select      |
------------+----------------+-----------------+
aarch64     | sys_select     |        -        |
------------+----------------+-----------------+
alpha       | sys_select     |        -        |
------------+----------------+-----------------+
cris        | sys_select     | sys_select      |
------------+----------------+-----------------+
m68k        | sys_old_select | sys_select      |
------------+----------------+-----------------+
microblaze  | sys_old_select | sys_select      |
------------+----------------+-----------------+
mips        | sys_old_select | sys_select      |
------------+----------------+-----------------+
mips64      | sys_select     |        -        |
------------+----------------+-----------------+
openrisc    | sys_select     |        -        |
------------+----------------+-----------------+
ppc         | sys_old_select | sys_select      |
------------+----------------+-----------------+
s390x       | sys_select     |        -        |
------------+----------------+-----------------+
sh4         | sys_old_select | sys_select      |
------------+----------------+-----------------+
sparc       | sys_select     | sys_select      |
------------+----------------+-----------------+
sparc64     | sys_select     | sys_select      |
------------+----------------+-----------------+
tilegx      | sys_select     |        -        |
------------+----------------+-----------------+
unicore32   | sys_select     |        -        |
------------+----------------+-----------------+
x86_64      | sys_select     |        -        |
------------+----------------+-----------------+
i386        | sys_old_select | sys_select      |
------------+----------------+-----------------+

Laurent

