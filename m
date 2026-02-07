Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97733EE0AE7
	for <qemu-trivial@archiver.kernel.org>; Sat,  7 Feb 2026 17:24:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vom2l-0002nY-GO; Sat, 07 Feb 2026 12:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vom2k-0002nJ-US
 for qemu-trivial@nongnu.org; Sat, 07 Feb 2026 12:24:26 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vom2j-0004SP-Gi
 for qemu-trivial@nongnu.org; Sat, 07 Feb 2026 12:24:26 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-794fe16d032so26272857b3.3
 for <qemu-trivial@nongnu.org>; Sat, 07 Feb 2026 09:24:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770485064; cv=none;
 d=google.com; s=arc-20240605;
 b=TcmugZcl3BaJ0RqvHmm0Bmw4LvTDcrFEwYkQkFO01efidLNrv3w8RRNEWHfhyyOuhA
 jNOW63XVaTLU7iP1+KJ345x1H40rWFtZ0efNR8CJBQACTjspIa6qGDYTCab5KTxhe4QE
 Sby3E9zoTY7vT3hOoeaeC6xdmQILSV6sJqHbWmvLk38Irr/sFSXZbF0P88hrsDqo+I4k
 WOlrkB6NwcmkOV1L4l6wKVFVuLZnTicXXf4P5eD6uK7YkUnWGVmt6l5Q4pbtb8LwUIdc
 pfZl0SoI1X/XnwzBH9+rGoDGD96yEtw/jpasiqk8fyvixVpP8VDLa+VMI/iOQ0+BjqPg
 CDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fG9u+rhxAnoWtIzvg4BuCMilcgm3foUHCd2T822XsRU=;
 fh=owlrESioq1yE3u4P4+My2NO8AyGSQpH/wfwWspwQe6I=;
 b=GCceLvOpJk5To9QabT3tBbmQ+C79XynyWuYyumI9Ib9hrFCMgK8XfiMXj21R8JMn9h
 f0EnIXnAycS63jH7LYKZBi05qmU8WaWz5WN+HShtj7/Y6zXQTa0BuKtisem5Br5QhSmS
 Udc1A6xTnqjV4f63p3SSX/9ATDqFc52YVCfRiicBTk/d0VtLMzgHA79q3Yo4rfentAly
 eiYXj5D1fHIQUSl/gnNBoy1ZvYc6y2hlvcpUZDoIUXOo+ant3DKhkitixeHhDnQGVsVH
 ay6tCS44I2dkoDTnl/UxmTuA9fFbMeg6JwCIqI4uq+VOl9ddYZPCSdBDCDhqVi7tHOFe
 oX+Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770485063; x=1771089863; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fG9u+rhxAnoWtIzvg4BuCMilcgm3foUHCd2T822XsRU=;
 b=DD4E6RvwaDZuZsx6C7DtMTZ+kC1s/5LZDdDVkMSLeZ7Nl8YAY3vQTiBvDLbdshm+2Q
 50DIlkxRfnL19kM7/45ETrGczqW6SHDf2DAPX4EJwKg5JCSpDGc/n7+qJM1ZUcUY6lEH
 qjEqximjpuzEaMD5nDFDZQoAE9db+rhNIJ2iQ6KrmfV9a4OR1BPqvyr//KlKOPEAVZEq
 YSbxLXc14RIajVoJXzzR69gjfG3kS5yCX8GIa+x00ZV2MmueILMHsrWJsf8/IAtG7vkq
 +zPUjGefRuGHmvTmCq/+PxTZFn05C3ZD4kXK6syI/csOSB/KwLI5QO89rvyqnysC9GR/
 +tRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770485064; x=1771089864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fG9u+rhxAnoWtIzvg4BuCMilcgm3foUHCd2T822XsRU=;
 b=M8Noydju2Vn7rOD0A4X3F+Me+8slankbX3euAox99wcXmP6O3aSfP2t2gTC58Rxhip
 /t+Smm17V6KLlZfUKOBv/cb5wxybCSytWIGSnxisv1PgkTdOSl+QOrg9vnkaLRv4/U0A
 +qxqDdjr6GE1z2vFrsZ8ZkmF3VMggkuQw8HzWF2eOUbX1wIUkV8zcjH6Nd8entX8Dc6O
 nlChXza9O5a/3eQe/Wbr3SLIGfm3p67Qb6vn3jA95FJboVPwQrLqRTXEzuZezaOyFeux
 1vyxOW8zLdwEG9v/vCg6kH+2eKcSlr1BZKvhbhchjNdxyIhox+KtjdQSNIiN0Njulnmw
 vg0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjamtQzZpg6OOLagf6+1ci6x9J1yNVypD7cNs5GKU7QV4GBUUgDSRHH4sZISOWPZzWFXDq9peH800zb5s=@nongnu.org
X-Gm-Message-State: AOJu0Yzuv/9V+lQXU/OqKSUc/am/6OPASXotrZf0/VFGODMr8rIgcZt+
 jdCDaRV2h5Pa0PSjAke7gKQvc5tA3IH3PttgbAjAuyJ8aJPepmuv0M6Z9V5Ja2jwsp0f2srqRqG
 SrOWGcYkSNkAa23I0r24yGJhQpg4G1z1R/22LsgXTCg==
X-Gm-Gg: AZuq6aLZNXwfS3rhLPfJkTpLhUWqZSyo1o75sw8TkQJmgE7scFkq5vit7wsnvIeadXr
 ESkbwRTW4kYlNN+Wi+krHDVdDHWM+Zp05qUevXHOmgcdol692p3RRKCIV2BmvVWU4p2LnNjZFD1
 Pf3pmSdbrLajBZK968G+h/oi/gWZc7d5m7qZyug/lYqomIbadAHeRdXsZYD/PuFDJXfqaG+62oL
 611yiAMDOnDfmPxEfPZcJE0PxjE4Pd5wiV66SVzDZ4qpXZr9xc/SbhsoxEuW2GUx3m4SrCcqLCL
 95RVKXgpinv1B0hh2lcvJtXRTRx75esXRTxZIjOV5iARVZKEliHrCvk=
X-Received: by 2002:a05:690c:ed5:b0:796:371c:7afd with SMTP id
 00721157ae682-796371c7fbcmr13257257b3.13.1770485063503; Sat, 07 Feb 2026
 09:24:23 -0800 (PST)
MIME-Version: 1.0
References: <20260204075754.21078-1-heifetz@yandex-team.com>
 <20260204075754.21078-4-heifetz@yandex-team.com>
 <722eb7df-0eb2-49c1-af07-90004ad46a8e@vivier.eu>
 <14605571-e078-4d93-9f0b-411889a70076@yandex-team.com>
In-Reply-To: <14605571-e078-4d93-9f0b-411889a70076@yandex-team.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 7 Feb 2026 17:24:11 +0000
X-Gm-Features: AZwV_QgEBrWldqgA2gYP70QraDkDO_XqjXSe-RWbno73vDrTGCEFxif4EnAZyO8
Message-ID: <CAFEAcA_Kzy9DCnwM0CyO+X_RveRavhkSrBGoW_MXEeGstkgWsA@mail.gmail.com>
Subject: Re: [PATCH 3/4] system/physmem.c: reorder usage and assertion of block
To: Sergei Heifetz <heifetz@yandex-team.com>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Sat, 7 Feb 2026 at 10:24, Sergei Heifetz <heifetz@yandex-team.com> wrote=
:
>
> On 2/4/26 17:53, Laurent Vivier wrote:
> > Le 04/02/2026 =C3=A0 08:57, Sergei Heifetz a =C3=A9crit :
> >> Reorder the code so the assertion of block occurs before it is
> >> used in the subsequent lines.
> >>
> >> Signed-off-by: Sergei Heifetz <heifetz@yandex-team.com>
> >> ---
> >>   system/physmem.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/system/physmem.c b/system/physmem.c
> >> index b0311f4531..4308e02940 100644
> >> --- a/system/physmem.c
> >> +++ b/system/physmem.c
> >> @@ -2054,11 +2054,11 @@ static int memory_try_enable_merging(void
> >> *addr, size_t len)
> >>    */
> >>   int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **err=
p)
> >>   {
> >> +    assert(block);
> >> +
> >>       const ram_addr_t oldsize =3D block->used_length;
> >>       const ram_addr_t unaligned_size =3D newsize;
> >>   -    assert(block);
> >> -
> >
> > According to coding style (docs/devel/style.rst):
> >
> > Mixed declarations (interleaving statements and declarations within
> > blocks) are generally not allowed.
> >
> >>       newsize =3D TARGET_PAGE_ALIGN(newsize);
> >>       newsize =3D REAL_HOST_PAGE_ALIGN(newsize);
> >
> > Thanks,
> > Laurent
>
> Should I remove the assertion altogether, then? I think the const
> qualifier on oldsize is more useful than the assertion.

I think personally I would drop the assertion. This falls into a
category I think of as "assertion doesn't buy us anything".
If block is NULL we're going to crash immediately when we
dereference it, so the assert doesn't help to turn a hard-to-debug
bug into an easy-to-debug bug (e.g. by catching incorrect values
long before they're used) or to turn a nasty kind of failure
into a safer one (e.g. by turning an array overrun into
an assertion).

And looking more closely, we call this function in only
two places:
 * migration/ram.c, where we've already dereferenced block
   in the code just before the call
 * system/memory.c, which asserts mr->ram_block before passing it in

So I think the assert in this function isn't buying us anything,
and the simplest thing is to delete it.

thanks
-- PMM

