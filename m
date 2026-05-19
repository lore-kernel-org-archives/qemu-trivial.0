Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9B0CD4851
	for <qemu-trivial@archiver.kernel.org>; Tue, 19 May 2026 10:33:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wPHkz-0001a9-RO; Tue, 19 May 2026 06:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPHky-0001Zl-1F
 for qemu-trivial@nongnu.org; Tue, 19 May 2026 06:33:00 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPHkw-0004fa-74
 for qemu-trivial@nongnu.org; Tue, 19 May 2026 06:32:59 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-6313b7e3d03so1991786137.3
 for <qemu-trivial@nongnu.org>; Tue, 19 May 2026 03:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779186777; cv=none;
 d=google.com; s=arc-20240605;
 b=I2vr43grHCYbrR3G/Ru2MZFmx7+eOf295xdFGbC4WgVtDT468AB6L9gvT0Aq71xB+s
 fDToRrv3MvRhC/96RE9FhWENlvol8+cbY9ZViWYgQMe45EYYCVnYjopZzas0OysPMU+w
 ruRIrQtOkXuOEAfQrvRCx/Q3VBKdWFIdLpD6qPTByCh8mOAc0avT5ApMtmFx4nMSNKNM
 v6rIaMGxy7bvY6aLzTgcKRLdCieZdPiknofUpyi2vsmArbYLhL4OQHMUK1LqhJ+VPkI3
 7u+FkdiPK3FIXp0jbGheniDM8H2D1xshATVD8CSBba4kg6+ng5SFGHrLExPTN6OGp3/5
 cwZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DjFGDO+rJPTxAOU1tv6enj69fI1k+YxVjY85n3Po5FU=;
 fh=lG9oiaBzyGcd5Do/pLK/CFJZKnbQltxmVYdOCpNeCus=;
 b=EeBicXQxgZJwVZ1ILEtKW65nw4J1kCpLvf6mME/p4p1tPhG7pqendFecsDAqx66e17
 LUclZVZiS8PRkGPN1KzZxqon3l04LdSrLUorUrOVdKRJxsRKSXK1YcuTPZxXkisc/Wtj
 Zxn21X7Tf5l4aX4LP7Dnz3lbCz7tywNpmzSbWiF/GnBiOW6jiPQf4dCJRBb2/mHGOQlV
 KzjTIxCv1x2gc2RZH1nf+GGg0roIOguADs9R7u9wM5coCrq0SUPwDiiIQBl9svZLF5Y4
 hJ4lF48R/wpEflOXJreysHz93DhVmXNuvEF5i+3DlJStY6vIR5DUTb2FQIDsnaeLAQp9
 TIHw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779186777; x=1779791577; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DjFGDO+rJPTxAOU1tv6enj69fI1k+YxVjY85n3Po5FU=;
 b=yDliAAt6uP/DxaIeYkVYPKH+uCT7a+9eV5GaFj++OLMwvcZQESrmOtWCQ2I24mngRV
 mOz3/DhqUctaGTFvBpGay7LAZm0w/CJ84vNTnPWUXPfyTDDk8KOXjmrEnr2gmJRFO1nh
 TzmQjZY6dSmcM0T/HDyGkl6lEX09Ui7VLraLDnTSwnpPRy9dTSPiGYSYsa5g8kShRH1X
 23boB43+rSGUV4BSwa8DfTmTE4ZKixQlDpwOE5ilkXI7QXoGepWmvFJyVETC3siXs55o
 zsiLjnT+MiMH8Igf98dLG8eOvQEWMSbavejoVpZH/gncyPtri5V2Y66mg7TkmwbmWUOQ
 HKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779186777; x=1779791577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DjFGDO+rJPTxAOU1tv6enj69fI1k+YxVjY85n3Po5FU=;
 b=cjt5d7Hre/VPRddfwXdrY+kVRQ2/Pa9iqhgdJ1c2+iRDx1RlpcCWH/RHMfpg/k+vhd
 nXyPc1W0C9j5ObMWRYweT+XUuJ/+z+8ykgvfXkdOadf/luzJB5ZMChm7YasDahdVzJk6
 elvwfrvV5eFKVhawg7/21nhl/VUBA4qO8SeYPnVRNpmtep8bgOy3MQZ+r8UZGrglykRq
 c5Qmzvx94C3hzWcuq0VBD4ako+6jhTdcp8NW4pEzvRlYHIn6PpepAM00WDqX+OBI+7Eq
 2QvEJ4l5i+cqztQn9CPW/cmTeE11fL7PpkONC/HGOlL+mjv0bP6pw+OSZ57D4hZuqSC+
 NAVw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9S7y8FQX0ZBxVXEwASjjbuu8cz5p7rFf4KB9IS8WUpVW9vxDVNE7SqZt4kPKKqA8J8L3DDFBydNI5vhVY=@nongnu.org
X-Gm-Message-State: AOJu0YzoMZ2N4ffMlQY8k1xMhOXcqWVx5zQk3guTR5nBuxdFMknGMMk1
 zM7GYyKtkxchRnOPpN7q5hcK2FYQYaMvJiK8DN4ebuYHUR0TB9tMMoZDLU+DA7XaXMlV++HhfeF
 iNC3Z81/8Q6adQRji6EDKNsNdpa+kmGxmut0u1u+6qX8AGhJiZJYx+AU=
X-Gm-Gg: Acq92OFDeB+UiWU5ixQA1PLSV4LHXxD6yyOSINllvOG9vKhxKrefFQzvLd9U0XGJnA8
 DaQNHwfToFUprINpTcQm9DFWqO+6/BJgLFYkgDzV2JL2dR1NL97Y4tNbqxQ+sOfqk2F2474pNQX
 ikgFwZk2MScN6poW7K7GUUS2rXOe8RrTfjxR2UvpPhnBym8iGNmx+96jnieveoDeFo9Ot8qxcEX
 YzP2J3Ez4SS7HEtypc6hByLqvBpg1sNnyrIR/kONto0wImxLN3OfwG98AwfVbJUeGQOIREDihaS
 bVsXjcEtLb4F3LS9OGdQ0QraU+Hst1rmbe1AfHXrEDYJFb3akZFxuPsvgrP9ZPJBCsM=
X-Received: by 2002:a05:690e:1551:10b0:650:5316:1756 with SMTP id
 956f58d0204a3-65e228a4ba2mr14812476d50.57.1779186107206; Tue, 19 May 2026
 03:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260518160255.1844308-1-thuth@redhat.com>
 <ags5_IDkvxClCdHm@redhat.com> <ags7xIsUG2DqX5vu@redhat.com>
 <dbc6464c-2685-46c4-803c-6af53d345083@linaro.org>
 <c9fa27e3-0939-4490-b350-7a625ebcdcdb@redhat.com>
 <b70b35ef-1761-4624-9f98-7c1ae161ed9a@redhat.com>
In-Reply-To: <b70b35ef-1761-4624-9f98-7c1ae161ed9a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 May 2026 11:21:35 +0100
X-Gm-Features: AVHnY4IDai8ohiPPmfUsi6sgbNhGbbfI7LCpWhYitX_rzPXlm_IUhss04yTv4bA
Message-ID: <CAFEAcA9JaXVTNbAXbaTDM-bN=HEZHEX6+cDLiTx8n2=Di04LFQ@mail.gmail.com>
Subject: Re: [PATCH] system/rtc: Fix a possible year-2038 integer overflow
 problem
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=peter.maydell@linaro.org; helo=mail-vs1-xe30.google.com
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

On Tue, 19 May 2026 at 10:27, Thomas Huth <thuth@redhat.com> wrote:
>
> On 19/05/2026 11.18, Thomas Huth wrote:
> > On 19/05/2026 10.24, Philippe Mathieu-Daud=C3=A9 wrote:
> >> "32-bit *host* OS".
> >>
> >> Per ./configure script, we still allow:
> >> - x86_64 x32 ABI      (CPU_CFLAGS=3D"-mx32")
> >
> > We should maybe deprecate that x32 ABI ...
> >
> >> - sparc32             (CPU_CFLAGS=3D"-m32 -mv8plus -mcpu=3Dultrasparc"=
)
> >
> > ... and that one as well?
> >
> >> - s390                (CPU_CFLAGS=3D"-m31")

> > Uh, we really still allow 31-bit s390 hosts here? I think this could be
> > removed nowadays, also upstream kernel recently ditched the 31-bit user=
space:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> > commit/?id=3D8e0b986c59c67e08ada646249f834655a9e6da16
> >
> > Question is whether we can remove it immediately, or whether it needs t=
o be
> > deprecated first?
>
> Ah, wait, we completely disallow disallow 32-bit hosts nowadays:
>
>   https://gitlab.com/qemu-project/qemu/-/commit/372ec46b9f1215f48a4717f2b=
7ed969f65bfadc6

We relaxed that check before the 11.0 release in commit cf634dfcd8fc.
We require a 64-bit host for the emulator binaries but still permit
32-bit host builds for the tools.

thanks
-- PMM

