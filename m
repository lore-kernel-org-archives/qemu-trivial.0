Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfSbQ-0001pW-Hi
	for mharc-qemu-trivial@gnu.org; Wed, 18 Nov 2020 13:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kfR2K-0003cA-UY
 for qemu-trivial@nongnu.org; Wed, 18 Nov 2020 12:14:29 -0500
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:33917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kfR2E-0001O8-Rd
 for qemu-trivial@nongnu.org; Wed, 18 Nov 2020 12:14:28 -0500
Received: by mail-vs1-xe42.google.com with SMTP id v6so1422510vsd.1
 for <qemu-trivial@nongnu.org>; Wed, 18 Nov 2020 09:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tfJNx+8KKFgAeV9NlSHhIf3nEIjrW1gXQxpt/5iCRBE=;
 b=mELCX4ydTAeN5UYwVW6pXiD7ic7s7CJqD3Ei67l085/LKFH/5K4FZWFNlbpM7DqLnK
 jG1jVaJFVtxMn/jjfDHwZoICEh7jdmM1Le6wVMTN6Eh+mlARF5qd+CdeiKtTkoYFOFfB
 6n/yvx8TH9+g5NZRnJlHq+YFtQhLj88KA0wWC+Y9suut0epb2q0PVv/q4VL8NsgH8lpG
 pwt9HN1LMOLWN5qaRjvhrway0u+jj5NgflhJ10qNACBNrMpJFys9YnuABuJdVY/oOLdK
 COotHmt01Ce92CPbiL9YlKSQtXDi8vs4XtOI8SppY5aSKbgKoY+GwAC94bw6e2tsBWQ5
 ECtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tfJNx+8KKFgAeV9NlSHhIf3nEIjrW1gXQxpt/5iCRBE=;
 b=MIx25K7fZYZJgTeE7TKHbCNpgOSPA2J+YyfZuYSqBnenbnLnLqCUePz219w4PoHfFW
 WX5NLC2Y4mCm1njj9w1NpsVMyRtIXqvTZ0ugcsNvsjB7DEr3U7xx+22P2EmAdcr56JP7
 jMkCeK31V2yo3YBWAQbHcxa0eW8kNx4IxLwAK7nK0MMAmeUGTmeGMBsEWbA3e+kDG15x
 u6BL1ISG27hUW4NstasYIhoijYZrDa1EMfi17ko4sZ0H0MeZP44dseyqrag4PnPttjqu
 uXbuhJqzQ0VdlFSDq/1S5gnkUFvN4m1LzcxE4YTs/6rlR6AW0wjcldEWRgBeBVbfYfiq
 YhBw==
X-Gm-Message-State: AOAM531yLtXmreIeLbGxM0QK4vhbFZcBsUfb8MlMkbdiG1l80zYiT1DB
 Dq0bBdtutAl0kVBbAYdfA+AX3SXn8u8zUDh4w5WPTg==
X-Google-Smtp-Source: ABdhPJwHTZpCGEe2IcTrNXNlLSs5uDf774Q5ruoWSfRokmsbrp7LGnVkqMi+t3auPRt3+T4ojO6OyOp9UAEujLJr0Js=
X-Received: by 2002:a05:6102:309a:: with SMTP id
 l26mr4263753vsb.4.1605719660698; 
 Wed, 18 Nov 2020 09:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
 <20201118115646.2461726-3-kuhn.chenqun@huawei.com>
In-Reply-To: <20201118115646.2461726-3-kuhn.chenqun@huawei.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 18 Nov 2020 09:14:09 -0800
Message-ID: <CAFQmdRbaivcgHt=dQ_nysZ=zpCM=d5K+-MY1129WDa3G=E9MCg@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 2/2] tests/qtest: fix memleak in
 npcm7xx_watchdog_timer-test
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>, Peter Maydell <peter.maydell@linaro.org>, 
 zhang.zhanghailiang@huawei.com, Thomas Huth <thuth@redhat.com>,
 lvivier@redhat.com, Euler Robot <euler.robot@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e42;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Nov 2020 13:54:46 -0500
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
X-List-Received-Date: Wed, 18 Nov 2020 17:14:30 -0000

On Wed, Nov 18, 2020 at 3:57 AM Chen Qun <kuhn.chenqun@huawei.com> wrote:
>
> Properly free resp for get_watchdog_action() to avoid memory leak.
> ASAN shows memory leak stack:
>
> Indirect leak of 12360 byte(s) in 3 object(s) allocated from:
>     #0 0x7f41ab6cbd4e in __interceptor_calloc (/lib64/libasan.so.5+0x112d4e)
>     #1 0x7f41ab4eaa50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
>     #2 0x556487d5374b in qdict_new ../qobject/qdict.c:29
>     #3 0x556487d65e1a in parse_object ../qobject/json-parser.c:318
>     #4 0x556487d65cb6 in parse_pair ../qobject/json-parser.c:287
>     #5 0x556487d65ebd in parse_object ../qobject/json-parser.c:343
>     #6 0x556487d661d5 in json_parser_parse ../qobject/json-parser.c:580
>     #7 0x556487d513df in json_message_process_token ../qobject/json-streamer.c:92
>     #8 0x556487d63919 in json_lexer_feed_char ../qobject/json-lexer.c:313
>     #9 0x556487d63d75 in json_lexer_feed ../qobject/json-lexer.c:350
>     #10 0x556487d28b2a in qmp_fd_receive ../tests/qtest/libqtest.c:613
>     #11 0x556487d2a16f in qtest_qmp_eventwait_ref ../tests/qtest/libqtest.c:827
>     #12 0x556487d248e2 in get_watchdog_action ../tests/qtest/npcm7xx_watchdog_timer-test.c:94
>     #13 0x556487d25765 in test_enabling_flags ../tests/qtest/npcm7xx_watchdog_timer-test.c:243
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>

> ---
>  tests/qtest/npcm7xx_watchdog_timer-test.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/npcm7xx_watchdog_timer-test.c b/tests/qtest/npcm7xx_watchdog_timer-test.c
> index 54d5d6d8f2..3aae5a0438 100644
> --- a/tests/qtest/npcm7xx_watchdog_timer-test.c
> +++ b/tests/qtest/npcm7xx_watchdog_timer-test.c
> @@ -204,6 +204,7 @@ static void test_enabling_flags(gconstpointer watchdog)
>  {
>      const Watchdog *wd = watchdog;
>      QTestState *qts;
> +    QDict *rsp;
>
>      /* Neither WTIE or WTRE is set, no interrupt or reset should happen */
>      qts = qtest_init("-machine quanta-gsj");
> @@ -240,8 +241,9 @@ static void test_enabling_flags(gconstpointer watchdog)
>      g_assert_false(qtest_get_irq(qts, wd->irq));
>      qtest_clock_step(qts, watchdog_calculate_steps(RESET_CYCLES,
>                  watchdog_prescaler(qts, wd)));
> -    g_assert_false(strcmp(qdict_get_str(get_watchdog_action(qts), "action"),
> -                "reset"));
> +    rsp = get_watchdog_action(qts);
> +    g_assert_false(strcmp(qdict_get_str(rsp, "action"), "reset"));
> +    qobject_unref(rsp);
>      qtest_qmp_eventwait(qts, "RESET");
>      qtest_quit(qts);
>
> --
> 2.23.0
>

