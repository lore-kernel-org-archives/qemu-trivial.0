Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D22AC531D0
	for <qemu-trivial@archiver.kernel.org>; Mon, 27 Jul 2026 09:57:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1woI5O-0007Cf-Dp; Mon, 27 Jul 2026 05:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woI5F-0007Bu-CH
 for qemu-trivial@nongnu.org; Mon, 27 Jul 2026 05:57:17 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woI4z-0005e1-QW
 for qemu-trivial@nongnu.org; Mon, 27 Jul 2026 05:57:08 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-667923d86a7so3400990d50.0
 for <qemu-trivial@nongnu.org>; Mon, 27 Jul 2026 02:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785146218; cv=none;
 d=google.com; s=arc-20260327;
 b=d5cRZeyRhcDHuFZhQTkrcZJhK0xKU5Ec/NiKreiYZdB5It5n2SD3CgYrVDYGgCMea+
 yvv8+Lpc9nEu20hxwidTX1N4vC9EMO9qX2Xo8OipDemZs36yqJt9RkxYTmDO2EGPPjME
 GiGu5O5H8eKUzgfSvv4W4EcRLpOn5AVP7BCJt8kgdK1hTLXsAF26yiORKTkAG6IiOALp
 Z1kFHq7bM9pt1pSH+UBPfDKPxs7swOxRZ0RpZ63fsUbermI7VoAQKxdTdncUOhIq+YUu
 hL61SC5G06VVi8/ggBqGHu/AseXclZx3A7MXfA2vuXmwrNc8klDCL1OpVEgu0GQ/jzT5
 UVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6DZggg8Z++kZsiW9bFSUYxgoJflfU1TRkOMiNDsIkXw=;
 fh=ldSSgzrk8HEBf95paaKSVSe5WI74yO3888PLnOEfCmg=;
 b=g4RS42nh8VsOKoldGTOA+5jBCRsVnUVn9d4qyOALoPSbGygUCd0s5Xw0zcoeuTN0Cr
 4wYXiN5/wgmc6OEYECvQdrJmPjXsjhiTze0QmRsyCbpEiJyJDgYqYQtDWa0VKYUl8spk
 gvoapErOw/BLk8aBW2qaa2maGS4BFR3tUCTwMjJxy45OSwA6HYizKs2CrJBPpp9vxixO
 RKDCX6DplOkG9OQfs15vzbfCdaMStvp2ZFJHVxbFdQ/ZeeEa/w6n6qT3cagueITSQKeB
 4bsMbaBZVsd7eZSejnPWCm4RpekzV/Nru8wsY9OsO97OXUROZtGTn7pueVqbFoNXp8Tx
 pyYA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785146218; x=1785751018; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=6DZggg8Z++kZsiW9bFSUYxgoJflfU1TRkOMiNDsIkXw=;
 b=fvZ9ITkbq6e7lE/NakqgBeGIsZQtGLJuU+xrr+hRFZAetI+FDa6twC0JXfRjV400EF
 AEfcDtxME+3irPrKd0ThFoKWOiqq30WjMk9rTKdA4QO13gfP21XT+AcWmAk8wlh+au40
 fEGCoAaLySy2f/wTDWV0pMsD3bBj+qc3Kqs/jAc9vXoknJjVUF505/dYZP1GI75QIF+s
 DkdoA92Dbe7TocvO7LquYbLAX/uO0tjnzrh9Ocw9MP+odWuLHCM0l9TH9q8CFKfztyYh
 H+wC6XzNYNejiaw52wf+l/8p5sgHhjrs/1W3rrMtY8Whd+d+SW1skCDgEJyRlOEPJnCs
 BXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785146218; x=1785751018;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6DZggg8Z++kZsiW9bFSUYxgoJflfU1TRkOMiNDsIkXw=;
 b=dmgTAqy90czCO0gRWnw4bsW8lSZdewa/s/gUNptkwh9/i/rg3hYxTV0M9cZZlYSCvh
 U8Lj2XAL/CEy8uMhZPgtucobc1a++DU0JiyfWJLNm6Gb5RpYlY0gYQ3XOfjLZjcrLV6v
 KeGM50CoYbXPleIv20hg0o2iSS2VEMUk6pM1b6UcUuis3cPmer4PDwpArHd1rD7663VB
 F2IdSBY7/kWl1S7HvHGPpCBz4hMLX+CNmJgLDclh9nfrOedB4VHHw6fsagCxkwY/RwxU
 jV9M+YozLjaVC4Bq/+qRsHqwwvihaXX/1TZrxSP4+cnSkmRa+yCKPndRYeN+12bRZn+O
 eUGA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrf4y5iPSXOSa41i8MbEYmF+WsMKNO24L2AYjDSHZVDsLXFtwMRxw8Nkiwpv2FFjvOvY4j1CdPbDLpZYXQ=@nongnu.org
X-Gm-Message-State: AOJu0Ywnt0chwfQ7IkW6JIwXpPNaCHbsv5H1BdMTEFK+wMctBFALafZY
 tk1YDmcU+tO1HVlZM63L2AkTwCHi3ERmuZ1qXOlrHhs+EHorXW1kyat3TFH47LrwLTaKbBf+ZuN
 Wi2AzkfR/1OIytwGdaXGu26Ocvi+qKrJDXY8uGxbeeA==
X-Gm-Gg: AR+sD11ye84z8naPzM7FZbAKA20d9CSXXCWL0dOdKD3VZanotyZrQK/JwZEBh9pWnlo
 6ltP59woQ6Jhx9KnhcHInQ6ZVjMDsXSbM98TG5F9LT5bcTdkm278Ci26SSbroaQton2zNebft6T
 DeJYlKKru4GluCe4fLgk5jWhopTJrLsWmJiXSpV4XfX8M5uh0V4Dg6sffPwK9SBhYqTDSkWo47V
 u2/ZjlVNQGOnEeHdWhritLBqrZf+DqS06csAd4qpH4L1v5kByoHLiNX6hCz1LCYwMnvLqPigYod
 7jkLTn2ay/Zj73jpmcHORDiTSC+zPO9S11c+Zc7outTdMw==
X-Received: by 2002:a05:690e:c4d:b0:668:432f:f785 with SMTP id
 956f58d0204a3-668bfde0394mr3100893d50.22.1785146218419; Mon, 27 Jul 2026
 02:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260724110933.629791-1-thuth@redhat.com>
In-Reply-To: <20260724110933.629791-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2026 10:56:46 +0100
X-Gm-Features: AUfX_mx4at_lCYWCbKIb-vgnUZU1qSbQtXDVL1gpQjsaZvjMFL2NDjbc3AXD0Mw
Message-ID: <CAFEAcA8C6vBF_d5VeH23cqU0OjmQNtn9YqALLD_sD+t0YvgG+g@mail.gmail.com>
Subject: Re: [PATCH] hw/usb/hcd-xhci: Check return value of
 xhci_xfer_create_sgl() for errors
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Feifan Qian <bea1e@proton.me>, kraxel@redhat.com, 
 qemu-trivial@nongnu.org, qemu-stable@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 24 Jul 2026 at 12:10, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> xhci_xfer_create_sgl() can fail if a guest programmed the XHCI in
> a weird way. The current code ignores this error, and this triggers
> an assert() shortly afterwards:
>
>  hw/usb/core.c:612: usb_packet_copy:
>   Assertion `p->actual_length + bytes <= iov->size' failed.
>
> Fix it by handling the error correctly (i.e. return with an error to
> the caller).
>
> While we're at it, change the DPRINTF statements in xhci_xfer_create_sgl()
> into proper qemu_log_mask() statements, so we have a better way to detect
> this situation.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3786
> Reported-by: Feifan Qian <bea1e@proton.me>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

