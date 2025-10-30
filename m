Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47BECCF9F1
	for <qemu-trivial@archiver.kernel.org>; Thu, 30 Oct 2025 10:35:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vEPzb-0007Jy-2Q; Thu, 30 Oct 2025 06:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vEPzX-0007JT-Gg
 for qemu-trivial@nongnu.org; Thu, 30 Oct 2025 06:34:51 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vEPzT-0006NE-5M
 for qemu-trivial@nongnu.org; Thu, 30 Oct 2025 06:34:51 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-63b710f276fso1008226d50.1
 for <qemu-trivial@nongnu.org>; Thu, 30 Oct 2025 03:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761820476; x=1762425276; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ml6eg+Tmu/BgLj2QP9vN9SPxD3OHP2zjlRIa758b6AI=;
 b=cWjq+JxDJlNAifTH/4vvEhzYmHrGv8tfXbJALCGsRy5IgzKN6/++n99EAUIkcrGwru
 nq3kcPuhoiJtPUDmpEwQuE1pHd4skhxRPEF9XOhE4Xah14CIETvtcdLOb/VIfMEKsV9M
 qePRdAx5VnfgmmiE2C1sDxKsgFhIPiknyl0muDz/vfFJVozJ7XP6pxEpDVxZawEx6UAm
 RQjbTfkA7CqhoCck7zfFLkURzP2ha6fO2UBT2JMyKHos19mcVMApotvDeQL8uB0FKn/4
 Zsp2wqeGerR0rFV8dzjr3h7lgOGD07ERgJ2jvdW55HY6r4fi4H8QUcJjTV0G2RBon0rI
 SQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761820476; x=1762425276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ml6eg+Tmu/BgLj2QP9vN9SPxD3OHP2zjlRIa758b6AI=;
 b=Lnscfh+fwgfJ59SG8mB12GR0TOz38Gmlr6XyW7Y0fB8dEX0NbQBSzkYzTfQbd6I3tE
 1gLNjcR3rXEzM6RHsAmAo7BXunVOQDR1bbCLf24IFjTj60P+cGWR4TcDyLroWKr+Y/ME
 DvKix1eE6EwzX7meeXcqZerwqDYSZqyV3jadYBYRStww1RYGvjybQ9U2JETDM41oYHqj
 ZQUX8P7NCT4+Sd5n8k2EhvAWS87iq+gVddz/SBTM3IhZxLWbdBr5NmE+FGz2E0rxYhq9
 9abJ+BE0iAUG9eBw0QlZEae1z527Hs7jw9fW8XkZtXHvxKC45iORbmi8RRoBXfeCPi8/
 x47Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvGuo3M2gXMLFDgucVMdO5UNa6vSHYATd/xIaLnwq78UyaiLg/1LJa1xrozj1ED2rhf/MXTKxJXb2z/i8=@nongnu.org
X-Gm-Message-State: AOJu0Yy4rgnq5dae0MhoqwqCJp1b4vYaarySZT0j9H/AiWKSGkdovReY
 HOKWXIN2c7aVO4g22Tf6lNtLQc30GnvN6qBrpSidxZ3llzGq6Ooe+8UQURlSJCQ1LDuMJCbqPdx
 A5O1IlnOVfD2XZiRgh7V0+b0oYYnx841QyGusl7ldcQ==
X-Gm-Gg: ASbGnctlodm7eHdo7gwKIqh5y7Zk2PuOJnhKCvCxyWr7fzM+G1C3KI7gRXe5ozqj2IM
 uXu0yZPRbbf9UFYzGcpSuxFtBqIzcZQE0jERD0c781jrPyax0BbAv8s/krbSNkQUclbU9mLO+sF
 YYFHuxi3Oa0DW39CddXg/LnuANMrUoUqG0FXNCyF9VAkJvjJQUWpZquIpjJFLwVcI87qG6V25cY
 TboSiCws8s++UMl0fdkuaAfwONkWChQHwDZ+uM+zstiSexSsi9SuARE3GqVTwz1U3Jr9S+p
X-Google-Smtp-Source: AGHT+IGbh7ailHjah7nGH3PTBRa4asYxDwZJ9xcBgctjAdDUgN4OoraE6mwEi7qHip0qpkIY3vRdahn2w9Lc/Fpm8xg=
X-Received: by 2002:a05:690c:9b01:b0:781:c4:b61d with SMTP id
 00721157ae682-78638c384bdmr23335097b3.0.1761820476083; Thu, 30 Oct 2025
 03:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250922065714.93081-1-nanliu@redhat.com>
 <CAFEAcA8pLFu6eOK5N+E97qo5PCp3OW3BRfYNSEL7=YQS6+eh2g@mail.gmail.com>
 <fcf01a1c-3503-4397-a41b-d453ca2b7df9@tls.msk.ru>
 <CAFEAcA_BR4VEsZrq1eq19E6iguk49W=Fx2OKQvkvTZ7_6Pd0KA@mail.gmail.com>
 <CANUVZAznv1aP5DH6pHEQBZGxczkoNVQfKR5oOV7eTyrk4rVrpQ@mail.gmail.com>
In-Reply-To: <CANUVZAznv1aP5DH6pHEQBZGxczkoNVQfKR5oOV7eTyrk4rVrpQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Oct 2025 10:34:24 +0000
X-Gm-Features: AWmQ_bkczGM6rHZI6dp7KcU9eVhqFtDTZEr-wkr-swS78P-do5l3GS0Y0lMSBrA
Message-ID: <CAFEAcA8mC-VbD-29=7XLMiEQ0yhdKAaHzxWyKt5NXmUsjHgmBA@mail.gmail.com>
Subject: Re: [PATCH] docs/devel: Correct uefi-vars-x64 device name
To: NaNa Liu <nanliu@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, kraxel@redhat.com,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
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

On Thu, 30 Oct 2025 at 05:47, NaNa Liu <nanliu@redhat.com> wrote:
>
>
>
> On Sat, Sep 27, 2025 at 7:41=E2=80=AFPM Peter Maydell <peter.maydell@lina=
ro.org> wrote:
>>
>> On Sat, 27 Sept 2025 at 09:48, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> >
>> > On 23.09.2025 14:57, Peter Maydell wrote:
>> >
>> > > We could probably also correct the bit of the text in this file
>> > > that currently reads "depend on SMM emulation on x64" to either
>> > > say "x86" or "x86_64".
>> >
>> > This one will be a bit more than trivial :)  I for one don't know
>> > if this is related to any x86 or to x86_64 only.
>>
>> I just mean exactly and specifically the one place in this
>> file which says "x64" and ought to say either "x86" or
>> "x86_64". To me a single word change is pretty trivial,
>> especially since nowhere else in our docs do we use "x64".
>>
> This is to ensure consistency between the documentation and the API code =
(var-service-api.h) parameters and json file, which use "uefi-vars-x64".

The device name being "uefi-vars-x64" is unfortunate, but we
can't change that. We should be consistent about how we talk
about the architecture name in general when our hands are not
tied by compatibility problems.

-- PMM

