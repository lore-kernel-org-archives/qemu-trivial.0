Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EB8CD8C92
	for <qemu-trivial@archiver.kernel.org>; Mon,  8 Jun 2026 13:42:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wWaFB-00008W-0d; Mon, 08 Jun 2026 09:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWaF5-0008T6-VD
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2026 09:42:18 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWaF4-0008Kt-HB
 for qemu-trivial@nongnu.org; Mon, 08 Jun 2026 09:42:15 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-6611689dc10so1682730d50.1
 for <qemu-trivial@nongnu.org>; Mon, 08 Jun 2026 06:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780926133; cv=none;
 d=google.com; s=arc-20240605;
 b=djfQHkwVv7RXZNnv05jQUYXwfUtDG+4ZfdKKfOd2m21n8Uanz7eiXAX+UhHoDot/Jj
 nlBYGrtkvYOciFNNTjJUkuHoS46vFxNFuGx/WbhQcRe7rAZv2j7T0UT6NohDyzvtz0ey
 IwK/3IxxbiAMUWLpIZJ9jtH2ehB07u5UNNtdgxCze5cHekw8wpD4zVdeOmUJ85wWJVTo
 yoPMImqF00ViADWFM+Ctr3VZRujeUrSYdtGmNszuVYgq/BEnd7JpnRM+9SUV1LTQ+u2S
 aCpadG9P7+AksrFqbEBI4xjFMrGMfxLnTUvQhmcTow0XFGoXC+W8SU5n7TzQiym4nFCQ
 bclQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yztRxVw2QDyjtz3NSNd73YzdZcktuUTBZ7qaQ7mbGGM=;
 fh=JOMZTazbGLuAKKCfTjY8nOdycp22uHAVDuwnM4cxDOI=;
 b=YhL5RGgRRHKp5TbYi6Vbm5mISZW7mWg42Z40K+5wts9KVCN6OT5yiuBAr8YGnJeR7f
 Ah1pmCmoUPSVndd5tUdhiLIFeLL6fypZiSCurSaqZ00oFp+/BsCcBNiC+R2fzdUm9wUs
 UjwhiU5h1zX8KRgiJScCVfSMnNTimAq6lIlJ89ymXvf9uSuvoQCMijl4YVpHFRAbs8vp
 409mPbd6qXYlkPhqMvEj47atpp3WqN/viZPwUw4SLgIaMmA7kY8LAuenrpd2zSw9wbEZ
 vh9Bk0NNI/aEw4+S7e47JQwyBIHk9p8uTALGh0draksEA6a+XbSt/S9+fVx3DvNQymzO
 Z2wA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780926133; x=1781530933; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yztRxVw2QDyjtz3NSNd73YzdZcktuUTBZ7qaQ7mbGGM=;
 b=Fnjp3LCBBi7Nnn5pVywWVC6FadiPS/h9QdZ6Td/RDigwPiN5P1Mm4rA/KBcDmeVAO0
 ArOCeEKF3+S2KIsenGMGsTrf5L7S2fHJatMwLveQP7pcopyzhzYguWXgHgJMnoD+8d3a
 74VlIDlY8sqEtT0ONzcnaqlk65Xw2pwRy+YYj1LORenFPKmQegqx+JtQTL7iIZGkubOi
 /Cx3KRvTP/dbxcawI1n/hPJr0Zom2uUwVCy2SUV0zwK6HU3Au7cvttZVGb1STflz4ukG
 Bgs5H2nvGzRQ9zZ6y/8guGTKxr3Cohhtqhnogs/1JqfH/LvCTuOphLo+upT3x1nUbfSe
 hvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780926133; x=1781530933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yztRxVw2QDyjtz3NSNd73YzdZcktuUTBZ7qaQ7mbGGM=;
 b=Y9qbx3dzkQKF1ksV9XCayUREQc2W5LGrH7d0MzwIroq9iH+zm/98IdMjORThF2xrrr
 LAaCWV3/tc9BYiTnV5XTuMbm3Xd+CdaZPl5Try2IQaawAQv1Zhml9DdsuDVnYsfb3Sn3
 3gYwE24wdO8g1xRJy7Os22wCJpwJuCxavdRRxGh5oBeBXuXH5sHes9VmGV5N9qpFdQ8n
 FXH2A+PaTWP6Yqg8KYNN8LS7XEWkpkT4fGHZdQTJUhojnXZUgBE6Nqd/EE80Qo7dXfo5
 0dHWhKNzuSDEX3tePOUnXnhID41Cpjr89dRCqskTbOUQxHPNtP8H+a7KzXhCCr8QCtXI
 BtAQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8K7el1MT0lkT8FM3mJMENJCH7U3qNXhiV2E4zCdmfsEMOSNnC4oGhbdNSuNtG5phaay0ZzjPHKYIgCHvA=@nongnu.org
X-Gm-Message-State: AOJu0YwPGYXuVwQBVlKMfpWsrj6WrIv+Z+LafupKdv+l1Ajrmp+1tl3B
 Xe1hlssQcAqjJwbMP4hTaSeTizXv+a/YFd/yRdtYVM0sYE22vNk+5Kevy2q04FFlQFmawqq6ns7
 CLboQbNYKiKMJfJWXTtTamFymsEC8iEZTwBilMjBf+Q==
X-Gm-Gg: Acq92OEmaADFe5kuoEXnmG4C0MTMwyhTCrue+8tOQUTQoaIgbKxpUB3zL+PPTBcEgFl
 9zVPTdDU4a+WOczrc13VTVu+rSZ/qAask6ibpEm0eiE1wm5nCU9hw87mPRz9qtW3L6AYrauRJbv
 IeUBYz9C5F3Rg2M68GeE6dDlRXnBIVBkSBbfTTUOEBS9HhPlTmuApcPXEhuIpfHtfSPv1+9AXbL
 FF5/Q0HamP7et7wOKUcUd9Z+VXZKyU0s+sX+rQ5LJ3Mb96tK5Xuwe79cOBLnjEN6L6SFz9+mSkz
 dFFO1QPe7MukF1ht731flursbtVqEuJuTP5kUCUF4sOXGwdxVrtHhMN7p442JcT2W4xoFNyI7pE
 GFQ==
X-Received: by 2002:a05:690e:4805:b0:660:8e61:1a49 with SMTP id
 956f58d0204a3-66106e4abb7mr9259269d50.18.1780926133079; Mon, 08 Jun 2026
 06:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260428162048.2995097-1-luc.fast2004@gmail.com>
 <252f4369-68c4-4b34-a076-9c844b25720e@tls.msk.ru>
 <87y0gp17j6.fsf@draig.linaro.org>
In-Reply-To: <87y0gp17j6.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 14:42:01 +0100
X-Gm-Features: AVVi8Cf7m1O0i15R5TP8liS52je5HurvLYhOvTC_RNsApjTLdrrB-qNvnd_roO4
Message-ID: <CAFEAcA8nmKBbhkxzgF2diV41pqez3=m5hnx_qUZ2+5DCLqG3ag@mail.gmail.com>
Subject: Re: [PATCH v2] hw/audio/fmopl.c: Convert malloc, free to g_malloc0,
 g_new and g_free
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, Lucas Cardoso <luc.fast2004@gmail.com>,
 qemu-devel@nongnu.org, 
 kraxel@redhat.com, qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Mon, 8 Jun 2026 at 14:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Yeah I just scanned though:
>
>   /* lock/unlock for common table */
>   static int OPL_LockTable(void)
>   {
>           num_lock++;
>           if(num_lock>1) return 0;
>           /* first time */
>           cur_chip =3D NULL;
>           /* allocate total level table (128kb space) */
>           if( !OPLOpenTable() )
>           {
>                   num_lock--;
>                   return -1;
>           }
>           return 0;
>   }
>
>
> which needless to say is faking a lock with num_lock++ which should
> totally be using qemu_mutex - although even that might need some
> handling to make sure its initialised properly.

It's not really a lock -- it's just a reference count of the number
of devices using the shared data tables (if you have two adlib
sound cards in the system, they share the data). The locking here
is provided by the big-qemu-lock, as usual (OPL_LockTable() is
called from OPLCreate(), which is called from adlib_realizefn(),
which will always be called with the BQL held).

thanks
-- PMM

