Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B16C87FCC
	for <qemu-trivial@archiver.kernel.org>; Wed, 30 Jul 2025 08:46:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1uh2Qm-0003bu-TV; Wed, 30 Jul 2025 04:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1uh2BX-0000N2-Ku
 for qemu-trivial@nongnu.org; Wed, 30 Jul 2025 04:29:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1uh2BV-0003Tf-EP
 for qemu-trivial@nongnu.org; Wed, 30 Jul 2025 04:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753864150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qIAubJ+4pPZeiAxAjWYWB86w9h0bBF5mRzq+ysHiklU=;
 b=S8Bc9tsTaJ50q5ANY8CGScB7GKPQKqedV/S0WT0zr5NYdOwKxbbMrTu/rUdhg6VeEaSbNx
 wBK39xYhAZjSSmNtY5J/7i3OXbQUseQ/ntSJFOATSkY/r0NwtKEWBxAQXDaQsyrQ84Lss3
 3+JV0rBTkDbvCSEIgCgK8jMWv17fi30=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-U4DKG5iIOsKVBU4J7Op7bw-1; Wed, 30 Jul 2025 04:29:08 -0400
X-MC-Unique: U4DKG5iIOsKVBU4J7Op7bw-1
X-Mimecast-MFC-AGG-ID: U4DKG5iIOsKVBU4J7Op7bw_1753864147
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-707722d08d9so434306d6.3
 for <qemu-trivial@nongnu.org>; Wed, 30 Jul 2025 01:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753864147; x=1754468947;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qIAubJ+4pPZeiAxAjWYWB86w9h0bBF5mRzq+ysHiklU=;
 b=XnzHuozkKSCt//M0iKPhhWxvPhp89TnqMQnBJcjemzeEt+IoyoO/W8Muu4KJuR/+vn
 ORTw5pQ2dqD36Bzjg73REUhXhYJOnNv45lKPKKrZZ8yKwT0xPt4YtER9kuyckRgHAoim
 H1tYhxL3O6kjXskdBUeFslQIsnLGJdOqpiPSGyLihuCPW4ORJV3oe4REamyGZRmOEILy
 x5dAjEtOdMDl1LZv3LnOC97jscFvNSqw14R37Q4RIpJuvonLaVBu8gXNHfLfVDHfVoId
 HwXP3kXljHZ6bhdw4BrdkQVepQTdk66eG+8nL0/jWkOwLOty5Wn58zx0d0J7GmmK85pY
 uWQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2tg9GKi0vLX98VGOfzv3WBMO+AdoDnqOsMpXbSiw1zHkgQEutUFCwb0Xm1vTGvChfUy6/jRY4KPeF4QY=@nongnu.org
X-Gm-Message-State: AOJu0YyCOWnZGHFiy2/u87yU4F2685wmSpxbUrlGTCgcLtw2BEE1Fh4G
 +mEE/0nGv1jHCPbjz10UTB/qtTV56w0chxFPKyZyet2agUTxdxAPsMKYiDltMv4kmitse4tBHDN
 9ul1GsV//LFwPmS6qcQaSRRVxd9q17nkG5WnpqJliHG7jqnJXg7gpDMWNC20Xtp/v+hCkefpW2i
 vGZcY2fwRGhA7+rm9z7nEFelTwu+Onw9rZDQ==
X-Gm-Gg: ASbGncueLk5MHzosKN+v5RUc+qmGJsyXo/ft685SALQ2Ov+H7e+GwFOcPsZbykfvR22
 W/gr7qAuFn0rM7i6dzOXPEUp6/RbrGSGWKiZA+3/HVXRj3XNgDUOUnKE5ItdXsMbRmbyQ9sQ9RX
 rw0aGJH5djt/1EhwtRafCGtRg=
X-Received: by 2002:a05:6214:20e7:b0:6f8:f1a5:e6a4 with SMTP id
 6a1803df08f44-70767064db1mr34809936d6.22.1753864147512; 
 Wed, 30 Jul 2025 01:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdJjUSog9tvk/u1A25W9ION3C12Ab3GNRfcPjfEgU6u3wMpqmDf8ao1RMsB1p35ynVMLXHHH2bxu+gdCnjiS0=
X-Received: by 2002:a05:6214:20e7:b0:6f8:f1a5:e6a4 with SMTP id
 6a1803df08f44-70767064db1mr34809796d6.22.1753864147157; Wed, 30 Jul 2025
 01:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250730072709.27077-1-thuth@redhat.com>
In-Reply-To: <20250730072709.27077-1-thuth@redhat.com>
From: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Date: Wed, 30 Jul 2025 11:28:55 +0300
X-Gm-Features: Ac12FXwfkBYmPuO3D7qRrKPxMyT-IRyIgCNKMyAva0RdMk_tYAeYXzNiRSxbZ3g
Message-ID: <CAPMcbCp6cDWnV4PLnyYO5+rGoSeFEPSvGAOyJjK4N8r5Zkdv_w@mail.gmail.com>
Subject: Re: [PATCH v2] qga: Fix ubsan warning
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O3k9lpgfh_-Dv66QY_o3Prm70UVLLx4Rb0lopYYnKNc_1753864147
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000079dcc1063b21510e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

--00000000000079dcc1063b21510e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

@Thomas Huth <thuth@redhat.com> Is this fix critical to merge during code
freeze?

On Wed, Jul 30, 2025 at 10:27=E2=80=AFAM Thomas Huth <thuth@redhat.com> wro=
te:

> From: Thomas Huth <thuth@redhat.com>
>
> When compiling QEMU with --enable-ubsan there is a undefined behavior
> warning when running "make check":
>
>  .../qga/commands-linux.c:452:15: runtime error: applying non-zero offset
> 5 to null pointer
>  #0 0x55ea7b89450c in build_guest_fsinfo_for_pci_dev
> ..../qga/commands-linux.c:452:15
>
> Fix it by avoiding the additional pointer variable here and use an
> "offset" integer variable instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Use an integer offset variable instead for checking for a NULL point=
er
>
>  qga/commands-linux.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/qga/commands-linux.c b/qga/commands-linux.c
> index 9e8a934b9a6..0c41eb97190 100644
> --- a/qga/commands-linux.c
> +++ b/qga/commands-linux.c
> @@ -400,10 +400,10 @@ static bool build_guest_fsinfo_for_pci_dev(char
> const *syspath,
>                                             Error **errp)
>  {
>      unsigned int pci[4], host, hosts[8], tgt[3];
> -    int i, nhosts =3D 0, pcilen;
> +    int i, offset, nhosts =3D 0, pcilen;
>      GuestPCIAddress *pciaddr =3D disk->pci_controller;
>      bool has_ata =3D false, has_host =3D false, has_tgt =3D false;
> -    char *p, *q, *driver =3D NULL;
> +    char *p, *driver =3D NULL;
>      bool ret =3D false;
>
>      p =3D strstr(syspath, "/devices/pci");
> @@ -445,13 +445,13 @@ static bool build_guest_fsinfo_for_pci_dev(char
> const *syspath,
>
>      p =3D strstr(syspath, "/ata");
>      if (p) {
> -        q =3D p + 4;
> +        offset =3D 4;
>          has_ata =3D true;
>      } else {
>          p =3D strstr(syspath, "/host");
> -        q =3D p + 5;
> +        offset =3D 5;
>      }
> -    if (p && sscanf(q, "%u", &host) =3D=3D 1) {
> +    if (p && sscanf(p + offset, "%u", &host) =3D=3D 1) {
>          has_host =3D true;
>          nhosts =3D build_hosts(syspath, p, has_ata, hosts,
>                               ARRAY_SIZE(hosts), errp);
> --
> 2.50.1
>
>

--00000000000079dcc1063b21510e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto=
:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><d=
iv><br></div><div><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=
=3D"mailto:thuth@redhat.com" tabindex=3D"-1">@Thomas Huth</a> Is this fix c=
ritical to merge during code freeze? <br></div></div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, Jul 30, 2025 at 10:27=E2=80=AFAM Thomas Huth &lt;<a href=3D"mailto:thuth@=
redhat.com">thuth@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Thomas Huth &lt;<a href=3D"mailto:thuth@r=
edhat.com" target=3D"_blank">thuth@redhat.com</a>&gt;<br>
<br>
When compiling QEMU with --enable-ubsan there is a undefined behavior<br>
warning when running &quot;make check&quot;:<br>
<br>
=C2=A0.../qga/commands-linux.c:452:15: runtime error: applying non-zero off=
set 5 to null pointer<br>
=C2=A0#0 0x55ea7b89450c in build_guest_fsinfo_for_pci_dev ..../qga/commands=
-linux.c:452:15<br>
<br>
Fix it by avoiding the additional pointer variable here and use an<br>
&quot;offset&quot; integer variable instead.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0v2: Use an integer offset variable instead for checking for a NULL po=
inter<br>
<br>
=C2=A0qga/commands-linux.c | 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/qga/commands-linux.c b/qga/commands-linux.c<br>
index 9e8a934b9a6..0c41eb97190 100644<br>
--- a/qga/commands-linux.c<br>
+++ b/qga/commands-linux.c<br>
@@ -400,10 +400,10 @@ static bool build_guest_fsinfo_for_pci_dev(char const=
 *syspath,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0unsigned int pci[4], host, hosts[8], tgt[3];<br>
-=C2=A0 =C2=A0 int i, nhosts =3D 0, pcilen;<br>
+=C2=A0 =C2=A0 int i, offset, nhosts =3D 0, pcilen;<br>
=C2=A0 =C2=A0 =C2=A0GuestPCIAddress *pciaddr =3D disk-&gt;pci_controller;<b=
r>
=C2=A0 =C2=A0 =C2=A0bool has_ata =3D false, has_host =3D false, has_tgt =3D=
 false;<br>
-=C2=A0 =C2=A0 char *p, *q, *driver =3D NULL;<br>
+=C2=A0 =C2=A0 char *p, *driver =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0bool ret =3D false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0p =3D strstr(syspath, &quot;/devices/pci&quot;);<br>
@@ -445,13 +445,13 @@ static bool build_guest_fsinfo_for_pci_dev(char const=
 *syspath,<br>
<br>
=C2=A0 =C2=A0 =C2=A0p =3D strstr(syspath, &quot;/ata&quot;);<br>
=C2=A0 =C2=A0 =C2=A0if (p) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D p + 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has_ata =3D true;<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D strstr(syspath, &quot;/host&quot;);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D p + 5;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D 5;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (p &amp;&amp; sscanf(q, &quot;%u&quot;, &amp;host) =3D=3D=
 1) {<br>
+=C2=A0 =C2=A0 if (p &amp;&amp; sscanf(p + offset, &quot;%u&quot;, &amp;hos=
t) =3D=3D 1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has_host =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nhosts =3D build_hosts(syspath, p, has_at=
a, hosts,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARRAY_SIZE(hosts), errp);<br>
-- <br>
2.50.1<br>
<br>
</blockquote></div>

--00000000000079dcc1063b21510e--


