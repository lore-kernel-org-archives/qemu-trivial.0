Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C075C44500
	for <qemu-trivial@archiver.kernel.org>; Mon,  6 Jul 2026 17:54:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wgnWG-0004xk-RF; Mon, 06 Jul 2026 13:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgnWD-0004wg-Rb
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2026 13:54:10 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wgnWA-00088A-Mu
 for qemu-trivial@nongnu.org; Mon, 06 Jul 2026 13:54:09 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-664cb440f9eso4083709d50.1
 for <qemu-trivial@nongnu.org>; Mon, 06 Jul 2026 10:54:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783360444; cv=none;
 d=google.com; s=arc-20260327;
 b=X1Q7gP761/+Lt1uDNbOI0G1o3fkR5FjSAwLnCVScOHbI7rK0xjUUP2sLlZtUo3g8KG
 6SSnTD8T18UALi4jLAGL/1zVdSJpL1+JqdCmRO1oBRWHJEHEPuSfhl/RdtEowDhGzLz0
 wiadHlOLYMunYyvnV5qIuhnUArg9QNJoNbbhPJShTlThWgxs21vd0/knBURmCT9HGJyB
 zycfUKq26T0fWX8uk3mOP9AWkvD79FA2g9ePtRk+AjeVRqIfSshdP3rviSYAU3q7Ah9M
 ONIMAsgRyxaBxYTc+IJl613pVostKfUZJr5YoNw7Y0ZMYiFfuhz9qQEMCQkL2KVuBYVE
 6hBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=KPWU9zMPY6i0aneOZqqbvFptRwD37tmJvOurkiWj2m0=;
 fh=YqzB2TYLO7lKSvlDXGHehdCB2ctcgmjFqu6BYdRjROU=;
 b=NeBPwDPYjzntZrCRkt/54mnGLkdlcdTUvV+M5YWeh8Ol5+citR+JVZfPt0jQ53dBsw
 f+lV4kBY1G2q/5zQLkMzdcVymcAKMYgp+xSOg/eIH7evUZTq1eT6pzo0GvpzzSTE7W/C
 ToFKOAXCCdAZdMHPrRRZpBxq60S7x7z1ySmNs9YACaK7cnahyAltkmAcdBPtd3UZVWP9
 t+dqtnoD9Wos5dVlBIDbnKOX2EDUq0yu01UGn4hVMHnIlrKQhLeTZaDIXlK1L1e8Ji9H
 qxPqz8xFl6FG7AtpIGcVTXB/au49A8t0shyu+ckdRW2SPfoH1rE8kDa0u+nJ0aZRjR23
 V/6Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783360444; x=1783965244; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KPWU9zMPY6i0aneOZqqbvFptRwD37tmJvOurkiWj2m0=;
 b=m9fAYk5OwB2kPQROqrNY1pAE3F5tppIxqzE9HAee5sFhBOmBlB/tGwDwTxAulB9MV0
 vLt+1zbr7dBXfCZZocDTaQ4LrhFZZ8/QXorZnU1KZxwXoJP4mvYC/W5GQCwTFa4Zrjil
 UGtVW87pzlp2isuAxDSRTIK3GHcqfa9e5EaGDexK3AScv/rrQii4qZRCPW6zjlj7cbCG
 xn+rUQde+bAvbYO3h8qoXB/f6RE6P4MVIfSxVKGa98jFhdGqapNFy9SG3IJ2a99IloP5
 cJuGWnd1f+MPv46yRxfM/14Xro9/FZy5Nfe0SlbgEq+cOZsKcJMMwXKsyhnx0yqZZujJ
 6qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783360444; x=1783965244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KPWU9zMPY6i0aneOZqqbvFptRwD37tmJvOurkiWj2m0=;
 b=o8DqiJoYq0k5gzqUCFphOEWa7ILUIRW/OoFGFpPx6Jh7eN1NULNHIpPFv7Ue8VWBuK
 1/rqBcV3JV47Ewev6x+gudK+ej1uy5beuOBk/jO8VIz2+XXCYnLLDob9avGNTnYY9HBy
 /pMDGVfkd866rIRPJCUIWgvNRqGQuIYqi0eOPaJ9+tMuYupKE2TXo0Cy7eqjG/vV0jGq
 8zhUUQ06cHDzdOfghtjWTAIZAHHBKXfybqWaQoLphxPYlYW6kW6Pu+fgMqIBC/qqQEoC
 wOhU/kZQe3ifFnf29iTzAOs9dz3NEtbreYSxun+EL6q5J3PfZrJDEFQmX6z0DfmefdqW
 eTeA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq6MCr+4Zp6MeVKA5K69vlhsVvh5a2P9njs7uvSFZWBao23PCTU4JtSbj++kLvdiJpMdLJiPkvU6QmdZ5g=@nongnu.org
X-Gm-Message-State: AOJu0Yz76MQZiwyIlMRC8R09bQ+8mWU0ah2UVN1lAkyHdqn0qr8kDnec
 CvEfpJdf7HjCoe8/1raDN+NeXPUDwHeU3yRAj5Ah5FhDxPUtGhgW4kuqb7l7HnteYkh5WnOOjaE
 JTOfPeUvzReV40mqlAHCptWEGge+PhzBMJIJLx5crZg==
X-Gm-Gg: AfdE7ckYLT2qU+gZ7bIkX1Am6oC7KqdxelAtpatagxcaaVCQPhLSCuSpR0eBZpdHVtJ
 DlJgwZAZHAMx67yy25nCGkW2+biArGej5VXC29dx0NQqPpp7xvrHuJtnyWHvuoC/+z34SnzzvJM
 /VPf6TyqHFz4RHpkgU918M+NsoeT2a2aA7lmRJUgfO93VV8c38PKqaybF/rsbUo6i5W5M0d8SH/
 T+INWoPJHMTSz9S3JaUOrbSUDH+o99J6rtAjIBK4tcIYGCCYR5br73fd5bqLg+CkOplekyv3Cof
 kGUE6ioAcg0NbxEKFndcsy/o2auvgD4UNXxNH72mJRlY0oz5SpyezL1W
X-Received: by 2002:a05:690e:d54:b0:664:b27c:2b4f with SMTP id
 956f58d0204a3-6677fb0362bmr1453001d50.5.1783360443902; Mon, 06 Jul 2026
 10:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260309181452.83702-1-thuth@redhat.com>
 <00c4ab4b-a58b-4de4-8e41-566b2cb7f920@redhat.com>
 <124bd918-f2ab-43e2-bd2d-fc824de62c40@tls.msk.ru>
 <fcbe3d7f-64d4-4b13-b930-a81e77db4784@ilande.co.uk>
 <df7a091c-a8a1-416a-acf3-28a0cbd8dd2f@redhat.com>
 <c7d6b801-449e-4f55-9c1d-ebec7a0e9595@redhat.com>
 <c0cd50bd-e054-48b6-af54-1050e13bb720@ilande.co.uk>
 <baf0b727-d53c-4717-b4e8-9c8603b2fa75@oss.qualcomm.com>
In-Reply-To: <baf0b727-d53c-4717-b4e8-9c8603b2fa75@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2026 18:53:52 +0100
X-Gm-Features: AVVi8Ccn38g7Hit4O71HuRDN6SsoLBDmlWqjIzpdjYQIdM1Emf0YXyQjCdJ7I8k
Message-ID: <CAFEAcA_oFFEyRfXjRZR7+nLOE5fgzDi1kHQop=s1Q4EzYvaVxg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/sparc64/sun4u: Mark unusable PCI busses as full to
 ease device plugging
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, 
 qemu-devel@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Mon, 6 Jul 2026 at 18:29, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
> - Bus capacity is odd. We have a generic Bus-class @max_dev field but
>    do not use it with PCI variants. If set, it limit the instances
>    capacity. The capacity is tracked in the instance state, and when
>    no @max_dev is set the only way to mark a bus full is using the
>    qbus_mark_full() helper. Then if we remove devices, the bus remains
>    full, and there is no helper to restore available slots.

The qbus_mark_full() function is intended for the use case where
a machine has a bus which in real hardware is entirely internal,
so you have something like an I2C bus which has some on-board
I2C devices connected to it, but there's no external socket
that the user could add more to the bus for. The idea is that
the machine model creates all the devices for this bus, then
marks it as full. The devices never get removed from the bus,
because they're hardwired in, not user-unpluggable.

thanks
-- PMM

