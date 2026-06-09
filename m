Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA70CD8CA8
	for <qemu-trivial@archiver.kernel.org>; Tue,  9 Jun 2026 11:02:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wWuEC-00021l-C3; Tue, 09 Jun 2026 07:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWuDP-0001wa-IL
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2026 07:01:55 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWuDN-0005To-Ic
 for qemu-trivial@nongnu.org; Tue, 09 Jun 2026 07:01:51 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-66061993294so5637785d50.3
 for <qemu-trivial@nongnu.org>; Tue, 09 Jun 2026 04:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781002908; cv=none;
 d=google.com; s=arc-20240605;
 b=Zvt2QMxdlXHdImasj9yPYYsyQUGCtiPy1VqoN6S7CUny6aYFitazANOfYdKAOa/ApQ
 3K8O8+ho6PBseeYhOIN4SkC7jY7ovZUZBb4A9pzGwbwUEibej9uMfvvSKQrfuL4Ypb+P
 /kAJFEb3qh7F9Kmi8xYq2qyweLHek0eF8HgEUi8WJS0/xJcpNjyN0E9XlEuJQ5pPG6Vl
 vwuRMQtbHamerndbHVreF5mS0tTs0YoblfPdABGA7ZC335AXwobA8IEH6DW0Fny0C09N
 KK34O6iEz9jdWXMQQ1SrM58nRRBxALCGFeR5lOE2KaWBXz+ATiD9y9WWdE8B0QntMRu0
 p08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=IWvx6N/trd7GUv7lRQQJVJ/o7RKzQvf1YBdlMGaL8p0=;
 fh=Z/1Bxf1SKsldcU1HcO3ENRq6sHiHEh0sBxFcBHMqUgY=;
 b=ahYwdvZIs74mypVVMUPlXarFuU6FOewX/KtGf5Mmfp2p84LMtAI5ThGJvGxPjxZ5Gf
 5TAK2OaaGtyBMz2A+0d/c+GN2m/fbkuy/XKLLLQqN5Pez3zTuXDNV0CdQdcjupDe9E0b
 ykwEyw7wGTf8yeGl2pqxkd4hvRPZF3wkcJb/mHSKlxV1rinhZc5GoDU//ezl7ToBZmZh
 w/iRFZLwgfA1DPiO4W4+UHkrJIVc1vBJVnCNxs/XOIGnPYBImFarFY3LV/taJgLjxtFh
 YXzTBvdJibtjy1X8qCBkCB4Fz7NCT4tKW4xfqB+Y/RZzS5RCtd/I9KYq3+r5K6Mk0zkg
 z2xA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781002908; x=1781607708; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IWvx6N/trd7GUv7lRQQJVJ/o7RKzQvf1YBdlMGaL8p0=;
 b=j982zha9PMd0YJB2FolzjXg8DnxZPgzYM+fNPO2h7b43IL/z1IuRFeFZsbN/oBWVyq
 vrVXgYoCQ6gbuGPTz8Pa/sif8FxanER3ffotZ9Jp3Jz069G7HK01Fnp4nZYfAlG9jBw2
 yFRdK8v5cNiSU2Mqex2hqMSgG4mlhsWWtK8TNkqdPsRWvr+0xdS0yt7oCfsGSl/6gICZ
 PPh+7fIR4sfr1Xxt7ZP44beVKq+mKS9evTxsdfnCxjNKOR1XIXAqy1IO8q+VBjeCCD90
 kYDo+aoDyotgdOOPfXIIqViM4OjPXALZ3FdfuHNaTtDwhMCjIVngQ6oS6pqcofyrBVYW
 TkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781002908; x=1781607708;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IWvx6N/trd7GUv7lRQQJVJ/o7RKzQvf1YBdlMGaL8p0=;
 b=nHHuQQ/69XGC4uHRMnzWzM+lcarOyOiuphqatNfudTKJUTZq+2Dh627PVZY2rZ2l2f
 610MmUvrpH/p8bKe+Jkq68jyuBAjZ5qJDoYqRca8dJEQq89+rCQU2wlTG1l/puwMawIq
 kvtu9sVBcMrahhI3gygAwvPhNulxO6puykVm5ki5A0TJAEn4ExD7ZiRlD1OmMtnUEtUG
 67SledyJIfmbcug++WGZ/juZK4QfEWzA9ry4MBvt+IiEHWKCbTZY94APwMXo5s2dK9yz
 /1hdM0+VGivndVX3dPbUdU9O8nEAHwaK5HWZw7C8SB7UePvGqbTr8n4JC5H63dGs5CZa
 DRWQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8dJ8pK0BuVUgRaUdl1OEBq/BWzM+OPjEYOyez/2Dj4KWg89fhCPyxDID29OkTElb9ejLx9PN7pWSBDoJo=@nongnu.org
X-Gm-Message-State: AOJu0YzYuK5rbx39cS+Ig1kqc1VOIPqi9FFuMmkNaWqlOIdMqpC44+XN
 0TApWDvvaN2SWn4qTw5E7bwEGhtcmvtodyFKiDZwcfbRoNN98VSwrhizvN7YEnILp4Qm/88f7iM
 a2c01mRRMQZlVhd0GJ0s7gwIqdhTButXL2awfbGEJug==
X-Gm-Gg: Acq92OGrUbuqFswIpPSwASVoN2PVYHKGEiVzFrsWkTQOGsr5ramioU+pYKlovrRYLnG
 iHwzXoZ9j0U68CakPRnRL3nV7DU0FAzVz5ZpxEvKFqc4bQzEOD6OB0KOvarCL8uNz5vxMgPyJqS
 b4ZXBrR07Kx6B20pq9Pw0ulOhrgLsnYIv0qgtj4Shef5suX7HeT5Vgxun3WuEDcp17IcTYgoSWV
 XHCxum0EocsAPUTGOevBnBlASgKHpNFoZiDn8YSSN1XciamT5DdlJDqFFD9ICiENYbZdbfaWW2T
 0lzpn3tiQ12OFE3WzCVYVZLR6VWhYLjjPs9orbsRXVlP6gcjmFcPdvCs5WHzBfn0OJX2pglZp6H
 YlpkogK0rvJqO
X-Received: by 2002:a05:690e:140d:b0:660:62e5:9300 with SMTP id
 956f58d0204a3-6610779e02amr17201153d50.48.1781002908052; Tue, 09 Jun 2026
 04:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260609105626.1038690-1-thuth@redhat.com>
In-Reply-To: <20260609105626.1038690-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 12:01:36 +0100
X-Gm-Features: AVVi8Cc8oKQrydmGDQOBxXvHxwWMlyhEXLAqM4JoePjcSpmZv054gl6whVUi45E
Message-ID: <CAFEAcA9O6b02VMuto8VzaEsVi3zTqNtQKG_RcMaPnNdPXGUBhw@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/pmbus_device: Fix a possible crash when requesting
 too many bytes
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Titus Rwantare <titusr@google.com>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 9 Jun 2026 at 11:56, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The pmbus_send_string() function contains an assert() statement that
> can be triggered by the guest code when requesting too many data
> without reading from the device in between. This should not be possible.
> pmbus_send() already has a similar logic, but it simply ignores the
> error after logging a message with qemu_log_mask(), so do the same now
> in pmbus_send_string() to fix the issue.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3388
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/i2c/pmbus_device.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index b1f9843f52e..6aa608a2998 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -104,7 +104,12 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *data)
>      }
>
>      size_t len = strlen(data);
> -    g_assert(len + pmdev->out_buf_len < SMBUS_DATA_MAX_LEN);
> +    if (len + pmdev->out_buf_len >= SMBUS_DATA_MAX_LEN) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: requested too much data from PMBus device\n",
> +                      __func__);
> +        return;
> +    }

I had a look at this bug earlier, but was not sure that this is the
right thing. What happens is that the guest does something that
causes the device to queue up data X ready for the guest to
read, but then instead of reading it, the guest does another
"I would like data X please" action. My guess is that the way
the hardware handles this is probably not "add the second
copy of data X after the first one". Perhaps it is "drop the
data the guest didn't read, so the next guest read gets the
second lot of data, not the first". But maybe the spec really
does say "you can do things in the order 'ask for A, ask for
B, read data for A, read data for B".

I couldn't conveniently find the pmbus spec to find out what
the hardware is supposed to do here. We need some input from
somebody who knows about pmbus.

thanks
-- PMM

