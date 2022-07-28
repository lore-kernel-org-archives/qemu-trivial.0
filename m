Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oH0Bt-0004sG-FW
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jul 2022 05:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH0Br-0004oS-U0
 for qemu-trivial@nongnu.org; Thu, 28 Jul 2022 05:52:23 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:34586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH0Bp-0004Mh-OJ
 for qemu-trivial@nongnu.org; Thu, 28 Jul 2022 05:52:23 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id 204so1273052yba.1
 for <qemu-trivial@nongnu.org>; Thu, 28 Jul 2022 02:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CclOETi+Vhv48j6oliPuKoZdSQm5aSmbz7ClPj8Nf6Q=;
 b=cP/oE+UtU6ThfpsGMTT3iXPJRWKJQkYfhT3pH8B9SGqwHe9fZu642gXsRYvPAOurXH
 DdzHu2msUaZTZxtLs7BinD1npVTExIyQRavT4M1N6DMdR1UmFv5DgazRPyU2G0EHVSRy
 pwTMuQxAHCXAmxFgP+hIEnV2HWA1mRspuFQoYs61ZwLlbkEGpgh+2JibbNsagtRiQKWi
 dZaeNwRnbR55Iqk3sFzXFrUhMz2gawm12w+qmNXnnXBxbGxbMMYpxrVqfHX7bCo1LNo1
 VPYN5yUfeZZT3IlJpxrLMEg0bk8WPpzsKE/+4Rafl+yIxHLXSnEOlYnZv59Vss15LHSH
 UWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CclOETi+Vhv48j6oliPuKoZdSQm5aSmbz7ClPj8Nf6Q=;
 b=aW34KRNbboJyh6oMx3lOok7+EPVngwGZQN7aq+DyqSZtBTg1q8ARJutyZnM7D2IG7v
 VeHAmR/rZfd8783XbvW2hrsm9xsdA7GUO2jvOn18anD0rtQy4w9P2C3yu9okW6OwaEl2
 xhi38CB96u5HLAN911BJP71BXliw1CZBJdXWPus2n9uym9sVeNAHlHn1zkxlkqKe1Eb1
 Ky2Sn2Vr3g2Ui7s9Si3UxbRy5tRc8fySGGxHbt/wPOpMjI8ZWywaS57bqcB7ZtxMag75
 hShvJtUz3bJgfll4Oongq6ANWBR52FNefFcDXk4RzQuejUMzjJdkTJwmMXa63MfsPKKU
 AtXg==
X-Gm-Message-State: AJIora945O7BDc//u+Ef5VXAgqmih0M3BS8O+jcMQ+Y5+E8j1wIqspUa
 mwnAno3ElNMZ7flcT7U1570NvMokfFKm+YhkwcXn/Q==
X-Google-Smtp-Source: AGRyM1tXSCPAokZuHC4uAYhHtx4dip4JA7ZEV5g+NULYfPj5lhm0vy8I2KpX9Q6M7wvSB1cwsUVV9FyffRr6VM4m9TA=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr20070880ybq.140.1659001940607; Thu, 28
 Jul 2022 02:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220630085219.1305519-1-armbru@redhat.com>
 <20220701043032.GA28338@raphael-debian-dev>
 <87wncx2xw4.fsf@pond.sub.org>
 <CAFEAcA993Z7ty7FvxEX7JjLZCFWrcPRuy2eMJKwoVTZJ1Z7_vQ@mail.gmail.com>
 <20220727172759.GA30765@raphael-debian-dev>
In-Reply-To: <20220727172759.GA30765@raphael-debian-dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 10:51:40 +0100
Message-ID: <CAFEAcA_g-7uM3WN6ijL4RFcb5qRatX11vyeVvSwNHRNXbuAjgg@mail.gmail.com>
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 28 Jul 2022 09:52:24 -0000

On Wed, 27 Jul 2022 at 18:28, Raphael Norwitz
<raphael.norwitz@nutanix.com> wrote:
>
> On Tue, Jul 26, 2022 at 03:57:42PM +0100, Peter Maydell wrote:
> > On Fri, 1 Jul 2022 at 06:41, Markus Armbruster <armbru@redhat.com> wrote:
> > > Could we use a contrib/README with an explanation what "contrib" means,
> > > and how to build and use the stuff there?
> >
> > I would rather we got rid of contrib/ entirely. Our git repo
> > should contain things we care about enough to really support
> > and believe in, in which case they should be in top level
> > directories matching what they are (eg tools/). If we don't
> > believe in these things enough to really support them, then
> > we should drop them, and let those who do care maintain them
> > as out-of-tree tools if they like.
> >
>
> I can't speak for a lot of stuff in contrib/ but I find the vhost-user
> backends like vhost-user-blk and vhost-user-scsi helpful for testing and
> development. I would like to keep maintaining those two at least.

Right, I don't mean we should just delete contrib/, but for the
things currently in it that we do care about, we should define
what their relationship to QEMU is and put them in a part of
the source tree that says what they actually are. contrib/
just means "nobody thought about it".

-- PMM

