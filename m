Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1rQz-00076w-RQ
	for mharc-qemu-trivial@gnu.org; Tue, 19 Jan 2021 08:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rQs-000746-EH
 for qemu-trivial@nongnu.org; Tue, 19 Jan 2021 08:52:32 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rQm-0005XJ-PM
 for qemu-trivial@nongnu.org; Tue, 19 Jan 2021 08:52:30 -0500
Received: by mail-ej1-x62a.google.com with SMTP id 6so28589778ejz.5
 for <qemu-trivial@nongnu.org>; Tue, 19 Jan 2021 05:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bXzEeMT7iNFLu4EtDehM+wUr6sAzCFsvZL96vG5UzPk=;
 b=dDV2BZTOz8r9JeEd0OCx/6AmkjQcCtMWL+7yDiQnBwDv/s045j1jVxOhdYkLwdQy3i
 M115vo5WEzoG+9hnlZSDySHRJAsuZjOgEavb9+H3nDnGuYkSIyct6xhyYBW0JzuPp14X
 J4A+YODfnge5jNKBGZqOTiEoiV1lao+uFHngGPJWq5UbbkugSdRTUhNiXjP8Hvp9b8Ag
 QLxv3R9ZfDnP3CUxdv5k0+16W/IbIMl6DjFPYCV0hUJeA4ziSXKa8CgC16DU0XLGRL6L
 V2M/Imw2Su116I5sx2vDbZEBkzLZxvs5mmMSyJywx5QtGEqJR5FvyZJfYc0OpOhPL9sR
 Izew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bXzEeMT7iNFLu4EtDehM+wUr6sAzCFsvZL96vG5UzPk=;
 b=jz47Ds7bfxL69O5JUdB6BtNMMIZCqsX/llycsLBtusc2sVT2NUseF16ZOhl3IsIj46
 iMpLsB3nMN9imN8MR+HScEC3UFeZRm+unwHUXDwWxqj3+XXXe3OUugRHjiIoV1ERtWw5
 1AnvJGRra93KhNQbhpItVScRhWPYLX/FN++aAOWtxjt7T9m9vdYOyLLtblzcM+GYr5i2
 i+Qj6vfU2/QRZjaqnpA2rZWwP6DW/aLlGmKBe1B3Mghe1f+AxxCQQq79j+QRYgewSqXG
 s52vnrP/fkPfLa5EjMGv1P1RT8g9EkMmfpGo6EhhB0pbsNPirwRiXev5vc3veHa0/WQW
 raEA==
X-Gm-Message-State: AOAM530J1XQASUXbDzmdN+5vco6oac/yIBes9O6NpdO89lnR3OWZCk70
 1EUMICMLjlCTMUoWy3yv28svp2v/VstVpfsZnanvJw==
X-Google-Smtp-Source: ABdhPJzgzF9Xd0J6e9yeWnY+hoyP+xHFzoV/A/8ijMZHTlG+YhJJPZ8R4fWnGfkT6gmhD/CguPipgC1uT1Tjak0ogXU=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr142852ejc.482.1611064343248; 
 Tue, 19 Jan 2021 05:52:23 -0800 (PST)
MIME-Version: 1.0
References: <20210118065627.79903-1-ganqixin@huawei.com>
In-Reply-To: <20210118065627.79903-1-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:52:12 +0000
Message-ID: <CAFEAcA_0f2oxw3643KpSF2jY1UP7QNjY70vrjg1JNBWgV5mjow@mail.gmail.com>
Subject: Re: [PATCH] npcm7xx_adc-test: Fix memleak in adc_qom_set
To: Gan Qixin <ganqixin@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 Hao Wu <wuhaotsh@google.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Euler Robot <euler.robot@huawei.com>,
 "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 13:52:32 -0000

On Mon, 18 Jan 2021 at 07:01, Gan Qixin <ganqixin@huawei.com> wrote:
>
> The adc_qom_set function didn't free "response", which caused an indirect
> memory leak. So use qobject_unref() to fix it.
>
> ASAN shows memory leak stack:
>
> Indirect leak of 593280 byte(s) in 144 object(s) allocated from:
>     #0 0x7f9a5e7e8d4e in __interceptor_calloc (/lib64/libasan.so.5+0x112d4e)
>     #1 0x7f9a5e607a50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
>     #2 0x55b1bebf636b in qdict_new ../qobject/qdict.c:30
>     #3 0x55b1bec09699 in parse_object ../qobject/json-parser.c:318
>     #4 0x55b1bec0b2df in parse_value ../qobject/json-parser.c:546
>     #5 0x55b1bec0b6a9 in json_parser_parse ../qobject/json-parser.c:580
>     #6 0x55b1bec060d1 in json_message_process_token ../qobject/json-streamer.c:92
>     #7 0x55b1bec16a12 in json_lexer_feed_char ../qobject/json-lexer.c:313
>     #8 0x55b1bec16fbd in json_lexer_feed ../qobject/json-lexer.c:350
>     #9 0x55b1bec06453 in json_message_parser_feed ../qobject/json-streamer.c:121
>     #10 0x55b1bebc2d51 in qmp_fd_receive ../tests/qtest/libqtest.c:614
>     #11 0x55b1bebc2f5e in qtest_qmp_receive_dict ../tests/qtest/libqtest.c:636
>     #12 0x55b1bebc2e6c in qtest_qmp_receive ../tests/qtest/libqtest.c:624
>     #13 0x55b1bebc3340 in qtest_vqmp ../tests/qtest/libqtest.c:715
>     #14 0x55b1bebc3942 in qtest_qmp ../tests/qtest/libqtest.c:756
>     #15 0x55b1bebbd64a in adc_qom_set ../tests/qtest/npcm7xx_adc-test.c:127
>     #16 0x55b1bebbd793 in adc_write_input ../tests/qtest/npcm7xx_adc-test.c:140
>     #17 0x55b1bebbdf92 in test_convert_external ../tests/qtest/npcm7xx_adc-test.c:246
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>



Applied to target-arm.next, thanks.

-- PMM

