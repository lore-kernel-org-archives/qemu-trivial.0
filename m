Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56611FF885D
	for <qemu-trivial@archiver.kernel.org>; Tue, 28 Apr 2026 09:52:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wHf6u-00035A-9m; Tue, 28 Apr 2026 05:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHf6t-00034m-1P
 for qemu-trivial@nongnu.org; Tue, 28 Apr 2026 05:52:07 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHf6r-0006fc-IJ
 for qemu-trivial@nongnu.org; Tue, 28 Apr 2026 05:52:06 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-651bf695701so9830102d50.2
 for <qemu-trivial@nongnu.org>; Tue, 28 Apr 2026 02:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777369924; cv=none;
 d=google.com; s=arc-20240605;
 b=GbLTIN3rNkLgBBrIIv8UHLBFaFVz4Tzu/wwKLigYXKLwN50do5hFpqVNpQMX6QVqNS
 PuwDyhbBo6ZQ1Cosda2wdLEghtbzFipF6Ecq/W3JUesu6oxt1ln2DPx2fuB1Q+0nbSQm
 b7Mh2dkC81rOevhkkWO1f8qEMPI4ZayTYvWNhtEhM5mhVWhw+gyHN2nQPdiCNh/OKoeI
 JYKu8uDfKSwNk/0O6SzFUkQ/TMbUqsEpaFWm4la2CZDKhWIYX+Naxz0S6XAD4vntdzuM
 0hsy74pTHNOEAcB/ddklQiVxqSisOAPADxfib2e+AZIbe7b5x+0c2kS0SgtC0dCupjqP
 Gm0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Jf83sOe0igZW+OLTsh7KdIXlnA6gpK2sB4ZNna8MjBY=;
 fh=WwGPytxr2CQZF1/ep4rE9GqfOrwzX2MwFv4eC8jyfw0=;
 b=SgW8EHyu1g102LTJnWMZWscpUB/EDrjceGEJhExxtIR0WOacAJY2KVVksb8K67R734
 THgh5/5XA7GaUmSPMAwZd3n35VIfpZzvZGOxKnIp1txJZKrvfJjYGCxxzKXSx0jWLK9K
 LxOC1h+GclU+JWpDKI92OSn5XAvbESuMiMLX/QpFKArzGL6+/NK8ihRChEnbVyQakhHi
 GbSNWhsU8OxJ1prp5llJYYRnuyhIEALUQBGATWFQxM2cPogjxKG9iH27zDWTG9FYY7RE
 etUhsXrQ+gFCttS6odVrilIbfGm7vz9tJysdLdxw0gSmrL2VWjk94N9qJKMWDAQv0w25
 hw/w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777369924; x=1777974724; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jf83sOe0igZW+OLTsh7KdIXlnA6gpK2sB4ZNna8MjBY=;
 b=EKJB1l9KO+snjTd6eRM/5DLCoW7svOqmKFJUIC8RG4AyjKqw/0SweiDudlOJXkt1kV
 Y3VLt8H5Kx5stU5kIoY8rTik8cVgbKmXINfNAEfAJBCdfX2/weU1GvlOtJITJCT7y9q1
 40AUlcKnH7GbELi/5qHumJ+hGlPYgcPYG86B8JgjrmETbZnot9yzqT2Q7jMzu917U8UX
 qcaZ1S8flY6JBu/EeiGJoEHC/szFtnTd5OJvleUGbfaDBzlDMzJvCfiXu7BBQRYTZ1QQ
 utKWu33KEssOvhhcQHbS9WvUTdUrRvST5aOSV4njDMDAlt4xeWXxeRO56i1K0f1oGNop
 yyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777369924; x=1777974724;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jf83sOe0igZW+OLTsh7KdIXlnA6gpK2sB4ZNna8MjBY=;
 b=p/GA5Veyd7OLmQ/itJaD59GcY9a9zgtARwst6LRuOYixcbpHlQ3ZyfFjB1QDbeufA7
 Mb9Ja+4HeTKDQUoTBpATqUEWYzmnIfUkGmPoa28fDmhPDTKDkCbj26jXR1ynpWfmUbCs
 vjb1OWk7CWu+NEIKiJODoWHIPAo+fVo6EENf3RmURVlBNhIgy1htpwLAX9v0LJTU4ycA
 xCgwUWTgH7QoBSZpFhNflCStjAdG9r70GZVbBkKQ6xtTGqu8WjMsOeku6Xva9pGT1Rnh
 w5dGGbhl6skNX3rLWlEX8NlNZqUL8dakc8+FQDIM99vgdK4gQVtO5tI1faCCkd/N90hr
 CUhg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/n4GdMaH2dEhbS4Zr29AE9NUMtwZ0pXiuFRavXrxXkonDQsr4op5fyqco261u+u4IgQwooj+s7Tw4bBNw=@nongnu.org
X-Gm-Message-State: AOJu0YwnhgXkx1MNVK4dveOYpe8FXXNI49CeMX8zbVLId3MZoXNiqIDs
 OmmdxbcduoIfLrlwK+C8DUdBM0lK/1TuQFDWzRBAhHwiIZ1p5V9qfbv7zU7ug4dZ5YgEcIYBJ94
 i/egwD1BPHnG72gxmwqU602v8XMUNe0hfA7SFouNvyg==
X-Gm-Gg: AeBDiev0CpbINElKY6Mu0jdYUjU4Cr36jyeRIVgfJRWE4oNo5tN/MrW0X+4fBzYkg/P
 RhrXBji7fG+y1hb66F4CVOeDzNKKhlpzhv06qtnOrjY66uNGb0/hKZR1QlxU5qP5D5YrQQV0g7u
 fTi39SLOflnUDS4KIAtEiZV1ROcxqEXZKvLoNEHAZjOnsPsSY5Hc3TrbOzxbye2dWMnEVk/Xa5d
 1SJTaRXt+ep7XS8xgv0wMeWm9t7Ai5G1Wy0YIA6U38F5OYmWBih5wBEAxeCPbynlfTKFF6XERvJ
 Z1erDd/TVyC5YT1S0LMpx1DRGHQqNuUTJ+1SwYx4L0Njqp48+UVMqYN0bkQv4H+QfF9NL4QnVre
 Giw==
X-Received: by 2002:a05:690e:4813:b0:654:a4fd:ebfc with SMTP id
 956f58d0204a3-65beed4b37dmr1477104d50.5.1777369924253; Tue, 28 Apr 2026
 02:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-4-shentey@gmail.com>
In-Reply-To: <20260308203516.160103-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Apr 2026 10:51:53 +0100
X-Gm-Features: AVHnY4LN6oyQ5hgpGpRcO4ZdokEuLd-PlagZ965MDMbtumluQ7kS8dcp9G1gEZw
Message-ID: <CAFEAcA_BFzFSOrXB9DorTftGYVmvP7gB8_+14fpwGEC6vasAeA@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/arm/imx8mp-evk: Fix reference count of SoC object
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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
> object_new() leaves a reference count of one, and object_property_add_child()
> then leaves it at two. This would leak the SoC object if the machine object was
> destroyed since the machine is the SoC's sole owner. Fix this by converting to
> object_new_with_props() which gets the parenting and reference count right in
> one go.
>
> Fixes: a4eefc69b237 ("hw/arm: Add i.MX 8M Plus EVK board")
> cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/arm/imx8mp-evk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
> index b84ac91a17..cfc3038c36 100644
> --- a/hw/arm/imx8mp-evk.c
> +++ b/hw/arm/imx8mp-evk.c
> @@ -74,8 +74,8 @@ static void imx8mp_evk_init(MachineState *machine)
>          .modify_dtb = imx8mp_evk_modify_dtb,
>      };
>
> -    s = FSL_IMX8MP(object_new(TYPE_FSL_IMX8MP));
> -    object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
> +    s = FSL_IMX8MP(object_new_with_props(TYPE_FSL_IMX8MP, OBJECT(machine),
> +                                         "soc", &error_fatal, NULL));
>      object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);

There are more boards doing this as object_new / add_child / unref
than with object_new_with_props(), but doing it in one call seems
better than three.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

