Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41679CCD18E
	for <qemu-trivial@archiver.kernel.org>; Tue, 14 Oct 2025 08:37:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v8aWr-0008Tm-Hv; Tue, 14 Oct 2025 04:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8aWq-0008TM-Sp
 for qemu-trivial@nongnu.org; Tue, 14 Oct 2025 04:37:08 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8aWo-0005Rj-0I
 for qemu-trivial@nongnu.org; Tue, 14 Oct 2025 04:37:07 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-781421f5be8so15967417b3.1
 for <qemu-trivial@nongnu.org>; Tue, 14 Oct 2025 01:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760431023; x=1761035823; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G2wXHawLphgjXMKUIBlNV42EVOVQetLfGGTkt4o3IG0=;
 b=lX8oz2bzDkQTEuC+r6ZWKoyeJswSjYjVmyjV0NfgKWmfeQpagJ1DdvN3/tKiaKXTIn
 6pIvtBdAN8okJT7F9ekT31drRC/QA7MCHpMbElLP2gzvY5Pbo/PHZsw9pD/NfFbcXH7j
 sBDGL+OZ+h47ucsREL2i6ZWf0eKmDi1xaYMTdmOMmT34AUAAbAi2TgayYF7fMDU118qa
 +vNaApA0Gjb4k4KVb6ydk8EAsRYnH1kHkpNEsZelb9F4kZZMCLUUkzOlMXiHkVJz0LX6
 VxTkCZ7fuvXJFF2e3jkZX6incEsa/0Nse2JrQJRqO1UzEUPVeyIRaRZi2SSsXNkg4zHy
 5mig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760431023; x=1761035823;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G2wXHawLphgjXMKUIBlNV42EVOVQetLfGGTkt4o3IG0=;
 b=JDDu1bRDC0jtbT9rnHAtqi/GuFq71oMrUUEnmmQpHoUZplBYvVndetfen6CruBzy1q
 HysGJtn6btXG/4dIJogao0mnJplqwtrZ1UzsQGI+3kucYiV+outewL12V5kTuoy/Trq1
 14d6A6QkAbmfOaADgmNZqM4rQz7I1Uq1N2RElrZc5g1ftfZ7T3DEzX6JFuPFSYmW0Rh7
 FOaraqi9+Vto9V6Ac386WvV1av5suY1uW7YcvOLuwkNFYGG2LepDYH8WcW32+YE6Nawy
 ivPCgzTu7lTK/0XLayXf9e7thAfXwn1C1VS5+GrNr2KKepUUO5lfD2rV8ZiGizPX5que
 Te9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1suW5Y9LXMj0tilrbvM0EqB38xFntiZjrKGIXVtqE6KwHJC4N1YWWDNQpMkXKgjCtX9Wx4wXiwS+pE50=@nongnu.org
X-Gm-Message-State: AOJu0YyWHq5DNVc8nFBBwseqdxPnKDWawKn49goGjpfVypFwAuVh2YB5
 SqeQINzl0wJmML+FRVTrSvKQXB1wbJAkbbjKdvzfH6XyT/2iUmTYcFuoWTcv4N2BFpW8pgJMU4B
 bpKZdAzHXRAtcC02r92DgOXdq2/JF0utH3fOQEJhTtg==
X-Gm-Gg: ASbGncvz+NdmQkyVsmKiumsy2VX27B42ANHtea5cHNVyWA0SuVCneSMA9chcVwt+BRV
 dUsCR3gfr+wFLxsDVURMRH4vAjBhVPPLvVVYk2ksSYQvpYscPtB9bvCzDFuYZgRDvazwOGUG2ne
 A2JNohYZK7sF7uuhWq5eF9NY1xLy/gcWKjeaev8BmoVEIjgYPZ2lxy+MMI1pCxZHNN4q8ZnO18/
 kTU3upw3iuo8X9XE/x2coZwJ+MMraI=
X-Google-Smtp-Source: AGHT+IECuBWW7Mr3bdnefo9hCmYHcFbwqlQRLyVDhb767ve9pQExfrgwAwUBBTHQcYKoTbM+UVDSaLdeF/fMGFZKDEA=
X-Received: by 2002:a53:ea51:0:b0:63c:da95:21c7 with SMTP id
 956f58d0204a3-63cda9524edmr14064490d50.48.1760431023344; Tue, 14 Oct 2025
 01:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250729111226.3627499-1-armbru@redhat.com>
In-Reply-To: <20250729111226.3627499-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Oct 2025 09:36:51 +0100
X-Gm-Features: AS18NWDdnneHmaeFVDUQFGdg-xa0DZiF63LABZFsNDGIwihe3MoHxpb_nMM5usM
Message-ID: <CAFEAcA-UrCD7mrmX_4dCK0urMmY5+qs=Y268WerQVq1c+7nB=Q@mail.gmail.com>
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
 paul@xen.org, edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org, 
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Tue, 29 Jul 2025 at 12:14, Markus Armbruster <armbru@redhat.com> wrote:
>
> xenfb_mouse_event() has a switch statement whose controlling
> expression move->axis is an enum InputAxis.  The enum values are
> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
> case for both axes.  In addition, it has an unreachable default label.
> This convinces Coverity that move->axis can be greater than 1.  It
> duly reports a buffer overrun when it is used to subscript an array
> with two elements.

I think also that Coverity gets confused by QAPI's convention
in generated code of defining enumerations like this:

typedef enum InputAxis {
    INPUT_AXIS_X,
    INPUT_AXIS_Y,
    INPUT_AXIS__MAX,
} InputAxis;

Coverity thinks that INPUT_AXIS__MAX might be a valid
value it can see in move->axis, because we defined the
enum that way.

In theory I suppose that since the __MAX value is only
there to be an array or enumeration bound that we could
emit code that #defines it rather than making it part
of the enum.

thanks
-- PMM

