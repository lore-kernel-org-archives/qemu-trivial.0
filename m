Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQWhA-0003ri-TO
	for mharc-qemu-trivial@gnu.org; Mon, 20 Apr 2020 09:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34574 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQWh9-0003oy-7g
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 09:42:43 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQWh8-0003f0-6m
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 09:42:42 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:46290)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQWh7-0003eP-Q7
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 09:42:41 -0400
Received: by mail-oi1-x244.google.com with SMTP id q204so8713111oia.13
 for <qemu-trivial@nongnu.org>; Mon, 20 Apr 2020 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Iq5bUMxxLJDAUnu4KbPQ4sg/NUtm752Qnhd5fySRDU=;
 b=X2eclLwxSs4eb22eUyxRPOi/vm5DD8Doy3Y4WLIhvPnDJ4wt1xJxMsYR7DhCSy7fEy
 NDZjkYCKtl0I6H3dKYYqbyuBhbx/LWgRY24uDiM71/xfTVRGYlCuAltFO37Bd+6zGXZp
 s4CZD2rzbqs/WR5TDRImimMxPWECcM3x4X7CuWF9+5oQcQ0RSa/4kI7MvFU93AHEcbf+
 j+WDQ8qIcfuSKaEeul/Ezd3VEJ+LJjZ2FsmD06SklfIsVKcdxJOwMV11b4OESdv0pGtm
 qMCiJ7XpynKa2hTyyqvALOISJDbjb85QHT2xdM9uv9+6K1EH92nxvxK/h/jPTV9WIJOf
 3nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Iq5bUMxxLJDAUnu4KbPQ4sg/NUtm752Qnhd5fySRDU=;
 b=nMeAnlYl0rlPZS7QsnosbvBfuYJzMa0ZygwMyBXmd5jVKzsK0N6WHktrYhIENYlnLm
 RFZ2s9ZRiPNUssq52nXuv2JPBvcURMFiF3T2FPMzVGctvWBJIfUgKlZhxCBgcMH0owth
 w0evnWZ98Dv0PRy77X8H1Q3p7HWEprJTzRsdPYO5j7b4Kiwbmz/JGJiZTaaQuwsGwZOr
 kngYpOY1kU4VbabjWypY8ul5pvuyqWOm51KdcNzMes6DICfVPpdrShUWxZJm92+jTC1C
 ChPHtJd5/P+PdMLLIK1TP+8msFhnV+mWDN82rVxIRqsDFU3X6e3DWImYzUX72WAAs1wv
 LBZA==
X-Gm-Message-State: AGi0Pubrb3YBaJ/FEcN+k/Cix1kFNs3B/tY7BnEkkc+feOsEF3ekDHwj
 5XcnjK5LFn73pqQHSNxYrQYq83VdIJYvy26kf1pC8Q==
X-Google-Smtp-Source: APiQypJQ4by6GZvkqOQ067+mIYg6KNqeHDs9Hh4Pc3VEEx3qiFiALljax1uBY4c/6p0ovCa8GGt2oTSG2qUB5q2prp8=
X-Received: by 2002:aca:3a8a:: with SMTP id
 h132mr10135139oia.146.1587390159511; 
 Mon, 20 Apr 2020 06:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200418062602.10776-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20200418062602.10776-1-kuhn.chenqun@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Apr 2020 14:42:27 +0100
Message-ID: <CAFEAcA9s5yyiqzC0pB4FL-0iM=QTtj2ju=DaCepkR4gU5TGeoQ@mail.gmail.com>
Subject: Re: [PATCH] block/iscsi:fix heap-buffer-overflow in iscsi_aio_ioctl_cb
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Kevin Wolf <kwolf@redhat.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Qemu-block <qemu-block@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 Peter Lieven <pl@kamp.de>, 
 Prasad J Pandit <ppandit@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Euler Robot <euler.robot@huawei.com>, 
 Max Reitz <mreitz@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs1p.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::244
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Apr 2020 13:42:43 -0000

On Sat, 18 Apr 2020 at 07:30, Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> There is an overflow, the source 'datain.data[2]' is 100 bytes,
>  but the 'ss' is 252 bytes.This may cause a security issue because
>  we can access a lot of unrelated memory data.
>
> The len for sbp copy data should take the minimum of mx_sb_len and
>  sb_len_wr, not the maximum.


Thanks, applied to master for 5.0.

-- PMM

