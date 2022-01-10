Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6yAB-0004ll-MH
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jan 2022 12:08:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n6yA7-0004jW-HQ
 for qemu-trivial@nongnu.org; Mon, 10 Jan 2022 12:08:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n6yA4-0007yF-Kq
 for qemu-trivial@nongnu.org; Mon, 10 Jan 2022 12:08:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641834527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U+3SGfTNYkO6F8uq7Hq/XANHMcqQyET6yEo1VtIfGUg=;
 b=QStj+ShjraVahF6xk+STUNwLFNaATxY1C6OeDUR1KxYwYr6upT56Vd2bxc8ompODeMkQRq
 rfCwG1+cC+g3afWOSPr7KEbvaMHlrrDcJt+rMegEWAUum054FIbjA4ah0XaAWmpI38db//
 Nzup3QcUNKTsS67/AJJ3udlnHRB+B7I=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-XExJ8tUPMfGAZxmnOPaMpA-1; Mon, 10 Jan 2022 12:08:45 -0500
X-MC-Unique: XExJ8tUPMfGAZxmnOPaMpA-1
Received: by mail-ua1-f72.google.com with SMTP id
 n1-20020a9f3141000000b003057abfef2fso5166273uab.3
 for <qemu-trivial@nongnu.org>; Mon, 10 Jan 2022 09:08:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+3SGfTNYkO6F8uq7Hq/XANHMcqQyET6yEo1VtIfGUg=;
 b=kGIwdwnIesHpu1xUlRj2xnVEi9V6c5+yZcP9ZLpooMEFt+vpYwOI2s4KCII3gH8rfw
 73qLnyV+il65CdbgBkvX/UT57w3YDXSqExWYrbHVo2em1dXMwvp69KaJ1hmOmHqGYLli
 vza7oe/3O/iOEq2/hDFu1Q73b5krsfi1zrCP0RCxgCT6Ukb6Cojnd2tAol3H8ONi7Ig+
 I4zPOLtZvWRdQY/viy3t5f1894NhZy2GPH7HWLdZ62cpE2ij9aNwtDIpBZf96aJgA7kQ
 RUsk9WXkGmt7kyRRpT+BtmU7LxF6ckv4qVgf/R3Cf10vC+kiAdFkr/bshZZqwYVRnSH8
 qn2w==
X-Gm-Message-State: AOAM532jJUjcforBZDsrBMXay+k8F+i/y+D/VsmbUtiX6V1UQsJWxhEQ
 /SFyIE+wsCeRNLCVSJ0IM7qD+vD6JggyaOCpCFmzlryHrm5eVGKhxr7KAkzL6qYvL9mXm6E+IDB
 Wpp1LuI2MD0Ls1/SaGHSaTI1A3014Dfyrqw==
X-Received: by 2002:a05:6102:390b:: with SMTP id
 e11mr309979vsu.35.1641834525307; 
 Mon, 10 Jan 2022 09:08:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOkOaesUbm5csGJSv1vMu87CHJOC3rZwYQB+5NWVv6jr8hR/LtkV7BrdMjAcuwXuDpaRBkg8gBCPuNpQiNB/k=
X-Received: by 2002:a05:6102:390b:: with SMTP id
 e11mr309968vsu.35.1641834525129; 
 Mon, 10 Jan 2022 09:08:45 -0800 (PST)
MIME-Version: 1.0
References: <20220107153019.504124-1-sw@weilnetz.de>
In-Reply-To: <20220107153019.504124-1-sw@weilnetz.de>
From: John Snow <jsnow@redhat.com>
Date: Mon, 10 Jan 2022 12:08:34 -0500
Message-ID: <CAFn=p-ZYr+D54GzYKt5cxuJQQTARGQTvkkgVfhLGEeLczFt-Tw@mail.gmail.com>
Subject: Re: [PATCH] simplebench: Fix Python syntax error (reported by LGTM)
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a68fad05d53d631b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jan 2022 17:08:51 -0000

--000000000000a68fad05d53d631b
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 7, 2022 at 10:32 AM Stefan Weil <sw@weilnetz.de> wrote:

> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  scripts/simplebench/bench-example.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/simplebench/bench-example.py
> b/scripts/simplebench/bench-example.py
> index 4864435f39..fc370691e0 100644
> --- a/scripts/simplebench/bench-example.py
> +++ b/scripts/simplebench/bench-example.py
> @@ -25,7 +25,7 @@
>
>  def bench_func(env, case):
>      """ Handle one "cell" of benchmarking table. """
> -    return bench_block_copy(env['qemu_binary'], env['cmd'], {}
> +    return bench_block_copy(env['qemu_binary'], env['cmd'], {},
>                              case['source'], case['target'])
>
>
> --
> 2.30.2
>

Good spot. If it's not too late and not a hassle, can you add a fixes:
commit-id in the commit message? No big deal if not.

Reviewed-by: John Snow <jsnow@redhat.com>

--000000000000a68fad05d53d631b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 7, 2022 at 10:32 AM Stefa=
n Weil &lt;<a href=3D"mailto:sw@weilnetz.de">sw@weilnetz.de</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: S=
tefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de" target=3D"_blank">sw@weiln=
etz.de</a>&gt;<br>
---<br>
=C2=A0scripts/simplebench/bench-example.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/simplebench/bench-example.py b/scripts/simplebench/ben=
ch-example.py<br>
index 4864435f39..fc370691e0 100644<br>
--- a/scripts/simplebench/bench-example.py<br>
+++ b/scripts/simplebench/bench-example.py<br>
@@ -25,7 +25,7 @@<br>
<br>
=C2=A0def bench_func(env, case):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot; Handle one &quot;cell&quot; of bench=
marking table. &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 return bench_block_copy(env[&#39;qemu_binary&#39;], env[&#39=
;cmd&#39;], {}<br>
+=C2=A0 =C2=A0 return bench_block_copy(env[&#39;qemu_binary&#39;], env[&#39=
;cmd&#39;], {},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case[&#39;source&#39;], case[&#39;target&#39=
;])<br>
<br>
<br>
-- <br>
2.30.2<br></blockquote><div><br></div><div>Good spot. If it&#39;s not too l=
ate and not a hassle, can you add a fixes: commit-id in the commit message?=
 No big deal if not.</div><div><br></div><div>Reviewed-by: John Snow &lt;<a=
 href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt;<br></div></div><=
/div>

--000000000000a68fad05d53d631b--


