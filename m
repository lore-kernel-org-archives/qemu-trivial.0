Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA96C44501
	for <qemu-trivial@archiver.kernel.org>; Mon, 13 Jul 2026 10:18:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wjDjl-0002m0-2W; Mon, 13 Jul 2026 06:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjDji-0002ll-PI
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 06:18:06 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjDjg-0007hs-LP
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 06:18:05 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-664e3ed58bcso6000941d50.1
 for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2026 03:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783937883; cv=none;
 d=google.com; s=arc-20260327;
 b=Zch7+B7slBmWc7SRspD2qAR5+z6d2f6/Cvq+68g85myAFikLKMVLc2laghduCEgknW
 w6v07o4xSAoT9+vX28bbDiFeYDkeWdHthU1/xtdVT9rD69V1IK/50BiG19xIQVeHp9Le
 ZBJR6m2Jq4lN6BeydHgWELvXbNqAH54EqQ3R3Veiv2ImtcRrIrgJXRLmoFu8DqvUSzZu
 mpr25bTThjdDYjnkA0kRISjeM5Rx40SQVUaQ4fGPyMt4iVJWIHhDI3CUrSBtHp8iw0wp
 yNjAylS+0YnR1dCSjYsh8ZJYHLNJhJ+wnfC/dt/bK52rk28jISS67rEQlivGP+v1Y2jW
 CoHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bjCwi4kyQywSiEC5ILPY3B6gCFupp4Tt8f85lXOyU0g=;
 fh=EtnInQ6R0FbBE0zflvPSiPW43kp+VEbrSvpC/qf9rAs=;
 b=k46Wr/IiZtjBSX0jTdqvRSZ46O/8jjMc2b0qR0Rcd3e0iJ523ItyuRB2GIInnXrYcB
 2g4H3SBjLGZaZ0OTW812e1vHS85n9hBOsctefImo62GegskACpgrJ1HkEXSPsiu+zp1X
 yb1Uz1jpR9kziOX7MkqPIGw/ELlYNXnXTpvtFMQYhL8nKViDPRfvDV35+Q6K5UayBaOu
 +HRyUer1+obEvoXSrnrSXZTrzuWfQGbP1F+VMOH7/wTNCYP1ZF0R2ZUzRFW6DFN8eMlb
 8ocbgTGQhKdIVrkAidOPMRIKzYw2MzXY9VRE2dMrslL8oT0vTn0UiVlPkHSBqc3n+HKy
 TUhQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783937883; x=1784542683; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bjCwi4kyQywSiEC5ILPY3B6gCFupp4Tt8f85lXOyU0g=;
 b=coMdSLlNmNuvm9aeE+H7qq+/2/COZcKSFqElKEZzFxaslEx1cBeL94wFHu2Sm3xbEN
 S6OM/jxmOSlg6/6PAxgJA6YZ1qSIH24wW9WDwLtxqQbqPsxOygd1gGl8xcDGd4rxSpNM
 9NOD6GJlvGCvp947Bwio3yoP1ri/u/RYGeOJ5lLdtYPze90h0/4GFoPqWuFjTqLRiDDf
 mtnO8mQylkSrrSkbE24MlF22Mj6ToSB5olY/rJ11zAicFyeNTG4D2GSTIK9sQ0Gt8NkJ
 p3DlNlHLtfYdx3euvBRFrVXYKQVAP99f0YchY9ypc5K7JL3XkYdt4MrxDvvcbWQCw3Kn
 6VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783937883; x=1784542683;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=bjCwi4kyQywSiEC5ILPY3B6gCFupp4Tt8f85lXOyU0g=;
 b=JFAmMbGv+p2oARlpGtQ+BLIxTDVhPLGUZ4aU09NK7iPAAGCLDyqZI11EC8a/LrZkFg
 R3uGSoRGvrGiiV82LFXwE9D1cDqFMNvzV09o+ELhz+JFjPi10EjM7YktfMpe6uR+1PW0
 7bp9ktT4vgdQCs1IZQv4uOrxUQNKzOvgqKKJ2HwNt7p1ZPfd8UWEXoxNoD0fu6jJO5br
 eWmgvCv8h6IzAboWNxK3LDbIpTr4znl4nt/n5q23srdO/6OhT6louym6opdF/DAb7I6Q
 P8HLF3C+KzwTCDZ7mgziAqYnEwPmnyhkrjmCdmsRJI80/tmbLLONbryVj1hR4u+fyuL1
 UFIA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp56Fit1+Qo44G6uYISAngg/ytWh9oWk7m4nMgyXwzKSLCJyPmBS9CTPVfQN28Qw4ngqwvRZ6UQRLXJR4Y=@nongnu.org
X-Gm-Message-State: AOJu0Yx2GkpvBFf9rzzfp6+BZxds5KOgsGSwKPq2osnED9KNSaTaARtl
 yDuVVWXdS7DFiYp43Uzw6fZ8Anl6vlsi8wMmUYhzpOEkKhb6NWo45oWuAD6GX7Ype4aySfLZJ+c
 B3OV52sEvjRbuAVOhUWEAJwHgVGDKH80qFiDVS0+8yg==
X-Gm-Gg: AfdE7ckJB/tbm5DdLUip22GRvrlKncVk8z1myU34KEEn9A9WOgV7qj3uUN2183z5iu9
 lgw1SvXv5pNkyNxiylwFLthM0ojl93UI3oQQTiRzC1uOBsT/Fn/yzAuAPSIouyYQG8/nInFPuSj
 phBWon5Nl+w46N3ByALqPqYMBYykV8/5b+QFlUH0x+9CY5kl7EL6YMcnZ+bW67uw6GD5+ofiwHB
 cB0zfKB3mKHIhEb43IwhYEwGr+wqgITxHZnci3nSYPmj4YkPArBqIQujiph6LbYF2fVsq0MRCEC
 rgiYVQiRfza6wBOyYRjKTNXQGU4IdzPQ2zLSrqmneGWGKn6aiiPKTZyd2YbPUIC3++I=
X-Received: by 2002:a05:690e:1918:b0:664:b3c0:653e with SMTP id
 956f58d0204a3-667d98ec083mr5163887d50.29.1783937882619; Mon, 13 Jul 2026
 03:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260713100508.123623-1-thuth@redhat.com>
 <20260713100508.123623-4-thuth@redhat.com>
In-Reply-To: <20260713100508.123623-4-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2026 11:17:51 +0100
X-Gm-Features: AVVi8Ce9GmRshp3IUMcZ1Y13AORWJqj1xe1dCEhzz3DZOTynbYlV5S12XSAOhy0
Message-ID: <CAFEAcA8=_3Ofp3KnOXgfk6OSRHZtvSF6L2pb47XfC8b5TTZo+w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hw/usb/hcd-xhci: Use qemu_log_mask() instead of
 fprintf() statement
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Mon, 13 Jul 2026 at 11:05, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> We've got a proper way for logging unimplemented hardware features,
> so use qemu_log_mask() instead of the fprintf() here now.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/usb/hcd-xhci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index ee913d5c4d5..527910d92d2 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -1017,7 +1017,8 @@ static XHCIStreamContext *xhci_find_stream(XHCIEPContext *epctx,
>          }
>          sctx = epctx->pstreams + streamid;
>      } else {
> -        fprintf(stderr, "xhci: FIXME: secondary streams not implemented yet");
> +        qemu_log_mask(LOG_UNIMP,
> +                      "xhci: secondary streams not implemented yet");
>          *cc_error = CC_INVALID_STREAM_TYPE_ERROR;
>          return NULL;
>      }

qemu_log_mask() strings need a trailing "\n" (as of course does
printing messages to stderr :-)).

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

