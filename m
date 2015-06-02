Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzhHe-0006Yp-8R
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 04:10:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YzhHc-0006YT-K7
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 04:10:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YzhHY-00048A-2w
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 04:10:48 -0400
Received: from mail-ig0-f178.google.com ([209.85.213.178]:36400)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YzhHX-00047g-Vo
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 04:10:44 -0400
Received: by igbpi8 with SMTP id pi8so80803064igb.1
	for <qemu-trivial@nongnu.org>; Tue, 02 Jun 2015 01:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Krtg4/wytVAbPcHzyhFuwMvwRlsHAOvkJkXWKwbkOt8=;
	b=St8KVxZH4F5UtcU0j8tt+1pjhgUxj1UDtVXUxVoFjhtpaHZ23XCMLj0EaYzNUT/66f
	jn85d+aqmV+zoZ61C5kLB7MHR+/8qsYRdmMKLlPltw9FM3eBTGxsROhxQoEDnmQGV7Cr
	TcWiuQHv+bPV1Js7u2BJMxxG3crcpxsg/SXKeA0FmvMhteSc9gghvdInEV6Yvu7DNXUa
	iC3qYPMQy1WNJAJRugBlugP8NKAIgFHi4BY3VKvQ4QNbJnKzrgyrSzrSkUUz7fpB0nVO
	yqI0HYGbIwmm6VFCoySS5hBq0hN4vVJR0xBx0jjOCR1aDH2w4WvLvRHJKQSoX0koZZo+
	6IIg==
X-Gm-Message-State: ALoCoQnEjVKx9wYDf2EtHN9/8FRro3+5sOyMBL3Jc1WqDNuA5MVlKb4FIKmb7TRY+cwbSyVsMFKr
X-Received: by 10.50.110.104 with SMTP id hz8mr18514310igb.38.1433232643464;
	Tue, 02 Jun 2015 01:10:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.166.5 with HTTP; Tue, 2 Jun 2015 01:10:23 -0700 (PDT)
In-Reply-To: <1433232329-14983-1-git-send-email-mkletzan@redhat.com>
References: <1433232329-14983-1-git-send-email-mkletzan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jun 2015 09:10:23 +0100
Message-ID: <CAFEAcA9ggEPZyuVs66bT5Omte8gdkDv8Fdz1nSW9LuEDa6Z_vQ@mail.gmail.com>
To: Martin Kletzander <mkletzan@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.178
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] arm: Fix invalid assert logic in
	op_helper.c
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
X-List-Received-Date: Tue, 02 Jun 2015 08:10:49 -0000

On 2 June 2015 at 09:05, Martin Kletzander <mkletzan@redhat.com> wrote:
> Boolean value '!arm_current_el(env)' can never be equal to 3.  Fix it
> according to the comment above as currently the build fails with
> gcc-5.1.0.
>
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  target-arm/op_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 3f5b9ab5963b..7583ae71217b 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -421,7 +421,7 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome)
>          /* Requesting a trap to EL2 when we're in EL3 or S-EL0/1 is
>           * a bug in the access function.
>           */
> -        assert(!arm_is_secure(env) && !arm_current_el(env) == 3);
> +        assert(!arm_is_secure(env) && arm_current_el(env) != 3);
>          target_el = 2;
>          break;
>      case CP_ACCESS_TRAP_EL3:

Thanks, but there are already two versions of this patch on the list.

-- PMM

