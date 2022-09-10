Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oX2yo-000147-10
	for mharc-qemu-trivial@gnu.org; Sat, 10 Sep 2022 12:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oX2yl-00013k-VS
 for qemu-trivial@nongnu.org; Sat, 10 Sep 2022 12:05:12 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oX2yi-0003CE-OK
 for qemu-trivial@nongnu.org; Sat, 10 Sep 2022 12:05:11 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so563229wmk.1
 for <qemu-trivial@nongnu.org>; Sat, 10 Sep 2022 09:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ax6cXacV1irQaJ8kMfnLFDa/FvH1MMuLNH30zp/PRt8=;
 b=sUWxwvg81jKJaknxbkRTTPHg8FbrT+hIhINB/DAbAlJpdiOsc6Ny+6ssEuXfgtlQBc
 aY4W72mOAsHcvcJjmTWsnmP+RmnxpvudkRV4Qs1nfkDOWzV4VrnrIQ5bJ2TS59fr6lCd
 21oQLvgKiU7g6nsq0mbLc67ncM0qPcQpV+/AhzxWvKt1erTOk305ONV7HAvdI2Fi5ApP
 TvVd/fpotuOYoRJI0AIQRPOK5mCKzZw1lnl0gBlfCfrEKq6TW8+iiYMmedri+2Kp8Vnl
 /8q7xbKrpiepkcJU0ZnoBZiWI2BE4DWMYclAq8+qWnr3O+bLHXZeTY/ZYLzuAEqtaFpx
 48BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ax6cXacV1irQaJ8kMfnLFDa/FvH1MMuLNH30zp/PRt8=;
 b=qMMb6Fz0MxgUX5tVf8g8f/NSnQpdSGhOApIwrefIUEVjdjCYtS0oeXRz4+gmKrjmfe
 irDs/4Jhw0ILRLlH5589F3wMxvIwlvv1z+cQbfWA09a476cSydUT1TFJNigu1vFx3SXP
 Cl7MGjX2yVCsHvaqzpgH2Z8QA2wLh0e5m+Eue0bLCK0fxkEra41Wp3b/SlZxKphrXSCE
 lsg83F8U2LsY7eYH10RDI+B+Kex+aEZQCtJwEykbJuJENa+cJMX69KRwaZsrDPVMCx3Q
 BrnpEgPx3W4uYHccEITuaNZcenfEfWia853nPV1lduIQfNdTw/J8l1kXjb+xiuLJRNcb
 CMWg==
X-Gm-Message-State: ACgBeo1XFWn2c0dKXS48v+y7/xqKrXfvnbSbMqLOuccTbN61ai1HAQdO
 4U7+4fDYOC/EP9oZV7wE4RXVQg==
X-Google-Smtp-Source: AA6agR6gmd8pjnoA4J8Pv0xke/6VMFhPcbaFQxqHfZT5q+vX9eY1bJoB+qzWRbSdsMRTCU1EfTdrCg==
X-Received: by 2002:a05:600c:198f:b0:3a6:2482:b2be with SMTP id
 t15-20020a05600c198f00b003a62482b2bemr8889850wmq.110.1662825905889; 
 Sat, 10 Sep 2022 09:05:05 -0700 (PDT)
Received: from [192.168.1.58] ([93.107.230.34])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c190c00b003b332a7bf15sm4718764wmq.7.2022.09.10.09.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Sep 2022 09:05:05 -0700 (PDT)
Message-ID: <9498efbe-8aa3-708d-f9f4-52362bc3e458@linaro.org>
Date: Sat, 10 Sep 2022 17:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] hw/virtio/vhost-shadow-virtqueue: Silence GCC error
 "maybe-uninitialized"
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220910151117.6665-1-shentey@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220910151117.6665-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.214,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 10 Sep 2022 16:05:12 -0000

On 9/10/22 16:11, Bernhard Beschow wrote:
> GCC issues a false positive warning, resulting in build failure with -Werror:
> 
>    In file included from /usr/include/glib-2.0/glib.h:114,
>                     from src/include/glib-compat.h:32,
>                     from src/include/qemu/osdep.h:144,
>                     from ../src/hw/virtio/vhost-shadow-virtqueue.c:10:
>    In function ‘g_autoptr_cleanup_generic_gfree’,
>        inlined from ‘vhost_handle_guest_kick’ at ../src/hw/virtio/vhost-shadow-virtqueue.c:292:42:
>    /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘elem’ may be used uninitialized [-Werror=maybe-uninitialized]
>       28 |   g_free (*pp);
>          |   ^~~~~~~~~~~~
>    ../src/hw/virtio/vhost-shadow-virtqueue.c: In function ‘vhost_handle_guest_kick’:
>    ../src/hw/virtio/vhost-shadow-virtqueue.c:292:42: note: ‘elem’ was declared here
>      292 |             g_autofree VirtQueueElement *elem;
>          |                                          ^~~~
>    cc1: all warnings being treated as errors
> 
> There is actually no problem since "elem" is initialized in both branches.
> Silence the warning by initializig it with "NULL".
> 
> $ gcc --version
> gcc (GCC) 12.2.0
> 
> Fixes: 9c2ab2f1ec333be8614cc12272d4b91960704dbe ("vhost: stop transfer elem ownership in vhost_handle_guest_kick")
> Signed-off-by: Bernhard Beschow<shentey@gmail.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

It's not a false positive, but the fix is correct.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

