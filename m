Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BB7FF8875
	for <qemu-trivial@archiver.kernel.org>; Thu, 30 Apr 2026 10:43:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wIOrC-0007NG-Iu; Thu, 30 Apr 2026 06:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIOrA-0007Lc-2A
 for qemu-trivial@nongnu.org; Thu, 30 Apr 2026 06:42:56 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIOr7-0004z5-Cw
 for qemu-trivial@nongnu.org; Thu, 30 Apr 2026 06:42:55 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-6563f83ae9fso831059d50.1
 for <qemu-trivial@nongnu.org>; Thu, 30 Apr 2026 03:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777545772; cv=none;
 d=google.com; s=arc-20240605;
 b=Z6EPTP/aDHEAKBskudvuq4ovY85i/eOnArlH1HtCaMjtvCjXEthCK7e8yPBaN+Whk7
 EaylRDv299+nixvKaqfOXG/jOzLxAYzPP3D7ugcdSPPk1ypCzPndjBqNbgubrS+YSk2W
 Q/Sh5sILOo7o2Kbbs8lp7BCDHPCmDKQc+JFkIwMMTEqoVaTGwvBf5RMksocg+cp04hej
 S224T9qiYJLx9B3psyk4KObXBwzDt/+HD9dzZ+AHI07YDeXzD+IcwMGPRZVRdGLCWFt5
 GyUy6xSeWTmpm6UBhhHyz2gAfhmneFQgwVZnmYy2a0gQb/YqI8QgIBpBuLNLUzhgEqJM
 sW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2g0y1nWNZc+AxGadVPMcazKrF3IG5aUDZC2BcCua7G8=;
 fh=A1AcCLu906gABPRANV1KdiAXTF/dNQlDRgWmUhsu/DA=;
 b=h2/VBrBR+vxqOhq+hKw1LLqdMnjKfNibSW4zfmk1bYZieaRhMReWgwRZS7S6iAjPRF
 hd4YoawEwfuj5TOp/HayyXHN1ZtTAp2nXBWzmv/uV0oPcKQcsvmzYzE4Dx2rAKUveOhv
 TxwqhTuuJ9Q7iFR9d5rYv551qoTTEZOMuaI5wamau1rq37Yrnd7mMhCxiZY4AqHPr+K0
 8XTgrJh7N2izdfKguxIOF58Kd+3yFdbTbKdgJga0PQF8b6UcrdiWOJWaDCa56+O3rJAp
 NBM9tdF/l1FqQVSWGyGGLTTja7Aw1/iQZyTqTYIeYSER30aAeJ0St/IqYKhn32u1bKQa
 NZuA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777545772; x=1778150572; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2g0y1nWNZc+AxGadVPMcazKrF3IG5aUDZC2BcCua7G8=;
 b=u2CXR4cBppGDhrV2A68ihgDWzSPPtclXe/tzhEm/X9Cbw74n7Q2A5MLTB3GXN7eEZV
 kShllx9KuR5JPMGhAuq73WQsvacYgCY5JJRsVcl+LH75KMuMMkrsZ0ZvS6dSp9ZWURTJ
 H2Hdx/nViUZp3vFShu//T71zWpWjOp8cUhkH4maciR5+s1lOwKLSzq+ehR4La3PiwcrC
 vYpJXtiUI8LjvcRwcDVU5dMo1wwm1Bryf4faJXbLBjSdAdI15e4VFTdpD+kMYqXgPBQv
 vltiKxr1vbeBPAyZ9s+BWdiNQVBAK0Nwqj1mzJ8pjlMnGKPHS/SCzWaQ7xMmWC3bx38x
 5Z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777545772; x=1778150572;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2g0y1nWNZc+AxGadVPMcazKrF3IG5aUDZC2BcCua7G8=;
 b=SIInvHCj1LtXVpPpuwX0Pyd3QWuZ7knUMPvk5NWGqe3OIl/Sjo7e5kW5qHQRlTS2r0
 Nxc9fd2g9yAzxgK99hpm6HSFmaj5AkP6CR7HhajvBVC0v6uTGRxsj7DYAJ2P6vvzueau
 dzXkwCqPc+RdEd7IbicAT9cQ0fVfgoQ8be5MDp1BLgqFR5U7ZDIsau/6BUDib9tSV1MW
 6zqn1quazzJC/aSTi0S9OQkmwXmux/zeQPuaGUsKruBQEaw3IR1fI30wgn//C1ELRY2Q
 D5Yv22JiDbOavGGNiYbi7MWuWvdvB2nDkPT5N+AW2aw/KWBv3VS1LVpLIlD2fjkkM/CM
 pvBQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+j0CsiD8S3OX6DL3s0OAPasxaYnhWOsmeNVU1f6nQ0IXLIbUITqRiTHJz0hhoITZzB89xKfgnwE6sz7Rg=@nongnu.org
X-Gm-Message-State: AOJu0YxO8L004XkGkemREwL4L/GMhjubORttBs/mm54HT1P3Shn8FRAZ
 OKT5QncR259AtcPxUnS++ECH+j9E1wmABlHLUYzND53ziT+7yCxrnPkftCOGyW8GKVhp/FW5jk9
 XK80mF80m6hlGYT5RtEFKqfyi4oCA1jwbpmirqAmazw==
X-Gm-Gg: AeBDieusr7Fa9jccA2Ac/XpcWxLO8jB7l4NvkeZOPrixima3AjmZ+U3ymIOVSwpkOja
 JUphkueC7a6zencByUX5+YtoMKz95+N7RdTdMi+XfLS5igWaJYqGvB4c1bJgultbjU1bUPYAEwQ
 t+TQW+XHm/gneECK8H4w3Xmmi1T9mY2WCjhuKZErujyfPVcUAnQJi+/g4LRhH6tajSR5dfw9zMK
 FwY1ab9wdZ2VDIU1fiZ/U+4H1tfVnsJAtOva1Kwxbgr8vnbdFVseGrMNCBgycT+5Zt6+bKL54X4
 rZhIWb7ZVWLipEPxUkUanc8NTq9iIi7b8WbTD61oaZe05iu3wa0Tt2hq//vKYMIee1+PbDuWK1V
 9LjOwOPzJuq1i
X-Received: by 2002:a53:d104:0:b0:64e:d610:71cf with SMTP id
 956f58d0204a3-65c18fce8afmr1242841d50.58.1777545771829; Thu, 30 Apr 2026
 03:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260308203516.160103-1-shentey@gmail.com>
In-Reply-To: <20260308203516.160103-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 11:42:40 +0100
X-Gm-Features: AVHnY4JM2dYns_HE7ObRADh3zyxX8nLpEzAfCcCKftBVuoCubM6J_aRvFr41S54
Message-ID: <CAFEAcA8DbrVdRQK4Cy8gqU__FXYsTa0nZERqrd4he0Y1WRW7uA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Trivial cleanup
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
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

On Sun, 8 Mar 2026 at 20:35, Bernhard Beschow <shentey@gmail.com> wrote:
>
> This series contains some low-hanging fruit fixes I came up with when
> investigating Rust for QEMU, especially QOM object lifecycle vs. the Drop trait.
>
> I noticed that no finalize methods were called in Rust sysbus devices when QEMU
> quits, and neither are its C variants. What is probably missing in the first
> place is a
>
>   object_unref(object_get_root());
>
> at the end of qemu_cleanup() in runstate.c (see TODO there). Adding it before
> this series won't clean up machines since their refcount won't reach zero. With
> this series applied this additional line will cause various issues when quitting
> QEMU, allowing the problem to be investigated. Fixing it is beyond the scope of
> this series (and my time budget).
>
> Testing done:
> * `make check`
> * Run imx8mp-evk with a Buildroot image
>
> Bernhard Beschow (5):
>   hw/arm/fsl-imx8mp: Do not create redundant unimplemented devices
>   hw/arm/fsl-imx8mp: Fix parent of ocram memory region
>   hw/arm/imx8mp-evk: Fix reference count of SoC object
>   system/vl: Fix reference count of machine object
>   Revert "sysbus: add irq_routing_notifier"

Hi; I've applied patches 1, 2, 3 and 5 to target-arm.next, since
they're all either arm-specific or the obviously-OK patch that
deletes the unused connect_irq_notifier method.

Patch 4 (the system/vl one) I am not applying, because it hasn't been
reviewed and I don't know enough to know if it's correct or not.
(My guess is that it is correct.) You might want to repost
it as a standalone patch to try to get it a bit more attention.

thanks
-- PMM

