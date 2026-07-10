Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E258C43458
	for <qemu-trivial@archiver.kernel.org>; Fri, 10 Jul 2026 15:36:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wiDGV-0001TB-Ct; Fri, 10 Jul 2026 11:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wiDGU-0001Sb-DK
 for qemu-trivial@nongnu.org; Fri, 10 Jul 2026 11:35:46 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wiDGS-0005Va-O9
 for qemu-trivial@nongnu.org; Fri, 10 Jul 2026 11:35:46 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-664d78637f8so1604986d50.3
 for <qemu-trivial@nongnu.org>; Fri, 10 Jul 2026 08:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783697743; cv=none;
 d=google.com; s=arc-20260327;
 b=SeImSkKZQgObT68z1Y12VNLINqoDSZK8PyWo7+RIYCGl++Bk/dTTIfqgkONhdg7/eg
 K7GHff/i7Q1SXeOe5866CVSnTHQHtqtregUil26CBhsNLm1vAoeEdUM1L+YMWOI0z1bQ
 K+aAOrpqLetqDB3p8NOzEpi7U5BhnyczG6Ex0Zrf4qa2x56ne1EJHB5ojPHBLpkZgG0e
 c78kEsOK8Gm+w5Tpl//uuG8iepe2Gg7YQKPqKbHRvi2EhANx/MtOnhiCEcHXKlgfK4S3
 9Ewi+Oup/BDxB/AUllbgcflyKVmGgXccRbHp4nE0Q244py/NsXn5hxXt2ACSDJSfnndc
 KD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=brpid9hA+oeeOPIkA8YZ56T2Mv4J1vcmvdwBvJQdRE4=;
 fh=d/ZIP1ij3XXNZKGZD6Cn3R/MG1aC6riiITeEPb5wegs=;
 b=lVHS8Pe3gRFaVEH+1EQDgLAKBzcM/bL5W5XQTFryDCT6bkvOwVBXnYtfPXM2FATV6v
 c6d/ipMuOVUIQv8WJ+ByU3JHeJt0R0gxS5dItlrOKPxcuxaAVBNBUI4cfhZHAqGlfa3g
 e+u2kWqlDVMFuRQJt3tVHRzmKqEo2fpHW6sgCsGkvvfesW+1u0k4AvqqHCWo0UzuiYn1
 n2+mfiMKD0AqlWYgQmcpcSQy8M7pHqjWrGwayMb3nk1o/Ctewn/kfBkA1kXQW4BJLgjU
 JVFlZMOtWBeJ6KqJlNT//SHt+qtYxRbJ7dRPd+wznLOWtYEpoCg2qgnNzWi9RS5G+665
 5DmA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783697743; x=1784302543; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=brpid9hA+oeeOPIkA8YZ56T2Mv4J1vcmvdwBvJQdRE4=;
 b=am3UWBxsZ5PsVuFpN9PNcX5NzJ5RLSlUZf1eI0eK8p8KYsc4s9bB5bL+7SnHXr/moP
 Cx+61Ida0RBR96EKyTaFjMwJZl+Z0mKQBZMhzXKjxSH+GEUyFd24KgUGqsl4FPTrTmMD
 a2XzF5wLo/kmGXWdREv2qEg5dYc+6UnJdYqugJ6Hv41OSWDJhk4qNQUce41l8v3yvj1i
 A6KNpk2YcL0W0CldXvjR06JS9OcyONzvbaaXONcNpgh+6dxKBiB9sROB7lliimkQbv+6
 uUFDbTABI+P9HzqOfcFx8JRiSnTY4gBvkGVHLalrvQSwZyROc5db54TTdyLMcp2t2C8o
 MYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783697743; x=1784302543;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=brpid9hA+oeeOPIkA8YZ56T2Mv4J1vcmvdwBvJQdRE4=;
 b=RqjfN7rgC0lfstvCvD7Vy3F8JLHcYqoDh1P3nOjUyOYu3wc25yqAEdLKz8Ypr8HqHC
 a2rh9E8nfZQ2Y/owAYnIXOCtLzeHbPM7RN3fZ7cSDLNwG0iBsUXD5cj1/tErHhHG/TXn
 qo3kRD/JuKTdRY2r73e5PRkXIGq2O1BvdCXOL70iPwS27z1T6MkskgktKgdx9b8HXl/5
 dQxyiO+YS1VlrLy7NpjxC1GbkKGrFo7puS2giw/y1W/2OVHrfAYORRPQJruP4qby8Q8+
 PzzjV1Ah2+Pi3g9fUGDNnmmH2Iq36UUczc/IF25d/3dllrhsLI1sKdhYojVJCfRkxy/d
 cnlQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqS2m4i/b7cwl7/dcWtrlj6MUamcQu/09ZjspF00a7+3MWJkYwAUWtKWjF9Hsix/nisvr96A7S5G77HUSA=@nongnu.org
X-Gm-Message-State: AOJu0YyPUoXxdOzZGbU/L7n/2z5CSbSaszjH7sHumH0VmzmSyf3ApjeS
 8ZTBPg/l5l854U+Tn3N2cnLQ+meFk/7Dx8amvlA1T/GRSkrWsKrARkJk0HHx3sIKXIo/E2PZqvx
 w+C5U8hN9foBtgKH/lIEEPwUucI2IuSh9F/Gy3Gkl7A==
X-Gm-Gg: AfdE7cn15IxWjSzh10SMsoIt1KiavnxABczVYtj6dvgMdAE9uQFpek4r5prq6to1o7q
 4Wl4i7OaXHKYjO3blEqL3QQKmp9jCrSex+qyJB1r68PGYvoh3WG92itF1xXSXsvNLR6z09yy2Ci
 Vh8f5NxyKjm38lTXQWgMPVA/Rr7G77BHRs9Jrpx6i/SpYTzJ9bQibR+JM6qjp3xEwG6KLixVXgg
 Lfd+6PXAS4lYrpfSBmMRaJFJsdLqB6O7VVwD4DLxkpxgmhwTGolQNoke8xUuEUXenmva1iiFVjm
 QuxYRcTyBRr9Sj5VUZIQWOMznGBj+bewlOxP69ZzQkrepT8z/kJ/le1x
X-Received: by 2002:a05:690e:134a:b0:667:a1d6:9c35 with SMTP id
 956f58d0204a3-667a1d6aa47mr7906100d50.33.1783697743431; Fri, 10 Jul 2026
 08:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260710144327.600572-1-thuth@redhat.com>
In-Reply-To: <20260710144327.600572-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2026 16:35:32 +0100
X-Gm-Features: AUfX_mw7fHLpi5yTv0bRGBD6i2tHm-t-Q-wg57oubaJrBAoHFLR0lCCKDrOX-Zs
Message-ID: <CAFEAcA_aoctX5Cj9dUHSrt_MyzcSfN+bxHxzo+kip88Z-V0YKg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/usb/hcd-xhci: Turn guest-triggerable abort() into
 qemu_log_mask()
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-stable@nongnu.org, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Fri, 10 Jul 2026 at 15:44, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The FIXME macros in xhci_alloc_device_streams() can be triggered
> by a (malicious) guest. Since the macro also contains an abort()
> statement, this terminates QEMU. Turn the FIXME statements into
> a qemu_log_mask() instead to avoid that a guest can shoot itself
> this way.
>
> Reported-by: Feifan Qian <bea1e@proton.me>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3784
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/usb/hcd-xhci.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index 2cdab3ba0e4..002f801348f 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -965,11 +965,13 @@ static TRBCCode xhci_alloc_device_streams(XHCIState=
 *xhci, unsigned int slotid,
>           * together and make an usb_device_alloc_streams call per group.
>           */
>          if (epctxs[i]->nr_pstreams !=3D req_nr_streams) {
> -            FIXME("guest streams config not identical for all eps");
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "guest streams config not identical for all ep=
s\n");
>              return CC_RESOURCE_ERROR;
>          }
>          if (eps[i]->max_streams !=3D dev_max_streams) {
> -            FIXME("device streams config not identical for all eps");
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "device streams config not identical for all e=
ps\n");
>              return CC_RESOURCE_ERROR;

I get the impression from the comment that these cases are not
guest errors, but unimplemented QEMU support for a corner case
of the spec, so should be LOG_UNIMP. I had a quick look through
the XHCI spec, and it seems to define the streams handling
purely as a per-endpoint thing, making it valid for a device
to have multiple endpoints with different max streams settings.
It's just that it doesn't happen in practice so we haven't
implemented the "group identical endpoints and call
usb_device_alloc_streams for each group" solution the comment
sketches out.

Incidentally, there is just one remaining use of the FIXME macro
in this file: the "unhandled USB_RET_*" default case in
xhci_try_complete_packet(). I think we could (as a separate patch)
replace that with g_assert_not_reached(), because the function
handles all the USB_RET_* values except for USB_RET_ADD_TO_QUEUE and
USB_RET_REMOVE_FROM_QUEUE, which are both internal return
values for when an async packet needs to be queued or dequeued,
and which (I believe) shouldn't still be the status by the time we
get to this function.

There's also one raw printf that should be a LOG_UNIMP:
        fprintf(stderr, "xhci: FIXME: secondary streams not implemented yet=
");

thanks
-- PMM

