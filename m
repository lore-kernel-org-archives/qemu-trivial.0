Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WyKf4-0008Bl-Of
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jun 2014 08:44:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyKey-00083t-Kj
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 08:44:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WyKet-0002GY-LG
	for qemu-trivial@nongnu.org; Sat, 21 Jun 2014 08:44:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WyKei-0002Dk-VO; Sat, 21 Jun 2014 08:44:29 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 59D7943761;
	Sat, 21 Jun 2014 16:44:22 +0400 (MSK)
Message-ID: <53A57E26.2090705@msgid.tls.msk.ru>
Date: Sat, 21 Jun 2014 16:44:22 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, 
	Hunter Laux <hunterlaux@gmail.com>
References: <1403255644-16868-1-git-send-email-hunterlaux@gmail.com>
	<CAFEAcA_vy==mgFDUo6AMpUc_PZoZ8G=r8=ZLe1f0sGWCDhM_5Q@mail.gmail.com>
In-Reply-To: <CAFEAcA_vy==mgFDUo6AMpUc_PZoZ8G=r8=ZLe1f0sGWCDhM_5Q@mail.gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add support for the arm
 breakpoint syscall.
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
X-List-Received-Date: Sat, 21 Jun 2014 12:44:49 -0000

20.06.2014 13:51, Peter Maydell =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> [cc'ing Riku as the linux-user maintainer.]
>=20
> On 20 June 2014 10:14, Hunter Laux <hunterlaux@gmail.com> wrote:
>=20
> Thanks for writing this patch. It mostly looks good
> but there are some minor admin/format tweaks we need.
>=20
> You need to provide a Signed-off-by: line here, or
> we can't take this patch, I'm afraid. (We work the same
> way as the Linux kernel for this; see
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/SubmittingPatches?id=3Df6f94e2ab1b33f0082ac22d71f66385a60d8157=
f#n297
> for more details, but basically it says you wrote the code
> and are willing to contribute it under our licensing terms.)
>=20
> It could also use a little more explanation in the commit
> message.
>=20
> FWIW, this is an obscure syscall that dates back to before
> the architecture provided an official breakpoint instruction;
> apparently it's still used by Steel Bank Common Lisp.
>=20
> This is the kernel implementation:
> http://lxr.free-electrons.com/source/arch/arm/kernel/traps.c#L598
>=20
>> ---
>>  linux-user/arm/syscall.h | 1 +
>>  linux-user/main.c        | 4 ++++
>>  2 files changed, 5 insertions(+)
>>
>> diff --git a/linux-user/arm/syscall.h b/linux-user/arm/syscall.h
>> index ce2c2a8..e0d2cc3 100644
>> --- a/linux-user/arm/syscall.h
>> +++ b/linux-user/arm/syscall.h
>> @@ -29,6 +29,7 @@ struct target_pt_regs {
>>  #define ARM_THUMB_SYSCALL      0
>>
>>  #define ARM_NR_BASE      0xf0000
>> +#define ARM_NR_breakpoint (ARM_NR_BASE + 1)
>>  #define ARM_NR_cacheflush (ARM_NR_BASE + 2)
>>  #define ARM_NR_set_tls   (ARM_NR_BASE + 5)
>>
>> diff --git a/linux-user/main.c b/linux-user/main.c
>> index a87c6f7..831b363 100644
>> --- a/linux-user/main.c
>> +++ b/linux-user/main.c
>> @@ -807,6 +807,9 @@ void cpu_loop(CPUARMState *env)
>>                              cpu_set_tls(env, env->regs[0]);
>>                              env->regs[0] =3D 0;
>>                              break;
>> +                        case ARM_NR_breakpoint:
>> +                            env->regs[15] -=3D env->thumb ? 2 : 4;
>> +                            goto excp_debug;
>>                          default:
>>                              gemu_log("qemu: Unsupported ARM syscall: =
0x%x\n",
>>                                       n);
>> @@ -850,6 +853,7 @@ void cpu_loop(CPUARMState *env)
>>              }
>>              break;
>>          case EXCP_DEBUG:
>> +            excp_debug:
>=20
> The indent on this label isn't quite right; it should
> be 4 columns to the left.

Isn't whole thing - using label and goto like this, intermixing
two switch statements with goto - a bit flawed?  At best it makes
the code unclean...

>>              {
>>                  int sig;
>=20
> Those minor issues aside, the code looks right to me.

There was another submission of the same patch, but with
a S-o-b line.

Thanks,

/mjt

