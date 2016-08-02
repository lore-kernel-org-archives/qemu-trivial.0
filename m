Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bUaXT-0000fQ-W0
	for mharc-qemu-trivial@gnu.org; Tue, 02 Aug 2016 10:19:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUaXQ-0000cG-Hc
	for qemu-trivial@nongnu.org; Tue, 02 Aug 2016 10:19:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUaXO-0000On-Ex
	for qemu-trivial@nongnu.org; Tue, 02 Aug 2016 10:19:19 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34891)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bUaXN-0000OP-Hk
	for qemu-trivial@nongnu.org; Tue, 02 Aug 2016 10:19:18 -0400
Received: by mail-vk0-x22a.google.com with SMTP id w127so123673018vkh.2
	for <qemu-trivial@nongnu.org>; Tue, 02 Aug 2016 07:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9B8caFecW79mX+AyTjyrgtT6IWgG3GmIu5xzaHB/sYY=;
	b=gPV4DJV4xqZis/aaaJRGro70vqKQo1sm3fbhUj8HK/pzwQKtCfiBReGkOXivOQdTdA
	gZS622yo11G9NU4SYVpPPiQ+b3VTlR+EySqM/4kf2GbFvyLICYMFQfhvn1mRx86J5612
	MU4+nw5yfpwIhdcD0oLPXlp3ON5sTK2ja8ot0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9B8caFecW79mX+AyTjyrgtT6IWgG3GmIu5xzaHB/sYY=;
	b=lKB2DF5d+sTb2HTAK1RcyuwyqgEk+o7Ra7+m+wWT8stPKRaHZigiijFMYM3LqHZkki
	JcgsEfONh3BbeFwFoDIKK/G5f6DuN45JtFTvraJdGZ5ieqZjbCC6oR9TnIIpVjGdPh96
	jzujis+PD3FFuqyeb0NYtu0Ixm5EgMQU7JVV1a/zSOWzveea25m9RTKV2MZjrT5BJxmi
	nX17P5c4uKe7N5JRQoUG+0n0DOIDnPwsDwlDgmBSNQ5DYY+W9F8GaVfnblCrw4j/3vRa
	qQ6hfpX5XwqqTIvsi+XZyQZ4LnSuB2a6U/CcChkUtbkoXoFdKBm+cKKXT1ykPQ63So/k
	9FFg==
X-Gm-Message-State: AEkoouuBVb4qxBbN+3DBltleRhPzhhVta/IDimX3eG+Wgz5N+cyiYw2N2Ptb+GwlI7jJkQcSo/nnxOzssZ4hwhn4
X-Received: by 10.31.228.133 with SMTP id b127mr29650055vkh.90.1470147557086; 
	Tue, 02 Aug 2016 07:19:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.200 with HTTP; Tue, 2 Aug 2016 07:18:56 -0700 (PDT)
In-Reply-To: <C74630D0D1907C4A87964109A262FDDE51EC2406@EXMBX-TJ019.tencent.com>
References: <C74630D0D1907C4A87964109A262FDDE51EC2406@EXMBX-TJ019.tencent.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Aug 2016 15:18:56 +0100
Message-ID: <CAFEAcA8g3R4gPzm8QDf-E9Zm0V4K3Opnc44cCiqLviP7iATt0w@mail.gmail.com>
To: =?UTF-8?B?Zmlrc2h1KOW/veacneS/rSk=?= <fikshu@tencent.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, kwolf <kwolf@redhat.com>, 
	qemu-trivial <qemu-trivial@nongnu.org>, stefanha <stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/ide: fix a writing to
 null pointer exception
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Aug 2016 14:19:21 -0000

On 2 August 2016 at 11:22, fikshu(=E5=BF=BD=E6=9C=9D=E4=BF=AD) <fikshu@tenc=
ent.com> wrote:
> From b5e5c01b025e83500ca46628add7f63f42f9b2ab Mon Sep 17 00:00:00 2001
> From: fikshu <fikshu@tencent.com>
> Date: Tue, 2 Aug 2016 17:39:16 +0800
> Subject: [PATCH] hw/ide: fix a writing to null pointer exception
>
> In qemu less than v2.1.3, ide_flush_cache calls ide_flush_cb with s->bs =
=3D=3D NULL,
> and ide_flush_cb calls bdrv_acct_done without check s->bs neither. Finall=
y,
> bdrv_acct_done writing s->bs directly!
>
> Reported-by: fikshu <fikshu@tencent.com>

Thanks for this patch. However, this bug has already been fixed
in commit f7f3ff1da0c in 2014, which made it into the 2.2
QEMU release in December 2014. We don't support releases
that old upstream. So if you're still running 2.1 then
(a) I strongly urge you to upgrade
(b) if this QEMU is from a Linux distro vendor and they're
still supporting it, then you should talk to them about
backporting commit f7f3ff1da0c

thanks
-- PMM

