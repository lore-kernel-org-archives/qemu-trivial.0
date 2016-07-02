Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bJSLo-0002yQ-Tk
	for mharc-qemu-trivial@gnu.org; Sat, 02 Jul 2016 17:21:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJSLm-0002u5-DD
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 17:21:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJSLk-0006QL-F9
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 17:21:17 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:35060)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJSLj-0006Q7-VP
	for qemu-trivial@nongnu.org; Sat, 02 Jul 2016 17:21:16 -0400
Received: by mail-vk0-x22e.google.com with SMTP id i63so22715695vkb.2
	for <qemu-trivial@nongnu.org>; Sat, 02 Jul 2016 14:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=gvH1RCoAqNxKQbvS2rgR0SahU+edeR2KEqUNrqwIqbk=;
	b=CkKNj5giAskiR/d8URFxVvgRJYTKvD9FHyWRlVEi/VjJ1t7O6KpR3NgldofTJiarsJ
	1jcJ/bunIXGZ7qcWmrUw3xBIMO5v/8i1DaW8kpow708hZbSKDqguuUdeYWe6ds88KfwX
	be+Y9zCvZfUYAz3Kz1HgVzGisp8AP4x2jw8zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gvH1RCoAqNxKQbvS2rgR0SahU+edeR2KEqUNrqwIqbk=;
	b=BX6B9Ep29E0z+DqCe5xAmrzrRp97s3N3pfvWYn3/n8zifFnT5kenMSTaFoHBwMMS+6
	uYvWFn78VOaeFlJhUrvg6KJvKXjMnWH3HwEalsy9gDyYcWBfEhYMisI5o0d13sEzQRTw
	/3MFZbBeNX3yeZl97qiRtiIuUeBZ6hO4ZaOvFzrrJnnKUqoOBWy+jygAl853uWQRCCTL
	Y7LAO11oiAQ+Ky9N16PWBuxmOnaIe6aMsLJodRUOwxP30Z3zF/H48vJFe0iA34k+bL4x
	/kM0bS/xWWoLqiMQ05xx/c/KBdsRHB9DaJDcXX5JJGyelOx+nB4ddGhvj559pTHoJXsw
	KFfw==
X-Gm-Message-State: ALyK8tIuck3kXgRVcHgwJEWQUJBfuBeaXz4zQZuFNFKO8YsoJTttLPZhcTZM99lG6Fcq5ydfGB4oshP8OogzM4JV
X-Received: by 10.159.40.67 with SMTP id c61mr938923uac.82.1467494473805; Sat,
	02 Jul 2016 14:21:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Sat, 2 Jul 2016 14:20:54 -0700 (PDT)
In-Reply-To: <caf50e5d-791a-4ed2-0af1-54f96df35ae8@vivier.eu>
References: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
	<CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
	<164e58f5-7dcc-bc9f-286f-98b5de56c1cb@vivier.eu>
	<CAFEAcA9mk9Z=M+tahGE7JBiQ_zidqF1pj=13eLr0GcxHcSis3Q@mail.gmail.com>
	<cc5798cf-4e88-f1e7-f3ca-45482e0822bb@vivier.eu>
	<CAFEAcA976boeHjzyHMr_83cq+uezzBq=SCWePW-9780UAp=kHA@mail.gmail.com>
	<caf50e5d-791a-4ed2-0af1-54f96df35ae8@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Jul 2016 22:20:54 +0100
Message-ID: <CAFEAcA_YBZGQmerK69pw_C=wX=CVKuPYUdD9EE7aRoH85CVXYw@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: "Wirth, Allan" <awirth@akamai.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, 
	Riku Voipio <riku.voipio@iki.fi>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	Timothy Pearson <tpearson@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
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
X-List-Received-Date: Sat, 02 Jul 2016 21:21:19 -0000

On 2 July 2016 at 22:17, Laurent Vivier <laurent@vivier.eu> wrote:
> Le 02/07/2016 =C3=A0 22:12, Peter Maydell a =C3=A9crit :
>> (1) Define neither NR_select nor NR__newselect
>>  (and use pselect6 syscall for select):
>>  aarch64, openrisc, tilegx, unicore32, presumably any future arch
>
> They use:
>
> kernel/sys.c:
>
> #undef __SYSCALL
> #define __SYSCALL(nr, call) [nr] =3D (call),
>
> void *sys_call_table[__NR_syscalls] =3D {
> #include <asm/unistd.h>
> };
>
> It's not very clear, but I think they use NR_select with sys_select:
>
> include/uapi/asm-generic/unistd.h
>
> #define __ARCH_WANT_SYS_SELECT
> __SYSCALL(__NR_select, sys_select)

This is inside an #ifdef __ARCH_WANT_SYSCALL_DEPRECATED.
Only arch/score defines that; most architectures using
the asm-generic syscall numbers don't want these
obsolete syscalls to exist.

>> For openrisc, sh and tilegx we incorrectly define
>> a TARGET_NR_select which the kernel doesn't, so
>> we should delete that from our headers.
>
> I think they really exist (from asm-generic/unistd.h)

See above.

thanks
-- PMM

