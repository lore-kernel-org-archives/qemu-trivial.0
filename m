Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kdAe6-0005yA-ME
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2020 06:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdAe4-0005vS-G7
 for qemu-trivial@nongnu.org; Thu, 12 Nov 2020 06:20:04 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:33767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdAe2-00078i-Lr
 for qemu-trivial@nongnu.org; Thu, 12 Nov 2020 06:20:04 -0500
Received: by mail-ej1-x642.google.com with SMTP id 7so7177259ejm.0
 for <qemu-trivial@nongnu.org>; Thu, 12 Nov 2020 03:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mtwx3yW8Bx9Eq+J79CcgK1B8BYkrAaVYqOyBWsnkb4E=;
 b=wkXzMSiRcDwuXW+/+bAtM94LLteDSvraggq73XdG2UadnYKFW8QUYgkjftDhagivct
 pgWl+ArErdZsV8eT+PjWkEWXmxrVKGy95UeMj8F/X80iuRSt9WNhXmXbHm1ULjTXtpi3
 rGUx95RNfO+A3r7cz3KrA9bFlJB1x1SspFcgDycfHxA1k9t6dxzsrhsim/I11L6jRtzX
 9s2PqvASdezwlmJKrLvI1nVv+iTpxXNHot+p8O9WUs0JPnPROZXlWn0gJcIFMXiUYwIX
 z5pIVROBCbo+aY9zAujFc0rqaEX7kS2uKzEfYna9RpRfaW4dk3kULu0AOgG5JqJ4EP1t
 VN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mtwx3yW8Bx9Eq+J79CcgK1B8BYkrAaVYqOyBWsnkb4E=;
 b=Bthw/wu3443sd4XHtDJkNnJZnwc6lHc9KB5BiEM18BYjvaeWMhv3meE3rl4uwc6F7Q
 Ja8F6cqxjo+Ro8h0PkxhajpJWfg0xGo4dBRAph0pgj1FkwE+v5VguCJJCu/SsIWoC0aZ
 4OOG1s22przPSV3ShBcSX5Y71UpomdUUSKIa+5Z7OVUivFPoRN2XkJYAlKmPHVbIs+r8
 LKz0j8PW9S74xi5aTeyOa70ncDbAoZhCPqk0T1cllIDC9T+VK+Ga03TGLbPQDqf2ZiRQ
 oYcLO3FXUwYcaq1nXZj0SyME8IsmNLVDqVoNW4B+h/qjG8P3dsBy3COZB7nrKZKCICc1
 Gt6w==
X-Gm-Message-State: AOAM532YZN8/nHYJCBCiaLP0Hsi6cwTKdjToNq7mVm2nS2ujM8LsY/Xo
 Lf419AStUCwrY/MSftTVUxpvNJ+88ghScnkUved0HQ==
X-Google-Smtp-Source: ABdhPJy90I8XF8T6wt34SnOAorSBg1rpHSqL3Ijr8HYB1zL1art1pLylVr42eU/E/BxANRjkWNUtXFgGxgghbt44jE4=
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr28360990ejk.382.1605180001080; 
 Thu, 12 Nov 2020 03:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20201111164710.644863-1-ganqixin@huawei.com>
 <20201111164710.644863-3-ganqixin@huawei.com>
In-Reply-To: <20201111164710.644863-3-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 11:19:49 +0000
Message-ID: <CAFEAcA85O_q2KzNW1mJevEvM0kO1u0vDgpfVnbFBkk_qovExnw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ads7846: put it into the 'display' category
To: Gan Qixin <ganqixin@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Markus Armbruster <armbru@redhat.com>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 12 Nov 2020 11:20:04 -0000

On Thu, 12 Nov 2020 at 07:25, Gan Qixin <ganqixin@huawei.com> wrote:
>
> The category of the ads7846 device is not set, put it into the 'display'
> category.
>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
>  hw/display/ads7846.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
> index 023165b2a3..b455cb5acd 100644
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
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>  }

This isn't a display, despite being in hw/display. It's a
touch-screen controller, so it ought to be in hw/input
and be DEVICE_CATEGORY_INPUT.

thanks
-- PMM

