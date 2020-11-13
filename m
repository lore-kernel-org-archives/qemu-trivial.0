Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kdW4i-0005NV-AO
	for mharc-qemu-trivial@gnu.org; Fri, 13 Nov 2020 05:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdW4e-0005Ko-RB
 for qemu-trivial@nongnu.org; Fri, 13 Nov 2020 05:12:56 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:42340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdW4V-0002Hm-4v
 for qemu-trivial@nongnu.org; Fri, 13 Nov 2020 05:12:48 -0500
Received: by mail-ed1-x541.google.com with SMTP id v22so10027715edt.9
 for <qemu-trivial@nongnu.org>; Fri, 13 Nov 2020 02:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E7dPH8+MqDC8AZTpAs3Zo2mNH8pxaD+/sIjtCQl3Pms=;
 b=NwglDyLuljDnKqgii9OqAGMe35v+FAMjKQ0nQLd7Lxl/DvWo3Mjtjq8D3bqlAl7RbC
 rpaYzPA17tU8WvaxWaaPsq7sHCbO6rb95tcq/zrbUNMKXu1msTiTfhkn8Xr6BdOybYOy
 CnavXVk7ABmBxFvu2070JRLPWT2sA7oPEwpTwbbfUo9oZmnB9mGPVGrsyKv9xEgMjx44
 xUwwT66ZxAaI8rf9VFybFLhyB90ikPVz4ZpSMg0oyd5oewc9FC+HWQsNLJFX9dytHk0h
 M/ZLZY+6OtWlmbKA55kiZND7zw0XjjyA010HoygvK8mXCZB+1tekjQnuyja0OyySFgcO
 +PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E7dPH8+MqDC8AZTpAs3Zo2mNH8pxaD+/sIjtCQl3Pms=;
 b=rJPl/duWxkG53bsPT0v4IYlQuZCNG/QJ86YYLwU0jy2GJUUtO9dP9KUoW2PASrAj2z
 YTv1C1w6sv+9TPORyS9iGtvdQjAZ/CAu88yW7WAqG2iNJnU8kYDX92Wml3+g30gnoL0H
 bmvBAeJQ7QDSJFE5RExyHueVIW9Q/ZYBYyI/FuWzNoV56nbEhSOgKSS0fvECRrT7VOzi
 39sQerOg/iquZT3N6zlg5JJXMh7alXqFWsoF5GSngKsw8YIERfSgBYe1CY+aoO4rrne3
 SqncTR5SrbaMjYebyvFnWVzLNTwhH5iz4IjBOPORAjoonn0ru4bWcpD3u2ZmSgas4I+R
 GLNQ==
X-Gm-Message-State: AOAM532UWlVjrSfnxXqJJZjBMDYaDM+a23/BTbDkXu6x2Upm2SyuDOhr
 vCT5EzrOvfPcCdB0QxmMrZfmNEyQveML525yvnk4bTD012A=
X-Google-Smtp-Source: ABdhPJzPYaAnKelJ1c9wl3WiMHWkRAQhs9ML05sel2PS7jf5ACkeGYksbVU/p1rU27jBJIjJWI1bS+zUGzmHWFa4CmI=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr1837418edb.52.1605262362822; 
 Fri, 13 Nov 2020 02:12:42 -0800 (PST)
MIME-Version: 1.0
References: <20201112125824.763182-1-ganqixin@huawei.com>
 <20201112125824.763182-3-ganqixin@huawei.com>
In-Reply-To: <20201112125824.763182-3-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2020 10:12:31 +0000
Message-ID: <CAFEAcA-30x8FS8Kmz3AzvJAR0z7_7utAfPEhCTYmq-dvKW9wFA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ads7846: put it into the 'input' category
To: Gan Qixin <ganqixin@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 13 Nov 2020 10:12:57 -0000

On Fri, 13 Nov 2020 at 03:32, Gan Qixin <ganqixin@huawei.com> wrote:
>
> The category of the ads7846 device is not set, put it into the 'input'
> category.
>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/ads7846.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
> index 023165b2a3..cb3a431cfd 100644
> --- a/hw/display/ads7846.c
> +++ b/hw/display/ads7846.c
> @@ -163,10 +163,12 @@ static void ads7846_realize(SSISlave *d, Error **errp)
>
>  static void ads7846_class_init(ObjectClass *klass, void *data)
>  {
> +    DeviceClass *dc = DEVICE_CLASS(klass);
>      SSISlaveClass *k = SSI_SLAVE_CLASS(klass);
>
>      k->realize = ads7846_realize;
>      k->transfer = ads7846_transfer;
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }
>
>  static const TypeInfo ads7846_info = {

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Really we should move the file too...

thanks
-- PMM

