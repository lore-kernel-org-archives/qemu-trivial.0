Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1414CCA472
	for <qemu-trivial@archiver.kernel.org>; Fri,  3 Oct 2025 01:08:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v4UGN-0008TE-Ra; Thu, 02 Oct 2025 21:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v4UGL-0008Sj-HD
 for qemu-trivial@nongnu.org; Thu, 02 Oct 2025 21:07:09 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v4UGF-0002VL-Sc
 for qemu-trivial@nongnu.org; Thu, 02 Oct 2025 21:07:08 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b3dbf11fa9eso303696366b.0
 for <qemu-trivial@nongnu.org>; Thu, 02 Oct 2025 18:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759453616; x=1760058416; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUJ1G4B6gGG3DgKRIsukrEL70OmCxl2X+s7iaMTB1lM=;
 b=G1S/AG2GMMR3FToFF5All3JPqCeWFhPqrKALU8RfFZZONbLYHX0MEvQsvmTQ2PJ83T
 EP3/O5ULX1CPDUTFFH6QfEALYz0Jl/+CSRLIW/bIvrTZfKhknoyUJP/yOxEkREBi6BwC
 VDLjfoLWyIoVezbD+22RMJCOg4zTC9yccAPMPtbAlgwDIfZc8vL03soLSkmnqjgDL8s1
 0epJsGF7SyAKahvdUCaEakXQ12cvP9YZ5ntThTzKuhVbTKY41At/RDzBtw8oErTEcqmg
 60TOIbJeLId5ofzXJG9GJF9Q2eIqXioq6mGyqK0BhqiMjRT9FeaFli50zWbMDwP+3X3H
 rOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759453616; x=1760058416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dUJ1G4B6gGG3DgKRIsukrEL70OmCxl2X+s7iaMTB1lM=;
 b=hJt0uEDQ9fZh5f6XJICHqez5D2fzYd2jOshhTPyK52rgaUnpYHP7FSFEtvs99qYFrr
 5PKaLvc3AFlkbAfPQFamaUTeUbk6AFs2y1DqN7h9jNKZB0xmauytJQ5uvcpEbkoumkln
 X99OVzliNbv1uoLKnqHr3jEmcAaxbeGejmttqrSn9xP06jnaH6zsDJobTamvEM91wdBm
 OnLRJSXf5vlMtC94rXF3ggWKNUxEkzMug8aiv03zr8NAiOw5b9YRnAw0pgnpnSy8nnUo
 6UHTTd9VMv38VbchPi4UYvdrbqgVMYnigw8PRv5yKDTp3FBb9+8V9SyaLi4Fxk0J3pyX
 RLxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmXCmnUDmsF94xlvnHZ4k3JoABVA/8ODTkapF7B1s86Og54S70chA981NBZAusmrxlZKh7ZqQott25rZE=@nongnu.org
X-Gm-Message-State: AOJu0YwTNGWWgQnfRemAFYn+PXANNlc+hAo8tYggUGfLPZIyAJyDvYYX
 fEHLNGKXyzH44z09IZH6f/Nq5+3TqR0/qyDVb5K+yEt5Vc/A800u3yk0ZkssOdRFB2Ah5UZpvYr
 WkwBYy+yAgBj9xQ2f5mH95BD51XHKcEI=
X-Gm-Gg: ASbGncuAJriHkpgP7Hbd3F932FekSYJQgUVYqyd3cjjsOnyAw0Ox5JdCoRpzD93rSHD
 fmWyDBd1LJMAbGvHlxIiuViX6mbT6yGcQ2tHq0Ps3hTCT91VZW3z4dxk5zHeCJSM8soGG29T3Lg
 glFdKo2dIKGFjH38VadO1yaIeCX2kue1sr3mYzCNap9iuNk4HBPeN6vlLJHn2WB5Vg6TaozOB15
 dv+fssSaWnIBIT0eR+ksbesI7a/x0z/DgGgATsAkrviFDSPK/dMgYXYHgJu8A==
X-Google-Smtp-Source: AGHT+IFM/7JOB2qMO+pYWbdlGCbGLMS41DxU6Chfnus8j2/3SPPHzhrmm1t2ipiWUOxY2ncUuL7HVeb3DC7BTHdks9Y=
X-Received: by 2002:a17:907:944d:b0:b2e:e87e:ef2e with SMTP id
 a640c23a62f3a-b49c34474b6mr151753766b.39.1759453616142; Thu, 02 Oct 2025
 18:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
In-Reply-To: <20250929115543.1648157-1-valentin.haudiquet@canonical.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 3 Oct 2025 11:06:28 +1000
X-Gm-Features: AS18NWBuckVfcsWCLtP_skD8anng53scByzxab0cbxP61calpZ1B1PfLyIjMR5g
Message-ID: <CAKmqyKNvBF5hRjDZKNp1Bs-GecDqCu3inh-1-tsRaA9iyCU0ZA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix endianness swap on compressed
 instructions
To: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-trivial@nongnu.org, 
 zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com, liwei1518@gmail.com, 
 alistair.francis@wdc.com, palmer@dabbelt.com, 
 vhaudiquet <vhaudiquet343@hotmail.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Mon, Sep 29, 2025 at 11:02=E2=80=AFPM Valentin Haudiquet
<valentin.haudiquet@canonical.com> wrote:
>
> From: vhaudiquet <vhaudiquet343@hotmail.fr>
>
> Three instructions were not using the endianness swap flag, which resulte=
d in a bug on big-endian architectures.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3131
> Buglink: https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/2123828
>
> Signed-off-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/insn_trans/trans_rvzce.c.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvzce.c.inc b/target/riscv/ins=
n_trans/trans_rvzce.c.inc
> index c77c2b927b..dd15af0f54 100644
> --- a/target/riscv/insn_trans/trans_rvzce.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzce.c.inc
> @@ -88,13 +88,13 @@ static bool trans_c_lbu(DisasContext *ctx, arg_c_lbu =
*a)
>  static bool trans_c_lhu(DisasContext *ctx, arg_c_lhu *a)
>  {
>      REQUIRE_ZCB(ctx);
> -    return gen_load(ctx, a, MO_UW);
> +    return gen_load(ctx, a, MO_TEUW);
>  }
>
>  static bool trans_c_lh(DisasContext *ctx, arg_c_lh *a)
>  {
>      REQUIRE_ZCB(ctx);
> -    return gen_load(ctx, a, MO_SW);
> +    return gen_load(ctx, a, MO_TESW);
>  }
>
>  static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a)
> @@ -106,7 +106,7 @@ static bool trans_c_sb(DisasContext *ctx, arg_c_sb *a=
)
>  static bool trans_c_sh(DisasContext *ctx, arg_c_sh *a)
>  {
>      REQUIRE_ZCB(ctx);
> -    return gen_store(ctx, a, MO_UW);
> +    return gen_store(ctx, a, MO_TEUW);
>  }
>
>  #define X_S0    8
> --
> 2.51.0
>
>

