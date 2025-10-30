Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD941CCF9FC
	for <qemu-trivial@archiver.kernel.org>; Thu, 30 Oct 2025 13:22:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vESbU-0006Ss-RB; Thu, 30 Oct 2025 09:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nanliu@redhat.com>) id 1vELWS-0002LJ-FW
 for qemu-trivial@nongnu.org; Thu, 30 Oct 2025 01:48:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nanliu@redhat.com>) id 1vELWP-0000NI-9o
 for qemu-trivial@nongnu.org; Thu, 30 Oct 2025 01:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761803304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zKDXzeGoT92LMljzjA5alHgmCQRBI+W+byfC8plt9yI=;
 b=GHMldwFLOEqZ1iHJW0U6BIUmwzGcc84okkZtTxJF5gK+WFBM1sR2RSWq7xq4P0AaBS+LXQ
 t7Zk+IkLrUoWy63vDXaMAPBGZf9AXUyfcHHlkAYYohF5zrLf+JuM2jSrKDlWK6LFblKDY0
 ZPFg98ARS3Sq6g4+yddBnCMa7T6z7Fw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-Jv0gQbCeOFqa50uWN1lPPg-1; Thu, 30 Oct 2025 01:47:05 -0400
X-MC-Unique: Jv0gQbCeOFqa50uWN1lPPg-1
X-Mimecast-MFC-AGG-ID: Jv0gQbCeOFqa50uWN1lPPg_1761803224
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-63c348b15f9so498284a12.0
 for <qemu-trivial@nongnu.org>; Wed, 29 Oct 2025 22:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761803224; x=1762408024;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zKDXzeGoT92LMljzjA5alHgmCQRBI+W+byfC8plt9yI=;
 b=pAcnbFy9MyuXxwA05VTWt6fdpTVrk5s4wHWeiSGN7HyOEN9hRRyuqV5snr9ynE1jSZ
 Bl1DLQ5i/Qxsiu10APih3FrfldtL5XK8/6klOFxNOV2EJaN2s6j7+n8tKQ3OADcY5uL+
 doN879aaldl5hrMM8tg71+bBQrf5j8RpOxyN+e3JnZ5SDuXRVipNftcmQ52m4kHjLJEN
 Cx7jSqGMD7LY0t5FxwfomZQrQzTzXcw1ZsJRhAJowWFQhd0OAaVHyhvhxgKgk5EvRjMa
 pc2MKwRVnopQT2POnVYfSM3lYGxLe4hiu73kka4V7da++16Zitxh7BlPF3ONdpB2Xx3b
 jYBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqMWzDqTcEYabXEkKCZVQwCKXn2lKGY//ghHiwTzZbien31n4vSlgWPJoX8GKogpdWKW34nO61EjmXw4I=@nongnu.org
X-Gm-Message-State: AOJu0Yy90msldND7dH6KFQL2Tv9oolDy8AftnVWYjPv6SEFd7q7/YFq6
 0Kid44r401l9xKw/LEl9ODO9oFMml8p7J319umdpaR3uoDDChbDw++Q753K+aAWQWoHh7wpQ8X7
 RmOuDUFdcG21QZlhVPIu+Zu7xlWJ9K3+S+5gn37FQrZnsC6SjYc9C8VDIE4Wbzl5Vaq/D8pjaL3
 X8bidsfiqWseSuXzlWpE1eqpnhx/I3/13+MA==
X-Gm-Gg: ASbGnctiWEP6vtM4XkKfmgxFphNblNTVBMlpPVLha1l4Fm19zGWtvUTfakvl284CygH
 lV17kpL/cDYKNyO7ZlgkvIz3n1ykMyVXIIrn/gdKdaRq5h3bIrdtd8HfGEbyhr2pTp6M5cGk7QZ
 FBXbEhSOtIsSytAPR75wcI93JHsT9ku0sYsXoGBcW5EIZ2ifJa7ZBi/Kjt
X-Received: by 2002:a05:6402:3553:b0:633:d0b7:d6d2 with SMTP id
 4fb4d7f45d1cf-64061a3f66cmr1571639a12.18.1761803224236; 
 Wed, 29 Oct 2025 22:47:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHv1p+gOEEmlhrPO8SsbzlyARRTmp7Hn7fRGHKuEIr0We62RhhnOazO3T6eYWOP9K6TIwjDSY9U8jkDvo3Vris=
X-Received: by 2002:a05:6402:3553:b0:633:d0b7:d6d2 with SMTP id
 4fb4d7f45d1cf-64061a3f66cmr1571626a12.18.1761803223816; Wed, 29 Oct 2025
 22:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250922065714.93081-1-nanliu@redhat.com>
 <CAFEAcA8pLFu6eOK5N+E97qo5PCp3OW3BRfYNSEL7=YQS6+eh2g@mail.gmail.com>
 <fcf01a1c-3503-4397-a41b-d453ca2b7df9@tls.msk.ru>
 <CAFEAcA_BR4VEsZrq1eq19E6iguk49W=Fx2OKQvkvTZ7_6Pd0KA@mail.gmail.com>
In-Reply-To: <CAFEAcA_BR4VEsZrq1eq19E6iguk49W=Fx2OKQvkvTZ7_6Pd0KA@mail.gmail.com>
From: NaNa Liu <nanliu@redhat.com>
Date: Thu, 30 Oct 2025 13:46:52 +0800
X-Gm-Features: AWmQ_bmMsu5UWgtKZu-L-DwXOOZmZTOPccIj-DRmRArJnWINPBcLK69IAOEkaPs
Message-ID: <CANUVZAznv1aP5DH6pHEQBZGxczkoNVQfKR5oOV7eTyrk4rVrpQ@mail.gmail.com>
Subject: Re: [PATCH] docs/devel: Correct uefi-vars-x64 device name
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, kraxel@redhat.com,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0Q016-qSR_Q8oSlNs3xwg6qKu7C5FgnuCAO73lgCLtg_1761803224
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000051eab7064259c7cd"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nanliu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 30 Oct 2025 09:22:02 -0400
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

--00000000000051eab7064259c7cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 27, 2025 at 7:41=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> On Sat, 27 Sept 2025 at 09:48, Michael Tokarev <mjt@tls.msk.ru> wrote:
> >
> > On 23.09.2025 14:57, Peter Maydell wrote:
> >
> > > We could probably also correct the bit of the text in this file
> > > that currently reads "depend on SMM emulation on x64" to either
> > > say "x86" or "x86_64".
> >
> > This one will be a bit more than trivial :)  I for one don't know
> > if this is related to any x86 or to x86_64 only.
>
> I just mean exactly and specifically the one place in this
> file which says "x64" and ought to say either "x86" or
> "x86_64". To me a single word change is pretty trivial,
> especially since nowhere else in our docs do we use "x64".
>
> This is to ensure consistency between the documentation and the API code
(var-service-api.h) parameters and json file, which use "uefi-vars-x64".


Thanks.
Nana



> -- PMM
>
>

--00000000000051eab7064259c7cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 27,=
 2025 at 7:41=E2=80=AFPM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@=
linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Sat, 27 Sept 2025 at 09:48, Michael =
Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru" target=3D"_blank">mjt@tls.msk=
.ru</a>&gt; wrote:<br>
&gt;<br>
&gt; On 23.09.2025 14:57, Peter Maydell wrote:<br>
&gt;<br>
&gt; &gt; We could probably also correct the bit of the text in this file<b=
r>
&gt; &gt; that currently reads &quot;depend on SMM emulation on x64&quot; t=
o either<br>
&gt; &gt; say &quot;x86&quot; or &quot;x86_64&quot;.<br>
&gt;<br>
&gt; This one will be a bit more than trivial :)=C2=A0 I for one don&#39;t =
know<br>
&gt; if this is related to any x86 or to x86_64 only.<br>
<br>
I just mean exactly and specifically the one place in this<br>
file which says &quot;x64&quot; and ought to say either &quot;x86&quot; or<=
br>
&quot;x86_64&quot;. To me a single word change is pretty trivial,<br>
especially since nowhere else in our docs do we use &quot;x64&quot;.<br>
<br></blockquote><div>This is to ensure consistency between the documentati=
on and the API code (var-service-api.h) parameters and json file, which use=
=C2=A0&quot;uefi-vars-x64&quot;.<br></div><div><br></div><div><br></div><di=
v>Thanks.</div><div>Nana</div><div><br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
-- PMM<br>
<br>
</blockquote></div></div>

--00000000000051eab7064259c7cd--


