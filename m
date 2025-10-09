Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017D1CCD187
	for <qemu-trivial@archiver.kernel.org>; Thu,  9 Oct 2025 13:30:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v6qie-0001Uu-JM; Thu, 09 Oct 2025 09:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v6qia-0001U2-K2
 for qemu-trivial@nongnu.org; Thu, 09 Oct 2025 09:30:05 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v6qiP-0002nB-2F
 for qemu-trivial@nongnu.org; Thu, 09 Oct 2025 09:30:03 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-63bc1aeb427so940698d50.3
 for <qemu-trivial@nongnu.org>; Thu, 09 Oct 2025 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760016588; x=1760621388; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sbe2ohX3gBWx9TzEYThFBXKqR6DwYNml6WgtMjtxVEM=;
 b=xozwEUrDHWjdXg1NMR0eQQ+OimviZWaRGZk4+cmwhdD6jojF4LPkOAQqi1Ba/Go5iu
 X9KQ9VYbWkno4lCaVCL7xx9wj6Z7nnbV/Lbp8hNH+ECrTMiBeNY8JwENJkiDyPY0Yhb0
 +99+StwSYF4fAOPqM8W/rG5yJ/iQus2AeRi/FZRrYI8FdyskJcMoScup6nMX3BYjIKlB
 H5L/MPtfSXu97eLjlay/n9xONnJL2AAAQKpDi+ZxLlESaaNtAIJtWdwrq5Kt7heuEqKM
 Ym/SSRhnsPiSGeFubzTpQL4XbpGUOg3VChRfIPBlbaKvpTgc5ElYUR94yC9kFbxbdPkj
 5R2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760016588; x=1760621388;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sbe2ohX3gBWx9TzEYThFBXKqR6DwYNml6WgtMjtxVEM=;
 b=FcDrrZzJZyndoq+u4SSKQaEo0TQQiAjC9+tcxgnvm8whlUjigIlYnUEMozWshmcRZF
 kbStT10f/3Qh0IDv6EBpsTLtoXbPHFRwWPWwop88ybHNOOcJmaHmX2tvY8285Y09hd4+
 nzf9hThxigo0WgtYzx0RBscgFd2WYLab/Z8t66cK024Bvd1Wls29vVw+Y0YwXGiyHW6Q
 9FtwT8Lem44ttXdRpOtRG5Nf4jEWE02RZa4LE3gWGsjtNXZO7eerLQn/AeYcTX/84ZiP
 az7lcP7Xd/wKLJwLmbOA2U3o5nruYqU3nKpshVxEoG2XTDVIBRNer93gyVc8CWrR4Ujg
 6mvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxzZqqwo1teLj2+e11z5VxlgmrtNlz5T+iiBG4HH8qCvJnwLXmm+udvZqcpfXbwkDPFALwtYVk1Rnbzyc=@nongnu.org
X-Gm-Message-State: AOJu0Ywi95u4ra8LbxE2vFCxTCVBGHUDtietQFMpeBh/Bxmo78i4x57Q
 mxcn64G8gAE+b05LRSP/kLlXzW2bLQRRug+7bnoPsd2z+bQkRwWtEEVZWe17NcLKzduht6Y1c8Z
 ZdlxpYlbVykm5f+iPftqmE4T+pmh1PQemOOMFtWTGjQ==
X-Gm-Gg: ASbGncv27tSqP5Ep4cFoBpOdO0bahOd9fVj2WCDGEFgE9z2d3WpQpSCP04e68iUnEjt
 zwc6qznjUyxN2hDoRd4XQXCr+SM54OBWOOXztx4K/EfiKKsLdJLAA9qwO7voYAKZxEvwNevrmJa
 6bf+iWA7UtHLTfnhW7LqNuw0x2tO+2D31VTFno4HyXpRIMH+6tBG5FolhWHH48wPeDpcaS0QY2j
 WK5c7hyYBVXQWFKMtiPm+WASJft4wzgteFnRkUP1tFnUW0=
X-Google-Smtp-Source: AGHT+IH7Gq1Zbw2YoJORGs3HavzWbAbqOUe73lu9hljJfbhtwrvejjljWaJ5kl2jhEvXag1j4raHGr+fuzkIMl5rvwk=
X-Received: by 2002:a53:c08c:0:b0:639:58f7:f6f2 with SMTP id
 956f58d0204a3-63ccb91b8d5mr6030173d50.45.1760016588036; Thu, 09 Oct 2025
 06:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <CC5A0011-CD14-40F9-8023-8BF5F989BCCF@gmail.com>
 <20251007151157.5a601c3e@fedora>
 <DFAE42FB-786F-45D3-9FC5-C72DEC5A4301@gmail.com>
In-Reply-To: <DFAE42FB-786F-45D3-9FC5-C72DEC5A4301@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Oct 2025 14:29:36 +0100
X-Gm-Features: AS18NWCziaeBCU380HB1vkLX8VJpnmIu0SBEocM74RLlbJr_6YVM8Q34MdZGMRY
Message-ID: <CAFEAcA8LQi+nVztx7oz6yGaYgKvnECj_0Xom3NbxLAFK82hWTQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add pvpanic mmio device for arm
To: Alexander Gryanko <xpahos@gmail.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 9 Oct 2025 at 14:26, Alexander Gryanko <xpahos@gmail.com> wrote:
>
>
>
> > On 7 Oct 2025, at 16:11, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Sat, 4 Oct 2025 23:19:09 +0300
> > Alexander Gryanko <xpahos@gmail.com> wrote:
> >
> >> Currently, pvpanic is available in three device types: ISA,
> >> MMIO, and PCI. For early stages of system initialisation
> >> before PCI enumeration, only ISA and MMIO are suitable.
> >> ISA is specific to the x86 platform; only MMIO devices
> >> can be used for ARM. It is not possible to specify a
> >> device as on the x86 platform (-device pvpanic); the
> >
> > perhaps ARM folsk know better, don't we have some
> > user create-able sysbus devices? Can it be implemented
> > as such, so we would avoid creating built-in device?
>
> As a QEMU user, I expected there to be a way to specify a dtb from a file=
 that could be used as the actual device tree inside the virtual machine. P=
erhaps there is a way to do this, but I am not very familiar with the QEMU =
code and do not know how it should work.

You can generally use '-machine dtb=3Dfile.dtb'. But note that
this entirely overrides any internally generated dtb file
for machines that do that, so for those machine types it's
mostly a helpful debugging tool.

-- PMM

