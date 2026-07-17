Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0395BC44507
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Jul 2026 11:05:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wkgO3-0008Ci-Gr; Fri, 17 Jul 2026 07:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkgO1-0008BJ-8v
 for qemu-trivial@nongnu.org; Fri, 17 Jul 2026 07:05:45 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkgNz-0005d1-Gy
 for qemu-trivial@nongnu.org; Fri, 17 Jul 2026 07:05:45 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-81ee6b2da98so16420507b3.3
 for <qemu-trivial@nongnu.org>; Fri, 17 Jul 2026 04:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784286342; cv=none;
 d=google.com; s=arc-20260327;
 b=E+xQspeYfMwp8ZZeqqYY2sPFFP/D+dPpoM8wM02RsLGsKv7OVOnhSTPZQbq7lODCqo
 EaaDJtU5OLA0wXMdDEpt2D9es6A39lQnoibAvINgryNL5mQMCtvDm8JFBg9ip3kCOA4e
 HT+Fl/g9o6+fO10HX+DaDFieX0nMYKk4LCoVL78izIUoO2RaxYSz6RA+Yg+/BOeqv6Yy
 QjdpEe1IQXFTOCT31365mg/8XGWmT2aRwxHEYRgIYRgsnjwLpO2Lken959mX2hdCHgq8
 SysGKBXWH6ErdziF+uvT9DkzXM2M0pWrIq8EOut54vjgWcC3QCb9+UWF1Tj1nHjayNSN
 hhqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ekVtR/loJxDrA3aerqu3GtkExdV3IdtPovuInh/R/9s=;
 fh=Kxffzyf0684xacaqcgr+6NY1xyUSmzRXzga2XFKAjhM=;
 b=O74fr/Y52bV88D1pFJH8D/b4eHVmvqqFH2NjxJC5jcNJFe1Ga03hvMsvTXIowijGTk
 6I4wkAGvvT72lw5i6uvsSPL793giuRieg/yTS0e6FAAym5qQTEDGrp6ChbHTbkipQlzf
 Zw0W6wfoQPfBqjbwhe58+eBscUyIyZ/ljiIMtxNXDNBh3EDxxsahhSkzerRQPxQkU72t
 XedjbTyNXhh/Xs/kIOnRqVE3L8H/Nch717XJeezWY5mQXpiSUn+XsMwfEwI4uweZQxuM
 3+9VEcHrSO6wny5Z2pXzbC8j0VTpFwAgi1XRrIz6Mhxo/Ti3PyDD3/crcbo6HkKaZ5AZ
 DyxQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784286342; x=1784891142; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ekVtR/loJxDrA3aerqu3GtkExdV3IdtPovuInh/R/9s=;
 b=DtgS5lYZz9ps1kprAaDVG2mqrLGLxLY0zW+LD97zEzobIoeOo8VYYbvXUBoDfaW4+Z
 Tl2NJdZskKYkEEw1a5C1QDT8D3nQRckKtNH+D9P1gWSpgzekdue7+k9/7IPhQUXQLTXV
 C9rGkW2iRCmBlf86EpbRcSL7qiSKYYrWHR8uOW47sJiMDAyNZ02T/y7ds/ksKWgcBbx3
 OHyGq/iJs+x7MrA8BzHoQnu6AO8yQWLR1slnMKavxLAqTBru9ln1LxU6CIGH1glWulP4
 5TqQoXSSpT8Oe3IJ5X8iVsGB/Q4w9bY3R8U8zg5x4ihPFEdpfQy+L+0YzG58BpDyRRRz
 Mqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784286342; x=1784891142;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ekVtR/loJxDrA3aerqu3GtkExdV3IdtPovuInh/R/9s=;
 b=kozl5lzUFmN/Wxc19ykbiAcbrKSMsfDcRwfst7MWVnNLu9Lja2gDMDYxnqD4sk/z59
 XjGwwO+nHy74vBJAenw23f1eMYeME97LO9PUzLwVqo/TST36+WJxa+UDLhGTClqwcZvy
 RwEcRHkUPLqrntx7Pxc+fbAqcpFEgb1b8fBJlqW47dcJqKM1k8wmNDNXqXs9fIRux4RU
 BryRsPaCyWgI9ur9Joq7bnrrf8/TjkWmL4TVPbBlBh4bkCijOFP/I2SwQfsnMqY4S1G+
 5p3fs5yfw0Kd0RDJ8Hzxpm/MZ3+eSbcCfNVQGtqzkpWn3cd4qZqzleNpr5Fg+BGck5jg
 yJ0Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpv1pbawzS2pjPhx/xBM/rNJHkO2YBO5T/wipYfm2L1xd9IdV7SVZoSoHo3dSnio+OB3aRw0llK8Q0dyS4=@nongnu.org
X-Gm-Message-State: AOJu0YyClp/6W4XsU2B9xdNszhhpE7He+/D3qJSfNyzJYpLMNdqsSLoH
 zlMW3WkJyJEr4/AQjY2XSVfJ5FzwprtK2D8ibllC8luYWEWYWtSP0Gg+kc7cZseZhznlOAKDEP7
 VOPyS8ztpQxqbVhsKN3dkDdz0tPkVckYIY/6yN+ikoA==
X-Gm-Gg: AfdE7ckLT/GVmZXiPl9qvDtYlATBWKHehlpfOHFiDQonW2N6DCGkTBqZLuCnXB1IUIT
 pCwY3KqKQ+1E/5AAcJmU6dwDYFfs+Bv2xbMf0VLtVMPD7n50gDuRrpjGmuVYv+d46Z8QLqGlhor
 pzniTcN8Ii1jBOH2xAi/OugXxMpvK8Tj9tcFriBnATPh9y+j+DFpwMfqBfiJsVn2sHJVUzoXtSN
 KS0K502rqtDqDctNGs1IEIWdl1z4SXa/i7wlXE73RvxWeovPdQyHaj0KeeukfoJgZzqxN/Rl6f7
 dt58SVnLCwxM5GyMY5PD1htDW7kdmBGcM6jiwsEPQYANdsR4gUtshCVK
X-Received: by 2002:a05:690c:e3ec:b0:81e:c972:e8c3 with SMTP id
 00721157ae682-81ef252281bmr5824547b3.29.1784286341730; Fri, 17 Jul 2026
 04:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260716193321.256391-1-thuth@redhat.com>
In-Reply-To: <20260716193321.256391-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jul 2026 12:05:29 +0100
X-Gm-Features: AUfX_mzVAvkMgtpzTvt3oL5b8INESf04TJZp_VHQrGdBZF8IGE9zE_US5SFKiEA
Message-ID: <CAFEAcA_s8pZmJu9GW5Kqkg=7UZjKcMOGCrQNz=n_z8vY45doaA@mail.gmail.com>
Subject: Re: [PATCH] hw/usb/dev-uas: Fix guest-triggerable heap OOB access
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-trivial@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Thu, 16 Jul 2026 at 20:33, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The stream ID is under control of the guest, so we must not use
> it for indexing into the status3[] array without checking it for
> being in range.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3612
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3986
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/usb/dev-uas.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
> index 8576dfec96f..7df58cdeee7 100644
> --- a/hw/usb/dev-uas.c
> +++ b/hw/usb/dev-uas.c
> @@ -383,8 +383,15 @@ static void usb_uas_send_status_bh(void *opaque)
>
>  static void usb_uas_queue_status(UASDevice *uas, UASStatus *st, int length)
>  {
> -    USBPacket *p = uas_using_streams(uas) ?
> -        uas->status3[st->stream] : uas->status2;
> +    USBPacket *p = NULL;
> +
> +    if (!uas_using_streams(uas)) {
> +        p = uas->status2;
> +    } else if (st->stream <= UAS_MAX_STREAMS) {
> +        p = uas->status3[st->stream];
> +    } else {
> +        warn_report_once(TYPE_USB_UAS ": bad stream ID 0x%x", st->stream);
> +    }
>
>      st->length += length;
>      QTAILQ_INSERT_TAIL(&uas->results, st, next);

Doesn't this just postpone the problem? This function puts the
UASStatus struct (with the out-of-range stream value) oto the
uas->results queue. Later on we will end up in the
usb_uas_send_status_bh function, which picks USBStatus structs
off the queue and uses the same "assume st->stream is in bounds"
logic for finding a USBPacket for them.

Also, once we put this UASStatus into the results queue we
will never take it off again -- the code for handling reads
on the status pipe will only remove and process UASStatus
entries where st->stream matches the stream ID used for
the read on the status pipe (which must be in-bounds, we
check that).

The copy of the USB attached storage spec I found is not very
clear about error handling. But I think there is no way for us
to report back the "invalid stream ID" case. So I think:

(1) in usb_uas_command() we should check the tag for being
in bounds first, before any other error check; if it is not
then LOG_GUEST_ERROR and return (do not call
usb_uas_queue_fake_sense(); have comment about why not)

(2) is usb_uas_queue_status() and usb_uas_send_status_bh(),
assert() that st->stream is in bounds before using it

thanks
-- PMM

