Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tx8mi-0001o6-JJ
	for mharc-qemu-trivial@gnu.org; Tue, 25 Mar 2025 14:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1tx8mf-0001nA-AW
 for qemu-trivial@nongnu.org; Tue, 25 Mar 2025 14:13:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1tx8md-0006ZU-3B
 for qemu-trivial@nongnu.org; Tue, 25 Mar 2025 14:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742926430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UwDJXm2RsJNe4eB8DGHeaNjAcbEU1mHJXaYb8kSqj78=;
 b=HeuRkUFT2nwpiyo8Om5N9XB9wwjajD/sBQ7zZnAdtNn1VaLLQmZUdSnB4FRhOKFrAbKTWK
 +GrrSmQ9WvuJId4uE/UMWjUInQ12raYwwSv5FXP/e6dmLXBw1EqQqDzUF1xoYN2GXgtedy
 bjkaGkYXGTxaz6Rq6/XMl2/UoVME+nA=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-uT5m0gIAPY-rQair1ehamQ-1; Tue, 25 Mar 2025 14:13:48 -0400
X-MC-Unique: uT5m0gIAPY-rQair1ehamQ-1
X-Mimecast-MFC-AGG-ID: uT5m0gIAPY-rQair1ehamQ_1742926428
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ff82dd6de0so7984960a91.0
 for <qemu-trivial@nongnu.org>; Tue, 25 Mar 2025 11:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742926427; x=1743531227;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UwDJXm2RsJNe4eB8DGHeaNjAcbEU1mHJXaYb8kSqj78=;
 b=atnGAQpzGCSFiHYK+gps9Lh1Jacy9OKlON/DHgGnrcP3c37qeqoQPksPjhY2AV3xXO
 2bXGPrm6zp4Zrhik4wXqhOiO+5sRRdq/eY1+zNLJVPHyv0R6Hrxb95EhtXYGvizwkaKw
 oWYYzBx11mRGHyoLHeA1vlKHs2A9uXLXwekiFoNwWHje1l7PciMBR0njacRHJ14Xd9uI
 n/obN8P6uu6c+ae7AThiWPUjZPGYrth6jLJGcjD3NQr6KiKXOaCdiEX0YJe/mLp3xoaN
 ahE6BHzJyNDax9dw1cqZgENswCmP/TvTA6TiAoqrJGARxnE5nmiQtKixCu6CoEu0quR5
 Buig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlbeHxDBmS3GvOlhDd2cbQz+Fcc7B3GM/reJ21q6Bvi2o0BI2ICsm3rWliL0Uf1Otq8HclW8Cwrp7gaiE=@nongnu.org
X-Gm-Message-State: AOJu0YzLhPCsdw9+Ek3Cf9TkY9rf+WnIByw4y/jbUPsn0LcBH0GaGJNb
 dx0G6cQ9Tda7uNbFzhjsY0BImuQXs/WsO9vIf5Rvcxzvq3uGdnANenDXpCug52hXmKoKcONJfhr
 NuXkKNPu6dSx3pzPGbRUymijJ+LARACCnRXF7P3aHTxfd/Veau2KcBjAu7qUvTIlUEaBr9DJa/J
 w6ODyfhEh9tGFHQA0VIIDF6075E4OgtA==
X-Gm-Gg: ASbGncvkr0N3R/AACRtF0XIBOc5D8pQF4WBNz5Cdt3/zhjLc9j4Yr5OJ8/PuYiLoiMc
 bNAcsJWJavWWxANMYKA3YI16oZRFdqcFy+Ck5kPiZmhDsq9Mvqpy6/aXiw00JvNJAHtkuqc1CBe
 BYmZkBEMkejRdkFEn9RPPq5AXT6wRh
X-Received: by 2002:a17:90b:48c2:b0:2fa:15ab:4de7 with SMTP id
 98e67ed59e1d1-3030fe83954mr36667403a91.12.1742926427467; 
 Tue, 25 Mar 2025 11:13:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtmyi6GcFqJ3m1wquqvMzV9hfAZaSyUBkaM6fiqp8kmmjJ/Bbe7WxF9zPc9vruchvmpBqsgq7pCmUF5bEXzgg=
X-Received: by 2002:a17:90b:48c2:b0:2fa:15ab:4de7 with SMTP id
 98e67ed59e1d1-3030fe83954mr36667363a91.12.1742926427037; Tue, 25 Mar 2025
 11:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250322010857.309490-1-jsnow@redhat.com>
 <20250322010857.309490-3-jsnow@redhat.com>
 <87a599o5hy.fsf@pond.sub.org>
In-Reply-To: <87a599o5hy.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 25 Mar 2025 14:13:35 -0400
X-Gm-Features: AQ5f1JpyUOGx4WHsKaXiJm5gxBquSYODiTaS-a2DQ4NgGGUsng15Jjzjop4IEeI
Message-ID: <CAFn=p-a5vaW94HTzRtcX-xss5GzitHc_auPnnK-brWVhOZt23Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] docs, qapi: generate undocumented return sections
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Peter Xu <peterx@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Lukas Straub <lukasstraub2@web.de>, 
 Fabiano Rosas <farosas@suse.de>, Eduardo Habkost <eduardo@habkost.net>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-trivial@nongnu.org, 
 Jason Wang <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org, 
 Zhenwei Pi <pizhenwei@bytedance.com>, Mads Ynddal <mads@ynddal.dk>, 
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Eric Blake <eblake@redhat.com>, Jiri Pirko <jiri@resnulli.us>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zuBSHAZkqmETyyefh7DJf-iukoriy0XoZm-Hki2ia0w_1742926428
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008dbb4c06312eaedf"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 25 Mar 2025 18:13:54 -0000

--0000000000008dbb4c06312eaedf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 4:54=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > This patch changes the qapidoc transmogrifier to generate Return value
> > documentation for any command that has a return value but hasn't
> > explicitly documented that return value.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> A number of commands lack return value documentation before the patch.
> These are:
>
> QGA: guest-network-get-route
>
> QMP: x-debug-query-block-graph, query-tpm, query-dirty-rate,
>      query-vcpu-dirty-limit, query-vm-generation-id,
>      query-memory-size-summary, query-memory-devices,
>      query-acpi-ospm-status, query-stats-schemas, query-stats-schemas
>
> This patch fixes that.  However, in my testing, it adds the missing
> "Return:" doc *twice* for x-debug-query-block-graph and
> query-dirty-rate.


Guess who forgot a "break" statement?

--js

--0000000000008dbb4c06312eaedf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 25,=
 2025 at 4:54=E2=80=AFAM Markus Armbruster &lt;<a href=3D"mailto:armbru@red=
hat.com">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">John Snow &lt;<a href=3D"mailto:jsnow@redhat.com"=
 target=3D"_blank">jsnow@redhat.com</a>&gt; writes:<br>
<br>
&gt; This patch changes the qapidoc transmogrifier to generate Return value=
<br>
&gt; documentation for any command that has a return value but hasn&#39;t<b=
r>
&gt; explicitly documented that return value.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
A number of commands lack return value documentation before the patch.<br>
These are:<br>
<br>
QGA: guest-network-get-route<br>
<br>
QMP: x-debug-query-block-graph, query-tpm, query-dirty-rate,<br>
=C2=A0 =C2=A0 =C2=A0query-vcpu-dirty-limit, query-vm-generation-id,<br>
=C2=A0 =C2=A0 =C2=A0query-memory-size-summary, query-memory-devices,<br>
=C2=A0 =C2=A0 =C2=A0query-acpi-ospm-status, query-stats-schemas, query-stat=
s-schemas<br>
<br>
This patch fixes that.=C2=A0 However, in my testing, it adds the missing<br=
>
&quot;Return:&quot; doc *twice* for x-debug-query-block-graph and<br>
query-dirty-rate.</blockquote><div><br></div><div>Guess who forgot a &quot;=
break&quot; statement?</div><div><br></div><div>--js <br></div></div></div>

--0000000000008dbb4c06312eaedf--


