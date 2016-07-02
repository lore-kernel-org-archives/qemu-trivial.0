Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bJHf6-0001dq-Fi
	for mharc-qemu-trivial@gnu.org; Sat, 02 Jul 2016 05:56:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJHf4-0001a5-8i
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 05:56:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJHf2-00067Z-4r
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 05:56:29 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:34253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJHf1-00067J-Kh
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 05:56:28 -0400
Received: by mail-vk0-x234.google.com with SMTP id c2so181507389vkg.1
	for <qemu-trivial@nongnu.org>; Sat, 02 Jul 2016 02:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qj6ZQQkisvKUGQOgoiDyc48KLABZpF8CkvMaGhfTPVQ=;
	b=Vbw98/3BdlG3NfTi0bR89MZUqVwFRs+LeslhY3DMBOLPxEXchcV9wt1dNrzXvIgCDB
	ZB6Y0RA7EiO5nVYHaZbc+YPacTaOfI0s7aLbSjh04pjRuTxdJg/TxtpTHHsTtPyR1ty6
	JYJUTbnt0pbffpPnbKrYgstWvNFn7dc8FQiSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qj6ZQQkisvKUGQOgoiDyc48KLABZpF8CkvMaGhfTPVQ=;
	b=TnK82sPbjeuOHWeSRVbECNgKt/HpFWgkZ9qiSrxI+tvLqZFpRa7j++7unzvsaJm6P2
	6qxuu50l5mZOeOf8e4d5PUu08TrKbQm6pt9hNQfL8adhDqVvWfsWWlpayu2dIb+qyRcc
	W7RPJY22U+OuWMtpuahdGc08hY0okrTy5FiKEkQy5v0Oisk55/L4XOghlYO5lDvTYQeA
	WdI0O6YTn9MTgbvPjcCHmPfmd3afQ+uFAxFTW2Fmv4isJMo0wvExsDMghnD5/InwH6/1
	q05RgJyj6Xz8IeqhaXe7wqFX4jlwtNjLWy63VoUoVkb44ZgBhj+QvlkLpgzySe2sBZ52
	qKqw==
X-Gm-Message-State: ALyK8tKH3V/wnPIz/943+KizygR41OGj2oKQm8IcYcDYNY8rTV1TPgAtGdfIBEn4cdvKYt11Q45s0Y2MlV22aJOV
X-Received: by 10.31.109.197 with SMTP id i188mr1133518vkc.157.1467453387040; 
	Sat, 02 Jul 2016 02:56:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Sat, 2 Jul 2016 02:56:07 -0700 (PDT)
In-Reply-To: <164e58f5-7dcc-bc9f-286f-98b5de56c1cb@vivier.eu>
References: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
	<CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
	<164e58f5-7dcc-bc9f-286f-98b5de56c1cb@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Jul 2016 10:56:07 +0100
Message-ID: <CAFEAcA9mk9Z=M+tahGE7JBiQ_zidqF1pj=13eLr0GcxHcSis3Q@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: "Wirth, Allan" <awirth@akamai.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, 
	Riku Voipio <riku.voipio@iki.fi>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	Timothy Pearson <tpearson@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
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
X-List-Received-Date: Sat, 02 Jul 2016 09:56:31 -0000

On 2 July 2016 at 09:20, Laurent Vivier <laurent@vivier.eu> wrote:
>
>
> Le 01/07/2016 =C3=A0 15:35, Peter Maydell a =C3=A9crit :
>> On 1 July 2016 at 12:59, Wirth, Allan <awirth@akamai.com> wrote:
>>> Linux on X86_64 does not use sel_arg_struct for select(), the args are
>>> passed directly. This patch switches a define so X86_64 uses the correc=
t
>>> calling convention.
>>>
>>> Signed-off-by: Allan Wirth <awirth@akamai.com>
>>> ---
>>>  linux-user/syscall.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index 8bf6205..209b2a7 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -8002,7 +8002,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_l=
ong arg1,
>>>          break;
>>>  #if defined(TARGET_NR_select)
>>>      case TARGET_NR_select:
>>> -#if defined(TARGET_S390X) || defined(TARGET_ALPHA)
>>> +#if defined(TARGET_S390X) || defined(TARGET_ALPHA) || defined(TARGET_X=
86_64)
>>>          ret =3D do_select(arg1, arg2, arg3, arg4, arg5);
>>>  #else
>>>          {
>>
>> There is a cleaner approach which we should use to fix this:
>> see my comments in reply to this recent patch trying to do
>> a similar thing:
>> https://patchwork.kernel.org/patch/9185927/
>
> syscall_nr.h are copies of unistd.h from kernel, so kernel uses also
> __NR_select and __NR__newselect.

Ugh, this is complicated. The syscall functions are sys_oldselect
and sys_select, but the syscall numbers are __NR_select and
__NR__newselect, and I'm not sure all the architectures are
using them consistently. For instance alpha in the kernel has
syscall 358 as __NR_select, but the syscall table directs it
to sys_select(), not sys_oldselect().

> I think the fix can be as simple as:
>
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8372,7 +8372,7 @@ abi_long do_syscall(void *cpu_env, int num,
> abi_long arg1,
>          break;
>  #if defined(TARGET_NR_select)
>      case TARGET_NR_select:
> -#if defined(TARGET_S390X) || defined(TARGET_ALPHA)
> +#if !defined(TARGET_NR__new_select)
>          ret =3D do_select(arg1, arg2, arg3, arg4, arg5);
>  #else
>          {

This looks promising but I guess we need to fish through
all the kernel architectures comparing their syscall numbers
and which functions they dispatch to in their syscall tables.

thanks
-- PMM

