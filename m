Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YziIC-0005wI-Bt
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 05:15:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YziI6-0005uT-TP
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 05:15:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Yzhz4-0004CP-Q1
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 04:57:01 -0400
Received: from mail-ig0-f175.google.com ([209.85.213.175]:33220)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Yzhz4-0004Bd-G2
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 04:55:42 -0400
Received: by igbpi8 with SMTP id pi8so81002678igb.0
	for <qemu-trivial@nongnu.org>; Tue, 02 Jun 2015 01:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5j5grPU0QgDvB8Z1pzKeqmAZUsMrUBtSrp+oAcyzAzs=;
	b=UfdTH5VG2CQoI9ocU3+s61/fPNBxzbHunwVMA1nNlV66brskM25klZF5BIzgpfLQ+s
	TwU1Vb/MWa/bpkAsIeKo3zkGa75O0OdU1vYfH/wPHzmMu0HsVYL0rSF0X4ZZi3tJs8gM
	R6NuwO++LzJI9CerYltiZ11ta1SxS7DiyfxKpkhVHeiC4IwtsPq3XorSy00Hy5QMLxZz
	omkGGElrXDqJY4NCP2f2OoJUBGE3gTnATsHBhH9kSBkDPbNpWrdZpshNAEfhfJ7wVcvF
	0+lCeHHyFSw/ZWDZ8KuGMkNWbl9JPuOzJSHlxlLStZS4GDBdLkjwk/nLzVz3sdhH9Qht
	ztoA==
X-Gm-Message-State: ALoCoQmQecmqYBqDaU/ourmja8VyBwp1S+t3mQA/5zuiEOVE35Gatl1NfoEfQsLtE7zANx2cX2X+
X-Received: by 10.42.164.7 with SMTP id e7mr33312751icy.70.1433235341938; Tue,
	02 Jun 2015 01:55:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.166.5 with HTTP; Tue, 2 Jun 2015 01:55:21 -0700 (PDT)
In-Reply-To: <556D6EDD.8000902@msgid.tls.msk.ru>
References: <1433232329-14983-1-git-send-email-mkletzan@redhat.com>
	<CAFEAcA9ggEPZyuVs66bT5Omte8gdkDv8Fdz1nSW9LuEDa6Z_vQ@mail.gmail.com>
	<556D6EDD.8000902@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jun 2015 09:55:21 +0100
Message-ID: <CAFEAcA8Wzt9tCgUjCrW1eNHoagNDaUQB7tBN0_exzPnm1eErCQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.175
Cc: Martin Kletzander <mkletzan@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
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
X-List-Received-Date: Tue, 02 Jun 2015 09:15:27 -0000

On 2 June 2015 at 09:52, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 02.06.2015 11:10, Peter Maydell wrote:
>> On 2 June 2015 at 09:05, Martin Kletzander <mkletzan@redhat.com> wrote:
>>> Boolean value '!arm_current_el(env)' can never be equal to 3.  Fix it
>>> according to the comment above as currently the build fails with
>>> gcc-5.1.0.
>>>
>>> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
>>> ---
>>>  target-arm/op_helper.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
>>> index 3f5b9ab5963b..7583ae71217b 100644
>>> --- a/target-arm/op_helper.c
>>> +++ b/target-arm/op_helper.c
>>> @@ -421,7 +421,7 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome)
>>>          /* Requesting a trap to EL2 when we're in EL3 or S-EL0/1 is
>>>           * a bug in the access function.
>>>           */
>>> -        assert(!arm_is_secure(env) && !arm_current_el(env) == 3);
>>> +        assert(!arm_is_secure(env) && arm_current_el(env) != 3);
>>>          target_el = 2;
>>>          break;
>>>      case CP_ACCESS_TRAP_EL3:
>>
>> Thanks, but there are already two versions of this patch on the list.
>
> Hm.  So why are you sending it to -trivial, while neither of the
> 3 versions has been sent there?
>
> I found this:
>
> Message-ID: <1432881807-18164-2-git-send-email-edgar.iglesias@gmail.com>
> From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Subject: [Qemu-devel] [PATCH v3 01/15] target-arm: Correct check for non-EL3
> Date: Fri, 29 May 2015 16:43:13 +1000
>
> Launchpad #1460523
> https://bugs.launchpad.net/qemu/+bug/1460523
>
> Message-Id: <1433161632-5752-1-git-send-email-chianglungyu@gmail.com>
> From: Leon Yu <chianglungyu@gmail.com>
> Subject: [Qemu-devel] [PATCH] target-arm: fix incorrect assertion in access_check_cp_reg helper
> Date: Mon,  1 Jun 2015 12:27:12 +0000
>
> And this incarnation.
>
> Maybe I should queue one of these to -trivial, is it what you mean?

I'm planning to apply Edgar's patch direct to master as a buildfix today.

-- PMM

