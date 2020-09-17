Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIuqz-0001qK-9m
	for mharc-qemu-trivial@gnu.org; Thu, 17 Sep 2020 10:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kIuqp-0001j0-Ub
 for qemu-trivial@nongnu.org; Thu, 17 Sep 2020 10:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kIuqk-0003xg-TC
 for qemu-trivial@nongnu.org; Thu, 17 Sep 2020 10:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600352724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lUukFYmtVHu/eF7KiDGlHHhUC6qw89O8/TNBxEzhavQ=;
 b=DgiCTuIPoNTLCND592j6x+T3qmFiKfly3Uu1Vw2ByoiQ2igtWZUjIgShVrihk8NeF5stx+
 MqOtpNDOsivU18wrUKOV/iO9Dcly0uXpuG+071mxqt5MGuREfMglQPTToeNZJ+7kpws0s0
 wG0rYmuPzLUPb1Tak4DD9RGebDxb1Fw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-JImucOzYM6-1Wv2QbCpJLA-1; Thu, 17 Sep 2020 10:25:22 -0400
X-MC-Unique: JImucOzYM6-1Wv2QbCpJLA-1
Received: by mail-ed1-f71.google.com with SMTP id r19so961368edq.12
 for <qemu-trivial@nongnu.org>; Thu, 17 Sep 2020 07:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lUukFYmtVHu/eF7KiDGlHHhUC6qw89O8/TNBxEzhavQ=;
 b=Zj2YHYOuIXsgXL0JckFe+hCcbjsDsrA8yCnBRadfaPlUoVBHKTYMTSsoZ9GI5MbJ4f
 SGAkfIEtyrp5M6IlxVjxviJBtolFAnD+WkQvRcHczDOgyU/pt2PkXlWAnIWxGHxfuc4A
 d1p6FRLm7zvPRIyViCR1v1GYXdkwG7ExJJCYdWCb8ZSU0FZazowQFLANi+5nHya9jWmE
 VGIemvJYjGHLD03zKD9C0/jxcXhu+w/PQd6nSFYuOw6Y29ujTlTX4N/ezpl0vR+wIhoy
 n0Zle8MgxdwvSvBnIktvLYMI2FO3hbTewVOlOAl4rb6BQ53nrJIBlOJ5Ac3uKORuTiNN
 74Lg==
X-Gm-Message-State: AOAM531Gm9Y8Jv4JsYxqqAUsu0JSifU3LCjs/nR3ap1Viujs62e42XPY
 Wjmg8RZRIZZdLjpuJ9gys+/x88Iw8kMDZPdsSfIfdE8S3ceT9Wkq0L3mQ8f/u5QgkWTl+QhBC3Q
 JA5dWjlAgvGeiWqC4BRpD2Buq2YHH7JlhRw==
X-Received: by 2002:a17:906:3748:: with SMTP id
 e8mr28005624ejc.71.1600352721376; 
 Thu, 17 Sep 2020 07:25:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF0c94xPkOWvgwVL9MpB2uCAXsCPl9nf1iSu8I6+x83J2FmxOLWHJVr5JTdgiOqW4WDmia85LYLJxmZ02c27Q=
X-Received: by 2002:a17:906:3748:: with SMTP id
 e8mr28005605ejc.71.1600352721174; 
 Thu, 17 Sep 2020 07:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200917140700.673171-1-lvivier@redhat.com>
In-Reply-To: <20200917140700.673171-1-lvivier@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 17 Sep 2020 16:25:09 +0200
Message-ID: <CABgObfb4L4jCYeeE6gbpCY6cJws7v34+tJ3FWOqaKFDP_91hEQ@mail.gmail.com>
Subject: Re: [PATCH] meson: fix static flag summary
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000761c6705af8327d4"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 20:51:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 17 Sep 2020 14:25:34 -0000

--000000000000761c6705af8327d4
Content-Type: text/plain; charset="UTF-8"

Oops. :)

Paolo

Il gio 17 set 2020, 16:07 Laurent Vivier <lvivier@redhat.com> ha scritto:

> 'static build:' must display value of CONFIG_STATIC rather than value of
> CONFIG_TOOLS.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 5421eca66a02..c174f0ab0948 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1374,7 +1374,7 @@ summary_info += {'gprof enabled':
>  config_host.has_key('CONFIG_GPROF')}
>  summary_info += {'sparse enabled':
> meson.get_compiler('c').cmd_array().contains('cgcc')}
>  summary_info += {'strip binaries':    get_option('strip')}
>  summary_info += {'profiler':
> config_host.has_key('CONFIG_PROFILER')}
> -summary_info += {'static build':      config_host.has_key('CONFIG_TOOLS')}
> +summary_info += {'static build':
> config_host.has_key('CONFIG_STATIC')}
>  if targetos == 'darwin'
>    summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
>  endif
> --
> 2.26.2
>
>

--000000000000761c6705af8327d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Oops. :)<div dir=3D"auto"><br></div><div dir=3D"auto">Pao=
lo</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">Il gio 17 set 2020, 16:07 Laurent Vivier &lt;<a href=3D"mailto:lviv=
ier@redhat.com">lvivier@redhat.com</a>&gt; ha scritto:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">&#39;static build:&#39; must display value of CONFIG_ST=
ATIC rather than value of<br>
CONFIG_TOOLS.<br>
<br>
Signed-off-by: Laurent Vivier &lt;<a href=3D"mailto:lvivier@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">lvivier@redhat.com</a>&gt;<br>
---<br>
=C2=A0meson.build | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 5421eca66a02..c174f0ab0948 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1374,7 +1374,7 @@ summary_info +=3D {&#39;gprof enabled&#39;:=C2=A0 =C2=
=A0 =C2=A0config_host.has_key(&#39;CONFIG_GPROF&#39;)}<br>
=C2=A0summary_info +=3D {&#39;sparse enabled&#39;:=C2=A0 =C2=A0 meson.get_c=
ompiler(&#39;c&#39;).cmd_array().contains(&#39;cgcc&#39;)}<br>
=C2=A0summary_info +=3D {&#39;strip binaries&#39;:=C2=A0 =C2=A0 get_option(=
&#39;strip&#39;)}<br>
=C2=A0summary_info +=3D {&#39;profiler&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 config_host.has_key(&#39;CONFIG_PROFILER&#39;)}<br>
-summary_info +=3D {&#39;static build&#39;:=C2=A0 =C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_TOOLS&#39;)}<br>
+summary_info +=3D {&#39;static build&#39;:=C2=A0 =C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_STATIC&#39;)}<br>
=C2=A0if targetos =3D=3D &#39;darwin&#39;<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;Cocoa support&#39;: config_host.has_ke=
y(&#39;CONFIG_COCOA&#39;)}<br>
=C2=A0endif<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div>

--000000000000761c6705af8327d4--


