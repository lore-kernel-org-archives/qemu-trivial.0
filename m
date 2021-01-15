Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0Sjb-0000Y2-Mb
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jan 2021 12:18:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1l0Sja-0000XI-5d
 for qemu-trivial@nongnu.org; Fri, 15 Jan 2021 12:18:02 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1l0SjS-0000FE-6Q
 for qemu-trivial@nongnu.org; Fri, 15 Jan 2021 12:18:01 -0500
Received: by mail-wm1-x32b.google.com with SMTP id u14so4047337wmq.4
 for <qemu-trivial@nongnu.org>; Fri, 15 Jan 2021 09:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=42mRN6NepMeNgZ7kJJEjfLKx41zcNGB94iUcAdJ8y80=;
 b=RuJsfeN9a2qowmH7tpj3IeX/cI+Ane7TghTA+jv3HhtuPO06Rc3xvJWCy6AkoW+7N+
 jCGNzq5J3ikgHZ9n9krKZ712JJ7YJeqiMvBLWuDu61PpeMPh0VuCZ5yBb6kuZ2B/zpwo
 MHauq/3nKrthuQ1td5bmJHd8DX4X26XJjjObWTzh2ybBT5dYvddABoemNweqUmDxbynL
 Khf93g5XsSJxdtwqSO/8eY0+8fSWmxgcGO/Di+oy9VudCCU9ua/ItFMk15LY7pAm9D8G
 Z40JbdyqUnCFxBiw8xPzFp/4zf1UykTYPmmQ6vFBsTXaTZWb0T0MuY0nikB/Z8nijuk9
 iocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=42mRN6NepMeNgZ7kJJEjfLKx41zcNGB94iUcAdJ8y80=;
 b=VGiIP8ogdkZkJTenFjhZ+y7wQE1AsdPntJpDo0kzbPmqDGJJmvea3iLHVlISDNhxCR
 FGce1SrQZ0HTUTW/ibl6C6RTHWBsfBxmMKGRkF8p/0Z4XTXiW3ky7OrXO/hn3GE3itff
 pwslo5NH3MhI0c3EVVDor/QRQEsvvg26tGKuyLQ2WCL/hKJxqApx1u6Z6adKghLTFKN7
 0HR3uRJql3EYklt/XoBaHywq3OWBKXvrh6T9WuGPu+9vVDytnzI/lYjP3dpue/BQJCHe
 lMhRPhS2wGE2yuzHjRraPzTbvAQ7i029SPxBD+Hekejs5i4NjiBHEyEAka19eVcB781n
 06NA==
X-Gm-Message-State: AOAM531Sfa/iP/X2vyyXUzlYPPOSaeUWdS0c47Kwzgow88O+Vlkn8EDW
 9lM6HsF0e2wqtweU3/jngg0a+m9XXigQAFibrBLbXw==
X-Google-Smtp-Source: ABdhPJy3HBp2rw2emmQ6AkHO4LkHQV43rvqkBYuq0y/WkthDMpZRzInChsek8DrmKA6XLZTVSktrpzOEAq+sOWC6v+w=
X-Received: by 2002:a1c:984a:: with SMTP id a71mr3036881wme.175.1610731068332; 
 Fri, 15 Jan 2021 09:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20210115075634.717909-1-ganqixin@huawei.com>
 <74ba9c97-4d1f-111a-cffe-7aff18ac3f7c@amsat.org>
In-Reply-To: <74ba9c97-4d1f-111a-cffe-7aff18ac3f7c@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 15 Jan 2021 09:17:35 -0800
Message-ID: <CAFQmdRa8=O7QLHHFahxoSONw5iNtFZBBo_+A6yq-VJjw5Smc+g@mail.gmail.com>
Subject: Re: [PATCH] qtest/npcm7xx_pwm-test: Fix memleak in pwm_qom_get
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Hao Wu <wuhaotsh@google.com>
Cc: Gan Qixin <ganqixin@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-trivial@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 zhang.zhanghailiang@huawei.com, 
 Tyrone Ting <kfting@nuvoton.com>, Euler Robot <euler.robot@huawei.com>, 
 Chen Qun <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=hskinnemoen@google.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 15 Jan 2021 17:18:02 -0000

+Hao Wu

On Fri, Jan 15, 2021 at 1:15 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 1/15/21 8:56 AM, Gan Qixin wrote:
> > The pwm_qom_get function didn't free "response", which caused an indire=
ct
> > memory leak. So use qobject_unref() to fix it.
> >
> > ASAN shows memory leak stack:
> >
> > Indirect leak of 74160000 byte(s) in 18000 object(s) allocated from:
> >     #0 0x7f96e2f79d4e in __interceptor_calloc (/lib64/libasan.so.5+0x11=
2d4e)
> >     #1 0x7f96e2d98a50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
> >     #2 0x556313112180 in qdict_new ../qobject/qdict.c:30
> >     #3 0x556313115bca in parse_object ../qobject/json-parser.c:318
> >     #4 0x556313117810 in parse_value ../qobject/json-parser.c:546
> >     #5 0x556313117bda in json_parser_parse ../qobject/json-parser.c:580
> >     #6 0x55631310fe67 in json_message_process_token ../qobject/json-str=
eamer.c:92
> >     #7 0x5563131210b7 in json_lexer_feed_char ../qobject/json-lexer.c:3=
13
> >     #8 0x556313121662 in json_lexer_feed ../qobject/json-lexer.c:350
> >     #9 0x5563131101e9 in json_message_parser_feed ../qobject/json-strea=
mer.c:121
> >     #10 0x5563130cb81e in qmp_fd_receive ../tests/qtest/libqtest.c:614
> >     #11 0x5563130cba2b in qtest_qmp_receive_dict ../tests/qtest/libqtes=
t.c:636
> >     #12 0x5563130cb939 in qtest_qmp_receive ../tests/qtest/libqtest.c:6=
24
> >     #13 0x5563130cbe0d in qtest_vqmp ../tests/qtest/libqtest.c:715
> >     #14 0x5563130cc40f in qtest_qmp ../tests/qtest/libqtest.c:756
> >     #15 0x5563130c5623 in pwm_qom_get ../tests/qtest/npcm7xx_pwm-test.c=
:180
> >     #16 0x5563130c595e in pwm_get_duty ../tests/qtest/npcm7xx_pwm-test.=
c:210
> >     #17 0x5563130c7529 in test_toggle ../tests/qtest/npcm7xx_pwm-test.c=
:447
> >
> > Reported-by: Euler Robot <euler.robot@huawei.com>
> > Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> > ---
> > Cc: Havard Skinnemoen <hskinnemoen@google.com>
> > Cc: Tyrone Ting <kfting@nuvoton.com>
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: Laurent Vivier <lvivier@redhat.com>
> > ---
> >  tests/qtest/npcm7xx_pwm-test.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>

Thanks!

