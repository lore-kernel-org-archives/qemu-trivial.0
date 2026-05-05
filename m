Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE86FF885A
	for <qemu-trivial@archiver.kernel.org>; Tue,  5 May 2026 08:18:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wKAzD-0006tK-Hq; Tue, 05 May 2026 04:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wKAzB-0006sf-LR
 for qemu-trivial@nongnu.org; Tue, 05 May 2026 04:18:33 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wKAz9-0007aN-O6
 for qemu-trivial@nongnu.org; Tue, 05 May 2026 04:18:33 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-65c364b893aso3523535d50.0
 for <qemu-trivial@nongnu.org>; Tue, 05 May 2026 01:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777969110; cv=none;
 d=google.com; s=arc-20240605;
 b=jIeYqOzQ8T4h+chDQ0DPLFOQV7JvzAwFVVj4ps+Vwwd3TiMA/De0nHxdpQrD7eDOiL
 +xzaj1nRn277Hk8FC4TG6eI7mT3ANvHXz4vFG4KIPxNxTJAyxdqSmDuBEBhYtHGlsZjJ
 RJm5r49HdjWHClrAnhlXS4WEx9fq6lW0A+AIehM47Tpi2ka1iS+9j7KWUoM7ljD4lXnt
 PLNya1NYyFkP7rV58CtyNMeMMSFsi+2+ZuiY8KwAdg9yZ4v/30jUM5vCYxK6vSeW0dyB
 lBTGNSo8xFFqGfxcz1OjKi31dbw9EKOHSsDArk1ZiaHN712s6Rlq/9c0JKP7XpIZ5cUK
 W3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8iACR/gHRLBBLts9Z7rvitoq9zFPlMAA1icxYCWfZ40=;
 fh=a0iOowalELMxWCeLJtiNwp4Y6NeOLvQdHmWoLVQzR2U=;
 b=E292yS+J1FqlT+rjPfK8FTG8KX3+Iu8jXb8c/QZqUe6s70TdIo3uyCerju4t8kYeRX
 NaQnBhxk/nuqJBmha52z6OvmyW6fLc7kTUIsAxH7ecjkGNSU2qgQ4tz06j8IANRtnUJE
 7afB9Wk7kR/2+AeJjvL+e1OO5TnieBS/gNdyLFWGboLAmhzcwGVRaobxiiucBZGTmcgG
 dOWVoWt6iPv+UPpBQp9oTNy29mzn+BPuqUOrrj/+yarzxg4UkRa3gVb6iwNpremYTImi
 7B8iACJg/Z+libW8dmTNq9U7t9/4+IIr7zwYmyZTnwxuy1MkbqD5jlv1QHgEqfH5Tzsa
 XpOA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777969110; x=1778573910; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8iACR/gHRLBBLts9Z7rvitoq9zFPlMAA1icxYCWfZ40=;
 b=aEwM+vOy/pueg9MJseugP8GoiWGUsitjro62CaY0DxigCOwb5YRxlXn0e/YpCCGJ4G
 Cht5ykdwGB1HoUC/n9po8cGcm36l/vkyy0z2lXMn46o2RVpbhJEpLU+UZyVuVQLVe+ee
 VSZHdaxEUiniJCG70hcDC1N/A0B0/d6vCglEZj4Fc47ROMkhub501mlCxhQ5+dc32Web
 0xYQyEf1s6QXpF6ZTBMLc31nfvoBEaRdhDjGjdsseYVoTTh0jGBTzFnT3m/o+TUOoGcQ
 cYqArRym/XuCtqvfjze4+Nuli2nsvTYqAPum0GW9SMpWCh3ZxVWlzUoGFR5cqF0qXeTu
 kJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777969110; x=1778573910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8iACR/gHRLBBLts9Z7rvitoq9zFPlMAA1icxYCWfZ40=;
 b=BtFfoomCZwcJ9w7a3mJ6Hu028oy2NBORh3m2SncJ7jS3sqjQIr6+9fPadsVfWazJd3
 yfZCNChCE79kfmXwwhXE4iNB+VQJBFLYGuP5LSi+w0zq7/PQcffM9kKFCREH/a95qLQ8
 zd3fwSx3Xd1DHpOEFSaAxi9iBxQFUKE1Gjj53ZsiE0WBo7PRHLeeSjrpO8cYY9TETM7a
 /7/dOz5r04ZPt4F72lithkjZlOYACLEjlrVJWSon0Pk1uD8ZVzAuX1geA7hxP0Pp81mt
 kyQ3bUgL4oTF5RVjaysjDqzwHU7pWsQKyTvbFRLRxgi4I3vYw6sHXlYItH5yZgsPJG6s
 yaqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ91lj51TwbZNKAkctma9x9QIDoIcBCQVvcSu7tLH+6Dq4OY6zJlOXz8CuMXF7MTa5VtB1rDS5RlERb/xRA=@nongnu.org
X-Gm-Message-State: AOJu0YybyTv96RePi+/OQOm2xyvKBcc+v/ff8BHIZp5Ja5YcYp+MgyIX
 d7k08+qJjZq15Tc+B5PcxCE+rrnifywo+PEYc3aD1o1PzhVXmyX9B7CQ5J8vBprwx3eBWaqyHB5
 Dksc45IxZqkcWPuTILGO0a+874g2fud1Uo2pFpufhGg==
X-Gm-Gg: AeBDiesA8yOuua+oBSwkI6tf8lN25aSF9RsvIDDv1kC00bCa7c3Jpdv4UzU3rYPVtIl
 HiyEt1tMJDV6w7whsdyMaR5jLIrsMZazSpRcTxKgTJo3UK09KmgNr7ZOnEKrnwb+YOBWRS5rzJu
 frDg7w2GeEPWzDjejSuhb7T4TPscQMwMQHWyJX7ZXOW18zaRW67+1+He00CMo7NT0sWfLZwjp+r
 wnmg4XGvScchnWb+weY5O92Up1sP8CvVXaPuCbyBPHGqpXTevpw0bmBiCFGAer2q5cQLD7d9Tkh
 8dWhLrMI/sUztVUHwrxKXsekFp+X4eehM3Yuma/iDO8cW6ZqJ/lVxjaZPBub0wwGD/RqTqidNKY
 3+g==
X-Received: by 2002:a05:690e:4011:b0:652:e4d7:248a with SMTP id
 956f58d0204a3-65c3d974010mr13245379d50.7.1777969110486; Tue, 05 May 2026
 01:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260428163702.3224323-1-thuth@redhat.com>
 <64e966e3-8450-40ff-98fd-479eee458b38@redhat.com>
In-Reply-To: <64e966e3-8450-40ff-98fd-479eee458b38@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 May 2026 09:18:18 +0100
X-Gm-Features: AVHnY4LSVjlAJniKh1AmKHkUxMDgBbitlvx7573C-CFsyHsZ5FjbaFQbRIkZO-M
Message-ID: <CAFEAcA9HGWgJYvU_GVZCsxM7-WaR5QuwLES8aetPqD9jaLKr_A@mail.gmail.com>
Subject: Re: [PATCH] hw/vfio: Drop superfluous inclusion of hw-error.h
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Alex Williamson <alex@shazbot.org>, Tomita Moeko <tomitamoeko@gmail.com>,
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Mon, 4 May 2026 at 16:04, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
> On 4/28/26 18:37, Thomas Huth wrote:
> Applied to
>
>      https://github.com/legoater/qemu vfio-next
>
> Please base future contributions on this branch.

In general I think it's better if we don't have odd subsystem
specific requirements like this. The general assumption for
QEMU patches should be that they are based on the current
head-of-git. I don't want to have to remember that vfio
is weird if I'm doing a patch that touches more than one
part of the codebase. If you're accumulating so much
stuff in vfio-next that it's problematic to have new
patches based on head-of-git, then my feeling is that
you're not sending pullreqs regularly enough.

thanks
-- PMM

