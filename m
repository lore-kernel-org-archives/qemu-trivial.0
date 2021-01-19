Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1gqF-0007pb-MC
	for mharc-qemu-trivial@gnu.org; Mon, 18 Jan 2021 21:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l1gqD-0007oi-Bi
 for qemu-trivial@nongnu.org; Mon, 18 Jan 2021 21:33:57 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:44140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1l1gqB-0005Pj-Aw
 for qemu-trivial@nongnu.org; Mon, 18 Jan 2021 21:33:57 -0500
Received: by mail-lf1-x12c.google.com with SMTP id m25so26886622lfc.11
 for <qemu-trivial@nongnu.org>; Mon, 18 Jan 2021 18:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7bTyWCNAk4ls1b9ex3nxlCWi9X3qFAYl2nGOQrIl1NY=;
 b=n3781hcdYLyO3EPodL568U3TzZO7VQv+vv6zBFi8RWVHhdJp5RGFyI5fBWIkb3dRuG
 m3zbJKW4bE9+EmJlSi0ISB11dROL6ynivqMOWVtMKBxFNliGSrFRj8L/yE6eHMQ+PsIl
 8DjzwFDxUotiRfBtFqGVmliZWY8SKRg/MnCoRzpe4WWmxilTaxdLaAcjkUBslRjQa9TE
 0Vz3OoYenCNrlUn7U+pZNWk3FyapcgW9916Cy1ClbPyanT5TnWt0zhAW3YhNYXVuq4nb
 V6e7NdWtFeMXiMgFLDfDpkzMHwBPBXMBmL6Ky/PZ7+XfE2F+rUS7UT4BHNy8EFtaRmrh
 Eoqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7bTyWCNAk4ls1b9ex3nxlCWi9X3qFAYl2nGOQrIl1NY=;
 b=hObIsZ85uSXWardB4BcRRjcWxaIHbTXDvll17G1I8JxUTlfmWbO6qJmlLpwaLSdq0r
 nKPtkghsbVdRpiWk/ovGdkG4FZedLueWLA3FfbA5Zneysx/U4GOj1XmH/bww+KkAdzWC
 t8pZWI67HFhl938sU4bUM9DDlOrQ8GmrPEwQJVINIHmggk6lwUrqEBiv0c4KjXEm8BN5
 8sn/rWF8DogsAWqbzj47EzxDbZw/YsKgMJblwj1a961pJ+tTMSLVh9E3MZXrzbkXiUzj
 ItBuzRUKytbGZ2cTxKCnomWC6yU1kkB5h3TJajeYykPDJu+UknIj589kpTl8rACV0rRG
 5sCA==
X-Gm-Message-State: AOAM531bIEbs0ZM9o9eTbZ0SeeQ5l4Qgcx0mhk7oe8L0v1QrOSjZQFXG
 3qSxjUaCBgMiQ9Jz5I+L3mrM/nk4mwg3IGWxORDSCw==
X-Google-Smtp-Source: ABdhPJz5LHJRLZVIPuXuVBeYiKd/rhiT3mGQZ1gdmbB+igZGcA5u2gCFhsd4pXqAcihcoKpzjMZtw8QsphWFNBBTnSc=
X-Received: by 2002:a19:54c:: with SMTP id 73mr888737lff.551.1611023631678;
 Mon, 18 Jan 2021 18:33:51 -0800 (PST)
MIME-Version: 1.0
References: <20210118065627.79903-1-ganqixin@huawei.com>
In-Reply-To: <20210118065627.79903-1-ganqixin@huawei.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 18 Jan 2021 18:33:39 -0800
Message-ID: <CAGcCb13u6=7X1ZvP4Fi4ooi6rhsE=WJqM50ym01O2MujkynsVg@mail.gmail.com>
Subject: Re: [PATCH] npcm7xx_adc-test: Fix memleak in adc_qom_set
To: Gan Qixin <ganqixin@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Chen Qun <kuhn.chenqun@huawei.com>, zhang.zhanghailiang@huawei.com, 
 Euler Robot <euler.robot@huawei.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 Tyrone Ting <kfting@nuvoton.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004ae27c05b937ab4a"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Jan 2021 02:33:57 -0000

--0000000000004ae27c05b937ab4a
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 17, 2021 at 10:59 PM Gan Qixin <ganqixin@huawei.com> wrote:

> The adc_qom_set function didn't free "response", which caused an indirect
> memory leak. So use qobject_unref() to fix it.
>
> ASAN shows memory leak stack:
>
> Indirect leak of 593280 byte(s) in 144 object(s) allocated from:
>     #0 0x7f9a5e7e8d4e in __interceptor_calloc
> (/lib64/libasan.so.5+0x112d4e)
>     #1 0x7f9a5e607a50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a50)
>     #2 0x55b1bebf636b in qdict_new ../qobject/qdict.c:30
>     #3 0x55b1bec09699 in parse_object ../qobject/json-parser.c:318
>     #4 0x55b1bec0b2df in parse_value ../qobject/json-parser.c:546
>     #5 0x55b1bec0b6a9 in json_parser_parse ../qobject/json-parser.c:580
>     #6 0x55b1bec060d1 in json_message_process_token
> ../qobject/json-streamer.c:92
>     #7 0x55b1bec16a12 in json_lexer_feed_char ../qobject/json-lexer.c:313
>     #8 0x55b1bec16fbd in json_lexer_feed ../qobject/json-lexer.c:350
>     #9 0x55b1bec06453 in json_message_parser_feed
> ../qobject/json-streamer.c:121
>     #10 0x55b1bebc2d51 in qmp_fd_receive ../tests/qtest/libqtest.c:614
>     #11 0x55b1bebc2f5e in qtest_qmp_receive_dict
> ../tests/qtest/libqtest.c:636
>     #12 0x55b1bebc2e6c in qtest_qmp_receive ../tests/qtest/libqtest.c:624
>     #13 0x55b1bebc3340 in qtest_vqmp ../tests/qtest/libqtest.c:715
>     #14 0x55b1bebc3942 in qtest_qmp ../tests/qtest/libqtest.c:756
>     #15 0x55b1bebbd64a in adc_qom_set ../tests/qtest/npcm7xx_adc-test.c:127
>     #16 0x55b1bebbd793 in adc_write_input
> ../tests/qtest/npcm7xx_adc-test.c:140
>     #17 0x55b1bebbdf92 in test_convert_external
> ../tests/qtest/npcm7xx_adc-test.c:246
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

Thanks!

> ---
> Cc: Hao Wu <wuhaotsh@google.com>
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Cc: Tyrone Ting <kfting@nuvoton.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> ---
>  tests/qtest/npcm7xx_adc-test.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qtest/npcm7xx_adc-test.c
> b/tests/qtest/npcm7xx_adc-test.c
> index f029706945..5ce8ce13b3 100644
> --- a/tests/qtest/npcm7xx_adc-test.c
> +++ b/tests/qtest/npcm7xx_adc-test.c
> @@ -129,6 +129,7 @@ static void adc_qom_set(QTestState *qts, const ADC
> *adc,
>              path, name, value);
>      /* The qom set message returns successfully. */
>      g_assert_true(qdict_haskey(response, "return"));
> +    qobject_unref(response);
>  }
>
>  static void adc_write_input(QTestState *qts, const ADC *adc,
> --
> 2.27.0
>
>

--0000000000004ae27c05b937ab4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 17, 2021 at 10:59 PM Gan =
Qixin &lt;<a href=3D"mailto:ganqixin@huawei.com">ganqixin@huawei.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The adc=
_qom_set function didn&#39;t free &quot;response&quot;, which caused an ind=
irect<br>
memory leak. So use qobject_unref() to fix it.<br>
<br>
ASAN shows memory leak stack:<br>
<br>
Indirect leak of 593280 byte(s) in 144 object(s) allocated from:<br>
=C2=A0 =C2=A0 #0 0x7f9a5e7e8d4e in __interceptor_calloc (/lib64/libasan.so.=
5+0x112d4e)<br>
=C2=A0 =C2=A0 #1 0x7f9a5e607a50 in g_malloc0 (/lib64/libglib-2.0.so.0+0x55a=
50)<br>
=C2=A0 =C2=A0 #2 0x55b1bebf636b in qdict_new ../qobject/qdict.c:30<br>
=C2=A0 =C2=A0 #3 0x55b1bec09699 in parse_object ../qobject/json-parser.c:31=
8<br>
=C2=A0 =C2=A0 #4 0x55b1bec0b2df in parse_value ../qobject/json-parser.c:546=
<br>
=C2=A0 =C2=A0 #5 0x55b1bec0b6a9 in json_parser_parse ../qobject/json-parser=
.c:580<br>
=C2=A0 =C2=A0 #6 0x55b1bec060d1 in json_message_process_token ../qobject/js=
on-streamer.c:92<br>
=C2=A0 =C2=A0 #7 0x55b1bec16a12 in json_lexer_feed_char ../qobject/json-lex=
er.c:313<br>
=C2=A0 =C2=A0 #8 0x55b1bec16fbd in json_lexer_feed ../qobject/json-lexer.c:=
350<br>
=C2=A0 =C2=A0 #9 0x55b1bec06453 in json_message_parser_feed ../qobject/json=
-streamer.c:121<br>
=C2=A0 =C2=A0 #10 0x55b1bebc2d51 in qmp_fd_receive ../tests/qtest/libqtest.=
c:614<br>
=C2=A0 =C2=A0 #11 0x55b1bebc2f5e in qtest_qmp_receive_dict ../tests/qtest/l=
ibqtest.c:636<br>
=C2=A0 =C2=A0 #12 0x55b1bebc2e6c in qtest_qmp_receive ../tests/qtest/libqte=
st.c:624<br>
=C2=A0 =C2=A0 #13 0x55b1bebc3340 in qtest_vqmp ../tests/qtest/libqtest.c:71=
5<br>
=C2=A0 =C2=A0 #14 0x55b1bebc3942 in qtest_qmp ../tests/qtest/libqtest.c:756=
<br>
=C2=A0 =C2=A0 #15 0x55b1bebbd64a in adc_qom_set ../tests/qtest/npcm7xx_adc-=
test.c:127<br>
=C2=A0 =C2=A0 #16 0x55b1bebbd793 in adc_write_input ../tests/qtest/npcm7xx_=
adc-test.c:140<br>
=C2=A0 =C2=A0 #17 0x55b1bebbdf92 in test_convert_external ../tests/qtest/np=
cm7xx_adc-test.c:246<br>
<br>
Reported-by: Euler Robot &lt;<a href=3D"mailto:euler.robot@huawei.com" targ=
et=3D"_blank">euler.robot@huawei.com</a>&gt;<br>
Signed-off-by: Gan Qixin &lt;<a href=3D"mailto:ganqixin@huawei.com" target=
=3D"_blank">ganqixin@huawei.com</a>&gt;<br></blockquote><div>Reviewed-by: H=
ao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt=
;</div><div><br></div><div>Thanks!=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
---<br>
Cc: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuh=
aotsh@google.com</a>&gt;<br>
Cc: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com" target=
=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
Cc: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" target=3D"_blank"=
>kfting@nuvoton.com</a>&gt;<br>
Cc: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">t=
huth@redhat.com</a>&gt;<br>
Cc: Laurent Vivier &lt;<a href=3D"mailto:lvivier@redhat.com" target=3D"_bla=
nk">lvivier@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/qtest/npcm7xx_adc-test.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/tests/qtest/npcm7xx_adc-test.c b/tests/qtest/npcm7xx_adc-test.=
c<br>
index f029706945..5ce8ce13b3 100644<br>
--- a/tests/qtest/npcm7xx_adc-test.c<br>
+++ b/tests/qtest/npcm7xx_adc-test.c<br>
@@ -129,6 +129,7 @@ static void adc_qom_set(QTestState *qts, const ADC *adc=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path, name, value);<br>
=C2=A0 =C2=A0 =C2=A0/* The qom set message returns successfully. */<br>
=C2=A0 =C2=A0 =C2=A0g_assert_true(qdict_haskey(response, &quot;return&quot;=
));<br>
+=C2=A0 =C2=A0 qobject_unref(response);<br>
=C2=A0}<br>
<br>
=C2=A0static void adc_write_input(QTestState *qts, const ADC *adc,<br>
-- <br>
2.27.0<br>
<br>
</blockquote></div></div>

--0000000000004ae27c05b937ab4a--

