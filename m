Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD77CD5BD0
	for <qemu-trivial@archiver.kernel.org>; Mon, 25 May 2026 11:46:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wRTlW-0001WO-Aa; Mon, 25 May 2026 07:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangckid@gmail.com>)
 id 1wRTl5-0001UL-66
 for qemu-trivial@nongnu.org; Mon, 25 May 2026 07:46:11 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangckid@gmail.com>)
 id 1wRTl3-0001Co-KI
 for qemu-trivial@nongnu.org; Mon, 25 May 2026 07:46:10 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-bd9a71b565aso1052576266b.0
 for <qemu-trivial@nongnu.org>; Mon, 25 May 2026 04:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779709567; cv=none;
 d=google.com; s=arc-20240605;
 b=bVKAFHwiEDuxlGHTSX3ouuT7l0X/uiVBukpe6Qx6FCWNekhtJ7F1uw9HIHDx6XZoos
 IxE/iM+9X640t7tgngwD1QKvUK9m14T1NUFfl0kwI0jZ3+RU0sSDj/XQhw3x41I8LOXj
 h8Mt2lYvzgmVOYxat7TtLWNvxKVr5Ud/+IqznbJHJyDb8UtiSgZm9uLZMVfZQe0LeA0l
 4HHDL/ZpugynBYuZOiliglxwH6buc1htTkQiesFH1eyMsG5uvNVhHz8Ze5AHRXnUmKEQ
 P1e6I9cnVFlYpYE/pnKi7HJUJ2/ygZG5dKBc12UvulOJEXtaHsodgVeexTWSR/FDd7bb
 Cn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UfG4bsPoO0gVIYDhkQpli7FG8eRfL6sVO6+/+eOZMKw=;
 fh=FqK5qyUvyX846j+V64+vXsOP66v2NNt7ykptWWQlcnw=;
 b=apmkgXO0cFXp+JLrXPuN1dswaOZ1z3oUYkMcDILD+AAN0dNgckZYqQoucV9hBHlJm+
 SySzgXFppemWl+I089kBv7eFOpfudy1BUAP6efzFBCp/Ogwrz0nV/FAFyMqiX9kK+R4+
 1kBXSKhOO1V7Dj+NXflK6ckTuDlr6Mex/I/ETc0fMaQtOjENqy/+YKeDljXO/n2IpOv4
 rvbI+QNcfjRdsj1pexhLyZFJ2QTc/koxcgHjOpXURug2HjcmD5cpGvDqRC3/u7VQi3or
 QzE279E7zzU8cocml7dYCXEV6VRg/51ep0hlsWkO1N7+4Lf0jpuEInvsVOxW8ZDwZJdO
 0zow==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779709567; x=1780314367; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UfG4bsPoO0gVIYDhkQpli7FG8eRfL6sVO6+/+eOZMKw=;
 b=T14b6wKJyy0wxdC5g6JcOZhH0gCKcnoxSfoS2ZANdh0qbNECHVcvjjRPGNThg6MU6m
 v0d8p44Ta/K2DX7RqioGs2Z59HsN5fZheBXqZ57qjACyv4pMlgnUTjolQxzwqYsVVUnb
 2f7ec1QlXCAo++eX3nXwrw1n8Xb0OQvA6LCTiKHplxPmLUuGONoEPzJtf/HNqQYKS1lm
 gEYQqIu8E0OtOSLddY505Uof9Z+IQslJQSP2+Uiz90CUoFMKwUkeP0ckEWJqzSjfIKab
 6iihRyK5QSQMBQnZKX9R+4VbZJfYxu4db/sacQtYvMpkCcmw30QZwyodGlNIpKygjsZX
 MtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779709567; x=1780314367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UfG4bsPoO0gVIYDhkQpli7FG8eRfL6sVO6+/+eOZMKw=;
 b=XvqiyKYGPrFfkyJkACFgLtc4/DjTmFRnVTqiDAenGamBD+AQpnXXh2QvWE3ocQ0QzX
 d7bGmrStoh1LNF/hh1NhwlH/geTI4rN+yfh1/TXQ9PXpYQHTqSY1gmVMwq7XPuJLKypK
 YNfrBx95G/3FnrM/BnXvmsHg+aiEA/Xk3ADSuJc/ivajL2FoIjpMG6jv44IaWTjMbjKS
 dzSIQMHv8wD33xkqXRvk2Nb3doWE1JHKo0U11rORxQ7ZpgZ/D7w2RbeCjFVa8AL9XewO
 DKoRjqg8CjT5LNiP3oK8t58mTE5rxy1jNnZwv9Ks3s6Y1vX+knhpb3vBVLg/JMW7rJs8
 KDGQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9a5dy2yzutKPqxbge4SVuSH2jwBel0L4dHiTewcIBs9nt7clh85M8sqiGnaC3fZFUGIqEGW2mU+UUcEDE=@nongnu.org
X-Gm-Message-State: AOJu0YzMCdb/+7Li+n8JpKoniBe5skg4VWj6ojJ7wAp2OtkOFNr40EuN
 5z6YsWRKJzB/Y7qds3CX58oo6lls4Z35zzeWL40Z88YLoI4EnqL7mL0ykrevnP4HjGtZ0+2In4X
 zuKx/EiXJRsiiLyzw8nCmDSPle8uYvmw=
X-Gm-Gg: Acq92OHMj4lXI8/Ecypu8OoueKi/IkDhtOqmdc9Oh4gGV/vUHhODuq5xfHKnYj9eB7b
 hmcIqfXk0UT2E9Zhw60fZjnfh7k9VcD8Y7/T2f6hTR8FXlNN3eR9HCGObJPaTV7Er9IxWcyhuNB
 RRrQLZi3sh3MSafrPl2ruhGa8nph3cPDUQWwDCaxx1sMzs9GnjsIGLKYVDl3ctPrZ6Bq2LIjme0
 RfQ6fSAE2DScb0Mrp03BUmX2ColP9DfbLECvGE63vDWwnIr04zMjTYXG9FThJ8s5y65/wYhRCKv
 SG4PyLVtINahPJx2CeA=
X-Received: by 2002:a17:907:c003:b0:bd4:7bed:512a with SMTP id
 a640c23a62f3a-bdd2580bc63mr850076866b.30.1779709566601; Mon, 25 May 2026
 04:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260522080644.9531-1-randomjack94dev@gmail.com>
In-Reply-To: <20260522080644.9531-1-randomjack94dev@gmail.com>
From: Zhang Chen <zhangckid@gmail.com>
Date: Mon, 25 May 2026 19:45:29 +0800
X-Gm-Features: AVHnY4IXZtKOtDPQlXMfCoeG1JnNW4iwix8PkW155LMu8FPmCmagapidGMhGAqc
Message-ID: <CAK3tnvJ8acuHzp4WoQ87SqYJ36+Oc30ESYT+yrgNZgU+fCfv3w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Mechanical conversion to QEMU_LOCK_GUARD
To: Evgeny Kolmakov <randomjack94dev@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, stefanha@redhat.com, 
 fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com, lizhijian@fujitsu.com, 
 jasowang@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=zhangckid@gmail.com; helo=mail-ej1-x62e.google.com
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

On Fri, May 22, 2026 at 4:07=E2=80=AFPM Evgeny Kolmakov
<randomjack94dev@gmail.com> wrote:
>
> This trivial series replaces manual qemu_mutex_(un)lock() calls
> with the safer QEMU_LOCK_GUARD() macro in
>   net/colo-compare.c: colo_notify_compares_event(),
>   block/io.c: bdrv_co_get_self_request().
>
> Evgeny Kolmakov (2):
>   net/colo-compare: Use QEMU_LOCK_GUARD to simplify mutex handling
>   block/io: Use QEMU_LOCK_GUARD to simplify mutex handling
>
>  block/io.c         | 4 +---
>  net/colo-compare.c | 8 ++------
>  2 files changed, 3 insertions(+), 9 deletions(-)
>

LGTM.
For this series:
Reviewed-by: Zhang Chen <zhangckid@gmail.com>

> --
> 2.43.0
>

