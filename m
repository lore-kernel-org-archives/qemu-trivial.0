Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C352DEA8543
	for <qemu-trivial@archiver.kernel.org>; Sun,  8 Mar 2026 21:27:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vzLeq-0007uM-TF; Sun, 08 Mar 2026 17:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzLep-0007tc-3J
 for qemu-trivial@nongnu.org; Sun, 08 Mar 2026 17:27:27 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzLen-0001p6-7i
 for qemu-trivial@nongnu.org; Sun, 08 Mar 2026 17:27:26 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-485345e1013so5451865e9.1
 for <qemu-trivial@nongnu.org>; Sun, 08 Mar 2026 14:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773005243; x=1773610043; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iRlgP8G6B3LdQQh2fMfV60imkb6aMf4xZzOp/olhoLw=;
 b=VXveDkjIPiAnY5NIlHJ9g5TxU1XL7B2D2wuUF1cr6S80vnw2fGS5WEN72qcKvJgx/Q
 a7jwXITYApizyh3AwuS3W31N51rorXc8FHiP8OQImW42UW7F1VnlrG8rWlYZwZe2GX4C
 JQlF/fdyfn5u5WoapyBmxvwXcBXfgTGdFqplf4MT3hlv0/Bq7Kmdx/659ddHj9qrPaSs
 bWyM/4b7EkRPqezEClMGN1sVubKb6NeCD3ryALG2RSALZqNZG9NK2nhtJTPg/4WVX2rF
 aIfFXdHjFRQoNwaNQeDiY8FBG6eWSuSvnmf5HfJPLzHxzsONzRUVGr+DDaq3ZbbL8m8Y
 n1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773005243; x=1773610043;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iRlgP8G6B3LdQQh2fMfV60imkb6aMf4xZzOp/olhoLw=;
 b=tS6AI31QHBX74V/w4wUrJMs/JsHGObaVyew4/wIa9TDgw/vCEkYoF77JCISlf6Aoc7
 N3AfcZ5bM+Dqt4u/6ub0sPWU6DH1i0XMHJW9SnWv61bCFaYZSbQJfasP4XbLAhyYtdD5
 lq30hNnlXzHGiwJ93CpPZpPvMd+zsXoptSV+duBxe89ezqIKYdHt8NEpuPAon4H0vbqw
 fvuJ0xZYMQK4/VbvcrqhJg7/mv78Mgl3aV827LhgBlfvw33l2B8Gx6vW6bYMF8SYVG0h
 EchW0cgSJMIU0ToTqlL/TZL8b/LP+bvwtBMTf5iNW9P3/6pyNowdX8yjBx8GoEsgiM/w
 gPCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGaBPy2OtMut5Bj+BPcQhPMA8yl7i9GAibmft/+S89MzbbYzNpVhz/bd5sq++18QD2r46MaVWBN9E+0Hw=@nongnu.org
X-Gm-Message-State: AOJu0YyhEcSu70jGos9xVWMcEnBHV1N5vbZnTdDbnEazx2e21fPc03P+
 UaMLs+491vgfsZAgl0j9/6XhTm9uK4OUEHG+WaHTjdOzhMoc6M6GZal2
X-Gm-Gg: ATEYQzxVxexoGaWCneGkXj2/dTdWm6jxOE3W3uaExUWb46mH/riVI/dLMRmq5k2ks6C
 pcIJIq2+bWnoEAdhnX6rYp/KefvzXLwQJzaOVfDGXyCLUlfaMKWCpbhvBecoQ9AcDuWk16HcRSx
 H06oChhFbeDjdODHTLbMg3J5Cj6/GA4C5fPbd6T2jUYiSaonY5izJ4CkNzJdtlbsrZk5DBEU/FA
 I3dxVf8XW23gKP0bHXROfoBFOTVuClRSaHpIZXzefRs8O9jgie4v7NeIBIfEeHjS+b74mXD7Jyi
 s7yBcpv8nl9GrDS/1WhXTTps5Yxk2gW7aamHW0BlKJc+0Bg2slqZmMWcC9FvX5fKr/OkNyEGDp4
 FxbYMVAwg8W2/7G0clveZqQoErvnV082B8R2GpI8lQrRUTaDPmtEyDAdKoRGgsweB3aNI0hc9Bk
 8MrwrXo/XWQLpJOXKAqa4QM5CNXdov3UjOA9pMCrQAGuPzgPOneCup+sG1o27VadV0IqcPv3szm
 wX/ASDAdaZXfO/ohOSg3g==
X-Received: by 2002:a05:600c:350a:b0:485:3cef:d6ea with SMTP id
 5b1f17b1804b1-4853cefd8famr3345355e9.13.1773005242737; 
 Sun, 08 Mar 2026 14:27:22 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (dynamic-089-012-148-039.89.12.pool.telefonica.de. [89.12.148.39])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853a4be19esm51531785e9.2.2026.03.08.14.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Mar 2026 14:27:22 -0700 (PDT)
Date: Sun, 08 Mar 2026 21:27:21 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 0/5] Trivial cleanup
In-Reply-To: <20260308203516.160103-1-shentey@gmail.com>
References: <20260308203516.160103-1-shentey@gmail.com>
Message-ID: <7DEA8279-1250-4627-8CAC-80714A4590FD@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 8=2E M=C3=A4rz 2026 20:35:11 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:

+Markus

>This series contains some low-hanging fruit fixes I came up with when
>investigating Rust for QEMU, especially QOM object lifecycle vs=2E the Dr=
op trait=2E
>
>I noticed that no finalize methods were called in Rust sysbus devices whe=
n QEMU
>quits, and neither are its C variants=2E What is probably missing in the =
first
>place is a
>
>  object_unref(object_get_root());
>
>at the end of qemu_cleanup() in runstate=2Ec (see TODO there)=2E Adding i=
t before
>this series won't clean up machines since their refcount won't reach zero=
=2E With
>this series applied this additional line will cause various issues when q=
uitting
>QEMU, allowing the problem to be investigated=2E Fixing it is beyond the =
scope of
>this series (and my time budget)=2E
>
>Testing done:
>* `make check`
>* Run imx8mp-evk with a Buildroot image
>
>Bernhard Beschow (5):
>  hw/arm/fsl-imx8mp: Do not create redundant unimplemented devices
>  hw/arm/fsl-imx8mp: Fix parent of ocram memory region
>  hw/arm/imx8mp-evk: Fix reference count of SoC object
>  system/vl: Fix reference count of machine object
>  Revert "sysbus: add irq_routing_notifier"
>
> include/hw/core/sysbus=2Eh | 1 -
> hw/arm/fsl-imx8mp=2Ec      | 3 ++-
> hw/arm/imx8mp-evk=2Ec      | 4 ++--
> hw/core/sysbus=2Ec         | 6 ------
> system/vl=2Ec              | 1 +
> 5 files changed, 5 insertions(+), 10 deletions(-)
>

