Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0830EF506D9
	for <qemu-trivial@archiver.kernel.org>; Mon, 16 Mar 2026 14:24:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w28rk-0003w0-Ul; Mon, 16 Mar 2026 10:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w28rj-0003vk-GK
 for qemu-trivial@nongnu.org; Mon, 16 Mar 2026 10:24:19 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w28rh-0000ko-Vz
 for qemu-trivial@nongnu.org; Mon, 16 Mar 2026 10:24:19 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64ad79df972so4742838d50.1
 for <qemu-trivial@nongnu.org>; Mon, 16 Mar 2026 07:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773671056; cv=none;
 d=google.com; s=arc-20240605;
 b=UGtNS2IBn71uZymzQv6857r2RGi3saE0vDqgxJq82sU4F98XoBOKKfrek8YaGIrPlp
 UW+1MQ7JQiDlwPBY330OvLGXqz2pkuyZ+1yL9Y/vVsguOaN5uY5f50kqcTq5eUChKpI+
 s+Su8VguYIg9lOsPqtw9swsmqCa3L+zBEwc/7xRdL1qC+8emhFA6TKcxtA0Danc2zj1I
 Pcy6MGQwLvIXPRQVxNPdpqAC3YRinzgNd6/Rb3j+me7cP/iBy2CHaTBG/nGgMaTTFkAO
 r5CM445OlNKvyQPke70JkeR1t+perAo+tgiMBYR5vL1V5XzjqGqIzaEzq1fCqR/U1tog
 Sg2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VDA04NpZWwJQrY6iT1SQok0uwi8301C0SCSMaooDszE=;
 fh=1YEuNCVYub/vd/qjJfDE1ahhki/ET9hMCiLXQnDt3+k=;
 b=CfeYY1wdmeOd/77RMkkMfPnE3v572eH77RVmVCyVezBMFoWAGy+04FFP3NgnNA1P0W
 LOmeytu0tIMfDjwuTQiA2NHueAjBg9FgbQUqiN06h4MsHP8UZoOfV5qu8cQ+UA/jnTeV
 LfWWE3K9Znti9NwjmpunLcOloe9iaKb99lZ6t3HZ8WRU9ZVagJj8BnOhFYY8biE1pVoZ
 zhfP3taRp+Ua33w2F5nq2MKiuUzNZtXf8oqiYQTVbpCh/fhUWKBrWxW3y2+zO+2ACO8e
 200XVsR2COgJuVU2JXHnvd8gnzfKY04ChPPMO9CT07WTXb084f6+4SmJ70Rua3gTtdZo
 aLeA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773671056; x=1774275856; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VDA04NpZWwJQrY6iT1SQok0uwi8301C0SCSMaooDszE=;
 b=qnQsbSICfiA0XYepnp487/H2VAnAcE0L1NrMbHISpy/J7iPelN30NTxcm6hX4/IXFG
 S0M70W7MDawI/pwFRF5ZKZ0lTT8XVWA3PFwra3noEqYJdT8NnCrketwcJCQ1RO9g0HKU
 E8h04farxd2xvvwqJ+RqZOpX4IhpcxCDxMIJgod7Yg6p/8Wpt+M5cpMLiKM7VADm1j7L
 l8e/kagEgZlHG7kvwKR4DUHqlbo7qHvSwGEphAQ83qD4fZ9uNK3Y4KxJf97BrlhJAtCq
 /UZ+WnODv5J1MMuhZ8pJy+CrsJGShNTbKjQroyNKcWy8j5Isllw2k7Z/Ik0y9yhW8A/X
 fgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773671056; x=1774275856;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDA04NpZWwJQrY6iT1SQok0uwi8301C0SCSMaooDszE=;
 b=EC5ShTBi+DY3/eCq02tuGrYt6oPY8nT6qN4rPTgwv08ZEhOb88U7T1CBKl+R+WnWCm
 E1XM7r8KvenaetY6ZsXl5SswJTomAHGH0Z8dDSvGkSmCJvEmATYeH5U0OTpPmBhbV9Yt
 cI5IrG0rQVlFYEqtcXdAA6FkGR5Yvd82PttYY/wzRGicqdHr2h3b+6izxbjFgjF/q7pI
 RfQhIpW18Z+LVzKvNtcQqLZ5NDWlai9z4sdaCdejSeGCbsrUHdgA+DHWiFCe7551bJ1Q
 VYNvN1z1Yc7NFNKpf0GC0sPMzmAsRkiafw0aiJJJrVQp1glr+E7n72n+qHJ/QHYIwsjC
 w5xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeAEZYQGFrvtXxqHxHvzhbKG0eA4NEZkiDgYLYEL6RmP23F6xwcfYxVa8IF5Myfna9saQEMkyCSEaf8yQ=@nongnu.org
X-Gm-Message-State: AOJu0YwRjif5uZzb/MNY+tTYjp9JJwDw9zrfBaKOe7ijDj+4lotH5bMz
 coHJlxGB0IzZuPX+MmpGm6ASPV7YHgCCef2dgMxvZ5lP7atxQnuHEo3LFd7GXBlwwV4WWRgKA8u
 owW0r6XmXuo7jBGR/yWBdr/AGA/xOrmGd9RlNZp61BSfwRrsZErPc
X-Gm-Gg: ATEYQzzCSpu1TJbB/w6ao2AvSFGTWtJYNzjiyiSXXX9hNN0jibo4odKggZf3uGL1uDp
 T+CCq9o+WP3ntlueJCzKba0J1uv+3XOs9snbHfo2hSGO9Il8WUZTVq7h5sVI/cVNWHy34aJRyWc
 /8Y24n01XDm0qKqJl9IOoVlydTMtqL5rZCLdDYl914soG+sLTqs4vtODU4oOTWJo0O5LCrDJMok
 5mg0KqvwBhyl986yGc3ts3r1P3WsI8S+GCVirakJuMrYx3qHstqtpFQFqSwVrM4J71TRtSNxpLd
 5/G26eYFQk+d/8EcEVgfHsjI3LsEXucIiOze4b+hfd/3b/OFuJth9tY99a096Vo9aws=
X-Received: by 2002:a05:690c:e3e5:b0:796:357a:9ae7 with SMTP id
 00721157ae682-79a1c1d827fmr131533357b3.51.1773671056417; Mon, 16 Mar 2026
 07:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260316105244.107822-1-mjt@tls.msk.ru>
In-Reply-To: <20260316105244.107822-1-mjt@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2026 14:24:04 +0000
X-Gm-Features: AaiRm53YZ_2fIp5w6JyRd_n1R0J3-r5wEAl5qsYO1_MWnv0kFEb_NgDyi0_IPq4
Message-ID: <CAFEAcA9LKPZZ4+5rL6+AOXghbsS1AgkaAi6B1uAEXp0UveHNhA@mail.gmail.com>
Subject: Re: [PULL v2 00/13] Trivial patches for 2026-03-16
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Mon, 16 Mar 2026 at 10:53, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> The following changes since commit fff352b9b6080e580aa1fadd29b4eccf4cb2922a:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2026-03-12 15:21:06 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/mjt0k/qemu.git tags/pull-trivial-patches
>
> for you to fetch changes up to 7cc61f922f4b5db006e8f03d61208a3d652ed2df:
>
>   rename CONFIG_EPOLL_CREATE1 to CONFIG_EPOLL, and stop checking for epoll in meson.build (2026-03-16 13:50:18 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2026-03-16
>
> a few patches accumulated in trivial-patches tree to date.
> A larger part of it is my linux-user cleanup series.
>
> v2: drop the slirp socket change (net/slirp: allow hostfwd socket
> paths with dashes).  Not resending anything, just the cover letter,
> since the patchset is the same except of this single patch.
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.0
for any user-visible changes.

-- PMM

