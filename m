Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sULFi-0006Je-Rs
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jul 2024 03:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1sULFh-0006FT-N4
 for qemu-trivial@nongnu.org; Thu, 18 Jul 2024 03:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1sULFg-0003Bf-2J
 for qemu-trivial@nongnu.org; Thu, 18 Jul 2024 03:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721286510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XgQFGN5FbTjg4AcA020xtib6FIYbdQcRg9s1XZVYD6U=;
 b=Dd+pAdPeFUwBY7GM+21ox9qtyFGWyIP35L20YnTt38nexxlEP+6z45SxC/Gj8bhJ+h+Bba
 /J9AUFi0bRjgi12oxqHTLJpIjRcx0KHFjumgBT/FspN6kZgNyx99B8n52QtCrRO8wn1hfw
 SwsfdBQGXiJxe7BK1JizatFYKpzhw3o=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-lfUQFc9SOkOLJreZyFMp3Q-1; Thu, 18 Jul 2024 03:08:24 -0400
X-MC-Unique: lfUQFc9SOkOLJreZyFMp3Q-1
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-e032d4cf26aso1258324276.3
 for <qemu-trivial@nongnu.org>; Thu, 18 Jul 2024 00:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721286504; x=1721891304;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XgQFGN5FbTjg4AcA020xtib6FIYbdQcRg9s1XZVYD6U=;
 b=CoSc4guLIxYfmoR8TlyLs79kzz5xUNeDwv0Y2Iuikm5UhjbuHvH+id7NkEX25N4C8X
 3PJluNam576K/aNrgoM8Ko2O0Z8Y8/F8jl+IfzswzZ1yeR3xKkEykJhlXo9wMrAeVadb
 O8yKe6ahxpYYvi1bAB5ky01cAY0/F4EgayNgHOnbqCtYDAruqIjmhK37z5S0fb3mhXlx
 VEFEJiHq+wR+YkqxaQq4V9bHMejY1EW047m8JI21XP6qk4yaUz/mX/iHk4FmxBXC05Tn
 STw3cdwkd2fyQNb4JaHYClCyYFzBFy7+a00cORf+n9G1OsQJ8maH1YRnfoXxvsAAGe8o
 I9QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLXpIeJ5+Xb46h0FLiVM16KO7FbfCBqUvIAvR9/YWKoA1lguxo/GQoUvSCtzybiVmzgAvxL6UAKCRTbD/PqRuv5S02GTPjUw==
X-Gm-Message-State: AOJu0YzDpxTasqsFzIupu+uGNZWwtn0q2lcLJ1Hw2YAXSay8s9mIdm46
 CBe0y20P578/6z2azLRF7YiwFl/QSBQEn0zNKVwAsRe+d4SWmXTc4O4h+46grdDceq6u3nTG6VT
 obPXCGf2KTnpTiAAxgTk8J6rvuuwJvx9grZbjXG/mDtp0Y6M3RbTUXwEFTlRPE8dYut0XVqZ4b5
 OD20ZuIhB4l0wy7MOZOgc2sL9vsxckKw==
X-Received: by 2002:a05:6902:2b08:b0:e03:41c8:4fbf with SMTP id
 3f1490d57ef6-e05feae1051mr2275345276.15.1721286502496; 
 Thu, 18 Jul 2024 00:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBqznHaEAF/8Z+3JWKuznA/wuqZKVsCC/6N8FzqzNX5g6axX8yC4Og/XaZevGDOgENQK1pAj5Q9aSzR/UcaWk=
X-Received: by 2002:a05:6902:2b08:b0:e03:41c8:4fbf with SMTP id
 3f1490d57ef6-e05feae1051mr2275327276.15.1721286502150; Thu, 18 Jul 2024
 00:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240717140025.66397-1-philmd@linaro.org>
In-Reply-To: <20240717140025.66397-1-philmd@linaro.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 18 Jul 2024 10:08:11 +0300
Message-ID: <CAPMcbCrX6Xyz+UNqENmTDCt8aLdyQ4rMNzEVRJqHjZY1DTeTbA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Cover guest-agent in QAPI schema
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Dehan Meng <demeng@redhat.com>,
 qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000848a60061d803e38"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 18 Jul 2024 07:08:33 -0000

--000000000000848a60061d803e38
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Wed, Jul 17, 2024 at 5:00=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7d9811458c..af4db698de 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3219,6 +3219,7 @@ M: Eric Blake <eblake@redhat.com>
>  M: Markus Armbruster <armbru@redhat.com>
>  S: Supported
>  F: qapi/*.json
> +F: qga/qapi-schema.json
>  T: git https://repo.or.cz/qemu/armbru.git qapi-next
>
>  QObject
> --
> 2.41.0
>
>

--000000000000848a60061d803e38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 1=
7, 2024 at 5:00=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailt=
o:philmd@linaro.org">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Signed-off-by: Philippe Mathieu-Daud=
=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" target=3D"_blank">philmd@li=
naro.org</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 7d9811458c..af4db698de 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3219,6 +3219,7 @@ M: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com=
" target=3D"_blank">eblake@redhat.com</a>&gt;<br>
=C2=A0M: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=
=3D"_blank">armbru@redhat.com</a>&gt;<br>
=C2=A0S: Supported<br>
=C2=A0F: qapi/*.json<br>
+F: qga/qapi-schema.json<br>
=C2=A0T: git <a href=3D"https://repo.or.cz/qemu/armbru.git" rel=3D"noreferr=
er" target=3D"_blank">https://repo.or.cz/qemu/armbru.git</a> qapi-next<br>
<br>
=C2=A0QObject<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div>

--000000000000848a60061d803e38--


