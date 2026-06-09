Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F30CD8CA4
	for <qemu-trivial@archiver.kernel.org>; Tue,  9 Jun 2026 14:55:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wWxrq-0005QO-3S; Tue, 09 Jun 2026 10:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wWxoG-0003ZK-7U
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2026 10:52:08 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1wWxoE-0004ad-IF
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2026 10:52:07 -0400
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-5177d1ff061so2313551cf.1
 for <qemu-trivial@nongnu.org>; Tue, 09 Jun 2026 07:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781016724; cv=none;
 d=google.com; s=arc-20240605;
 b=QlehV9XcIIRVOQ7hu8JZR/j8Hf62vUUaQ7o0zrJOYCRNxDs1kuDV0durOSP1fk5GIf
 gVGfX7tMga5LOHRr6VZP1oHRBK8IHBEGuuaR82qOqSPtD8NXzaarnex7dvlaAdzUdaiv
 qNk+H8faCDE95mzkTT8O8GU21SdrcsMvxmejTUHnoF8A0PDALM7Z2gw6D3eGt2wTiahF
 +rm1IP9+5WpmjQsrIyZOVudtWtZDksnQ1xTgNu4tc3gVWE/ibT7msprdVLv+VFcVPyeY
 n5oPvYbfVZU10p8q5/E6snt+N3grCFrXHegFhE28wY2EQc6C+/0Ilb8/Xme7VjQqrePw
 nDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mT7L+1cUtlPaahWEj6bhvOX6q91ZJhOLDtmYP2cxvEQ=;
 fh=RTMLXKCRyPyOLZ2JjUpr7Ho+CgDygkMl0je6keSc6+I=;
 b=iSVFnlAQhb0ox89iXGPeyaJDX89qjVlk+h40R4XqaQbtWp7wKYmvA10Pj1z9UCkD/C
 cBABLe0Bi5QG9QZOaih54L9uI/6EA0HdugQuONcnqXmkOmB+i43gz/5wiZGcf95h8Y6b
 /QjHn/su0ugo2QpWCMvWd9m/XHpFT1rXCdZBznuOXRAc9XFvA2Fdjo3UiVSc1ls33YP9
 +Jqg0RtGpi6LML9PXy7JLDN+9q2efdWKzpdeKO4MsTuMXZLjzo1GxPTANB86zDFYJPFG
 TAWIDXhztDzUtnZPcKixj+s21grhAQs0jfL96UcGQe/DJOYjIxXdY8bN5agSQ6m0LlXO
 6N5A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1781016724; x=1781621524; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mT7L+1cUtlPaahWEj6bhvOX6q91ZJhOLDtmYP2cxvEQ=;
 b=guptycxe07D+Q47rkyJz8E6G1ni5nvujk9MaDtRU9zxbuC632g03ATblufsNM7Nqgo
 Chnak9yjXXvinFHV4DlVziqv08nreyXkmLLhIRn4W+0CHmJri90QB3x8E6bi0G0sNriv
 npLlX2SH1Htp9qpVm9Ydn6qFreiE/dqWHuhhmDu3Nu32K9zw4R4eDd2S9vMG0gmNaDMW
 wNMY+EBSdtLjr2S0amoLLPzo2agmPLXVFNFo7cTx6J2ezyQFzw+elAz4iZC5F9Je8RFU
 1NKPmbMYzqYSlPZbc8VMNUD7o0R7HKAkWUEUBvNsUGX5vdDOkIqFtr46Rz9NdbLi3Ftj
 9HOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781016724; x=1781621524;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mT7L+1cUtlPaahWEj6bhvOX6q91ZJhOLDtmYP2cxvEQ=;
 b=oi/UESJ0fQ/bulg+pIfe0+E2aW63xe6eGSwNHahcXtRwmQ+t/hnQlEMxBCzh2Ur89Z
 4FFcYgaER7C1SxQG5seG+BfBgbQsEWumv1cntgZS55RMRj32lR56fWkYNWQGllZQwSZx
 X5KXdy4tpKfgOOTkVo8pdLJDGXGx/YkxPjbAOWyCdf+GU1hsX78glKiVf6HGTifJ2CVR
 GdIuIgbZG28PQj59GZhSqwjuhiHB//Lcr8RQ2UffLwg/UcgEod17GlWrAZPQ9UqAqzl2
 88twXdznQvWcAYQu5NfC10yWzmdZ03MA9lUB+MogA0et6BIfkhBRfZHRdRCJQmJgBvb/
 IIrQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+mk/NRpi/0U5vJuy3YFB2h5Q+t/tnWpDK/NKluCeoF5M5OHwIStszmHVeJmLaQgbBQSAcZ8KufKZcNP2s=@nongnu.org
X-Gm-Message-State: AOJu0Ywq6A6VpSqFddabZnw+XcrTZODRxdS+rNzAiRN8E58mYdDww79t
 EaCpvFRzrvCL9iYo8eQZH21mlwWxRjAGnc6OeM5+ZYsKYF4C+tMzdy9FM4Yt1z+DJRGo9OaVk4j
 xKEhqV3laesxh4YkEbfwGyC33V06oODpQ4yPtqidp
X-Gm-Gg: Acq92OFjzuol3UWn++OiqYOUUDsH3DwMRt0c6VB4JgV7Ib/RS8ABIE5RovP9+kTdgP1
 Dit7bddzrS5iwraO4S2y2omS0yq6sTiQKLdcnFsca4SEQA0AL0Yq2kDpKpkRsC3xq/JP0aCfPv7
 obz4x5Ex/ahesqh0Q+5DBJyfNAh0wrJ3sXMonQIbdkS9ATas2xj3ASt+Jgig8cdyO1rcBAMFIwe
 UwWWTm3kG6h85lVJb3WhOrJd/P8qQs9G2kFKWJkvF61uTBqlz8YID982TdqWfUk2JRFhPSSiG2u
 GcNKBZcLfXp+R/HDkT52hpakAJy6GIJN2P6B05tbcU5lPuUwwA==
X-Received: by 2002:ac8:6610:0:b0:510:f9b:fb5f with SMTP id
 d75a77b69052e-51798298a3cmr32128971cf.16.1781016723550; Tue, 09 Jun 2026
 07:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260609105626.1038690-1-thuth@redhat.com>
 <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
In-Reply-To: <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 9 Jun 2026 07:51:20 -0700
X-Gm-Features: AVVi8CcM3axo7mAEJOZp-nioF3imcVzHW2yLICbkWxeE6AKaOP-rr_nCCejynOc
Message-ID: <CAMvPwGpvpHD+Sx-HZR4FFMJB+W8Rk8LoU0256Q=vwKAdC96HSQ@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/pmbus_device: Fix a possible crash when requesting
 too many bytes
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=titusr@google.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 Jun 2026 10:55:44 -0400
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

On Tue, 9 Jun 2026 at 04:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 9 Jun 2026 at 11:56, Thomas Huth <thuth@redhat.com> wrote:
> >
> > From: Thomas Huth <thuth@redhat.com>
> >
> > The pmbus_send_string() function contains an assert() statement that
> > can be triggered by the guest code when requesting too many data
> > without reading from the device in between. This should not be possible.
> > pmbus_send() already has a similar logic, but it simply ignores the
> > error after logging a message with qemu_log_mask(), so do the same now
> > in pmbus_send_string() to fix the issue.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3388
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  hw/i2c/pmbus_device.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> > index b1f9843f52e..6aa608a2998 100644
> > --- a/hw/i2c/pmbus_device.c
> > +++ b/hw/i2c/pmbus_device.c
> > @@ -104,7 +104,12 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *data)
> >      }
> >
> >      size_t len = strlen(data);
> > -    g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
> > +    if (len + pmdev->out_buf_len >= SMBUS_DATA_MAX_LEN) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: requested too much data from PMBus device\n",
> > +                      __func__);
> > +        return;
> > +    }
>
> I had a look at this bug earlier, but was not sure that this is the
> right thing. What happens is that the guest does something that
> causes the device to queue up data X ready for the guest to
> read, but then instead of reading it, the guest does another
> "I would like data X please" action. My guess is that the way
> the hardware handles this is probably not "add the second
> copy of data X after the first one". Perhaps it is "drop the
> data the guest didn't read, so the next guest read gets the
> second lot of data, not the first". But maybe the spec really
> does say "you can do things in the order 'ask for A, ask for
> B, read data for A, read data for B".
>
> I couldn't conveniently find the pmbus spec to find out what
> the hardware is supposed to do here. We need some input from
> somebody who knows about pmbus.
>
> thanks
> -- PMM

Queueing reads are an implementation detail I decided on, not part of
the spec. How the data gets discarded is up to the device
manufacturer.
There's a separate issue here though that I have a fix for.
SMBUS_DATA_MAX_LEN in QEMU is for an older SMBus version and it needs
to be increased.

I can set aside some time to bring the SMBus implementation up to
date, but for now increasing it to 255 will put QEMU in line SMBus
v3.3.
-Titus

