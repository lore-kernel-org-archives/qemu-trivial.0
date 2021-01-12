Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGom-0007ry-70
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2021 05:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGok-0007o4-Kf
 for qemu-trivial@nongnu.org; Tue, 12 Jan 2021 05:22:26 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGog-0003u1-BN
 for qemu-trivial@nongnu.org; Tue, 12 Jan 2021 05:22:26 -0500
Received: by mail-ed1-x534.google.com with SMTP id h16so1678642edt.7
 for <qemu-trivial@nongnu.org>; Tue, 12 Jan 2021 02:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IOGIW7QqJQlE5rSDONEu7oF8U9aw6m6j8tszCXUa1mg=;
 b=c6hjOqwpiiUFEngaG9IdvvDtavm3Ju81H87qkY2zucQiR4ThgTS3A/EILIDFUP/Ywd
 IR8hA9zVmP8WcQAtPX3i1shAygEoJBSEej1V+gc9UpSjumWO87nm/niHpthp9V0z+9sL
 hh79vN9q9mYHAolKHkG20DxMSr+6k1Wyp7nFuth53A2RzI/X2enaysYYmQa6xfFrvDPO
 3f1Kca+E2b0Yejt4C2r/fK6AgcDQTxkdD2ZZmddSopSuLLkCcANq8iHwHHG0SUZpDiAB
 lODnDpqQ+VCP8wrTbpriVLQwdQrGXxO/aWZ/+TyhnF/s5eSQOcVa9jsp6iBlk2n9A76X
 8L8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IOGIW7QqJQlE5rSDONEu7oF8U9aw6m6j8tszCXUa1mg=;
 b=NMNlamyR4ZaXoewCYk76FeeqeodFwFJPfw0x/y+uekZV6mup9UgRleFAefs2vXRwsP
 BDH+FDUF1tCll2FSS0TrpGX7k5+OReKXRmnHMZdXEEy/gaeRLkkGRnLzjAv9G7yVIkjE
 PLkwrP8NuIF6MqnO5/pLv+NAV9GAH4jk9Vr6BGgh+ikx7n6V3Foooeq6q7Fj+zjdhnDX
 53424sfZNrf4/pC2OwR3vXGKWTtd675iLktfl6rB29zPABT409IARWPTi+xbz3003JjA
 euqf9btdFFFtuCXKamCZ6F6I/fUSTyKQV8YOLShA1QwHxl+gb9J2h17kKlOEwBq/Ess3
 /gCg==
X-Gm-Message-State: AOAM532BaBKdMqAWLcVnaRoXJ+dSCZFEc8S8E4uQc8VPL5JreZehykEd
 QuMWChdrh/HX80T5utAdxasbJCRplhIMCLKj3vw5aw==
X-Google-Smtp-Source: ABdhPJx2vUsX0zeu+aMbIhi+Xnx3BYApYbc9CAafDW1s/SS0PHDNeM/MCqf4wkKhQnc4QDcGRkNgRtgGeFfHMeTTlMs=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr2817667edr.204.1610446940650; 
 Tue, 12 Jan 2021 02:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20210112101746.379517-1-ganqixin@huawei.com>
 <20210112101746.379517-2-ganqixin@huawei.com>
In-Reply-To: <20210112101746.379517-2-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 10:22:09 +0000
Message-ID: <CAFEAcA-68F=NcqS8AyiPTToc7CQyoymPhp3Z77idQkVk7fHYXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pl031: Use timer_free() in the finalize function
 to avoid memleaks
To: Gan Qixin <ganqixin@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 David Gibson <david@gibson.dropbear.id.au>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 10:22:26 -0000

On Tue, 12 Jan 2021 at 10:20, Gan Qixin <ganqixin@huawei.com> wrote:
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
> ---
>  hw/rtc/pl031.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
> index ae47f09635..f0981e6c21 100644
> --- a/hw/rtc/pl031.c
> +++ b/hw/rtc/pl031.c
> @@ -194,6 +194,14 @@ static void pl031_init(Object *obj)
>      s->timer = timer_new_ns(rtc_clock, pl031_interrupt, s);
>  }
>
> +static void pl031_finalize(Object *obj)
> +{
> +    PL031State *s = PL031(obj);
> +
> +    timer_del(s->timer);
> +    timer_free(s->timer);

You don't need to call timer_del() before timer_free() any more:
see commit 5f8e93c3e262ab.

thanks
-- PMM

