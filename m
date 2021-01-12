Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzMkT-0005u4-Sw
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2021 11:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMkS-0005rI-SB
 for qemu-trivial@nongnu.org; Tue, 12 Jan 2021 11:42:24 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMkP-0001Z6-Kz
 for qemu-trivial@nongnu.org; Tue, 12 Jan 2021 11:42:24 -0500
Received: by mail-ej1-x634.google.com with SMTP id n26so4431151eju.6
 for <qemu-trivial@nongnu.org>; Tue, 12 Jan 2021 08:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UIVbbQFttvN17seLXDfAzo2rnf6D0gitn3FMp5UU6xM=;
 b=jPVSko+4ckOv3/9tkxconkkJ8fZU9v66to2XRq08CCjjzMinT1e2MKdjl/Tcx6GuTR
 Wb0D/NcLiPvqxVZGkG+Kz+UQTc5ArBW5npr+yhBcAs9FYB++Gv/tbVOVoO+21LanD0Tt
 Zj6ebsHM3D1r9/6dEFv+qBI4fJQb3QRgLbKLa4j/F+J1oOP/ziw/PRtRsoaDc+IUXY3B
 BIHQ8ux+k39SYgbUuaVelCB07h9nRSf5XbfpyuJRaSDKJWc8qOrXCHTRWGePImDA2lkD
 M0RVckp2d94UqdLjMkIvCeP1r+gUTef+rvQLuhiU1AptYBCLfc+I8Gnmoe+fRzU3Bcgh
 H9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UIVbbQFttvN17seLXDfAzo2rnf6D0gitn3FMp5UU6xM=;
 b=rdt0UPzCYYOGhOYS+/E/3YHqyIwdzmQBPPVRyJC3KeJvUNgEkHpxpOStMtcutoZ4pK
 G9ejYuWYeZkJi4rwqhh0IL4vXnUuAKg5KQpPH5JZmReNOYV0zxPoFx1ENOmbD7aPsupk
 0USHvHctaQnu5qKCGDGCDjpQPN2NVNEZAY5gD2o1rwj1MDRnNDGSMY133DSYA1IWVHWo
 JNNPZXST3kZhnqSGRcXgQDnjeOsCguR0rzl/9vy7iGMBb0rNWBojV9oXqeLQH6JkWK78
 AgAI7XJSWjcoOQz5xAr6NM6LIRWNienahJ8/XBf0wrKJJKSko/rF4Rb3sd43dQYKjdQs
 6GFw==
X-Gm-Message-State: AOAM531XATtG1aKv/kshG+ok8na62XJ3FQomrBJYNkNExWnS47IpU8nB
 Bct867A+46s+gGRIHDpQO2H8TCLems4acDWSUKCrEA==
X-Google-Smtp-Source: ABdhPJzm+wQviwzcL6ioULEfRt8w/EiTe61whI+b0LsCMUzrXdrQN8zrSIbdy/gqIdMmqZyIy84AWk5LttdKrFu4B2g=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr3685036ejb.382.1610469739747; 
 Tue, 12 Jan 2021 08:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20210112112705.380534-1-ganqixin@huawei.com>
 <20210112112705.380534-2-ganqixin@huawei.com>
In-Reply-To: <20210112112705.380534-2-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 16:42:08 +0000
Message-ID: <CAFEAcA_AG77gJySKNRcKFrGsmhn2uNZMyB4aNynD6w5rFTz=7g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] pl031: Use timer_free() in the finalize function
 to avoid memleaks
To: Gan Qixin <ganqixin@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 David Gibson <david@gibson.dropbear.id.au>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 16:42:25 -0000

On Tue, 12 Jan 2021 at 11:29, Gan Qixin <ganqixin@huawei.com> wrote:
>
> When running device-introspect-test, a memory leak occurred in the pl031_init
> function, this patch use timer_free() in the finalize function to fix it.
>
> ASAN shows memory leak stack:
>
> Direct leak of 48 byte(s) in 1 object(s) allocated from:
>     #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
>     #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
>     #2 0xaaabf5621cfc in timer_new_full qemu/include/qemu/timer.h:523
>     #3 0xaaabf5621cfc in timer_new qemu/include/qemu/timer.h:544
>     #4 0xaaabf5621cfc in timer_new_ns qemu/include/qemu/timer.h:562
>     #5 0xaaabf5621cfc in pl031_init qemu/hw/rtc/pl031.c:194
>     #6 0xaaabf6339f6c in object_initialize_with_type qemu/qom/object.c:515
>     #7 0xaaabf633a1e0 in object_new_with_type qemu/qom/object.c:729
>     #8 0xaaabf6375e40 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
>     #9 0xaaabf5a95540 in qdev_device_help qemu/softmmu/qdev-monitor.c:283
>     #10 0xaaabf5a96940 in qmp_device_add qemu/softmmu/qdev-monitor.c:801
>     #11 0xaaabf5a96e70 in hmp_device_add qemu/softmmu/qdev-monitor.c:916
>     #12 0xaaabf5ac0a2c in handle_hmp_command qemu/monitor/hmp.c:1100
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

