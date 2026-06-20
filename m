Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F1DCD98F2
	for <qemu-trivial@archiver.kernel.org>; Sat, 20 Jun 2026 20:34:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wb2OB-0000UL-SS; Sat, 20 Jun 2026 16:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randomjack94dev@gmail.com>)
 id 1wb2OA-0000Ta-8Q
 for qemu-trivial@nongnu.org; Sat, 20 Jun 2026 16:34:02 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randomjack94dev@gmail.com>)
 id 1wb2O8-0002Ii-Qt
 for qemu-trivial@nongnu.org; Sat, 20 Jun 2026 16:34:02 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-7dd5a8dc8a2so23141517b3.0
 for <qemu-trivial@nongnu.org>; Sat, 20 Jun 2026 13:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781987639; cv=none;
 d=google.com; s=arc-20240605;
 b=ac7tADCo2pQcYGXNQpsh/VuM1rjO7KFHh1VrFCoagW4lV5XZBKSG0LBIznujiUcXM6
 67LUXxPmtciZW2ANgCGKVSbmqGgw4nupm9tsAYuEkm0pFTIGsnpRN7QqI/a8esMIGHM/
 chKFUw69gNfTpAsXe4KgxwguuQKxXQCpsxDPSlKZ6X6J6SN1veXfQ01CMMg9N2QW5YX0
 bmLS6s13rIcFw6gOHjRmORj4Ggde9dJpCHuXWBLCWPjQGPHFwmxGpohryMLC3lC4V6+f
 YvWqHYQY1uZdQ2UOhjyOtbDm1ggverFQ1yq2TvIbWqwWLv1bBjajFxr0FA/Q6c+eaikL
 serg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1EbwOv8yj9dwK8UApjDfStz2RWrwDBklKn1BxxruFww=;
 fh=G/S7qosjoY8H7bJzOu0Vh843DBzWVTs6cPbzPqH4gXg=;
 b=N9zf0PhYB61DLSB7JMBy9mKjBDf/sVmxlG2FjBXTHyjmS+xe6873iagE7zMNJCaoQM
 hhu+ed5ddJVlfvA6wOgo/BGESQxuc0OQYeM3DItvBVqyMfcZdWF87eXpk1URwYfTT9N3
 vO182nWixEB8FdJrrSCCM2dqcl8ONmpY8bXKMKsKggaPUYxqah5KSEkFxePWV4y68CD/
 V7O4WWPdJUox362rwbsLJ0nmwO/RvH9UrVYvFwr5YQuBVHGX4mpGYndymgc6XjTBEzeg
 Bo/fB00q3GYDrMLF4ky3Xr7UTC5yiD5rpnXv06N52UR/cPZxqjR7jXRmeBkZV+GuNDvP
 /Apw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781987639; x=1782592439; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1EbwOv8yj9dwK8UApjDfStz2RWrwDBklKn1BxxruFww=;
 b=h7ONv8/oJYGPs9P8h8dVd4swC3ylEZvaDMtf6MGtZ1oCORBpdSwf0QsnGDuERNBzBT
 uwmiCzowGy505qePG8nn6voh8TgwiC1xI+QF7NA7d+9aOj0UMkAkY6zQtSDbPxxuEDrT
 WeFn5wIFi4N9Vdji56eDmIcWT2etqNP1x3H5pjjT8zmvKcGLhJdUKHWLLAw3hmbplAAM
 esuXsFQ3D0CnQuPVb0Bp97KLzjkD3YZTP+kP9I2kfN3dbBS59rwX/psHpDkJVkWR9nqP
 ebYxRL3GZCbNk5k+8X5N+5B1IoWWpZ2jL54pfk6/6qPjWY+AH2JaFgz+9cCvGAEr3+ID
 5Ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781987639; x=1782592439;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1EbwOv8yj9dwK8UApjDfStz2RWrwDBklKn1BxxruFww=;
 b=c7eA/rgbPGvfIOQFhSrYft+DUUis0wbRMmAbRvrrPQK7dHzwwIxsPEyeamBSd1qwd9
 acqx8xsAcZd2yg68TtawvQrFE9H3B0Mp2UDk+/oElKuU/ybW0/aZeFboeTKDwokUe1Sl
 3c+DP3iKKSBwC0XGCHCi2UF3ihSyVgYMGFDYYeA2QcFyuHAvLoLgtseYtND6Fvun2FPz
 6nvEYVLqwfF5EC/YJyXSGe0jZ1W4l5woBjIir6jbcJ0pScNA1wC4/bi0f1PnURofCWPv
 AFoBGikBYn8Z5oQ07O7opOL3RKjqTCQlCC4EttdBmc5xCogZxSqoZ/z5vLGupF2xmo7Q
 RgfA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpwGh2gRYiOiGv4/SLfer8NkAVry1vYyLrBTNguMs07vPjKrZNm85lXfF7vmB4sVMve/Qo8XMi9ePgggaU=@nongnu.org
X-Gm-Message-State: AOJu0YxTwQxVuIoTqe53XuYMTbywogn0bTrzEj31m+5LU3oOFBXphCZg
 QU3P0qbUfA+bv5Q3j95e1ZdBUcDXQ2g+pCKddiZr5KopLWIB4bd4UAUMMcW4ZKgXr2WaaiESadq
 3Ot3msMUa7QGgUTmtZw7Uewc6RBDP/MQ=
X-Gm-Gg: AfdE7cn+r9NK+uUza1mtq+j0zrndnhV+KTlKLew2vrvDlUdkTXiWx0fKt0mhcaJg6ac
 2ObfT5rttnmipDahXaEhq6RqOYFj3WxU4hdHCvwaO2F3duzi//J/ydtiYpj09l6Sf7N+N5ySo/I
 Du/9VPwBzFZnaasSmc+DcfG3l2kGVb1MRSq+8wnwqGLnpLTYA6NXPAZZ6avMBB8DBY5Ja2EVQKJ
 xSXcXKzpt1M047wU2rO0EcvBPq2G6YjyAe65S94AERd39u5q1U2CQsviFWvA2zLVcMbLhqDrA==
X-Received: by 2002:a53:d017:0:b0:662:dfb5:bac7 with SMTP id
 956f58d0204a3-662ffea4ed8mr6728692d50.58.1781987639453; Sat, 20 Jun 2026
 13:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260620171318.24189-1-randomjack94dev@gmail.com>
 <CAFEAcA9_Cy1x46YQSawzmF_fc4GVq_77vyRF7TWwruBND9eCGg@mail.gmail.com>
In-Reply-To: <CAFEAcA9_Cy1x46YQSawzmF_fc4GVq_77vyRF7TWwruBND9eCGg@mail.gmail.com>
From: Evgeny <randomjack94dev@gmail.com>
Date: Sat, 20 Jun 2026 23:33:48 +0300
X-Gm-Features: AVVi8Cc4QBnUlljz6fudyhiag9f0BZdgszf4Wx1nqcRxHPF1v17FstSnfrNbhm0
Message-ID: <CAFvcSaQ4R7oQ9KMrEb81mZOaqZaR5XqCLn8-DJn-OX7GQuSSCQ@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/soc_dma: Replace if-else chain with array lookup
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003e6aa40654b55498"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=randomjack94dev@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000003e6aa40654b55498
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Peter,

No particular reason.

Just found a small refactor-like TODO comment.
Did not think about this code being ancient.
Feel free to discard the patch then.

Thank you for your time!

Best regards,
Evgeny

On Sat, Jun 20, 2026 at 11:23=E2=80=AFPM Peter Maydell <peter.maydell@linar=
o.org>
wrote:

> On Sat, 20 Jun 2026 at 18:20, Evgeny Kolmakov <randomjack94dev@gmail.com>
> wrote:
> >
> > Refactor transfer_fn assignment in soc_dma_ch_update()
> > via array lookup as suggested by the TODO comment.
> >
> > Signed-off-by: Evgeny Kolmakov <randomjack94dev@gmail.com>
>
> Any particular reason why you're looking at this ancient
> code? It's used only by the omap SoC -- if we care enough
> to do anything to it then converting it to qdev is fairly
> high up the list...
>
> thanks
> -- PMM
>

--0000000000003e6aa40654b55498
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Dear Peter,</div><div><br>No particular rea=
son.<br><br></div>Just found a small refactor-like TODO=C2=A0comment.<br>Di=
d not think about this code being ancient.<br></div><div>Feel free to disca=
rd the patch then.<br><br></div><div>Thank you for your time!</div><div><br=
></div>Best regards,<br>Evgeny</div></div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 20, 2=
026 at 11:23=E2=80=AFPM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@l=
inaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Sat, 20 Jun 2026 at 18:20, Evgeny Kol=
makov &lt;<a href=3D"mailto:randomjack94dev@gmail.com" target=3D"_blank">ra=
ndomjack94dev@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Refactor transfer_fn assignment in soc_dma_ch_update()<br>
&gt; via array lookup as suggested by the TODO comment.<br>
&gt;<br>
&gt; Signed-off-by: Evgeny Kolmakov &lt;<a href=3D"mailto:randomjack94dev@g=
mail.com" target=3D"_blank">randomjack94dev@gmail.com</a>&gt;<br>
<br>
Any particular reason why you&#39;re looking at this ancient<br>
code? It&#39;s used only by the omap SoC -- if we care enough<br>
to do anything to it then converting it to qdev is fairly<br>
high up the list...<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000003e6aa40654b55498--

