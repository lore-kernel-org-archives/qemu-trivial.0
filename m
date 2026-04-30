Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB47FCD13DE
	for <qemu-trivial@archiver.kernel.org>; Thu, 30 Apr 2026 15:40:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wITUo-0005kq-16; Thu, 30 Apr 2026 11:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wITUj-0005hp-AR
 for qemu-trivial@nongnu.org; Thu, 30 Apr 2026 11:40:06 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wITUg-0001wA-CA
 for qemu-trivial@nongnu.org; Thu, 30 Apr 2026 11:40:05 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-651bc83e74aso971282d50.2
 for <qemu-trivial@nongnu.org>; Thu, 30 Apr 2026 08:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777563601; cv=none;
 d=google.com; s=arc-20240605;
 b=UcIRpgmSUaMhXZAyqZdyDTaZHQR/BAR9yyDw4A2lOuzkjLd+v6wFUzfpmrbRlFq2ev
 3ngCaG+q19zwf0kevpBYGB7m3KMn3nDTKTg5ZdeaDxetee0YUecvvFqyVBeSO6LtUWda
 KNXezmZHbuBj7VBvbnp4X1/Uy3A/G6m8a16zuAbV/0PwpfbYxB6wiExpTpRuupx0SCe8
 DB3eBTNofY2Z4e6ywJx0/qOlt534gP6bogkSzWiciFW01JFpCYznVkvOgLydsY/Kxnon
 HnWVAQiqU956xQfe1OuoyAR+ZPy8PiSn7qGhozU+kCgpW253VhdxNLUvgwXns7YMIVY4
 QtrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ReDWy72RBwlCfXkKdQA2a7wP1OoBOa5MlmjTpVb60nw=;
 fh=1lP0zPo8L78NHQ6VR+K9ztKa2wpCSha6wZLb1v7gcMA=;
 b=Ijin/qkYU0CdauB/OQCL6vj2NZZzzrMVMKOEQYxUvOpvehyaHKRjb141/KO1Ptsxbr
 C0e9qRP04OXIOYkXDSMMXE4SoQ2CzTKvcirHDREi4QxjfD1yJqo3DHHzoBmKsGjoOJTH
 kgCLtYR6KFg+eFJ0+hqZgETF48z6GN68fpY+CzNtKl0WGR4cj/46m68XZA0z8wBfo4wp
 W9UCzdTbEo3zHcln2mYothcwVSkmoMjzKVDbbRVfDIRrSy29mXfGrzUq3CJOKVUOocP3
 ow4voxvMbo8VTN+8tkvjfebDHQBcj6ysnlgBlTYr7bNdweG5td1QMHtqBx68vzAJqXo3
 5W3A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777563601; x=1778168401; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ReDWy72RBwlCfXkKdQA2a7wP1OoBOa5MlmjTpVb60nw=;
 b=VwKL/nJkikvNyFYp6LoqNCS5hZOwiL2C2KoXYAYje169uarkMz39pDaRv8szXZDR4d
 4sV/ERlL6OxZWOcXp8SVJL6xG0G5MUL5hA48sDc2UZR6f3SvxJCEYmX2HenBFIfaipY1
 mJF3ua8PUnD+xvZjIyqJv+SUdPUcX09tCG91Z1+2ndKvJXy8kz1N/wkVRPfaDQIL63iq
 RpDyR/WHdJlJpteD31M+Q7NMskWvN9c13V0OzFESNuMMNIWaTZLbzp8XzRtuT75X17a/
 8Cpb69OON7wIVmOhqHnVzaat756y6RQSHNn9s9twpsUZ5yFA4pdzPntW5Hu1YsQlKVw1
 BmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777563601; x=1778168401;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ReDWy72RBwlCfXkKdQA2a7wP1OoBOa5MlmjTpVb60nw=;
 b=ZFVzNM5EyEy6RxuFkfjJ1Afc84rMoqAc1WMsZnOSUYAA8rWQssA4rXQS/G2lJxLdUm
 EjzJwRJgCso5HRTFcCowpPk8kwpbYrg0YxE+k7ao0lJxHndjEd4U9QZjFZXga7AEoGdd
 NNZY8d5EkhWtW8q8br0wRVd1xckhFYampn0V0uoVNFAkEnRlO2pD/WTFnRtrOvzn7GVi
 POUidj+0wZ8ojCOsolfn6hR+TFxKH86fJrVAaz3yIF4yuPpb8Ie474V+JXGYXl/+NEq2
 ww53qpXvCppvUOoyYVQR2TueFwquSr0yyvlBxmWk7lvRGOCVSlLYczeQ8vxWz3K6jY7/
 xoGw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+R3PbMf0ISYdnZhgpULgXvpRAVjUN6bUXBPu/LAz9xn5p9T1KjHW1LumPprbnUDJ68XaiZ0PWAxZMusEc=@nongnu.org
X-Gm-Message-State: AOJu0Yw3jAGrsaHyEu6y9infm1Iq7UoCxsNjrQRfgnVRPj7Sa8d4pvGZ
 +DZn21mX//YA3NBP3NWNFbAORJNj23bsUGx1NEtQMEsfdl8HqBRZVd1mjmhp2vwKgyGmT9abLhj
 Ok8qFvvu8C2a93kaHmdAZXZ4ZiLTkYTrMGzYl6SWj5A==
X-Gm-Gg: AeBDieuOuCyYvPXhuOEfCejsZZ+sjKrAcfoEUF5XrN+QJK9oLs/gBm18u9IgqK06aAO
 7YRF63xDxBU5KsIhghEOyMvYJHRjjJ8GyfFHYYZcP+fYCoE08nW3qLlU8m2ldluxS/SdKxf8KnZ
 wkBabajFGm/qNJGRJgoYczVZHQznbspK1XMRWvi2yclTVWYZ6W9VLIDsWgwQxnY3yBdWXOct3t7
 I1TW57V4X1sipHnLs3mA+Lcxb5mwUjJyltAoQrEfjmEaiFC9wST4UVaF3mk73+HZQm4gY2sFWPQ
 hJXS1MhFrMy6d3CcwJUaGPBOsRizWpN3KD9acXh/hbG23iDmVqcTdMiBhsa2sm6vB8VWr9SJNcq
 dUg==
X-Received: by 2002:a05:690e:1206:b0:658:ac79:ad4d with SMTP id
 956f58d0204a3-65c18f55fe5mr2776193d50.47.1777563600816; Thu, 30 Apr 2026
 08:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-4-shentey@gmail.com>
In-Reply-To: <20260308203516.160103-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 16:39:48 +0100
X-Gm-Features: AVHnY4J8zxXW6fxl_n0y_3WVqX0LkzYyp3tUTgzLovV3Dib0GiEAegikkClToJw
Message-ID: <CAFEAcA_cYDwOFP_h_pKyUQ0kKmT671iZiNntzMC5O5tF=1cC=A@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/arm/imx8mp-evk: Fix reference count of SoC object
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

Looking again at this, is this really right?
object_property_add_child(...) creates the object (refcount 1),
adds it as a child of the specified parent (refcount 2), then
does object_unref() (refcount 1). Then in this code we call
sysbus_realize_and_unref(), which calls qdev_realize_and_unref().
That function:
 * (indirectly) calls bus_add_child(), which takes a reference and
   hands it to the link property on the parent (refcount 2)
 * calls object_unref(), as its name suggests (refcount 1)

So now we have the object with refcount 1, so it doesn't just
vanish, but on the other hand both the QOM tree parent and the
qbus tree parent think they own a reference to the object,
so our refcount is wrong.

I think the existing code here was correct: we get a reference
because we call object_new(), and then we drop it by calling
the realize_and_unref function.

I'm going to drop this patch from target-arm.next.

-- PMM

