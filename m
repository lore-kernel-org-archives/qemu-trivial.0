Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4A5CD8CB9
	for <qemu-trivial@archiver.kernel.org>; Tue,  9 Jun 2026 15:26:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wWyL0-0000bZ-AP; Tue, 09 Jun 2026 11:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWyKw-0000Vj-Pn
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2026 11:25:54 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWyKu-0002Br-Lu
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2026 11:25:54 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6924a68e3f3so1204102a12.1
 for <qemu-trivial@nongnu.org>; Tue, 09 Jun 2026 08:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781018751; cv=none;
 d=google.com; s=arc-20240605;
 b=SoKhZwe1VBbfwqaYHQimFcbdCc+HY8ZJDvAgnZ3UdaoaKyr9CZzneIiOa+hirItmPV
 HH0RXLfKZjHZCJmgxZryqscyphg3N3TkjFPrP5fdJ1fruY0Wf8aGItJFOi9Q4D4jYe/3
 wr3t9mPXdTw5B2qb+W9S+Ajj3hzqbrVzD+4Tvxy1EFuN6Ac09UxyemcBqtoAyxwKDLx0
 T2Y2v/wnnULsntd2ra+ANR36YObJaOZfw2xl6IUp+tLeXZ4zlBs9FYwal9M/DJ4kYL5G
 4Vr0Sne3Uxs8dQI05umP0NxOSDB6LOGJh62iO5JpcbCGWjnWQBzQC7nOSiFC7Mm5VI2x
 yVuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=o7hZxrOxQsSfFXsDoeNg7xAeFrfoXUdRu0/vaXFQ7xY=;
 fh=caDspV5VEZivs2MTMPMKKyWwJsX2DPudyA01ZA3Qc4Q=;
 b=jm6kDXWkjOr5WV6NHKRBQdha9JXL3HEyny/bMrD4Ybw4QfFA8llvYPkk4vB9G5LDI7
 b+DvcA9wv3Z+bfSyq9s/dDLNo1i9jKxP1WorY6iFmHhmMOF1WH3RghX+b2X0c3nCh6th
 IesnR1nXBNJHV4lE8xADAfdIxa9k42sT7BIAkDok55Gt3RK32I0EUi91OXJp+rEaauuq
 mCluFixqBJYVWu9xSqwYHdmwwpBQR4ehybDsbECgs6nDaOzLdAhuy0VpnTXrOQW3T8n+
 vGI+gz8mGM/3/ZyCJctP6WNdfTbegqIJrccpMoKWFzp4JsKtJqRx1inX+sBlQgIXRfUD
 8nxw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781018751; x=1781623551; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o7hZxrOxQsSfFXsDoeNg7xAeFrfoXUdRu0/vaXFQ7xY=;
 b=eqhVwtcdaKQeArCD6FtycGKL7q1qZQ6cQ1GmgGkzDpl50mzaFNd87uWORVrsEAa3S8
 grqqV1IA5c5hZF99TRecLJCxO5oAvwSO4YRJ7ceU3+pyHuV3hho3k5jPFAPEuiSIKVH6
 smtbqWI3pozrzX5NedRQS90irhd13VhIA9XbWkpr7D/XfuBCyA5L5w5PAVKTadZuPQ2a
 Ke/R5ICvfUH8AjMO4l8UIHreEbI4ur1Ha8dCdSLlnX204JkAn6suW01wX+mslYUEmgSO
 PW9gpoPWCVw9FhD9mNKmZQI+J1yA7tY4nt1CjPkadMkovMaDgI1VeTOMHhn5Bb8aIGTJ
 5pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781018751; x=1781623551;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7hZxrOxQsSfFXsDoeNg7xAeFrfoXUdRu0/vaXFQ7xY=;
 b=deZ9+uwQUjh4LEsxhkGIrBVS2llC9nKcIyOFY2zxTK5JNRlhooVAM08vXGcvameHNZ
 BeqKn7mUqugOiWESjlChCSfJCrOLjniOgOYjGzZFkZU9Qrqu+yzdWtQ+XCxw4z9iZAXf
 dF9zhf+7fgQD/gOwnQTlxQ2WJXp4y6RRzrr1bqVAQ+f3cN5cks7URCoZ2/M4Z5FPOko9
 jJuyIspfamB/nBqPXeWNZUg+RSu8YjwFA6PhtesW83APC05NL5fTMIdTRI0+tiarcrhh
 RHG//YE3sVe6jvDlbM/IUUaoVgdJBQeAAR6jSRi0X991WdTq6zVg7lWpu3mbzW0sJujG
 Aopg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9w20eNwZ4bUSXe31wVc0wR0xUC28MConDVi+zwaIarlie5bldSw4Zx9fJqoQ8erOrLv8AeSQkca5eFE1Q=@nongnu.org
X-Gm-Message-State: AOJu0YxFJcICHwgJcn24p8ioIBxsID/q2brHMkUeZ4xMk7pHzsaiC8g9
 0lAVkhZ7LYUb45dtP20zxezz4dm47kTdI6ZsdIbOUHhvI8u3h2dht9nyYlHvEd/n/3bjyJ6H3C8
 k+iIYiAdD3wjs6S3VRspJkjw1w0WVvTQxoDx/0i3/tQ==
X-Gm-Gg: Acq92OEybCbt3f4jYKtiwDkPfGDw4GmRCzxtLFHH5P8zJ9PdUGszN0rU6h5c1dKwpjm
 vMg27OVS0Wk7nxkgTcwQx+9JCNZ1AA95ovTUInHi23hfzZvntUwkuDobjmAUSq0BRQs4S0l14PY
 2scev2eyRH2O0e2rkkjuUPviEVA8MRKv35jX2xr1txakwg9x3XsVtCC/C7NumfdsN8a5UEVS4vQ
 GRQn6Zyg9UFNpukP/DsSTtjwDPPq7RGjpiwKx2eKrbPWj8Q7xEuvjMWrNC6FvxThDHjTCb2QqLR
 WDR8nDf47pGkFTjyNrWqJzRqEwKJFB0Vpd6DxGs1c3FnoGP5oEoI4MNAseSPBZOdchjeoST/6SJ
 alA==
X-Received: by 2002:a17:907:6e87:b0:bee:b5f2:639d with SMTP id
 a640c23a62f3a-bf370376bf2mr1047493266b.10.1781018750780; Tue, 09 Jun 2026
 08:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260609105626.1038690-1-thuth@redhat.com>
 <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
 <CAMvPwGpvpHD+Sx-HZR4FFMJB+W8Rk8LoU0256Q=vwKAdC96HSQ@mail.gmail.com>
In-Reply-To: <CAMvPwGpvpHD+Sx-HZR4FFMJB+W8Rk8LoU0256Q=vwKAdC96HSQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 16:25:37 +0100
X-Gm-Features: AVVi8CdB3SImlFLR632tnSYS0KHxqTkH9TALVmIC-IdIEoCpYoimC7lGmw54OfM
Message-ID: <CAFEAcA9N_O7RZRU+SPTfB_ePasjVZvUsFPhndfQDuHgQ+4Q-5A@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/pmbus_device: Fix a possible crash when requesting
 too many bytes
To: Titus Rwantare <titusr@google.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Tue, 9 Jun 2026 at 15:52, Titus Rwantare <titusr@google.com> wrote:
>
> On Tue, 9 Jun 2026 at 04:01, Peter Maydell <peter.maydell@linaro.org> wrote:
> > I had a look at this bug earlier, but was not sure that this is the
> > right thing. What happens is that the guest does something that
> > causes the device to queue up data X ready for the guest to
> > read, but then instead of reading it, the guest does another
> > "I would like data X please" action. My guess is that the way
> > the hardware handles this is probably not "add the second
> > copy of data X after the first one". Perhaps it is "drop the
> > data the guest didn't read, so the next guest read gets the
> > second lot of data, not the first". But maybe the spec really
> > does say "you can do things in the order 'ask for A, ask for
> > B, read data for A, read data for B".
> >
> > I couldn't conveniently find the pmbus spec to find out what
> > the hardware is supposed to do here. We need some input from
> > somebody who knows about pmbus.

> Queueing reads are an implementation detail I decided on, not part of
> the spec. How the data gets discarded is up to the device
> manufacturer.

So what *does* the spec say? Does it just say that if you don't
read all the data before doing something else then it's all
unpredictable? Is there a way for the guest to get the device
back into a sane state after it's broken it like that?

-- PMM

