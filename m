Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UG4mD-0002Fv-Cq
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2013 05:48:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UG44d-0002v5-E9
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2013 05:03:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UG44Y-0001sp-8S
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2013 05:03:43 -0400
Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b]:49041)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UG44X-0001sV-MP
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2013 05:03:38 -0400
Received: by mail-la0-f43.google.com with SMTP id ek20so2170125lab.16
	for <qemu-trivial@nongnu.org>; Thu, 14 Mar 2013 02:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=5aSTeEV70SoAa/7qNQUE09+8ROgp3CVvQjXSJ5AVEsc=;
	b=QuCy+Kd2pSEeg1c4XJpjD/+t8EVziRf3qpQBPMRHI9DU+2l2vLvyI6vVin+W3e4VwJ
	ikaoq0ysqSZt50eWRb3EeuhsUYQx3VDfqaSCpFLcA38O8MC0vwW7YFXuNvtXjdGunxEX
	0cmojxSKAFjTQF3CMSnm5b7rY6SdS+F4DXXqSN504w+N56/UdLukkNabcJRrkFEDOuHQ
	h+oXTW2CRhYlrobHBKRE6BIt4lYKC9V2mYKzWbXM/LeAMJB9wh/QxAv6aNDUwMjJZCfl
	9+kRVXPs7oBcEtl3GJtWN/FlJkKST7rAJ+9JC75F4TIsistrIXzEKxNQHYsY9sJYAcSt
	BGDg==
X-Received: by 10.112.134.105 with SMTP id pj9mr782681lbb.94.1363251815062;
	Thu, 14 Mar 2013 02:03:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.2.202 with HTTP; Thu, 14 Mar 2013 02:03:15 -0700 (PDT)
In-Reply-To: <20130314080646.GA28398@cs.nctu.edu.tw>
References: <20130314080646.GA28398@cs.nctu.edu.tw>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2013 09:03:15 +0000
Message-ID: <CAFEAcA815a9QE-y_JSApC0o9MSt6TrjQc+Hgo83uxEUD8KTHjw@mail.gmail.com>
To: =?UTF-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQkcAHI7HJfx3iUQCr+lvXgSnB2mZ4fJ8tQfpQ7SbMHiqzZZYPEY2RXhIP091rL+ClLlgvU0
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22b
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] Use proper term in TCG README
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
X-List-Received-Date: Thu, 14 Mar 2013 09:48:44 -0000

On 14 March 2013 08:06, =E9=99=B3=E9=9F=8B=E4=BB=BB (Wei-Ren Chen) <chenwj@=
iis.sinica.edu.tw> wrote:
>   In TCG, "target" means the host architecture for which TCG generates
> the code. Using "guest" rather than "target" to make the document more
> consistent.

Thanks. I've tweaked the wording a little in one sentence below;
otherwise it looks good.

> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> ---
>  tcg/README | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/tcg/README b/tcg/README
> index 934e7af..00d4751 100644
> --- a/tcg/README
> +++ b/tcg/README
> @@ -14,6 +14,9 @@ the emulated architecture. As TCG started as a generic =
C backend used
>  for cross compiling, it is assumed that the TCG target is different
>  from the host, although it is never the case for QEMU.
>
> +In this document, we uses "guest" to specify what architecture we are

"use".


> +emulating, and "target" means on what machine we are running QEMU.

"emulating; "target" always means the TCG target, the machine on which
we are running QEMU."

> +
>  A TCG "function" corresponds to a QEMU Translated Block (TB).
>
>  A TCG "temporary" is a variable only live in a basic
> @@ -379,7 +382,7 @@ double-word product T0.  The later is returned in two=
 single-word outputs.
>
>  Similar to mulu2, except the two inputs T1 and T2 are signed.
>
> -********* 64-bit target on 32-bit host support
> +********* 64-bit guest on 32-bit host support
>
>  The following opcodes are internal to TCG.  Thus they are to be implemen=
ted by
>  32-bit host code generators, but are not to be emitted by guest translat=
ors.
> @@ -521,9 +524,9 @@ register.
>    a better generated code, but it reduces the memory usage of TCG and
>    the speed of the translation.
>
> -- Don't hesitate to use helpers for complicated or seldom used target
> +- Don't hesitate to use helpers for complicated or seldom used guest
>    instructions. There is little performance advantage in using TCG to
> -  implement target instructions taking more than about twenty TCG
> +  implement guest instructions taking more than about twenty TCG
>    instructions. Note that this rule of thumb is more applicable to
>    helpers doing complex logic or arithmetic, where the C compiler has
>    scope to do a good job of optimisation; it is less relevant where
> @@ -531,9 +534,9 @@ register.
>    inline TCG may still be faster for longer sequences.
>
>  - The hard limit on the number of TCG instructions you can generate
> -  per target instruction is set by MAX_OP_PER_INSTR in exec-all.h --
> +  per guest instruction is set by MAX_OP_PER_INSTR in exec-all.h --
>    you cannot exceed this without risking a buffer overrun.
>
>  - Use the 'discard' instruction if you know that TCG won't be able to
>    prove that a given global is "dead" at a given program point. The
> -  x86 target uses it to improve the condition codes optimisation.
> +  x86 guest uses it to improve the condition codes optimisation.
> --
> 1.7.12.3

-- PMM

