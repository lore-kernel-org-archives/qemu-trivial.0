Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bJGAw-0000jG-45
	for mharc-qemu-trivial@gnu.org; Sat, 02 Jul 2016 04:21:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bJGAt-0000TO-S8
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 04:21:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1bJGAr-0003gc-Os
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 04:21:14 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:64972)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1bJGAm-0003di-Uy; Sat, 02 Jul 2016 04:21:09 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue002) with ESMTPSA (Nemesis) id 0Ls3eJ-1bSMj03d9z-013sYL;
	Sat, 02 Jul 2016 10:20:50 +0200
To: Peter Maydell <peter.maydell@linaro.org>, "Wirth, Allan"
	<awirth@akamai.com>
References: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
	<CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Timothy Pearson <tpearson@raptorengineering.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <164e58f5-7dcc-bc9f-286f-98b5de56c1cb@vivier.eu>
Date: Sat, 2 Jul 2016 10:20:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:2Du7QGfKpzfyZTPEt5UB5K2lBWfLZxbQ4V7UElxg4dr6vQ19Qu9
	BtyzbUaH/6287oF+NsZGcqhowQeTrKLPsAf48Wzv6+0Fy8MYikxtSZLtK+TDx5D4IG1apKs
	uio3mVPmyVF7T4G2NdiWVCKGnBMBujR69i3zI9EXR2XrZbxCQqHXGyfljCbF/TQAnGC7nyS
	Cle/e1OJvIEWhcJIdk3Xg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:74/fkn5nQ0k=:weE4A5OHaZoMJ0u1M72kI3
	r4Yr2UJDDibK5S77mkfgePAIDWUqYhzVkM4/Ao1yJOFVDHnvqOBVi2W4yLnKm7F2Te0Fc50Nd
	nY7o5Xl35kxcTiEa4qnv4vJ464h9zoEHUugfKHoz1SKNmeGcDaUzVRLA0wy6rYL8vothXe1SS
	wj8maXwSsZL+WCYHje8GSqqQWvNVMpdsjeB3Xo5DDf0bw0SNQrSNrgvAppEsKl0RWyBLZ7KAd
	frit4ogf6Eh7PJENKMisisdGKyyx0T8vpHN/184Yzgdu1bxpzmve5HlQ34qYoH7nyp1P2VMxA
	y6BqKBCnIcMEIUA4q7HQP9zPVg/JooNeeMrKnqCkF6yEQSUV1nLj2WU5Ws3+vjD44Rde7bYdZ
	ALpiXCqnwDkkwwgIJp4cRp89+XMMlPVDrZIxn9/O/dJF1QdVnyZ0yUla18Nqq2RPugrVF+2/I
	LLqRdPIhVtrGE7vb7ngKDipCjIx+uqJ53F5fWrQRj7tuVtAFrzomFqQmhskkjvfDlqRrpYMHf
	rIaNFo/w72hGqbeJCU9DAVO3zxFEleXJlf1kqnz6Z9rRQTkU3amRG+9Ax1iZwY/eZiklGtfy4
	0UOKD8Onyt9fJPFBYrgIG13T0W4fIUNV8JcCYLWi/+ydZ2ymsiYBhSuSqAJZfdYPB66CpUD99
	F6XaWV6DuFJEk3p8zel0Nd6sPqjRdXhJPVSqIaNzUhcEqa4QQazqMMihQyfwo8fCxZJ0EMOA/
	UwmkjUssABYWWZYI
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
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
X-List-Received-Date: Sat, 02 Jul 2016 08:21:17 -0000



Le 01/07/2016 à 15:35, Peter Maydell a écrit :
> On 1 July 2016 at 12:59, Wirth, Allan <awirth@akamai.com> wrote:
>> Linux on X86_64 does not use sel_arg_struct for select(), the args are
>> passed directly. This patch switches a define so X86_64 uses the correct
>> calling convention.
>>
>> Signed-off-by: Allan Wirth <awirth@akamai.com>
>> ---
>>  linux-user/syscall.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 8bf6205..209b2a7 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -8002,7 +8002,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>>          break;
>>  #if defined(TARGET_NR_select)
>>      case TARGET_NR_select:
>> -#if defined(TARGET_S390X) || defined(TARGET_ALPHA)
>> +#if defined(TARGET_S390X) || defined(TARGET_ALPHA) || defined(TARGET_X86_64)
>>          ret = do_select(arg1, arg2, arg3, arg4, arg5);
>>  #else
>>          {
> 
> There is a cleaner approach which we should use to fix this:
> see my comments in reply to this recent patch trying to do
> a similar thing:
> https://patchwork.kernel.org/patch/9185927/

syscall_nr.h are copies of unistd.h from kernel, so kernel uses also
__NR_select and __NR__newselect.

I think the fix can be as simple as:

--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8372,7 +8372,7 @@ abi_long do_syscall(void *cpu_env, int num,
abi_long arg1,
         break;
 #if defined(TARGET_NR_select)
     case TARGET_NR_select:
-#if defined(TARGET_S390X) || defined(TARGET_ALPHA)
+#if !defined(TARGET_NR__new_select)
         ret = do_select(arg1, arg2, arg3, arg4, arg5);
 #else
         {

Laurent

