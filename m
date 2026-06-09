Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E8CCD8CB9
	for <qemu-trivial@archiver.kernel.org>; Tue,  9 Jun 2026 15:52:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wWyk8-0003xJ-Hz; Tue, 09 Jun 2026 11:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wWyk6-0003uw-Mt
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2026 11:51:54 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wWyk4-00070z-Qn
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2026 11:51:54 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5aa62bd04fbso30761e87.0
 for <qemu-trivial@nongnu.org>; Tue, 09 Jun 2026 08:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781020311; cv=none;
 d=google.com; s=arc-20240605;
 b=TuCTTkuM3j0rSEhhGyraKGeXbb6kUhUmVVUieD3y2ZyhjTy2fcB0sc0XAtUr+v60Y5
 zAjemn4OuFR9FKNcK1ZiMXTi7Kbm3dZADox2bof/n4WhNTm9onqKi1N0nryY1lGcCQNG
 5MtyBnFD1Q5HHCFXnHeuTjixW1UxzxLHxhiqmtReceOY/IpcDGzv1lKuizctmsDpcOtF
 Lv2LlMF/+xwETrbNBNOMcQfwYZmqtpg9TRMh1sg09HRb6cRRcwiIIzxLLXjppsod+bQL
 s1u2WpEMBXhhhprlVQ1kbyUlzp5gX7Gii3pTMujSmyVtwjBno3daoA99QBe02npuhyDn
 UqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wNVM8/XIQ+GMp2Km6P124CqDPpvEiW+D0aQeKgN3Az8=;
 fh=CHABZT8yRuYaykAkw7/g96iLH7zlggYaTPK2Tt0gmaM=;
 b=TIpwEq+MS6d+AjjbUg+RZ9OBXF805MfaPo1mcJ9VoTX9lbONNr0dMeLZMuV6KI3pOu
 dyyM41PwmebO7TDkQ0NSPODGc2jKi2GrGybJeUyYlaEt9utgvh7brSU9jhDCS898YH4t
 4wNq8IbK7uyX1nDejKf80eUxzbkuxADiIite2D0BLzM0HAN4DhW4YnXzNd2NKeWhJM1i
 nTIZUdGyXxmUZHgYMqC5+8tGld16jLB0ZfqFFxEnNdzSnz+CZddz+dSo0xcgqY/IEarj
 MQsx34J7DjnFDiC+PEfQE41Urr2mV5EXfLBp6Yt8pnaXqibdPBCoJOpL3vJt9JaaqqOx
 HALQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1781020311; x=1781625111; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wNVM8/XIQ+GMp2Km6P124CqDPpvEiW+D0aQeKgN3Az8=;
 b=OteLEIbV8juVlw/RPBoJOAsAF+aLOIsDIlV9cDniJbmZFze1L+6Xsk1tdib0Sp2yHq
 mwQPFQgPTPAHT87Uc09sTy5Jblmm0B9wy9qTzAbwCxqG06B+RPfsiEgvHsvKbMFv6IRb
 VdTehG7ed44u163Tu75pm7sK+7QJ3EhBiZ+bqQlaOs814XJVmQ5zlRFRk2ivRx8gB9W5
 0OAqN96UdzGWDV50I6HmKgF/3HE7YqH0RrwcIW2/YNMdGqRozZilBj0dTQYAtWJsE2uB
 S8pjMas5enBEnZi0N5JMG0JAuB6Rb9lhMtFn52t1CRcfDttNfe+SyMswAMMtXCGEOeEM
 JXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781020311; x=1781625111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wNVM8/XIQ+GMp2Km6P124CqDPpvEiW+D0aQeKgN3Az8=;
 b=NsMiBXQV9J0g0XoGts6RZIk+JGNcDhFNo/8mjRDP3Qg9/65Mle1vEWZfbpR1uuzjwk
 Fem2qj3ii1CeMi8GVg9tzkCHSgR5LoFgxw0UMI4oljPSIpmGgzlvJC6iTyWenfkwlVRd
 Y6Kb8L0+Bq91mVNmYkLQXEUJD1OKkAGbY+ECk0Bfmfus4Zu/IE4wGc88Vymli3Kqw4Do
 A2tqXrfYXV/lTMyeSFgofZg0K/Ug7ii2HxWSySLihilXc2LerntTfUWKpnvAlTbvb2eC
 /TSFBH+heOBgUACiBR4rNRchfRuWR+7ZvJ0kKeZlIOboeo68otBKGmLRgiHvEKeiG+ow
 luwQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+7zSDTbBTX8BIOabAxUs8vcxWJJ9m2GQ5TEYc0LUOl2zfT2QRPSsXVLuwSjh2W1Ukd1Gc0Ai9Kqk5MqrQ=@nongnu.org
X-Gm-Message-State: AOJu0Yy9ZnClpbvz/9vImJOwK1nC3wFAi/Q4FkG3ulSiPSLdNmUbg+fa
 pZOw+wXm3ziwRXx8buVfIeed1LwVuCXc1yj/AyJfknOPwER4VFZthWJewzDvqdQ7deYZ8TX/KwM
 ZR/vP6gD5mWul8lwrkxuv/vBoXK5UXUJfawccyzk0
X-Gm-Gg: Acq92OHcdHNcdMu4/20sY6f3lGK9GQS+4mAxQzpV0jDVrcgpyRuNJ8+DiGI0OA7wGXz
 WIGQE5nJqj8fmiEHKCwr2fHML7PcCBVG2DTgYpK5SWpyHSRYn51I4ncDXtCXbkbBxKBW1R7x5Hi
 McZ9M3Nz+xD6SSHOiKRAAfVRKugJpSwYYensHALMfsazwS1Y3dQN3pqwYoVZCHmqCorFcvnxdom
 ni8Lzm/RSKAXsALpYhBROmCc2UfEyhqLuc/v2qHq0AsNgqZ/tWrtBGffAl1e/PJf69tWfKoMzC9
 xB+OfOIBHFpOt8gBwYUXKjb/bysmubFlXaMp/GlsdH1Ton8ZzQ==
X-Received: by 2002:a05:6512:23a8:b0:5a8:73f1:4099 with SMTP id
 2adb3069b0e04-5aa8856cd45mr731268e87.0.1781020310309; Tue, 09 Jun 2026
 08:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260609105626.1038690-1-thuth@redhat.com>
 <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
 <CAMvPwGpvpHD+Sx-HZR4FFMJB+W8Rk8LoU0256Q=vwKAdC96HSQ@mail.gmail.com>
 <CAFEAcA9N_O7RZRU+SPTfB_ePasjVZvUsFPhndfQDuHgQ+4Q-5A@mail.gmail.com>
In-Reply-To: <CAFEAcA9N_O7RZRU+SPTfB_ePasjVZvUsFPhndfQDuHgQ+4Q-5A@mail.gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 9 Jun 2026 08:51:13 -0700
X-Gm-Features: AVVi8Cdai3kcd1rD-r_4IKxs0gsOerSlPqiCRzTaBqR3URolkh9sVOzU02dxeO4
Message-ID: <CAMvPwGpzAcDxeqSvQmOjzkQn6T91CAmTO31bNs0wmSMqQKG=Qg@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/pmbus_device: Fix a possible crash when requesting
 too many bytes
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=titusr@google.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

   On Tue, 9 Jun 2026 at 08:25, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Tue, 9 Jun 2026 at 15:52, Titus Rwantare <titusr@google.com> wrote:
> >
> > On Tue, 9 Jun 2026 at 04:01, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> > > I had a look at this bug earlier, but was not sure that this is the
> > > right thing. What happens is that the guest does something that
> > > causes the device to queue up data X ready for the guest to
> > > read, but then instead of reading it, the guest does another
> > > "I would like data X please" action. My guess is that the way
> > > the hardware handles this is probably not "add the second
> > > copy of data X after the first one". Perhaps it is "drop the
> > > data the guest didn't read, so the next guest read gets the
> > > second lot of data, not the first". But maybe the spec really
> > > does say "you can do things in the order 'ask for A, ask for
> > > B, read data for A, read data for B".
> > >
> > > I couldn't conveniently find the pmbus spec to find out what
> > > the hardware is supposed to do here. We need some input from
> > > somebody who knows about pmbus.
>
> > Queueing reads are an implementation detail I decided on, not part of
> > the spec. How the data gets discarded is up to the device
> > manufacturer.
>
> So what *does* the spec say? Does it just say that if you don't
> read all the data before doing something else then it's all
> unpredictable? Is there a way for the guest to get the device
> back into a sane state after it's broken it like that?
>
> -- PMM

I'm not sure this can happen on hardware. The device puts all the
bytes on the bus, and the controller can interrupt it with a Repeated
START

SMBus v3.3 6.5:
```
The data formats implemented by SMBus are:
=E2=80=A2 Controller-transmitter transmits to target-receiver: The transfer
direction in this case is not changed.
=E2=80=A2 Controller reads target immediately after the first byte: At the
moment of the first acknowledgment (provided by the target-receiver)
the controller-transmitter becomes a controller-receiver and the
target-receiver becomes a target-transmitter.
=E2=80=A2 Combined format: During a change of direction within a transfer, =
the
controller generates a REPEATED START condition and the target address
but with the R/W#
set to 1. In this case the controller receiver terminates the transfer
by generating a NACK on the last byte of the transfer and a STOP
condition.
```
Hmm, seems to me the data gets cleared with a change in direction.
-Titus

