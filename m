Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpAb4-0006Fl-8Z
	for mharc-qemu-trivial@gnu.org; Tue, 15 Dec 2020 08:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpAax-0006F8-OM
 for qemu-trivial@nongnu.org; Tue, 15 Dec 2020 08:42:28 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:43910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpAau-0005DE-CM
 for qemu-trivial@nongnu.org; Tue, 15 Dec 2020 08:42:27 -0500
Received: by mail-ed1-x541.google.com with SMTP id q16so21024374edv.10
 for <qemu-trivial@nongnu.org>; Tue, 15 Dec 2020 05:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5XIY1ylh1qbxux1IK92h1uyY4h3lCwFDABDdo2wJwf8=;
 b=GbIC48qiCwaSObsjH7GaYGov3+/63QqyQSI96hEIfOJWL+Fb1TJP2bNiwERHwATRn1
 poPa4dc6EEQwaYgWkwgGPT8xubIVY+CmXE7vzy5e3TUnsKuuN8ZZV2HPRbWoFmiF/tWT
 ZDhHYLpKB+Z+I3x8J87NbbWezrYZIOEQ9Ki5iNZmgE59raarHtOir4rJtl3E0nWr++3Q
 ovoK5XCFC2gxMCpdbCZZ+GxN9W0B9iR9Xgop18lE34D4Z1fRaBW/lZl5JeVQSDXN2Xso
 98+46nrOMbJUhH5KE4Lr4SpNT+n0uj0LMa5bFQNbSSBu3kXuHEKZpzgR5g/NZetqvfFG
 X0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5XIY1ylh1qbxux1IK92h1uyY4h3lCwFDABDdo2wJwf8=;
 b=FYLOUTc3gZOE614Pz5rr0BSNDdyDJydJleRO1H0z5QXpom7S7iKRcd05AwJ14wwVXk
 1oydt3sUY3VSFgPn7kWMB9avBHA12Frye9mOhPDlWurIVBHnLs63FoTvzQLWC2H+zmzt
 cU7Rr7b82qrzs/UvkurbOx1svyDT5KKQPWQmlIc0P8+XeM0Kg9KekueKABTkODBZxjIp
 0njliz7ds8TQZmX4X1RHcGaL97/mHLvrV5DzaM1gEVUhvchnEc8qQik8EHxOsimoDwHE
 3fr/4iLSGGuYURVlpKUltUxvVOUXBiCGHjXeDKSz/X6NgKU9mPVOIsw+h9PVYr2zlmXB
 pBHg==
X-Gm-Message-State: AOAM5302OOFfx53UZTf9xg1fK3iKaRvjzg9lAm0h4l+mqpuLHED9bPHT
 e4z6WxTgr0fqt6xSiTgynowGUZvzv+ne82H6dy0rHQ==
X-Google-Smtp-Source: ABdhPJyR1xQ4HZucPUi6nK23XYnqq0dy/VAeYViFGqFVDG+TVvfGhvErVyPXThFJC/QAoac42s1ZCWWST4ShMhh3Oek=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr2474120edw.52.1608039742865;
 Tue, 15 Dec 2020 05:42:22 -0800 (PST)
MIME-Version: 1.0
References: <20201204081209.360524-1-ganqixin@huawei.com>
 <20201204081209.360524-2-ganqixin@huawei.com>
In-Reply-To: <20201204081209.360524-2-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 13:42:11 +0000
Message-ID: <CAFEAcA_fiuM=iM6+Nud=ytgzS3n4w9N9VoLp3PrJ2qCFZFRRtQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] pl031: Use timer_free() in the finalize function to
 avoid memleaks
To: Gan Qixin <ganqixin@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Euler Robot <euler.robot@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
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
X-List-Received-Date: Tue, 15 Dec 2020 13:42:29 -0000

On Fri, 4 Dec 2020 at 08:13, Gan Qixin <ganqixin@huawei.com> wrote:
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

