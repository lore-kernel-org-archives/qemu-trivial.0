Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE11C44500
	for <qemu-trivial@archiver.kernel.org>; Tue,  7 Jul 2026 08:20:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wh12F-0004wN-6N; Tue, 07 Jul 2026 04:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wh12D-0004vo-Qc
 for qemu-trivial@nongnu.org; Tue, 07 Jul 2026 04:20:05 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wh12C-0007fS-6B
 for qemu-trivial@nongnu.org; Tue, 07 Jul 2026 04:20:05 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-664bb15d05dso5446260d50.3
 for <qemu-trivial@nongnu.org>; Tue, 07 Jul 2026 01:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783412402; cv=none;
 d=google.com; s=arc-20260327;
 b=DB7RC2XChE3OtigyoKrzqxYN/5tG5gBeLVbWgE+13tQtCN6TTcXecEn17Dw5bzoc3m
 u3zrYGKmnN7WXN+iIjH1AZKw+d8LHxn5Ju9n8tobBcPRY7UoifEuPyMES7t8nI3eJvbk
 rUKhzoqmHDabc4OefqMLPBukdgRNx4mEzmi+HzkhrpM6UDBVkwfEdai/TP5TmO8sgEFY
 0626CMQNzzJYwUxCKLB3tFX3uISb8XpiiMqW1gKoTTxC2bKO3c5r7qoVISI1/rc/rUh/
 x5JBRIwnOFNAyHOFWJJ5kP67SYRXUwTh/9AqW+BW7MLt1wPmfsSMfh9K4ZnDWOlBky/b
 kJWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6s+ViQ7C6cdtI+3yrPoDRiHtXxuyrUpD4TQFZaKFH6M=;
 fh=OKGIYIp9mjPaeUWSJPRSf7aPXMX875Aoru8leBxWWkA=;
 b=hE92rB/+4lNMAPFvtoETe28Y+pR8DXcXbfHEQGReZZurwwe4S3FwQt1V9t91p/HYpR
 j6HTQ4Qs6iJ3SXuBYIfB94USTIqnfgvebRfZt/nyID/Zn9r9q9GDdRBWrjDe5GXAms2X
 IZ1gZiI4bDGgAe3QkGIZyd69BQtAAIP0/dZSynFWtIzZ29erhxfSW4dAe3ZploUNFXHQ
 i1H1GGy6DPbjp4Jj3n86m2CKhn1J6cEmIupbWSZUCkTYnweN7pWIqfqU+wrm1evh6DRC
 VVvz1XbOPX638auLpbto1oTug6ApgH6iGWbgLUKGE7d9BSOfSeYg5hvPBrPa/EsegIla
 UYwA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783412402; x=1784017202; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=6s+ViQ7C6cdtI+3yrPoDRiHtXxuyrUpD4TQFZaKFH6M=;
 b=a4AgFQre5YyRZV+E/PL5btCNr/b/uzcFhwmKs2hKnNyxNURYU9B8/9wwTSKhSGrVnR
 ieVZAEZtZ60M2wbqsf/QDvjJS5JV9dUpmB4vl1efitUs9vw9fLKWF6LuNHtPoRAmD39v
 6xoeCrp4RBuQDeMEZ9BUtgrsTXaVKalM/W4HY0jHxFZrZNU1QvRBrtvgIcs8zZ/apwtP
 zVcIFz9EtkZadTtR9nw/BLSpKnI40pQ+hrUDY6sN9v0B0qPqMmbh9+3nyDsVkCa8ZzHK
 oPOqd+beFk1hCS70n5sSgCzVmYB6relyD3B4p7BojvvOM0/Q2G27fLzNVkZ5ZcUukWgi
 nzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783412402; x=1784017202;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6s+ViQ7C6cdtI+3yrPoDRiHtXxuyrUpD4TQFZaKFH6M=;
 b=UgF+LaTCmzb9SY6jalaXvI4ZWCoEBFPfMkO3YeEUQG5yJ2IEbudY27BvggUD4zjbuz
 18yVtk1WdFqh2MLv3V+ncLFWa1WFSO9LIrah0r+x1AjWr+DXcNThwcpSJ6xXjYmzOPb5
 TtC1YLOs6n33Q7w1PvptgAxQBluiVsHwkYYLyXcgzFkb+b1HfQ7tvJga6IJRDBPR9gjj
 2PyRuWoPPKBsdZImSGO+0andt+l4RJkzGCQNazN348ueFuIrpgTvwdGqP9c1/SsUdulH
 Vq/tEM5LnYFSrmKvwtia650/W1QHgC0ldjogcr/fk3bx8MTm3XI5204EQ6oSK0+a5RhJ
 +XfA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro313dYf5hKYxB/G1P5w5H7DZVC6nYHyPWOKRhfNkVPMOZuD25sE4tTlkttFOejDCd4Lj2T1d8Z++tEEOQ=@nongnu.org
X-Gm-Message-State: AOJu0Yw/7HJeN3ozBrRDlqEYzRDSpV5naW+0RGAL2XOa14NofLdJSE1M
 pkkDZLwEzMkxSzM3oKmXXFrPlubprMJjTCMI1welslo1RTVK8WsX8a8Dy23CCZQ0e4G2MM4PlcD
 K/HLAUCB+J1Rkw30g3nUSZDEU6EmYheXD0Mc4VAiN8A==
X-Gm-Gg: AfdE7clyy/F8I+oSJRrYWAC2mPD+yOGWHo7l+oeEG6ys+ftBISt1slvWYal5c8cl9kU
 ylow9XABQVzYstlJi7+cDhmMt5H/o4vbsenx8yqMnxFeBsJzH3Z5w2l+wZHvtFMh2vkZocFIy8w
 +ktjPRVP6Hvo3+GFi2xOsn7Cp/Whl5WIA0zCcSe3/VH1jUd5h7XI7djuje6B0rpwQNInJ94LVNx
 +Fewo/GN5A52LUskmfumLkxr6HFyc93MbMLbg5qF28vhmf3Bi6eFt0OqPhd7JOo1p3PoKKKWXOj
 scnbXchupkqVu8SM+33AkRNfIaZjosYyusfZ7lozk3pL6fnx/J3ctrD/
X-Received: by 2002:a05:690e:191b:b0:664:c7b0:f64f with SMTP id
 956f58d0204a3-6677fd49591mr3268548d50.58.1783412402466; Tue, 07 Jul 2026
 01:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260309181452.83702-1-thuth@redhat.com>
 <00c4ab4b-a58b-4de4-8e41-566b2cb7f920@redhat.com>
 <124bd918-f2ab-43e2-bd2d-fc824de62c40@tls.msk.ru>
 <fcbe3d7f-64d4-4b13-b930-a81e77db4784@ilande.co.uk>
 <df7a091c-a8a1-416a-acf3-28a0cbd8dd2f@redhat.com>
 <c7d6b801-449e-4f55-9c1d-ebec7a0e9595@redhat.com>
 <c0cd50bd-e054-48b6-af54-1050e13bb720@ilande.co.uk>
 <baf0b727-d53c-4717-b4e8-9c8603b2fa75@oss.qualcomm.com>
 <CAFEAcA_oFFEyRfXjRZR7+nLOE5fgzDi1kHQop=s1Q4EzYvaVxg@mail.gmail.com>
 <1aa71446-d211-46d6-b4eb-7bc0fea36de1@oss.qualcomm.com>
In-Reply-To: <1aa71446-d211-46d6-b4eb-7bc0fea36de1@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jul 2026 09:19:47 +0100
X-Gm-Features: AVVi8CfCHkhIJNMphVa_Kcjqq_ugsDcSDitULfU1lYHiSwySy73bZ-uGYg_tQdw
Message-ID: <CAFEAcA9qKE_kg8qubyCumJ14D917RWXJULRW_SnBwnNh2qcZuw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/sparc64/sun4u: Mark unusable PCI busses as full to
 ease device plugging
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, 
 qemu-devel@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Mon, 6 Jul 2026 at 21:27, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 6/7/26 19:53, Peter Maydell wrote:
> > On Mon, 6 Jul 2026 at 18:29, Philippe Mathieu-Daud=C3=A9
> > <philmd@oss.qualcomm.com> wrote:
> >> - Bus capacity is odd. We have a generic Bus-class @max_dev field but
> >>     do not use it with PCI variants. If set, it limit the instances
> >>     capacity. The capacity is tracked in the instance state, and when
> >>     no @max_dev is set the only way to mark a bus full is using the
> >>     qbus_mark_full() helper. Then if we remove devices, the bus remain=
s
> >>     full, and there is no helper to restore available slots.
> >
> > The qbus_mark_full() function is intended for the use case where
> > a machine has a bus which in real hardware is entirely internal,
> > so you have something like an I2C bus which has some on-board
> > I2C devices connected to it, but there's no external socket
> > that the user could add more to the bus for. The idea is that
> > the machine model creates all the devices for this bus, then
> > marks it as full. The devices never get removed from the bus,
> > because they're hardwired in, not user-unpluggable.
>
> Are you saying, while this happens to work correctly for the
> Ultrasparc Sabre PCI host bridge, this is not the appropriate
> API to use? I understand the I2C example when the lines are
> populated within a board but can't be accessed outside of it
> (like our CLI -devices), but what about this Sabre case, the
> bus is internal to the chipset; can we consider it a full bus
> or should we use the BusClass::max_dev property instead?

If the bus is internal to the chipset then qbus_mark_full()
sounds fine -- the only devices that will be put on the bus
are the ones the machine itself creates, and the bus isn't
intended to be available for users to dynamically add more.

It looks from a quick grep like the only use we make of
BusClass::max_dev is that we set it to 1 for:
 - PCI controllers that have a single root complex
 - virtio transports, because you can plug exactly one
   virtio backend into a transport
Did I miss any other uses?

-- PMM

