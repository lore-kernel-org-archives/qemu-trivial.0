Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC00CCD184
	for <qemu-trivial@archiver.kernel.org>; Tue, 14 Oct 2025 13:00:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v8edH-0008C1-9r; Tue, 14 Oct 2025 09:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8ed9-0008AY-Vc
 for qemu-trivial@nongnu.org; Tue, 14 Oct 2025 08:59:56 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v8ed6-0004e3-V9
 for qemu-trivial@nongnu.org; Tue, 14 Oct 2025 08:59:55 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-635355713d9so5101430d50.3
 for <qemu-trivial@nongnu.org>; Tue, 14 Oct 2025 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760446788; x=1761051588; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DGAb+4USIiQWrIYxqWxfsLF1eArRgLsM7HUF2jQ9eV8=;
 b=E3eQFDm2RBDn6/qlzTkPwpKLXOYtr94IGojST20oI7M4Y3eDlySCYPyhXtlKDOVn3q
 nMEoWARlffoQX9JdBfgtYXNTpFazxKtWFpIoBKovYV2T9nd+PrVVDfkFoedzCKAdaGYh
 SB5z3NxAOyuXAMNUKUEvdQBXHov+lvuCS9w5Y0cosCOby6gNLZi62kepdN0sjvDpgtqW
 yV+Fy9aJAnH7VOoU3QIZO900KvE9dIP8hprxiHZhAU4dBfHYCk6FbMquBrzCQqRbM/1G
 vMVUHYXF2B1WvnJmdTGanjrBLF3cy1NrUbOT2E5AfOSfSgCMC6rjLZwVte/qeNVDqTE3
 yc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760446788; x=1761051588;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DGAb+4USIiQWrIYxqWxfsLF1eArRgLsM7HUF2jQ9eV8=;
 b=Pw9WLXP+4C8NABwQwe1VaOVg5HE6uFnyouie9VpGaDnrPfjxBsQQ3jG0DSLpEvPfEg
 LUGYdvJoOkwgdpkoTtDM7n1pkNCFHPvrJvV5Hwe6B+wxgQjovG+MbXy62TPrcp8vAbaO
 S4wb6REpBkz3Y6Y4EgMklvPULnQOH4hX8Pi8vdwm/J5AKSxqzOQDI2ktT8qo25Z8smYA
 ueoHk7qznouUMaTvpW/4JaTXgYvb+g8s01Io6Rs2fyzOm1fooPgmI/8FosQ3GWuGRvNz
 STflSHIGHz+KAOR1rnMrnU3B3D7U6Gm7MoY7rRZdDa608JgtM75DzJTRmCTaBRr5spsq
 5LwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9ktFPN1RpvNZc81aQZ4xn56w2y4MA4Fv0pDjryyJPsg3fHSIL2yQg3hnsvlzesUziF3F8jZTHa06rBJI=@nongnu.org
X-Gm-Message-State: AOJu0Yy+e7uv5FQIKWsU2HNFn1A/mlhjqbdVVNdiK4o53JzA9bzUh7A8
 dQLXymNzRTTnaIiLLAClWKcLYVRK+a/yADIR94gjaua5oHBWvw8MVYExE7jmlpwPqx1i/L/BUjq
 15cAoSZGFTlJZp3BX17kVjdXMtnJSNkTOq0VfQ1MVuw==
X-Gm-Gg: ASbGncvuu6+KdeLVlMPcZOAK88zbNrJ7kUGYHyD8CY6JKBbSP0jirFlLLcLRPvfTTIU
 i0wMcK7BK2jkstZb/CHMxeyevlOTkFaxNKF2wgMmdPLHR0mhpp+TGWzonHfm1h+jxkhVDLwEC2F
 h8ncWVNLEEuKD9opVQ4X7QX7/N+4Efs1z3E6Ys/GJoxiqX2jPlxqvFjEBkp1Opl73L8D8GhKl3E
 +4rvnuEzExIQE9sRkNEmn88bV7qv5KJwXwLc6vfQw==
X-Google-Smtp-Source: AGHT+IED4DPQdBK7ONm26OmCpKVlBffbLSUSkcJilcgE42YRs0GaEMyY5HjOGbcIqDd1U1OSOTWygdg0r2hHPeNy8JI=
X-Received: by 2002:a53:ac49:0:b0:63c:e72f:d354 with SMTP id
 956f58d0204a3-63ce72fd63cmr12424599d50.22.1760446788372; Tue, 14 Oct 2025
 05:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250729111226.3627499-1-armbru@redhat.com>
 <CAFEAcA-UrCD7mrmX_4dCK0urMmY5+qs=Y268WerQVq1c+7nB=Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-UrCD7mrmX_4dCK0urMmY5+qs=Y268WerQVq1c+7nB=Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Oct 2025 13:59:34 +0100
X-Gm-Features: AS18NWAkDU_I2OBOHorXRS1aTrsOfZLJKRYRT_z0zRWC_KiBP47Dd1fp0k_Ow-I
Message-ID: <CAFEAcA-01WR=jgdiCY57P_88ez-mRw07ShU0eWyzLPB+WbT_xg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
 paul@xen.org, edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org, 
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 14 Oct 2025 at 09:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 29 Jul 2025 at 12:14, Markus Armbruster <armbru@redhat.com> wrote:
> >
> > xenfb_mouse_event() has a switch statement whose controlling
> > expression move->axis is an enum InputAxis.  The enum values are
> > INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
> > case for both axes.  In addition, it has an unreachable default label.
> > This convinces Coverity that move->axis can be greater than 1.  It
> > duly reports a buffer overrun when it is used to subscript an array
> > with two elements.
>
> I think also that Coverity gets confused by QAPI's convention
> in generated code of defining enumerations like this:
>
> typedef enum InputAxis {
>     INPUT_AXIS_X,
>     INPUT_AXIS_Y,
>     INPUT_AXIS__MAX,
> } InputAxis;
>
> Coverity thinks that INPUT_AXIS__MAX might be a valid
> value it can see in move->axis, because we defined the
> enum that way.
>
> In theory I suppose that since the __MAX value is only
> there to be an array or enumeration bound that we could
> emit code that #defines it rather than making it part
> of the enum.

Also, there's an argument that this function should
ignore unknown input-axis enum values. If we ever in future
extend this to support a Z-axis, it would be better to
ignore the events we can't send, the same way we already
do for unknown INPUT_EVENT_KIND_BTN button types, rather
than aborting. But it's not very important, so the
g_assert_not_reached() will do.

(In some other languages, we'd get a compile failure for
adding a new value to the enum that we didn't handle.
But not in C :-))

thanks
-- PMM

