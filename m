Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9A2CCD183
	for <qemu-trivial@archiver.kernel.org>; Thu,  9 Oct 2025 16:37:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v6tdO-0004d3-U2; Thu, 09 Oct 2025 12:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v6tdN-0004cK-7s
 for qemu-trivial@nongnu.org; Thu, 09 Oct 2025 12:36:53 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v6tdJ-00033X-Mb
 for qemu-trivial@nongnu.org; Thu, 09 Oct 2025 12:36:51 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-635380a4a67so1474860d50.0
 for <qemu-trivial@nongnu.org>; Thu, 09 Oct 2025 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760027805; x=1760632605; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ISEsDYfRJnbaETlfdvzNPE2SdTEJ/sC4RuJ7kNzR684=;
 b=Aqr9ue71Q5OgfWlbbubqPYe0NVPAGiEb23QrcomJD0PTkIN/qY7sgO62yaUYagHzAX
 VQBAp//Vfhg6+bPyOKf1CCTI7zgDd5szAdvYg4q58dn6y6vB057ij7ucmVd0uouZ3GtT
 1lXiyapMEyO2vnngJ6rvzftw5SJz81pFOrYVItCJ4He4RTQy+h3MqTI5C6De8oGbV/kZ
 NwrLh2GpGiFrljHn5uGkKgcP6QpRyQnXnqWhbbgKawb/mhqKSvnBd2HJ+uutlQGjSHBG
 P2USOtsIlIoRjuP03NDjxe9dEvBaZJ/jL7sOulpNW+177mj0Haopr45eZvbSusN1OLPF
 HQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760027805; x=1760632605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ISEsDYfRJnbaETlfdvzNPE2SdTEJ/sC4RuJ7kNzR684=;
 b=LSfowEl8RXiZUr3o+jtf+T71lotXRpQgwHJ6lJK49m01RWu1i3tO+QpZbn2aE8USxa
 2UGfA1i1XJdk/Hwpqs3OsrlBbo3ON1ACwpt6DW7PkU8WR3kiy5Mh47CTRMUsPKUAw5zg
 Qpf8MimE7Jy4HFbsA7SRVUjwrZlkg6rQ8MIPKv5Vfaj2PxK6y34g7EY9bAH5oSn5Il+A
 ZEHbHU0yf1Eg48DJb0scR9+MTU8UR2N4BzM0RrjHgRQRxhRQpqUCWqF68RcvrThPV+W6
 haIN9VaQ5bqBP6hEUzAS81zY0674BuCH0hOumFVS25EtPFYpP7yNnet4M85Kp3IIeOlG
 b5Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDlLBP0TXBsuqYluniwUpTNzCRIflK4zGiBSBus9k2EBTaG6fzOGlK6HpMKisuq8VkbGUambx3tTd9MlE=@nongnu.org
X-Gm-Message-State: AOJu0Yyi+qRGcphnUhq1cLPQ4ybRLNZe1zMMkJBAt1jC+gdM8uhRLv3T
 4yRPknTFsd8bxQbVzcXdkviTADf09P5kUNUqT44Cwq354yuSf+6NPYdUAIzbKyVIUeL/CRbaRqj
 EkjkZvs/xoSIaReeyf3J8XPTJv/NpZsATqQiHMpqhPg==
X-Gm-Gg: ASbGncstMBDXfxxsoe+JyU63sahztsbX3OrKMlU/E80NqqZDV3RLVA7r/0mmIzJW/yI
 KuH3NBGK9wL7oZ2vWuwZNt0woD1ogQA+4H73iqoAW4qm7hPgN1XgaJznNTrYktQHHs2ZJRxuugx
 3tvKiioaiSQAAUMbj4xyzy3sel2HGaIi1/M7bOumMD5IS7PRTZxfHqbi0DSPrfjo+aH5DxYRq+J
 2j9uRENkjenJG8D7ZJsSRT6uh13UhSXgjMERdJtgiYt+WQ=
X-Google-Smtp-Source: AGHT+IEw/yhF5vDCekLi1qi8P1pXjZwKXAGi+Q6H9roUj5HpiPiTJWyElrMvreoXiX3zq+crX8tGdlMTs38ymEP3d8I=
X-Received: by 2002:a05:690e:1597:20b0:63c:e3eb:20d2 with SMTP id
 956f58d0204a3-63ce3eb25d3mr1755504d50.52.1760027805485; Thu, 09 Oct 2025
 09:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <CC5A0011-CD14-40F9-8023-8BF5F989BCCF@gmail.com>
 <20251007151157.5a601c3e@fedora>
 <DFAE42FB-786F-45D3-9FC5-C72DEC5A4301@gmail.com>
 <CAFEAcA8LQi+nVztx7oz6yGaYgKvnECj_0Xom3NbxLAFK82hWTQ@mail.gmail.com>
 <9961189C-3A61-4767-B620-C1B7315495CA@gmail.com>
In-Reply-To: <9961189C-3A61-4767-B620-C1B7315495CA@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Oct 2025 17:36:34 +0100
X-Gm-Features: AS18NWBWMXORa97Z_ZqOOS4TVdnIUCgwIy1rK-0WLB6wkXfqAlO8fskLRcDOrAg
Message-ID: <CAFEAcA_t3zFfSiVaY++N8Li=tLv3hOpewZG1vB_OyKY2cWuwXg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add pvpanic mmio device for arm
To: Alexander Gryanko <xpahos@gmail.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Thu, 9 Oct 2025 at 17:30, Alexander Gryanko <xpahos@gmail.com> wrote:
> I added '-machine dumpdtb=3Dqemu.dtb', then converted dtb to dts 'dtc -I =
dtb -O dts -o qemu.dts qemu.dtb', added
>
>         pvpanic@9060000 {
>                 reg =3D <0x0 0x09060000 0x0 0x2>;
>                 compatible =3D "qemu,pvpanic-mmio";
>         };
>
> Then I compiled qemu without optimisation and set a breakpoint in =E2=80=
=98pvpanic_mmio_initfn'. It was never called with '-machine dtb=3Dfile.dtb'=
. 'info qtree' also does not show the device. Perhaps I have configured som=
ething incorrectly?

QEMU's virt board does not read the DTB and create
devices accordingly. It creates devices and writes
a DTB that matches what it has done. Editing the
DTB but not QEMU won't cause the device to be created,
it will just tell the guest kernel that there's a device
which doesn't really exist.

thanks
-- PMM

