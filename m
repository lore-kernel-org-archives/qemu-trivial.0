Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tPXGl-0000eu-R6
	for mharc-qemu-trivial@gnu.org; Sun, 22 Dec 2024 20:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hhan@redhat.com>) id 1tPXGi-0000da-Bk
 for qemu-trivial@nongnu.org; Sun, 22 Dec 2024 20:30:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hhan@redhat.com>) id 1tPXGf-0000Vy-14
 for qemu-trivial@nongnu.org; Sun, 22 Dec 2024 20:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734917393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7hA3AZRVD4+1UKEu0JMZr10iSIMDRUaEYs3uUl+qSoE=;
 b=I87IEQhMZwB/8ClNHZqAvuB7RUPsLR/djdLqzWDqj1+x58HRp5+1FO4k6bBn0E8XtWVsF7
 vm/uZjKOeugB/3KBO97Z3wfeK922dlCBiSjvHsRy+PjK/K/wv93Vp5GR8TRDREbP0eQpJM
 MXur8Jqj0ytK4/hv1nxw7oPzEmlmqNw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-HYmH8oEvOIueJIC0BFFqsQ-1; Sun, 22 Dec 2024 20:29:51 -0500
X-MC-Unique: HYmH8oEvOIueJIC0BFFqsQ-1
X-Mimecast-MFC-AGG-ID: HYmH8oEvOIueJIC0BFFqsQ
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-aab9f30ac00so303417866b.3
 for <qemu-trivial@nongnu.org>; Sun, 22 Dec 2024 17:29:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734917390; x=1735522190;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7hA3AZRVD4+1UKEu0JMZr10iSIMDRUaEYs3uUl+qSoE=;
 b=uquKaZVcL9TOZoXXEJAzR06sHO2yuTYNu526O0Oj1IUgdyY4KslqKSoZ6XpoUE/D3i
 9CQ1Ol+qcSJvr+wihGZLOKfaL6JOFFb5eGupnZugdQc0UBUv1BIsqXlwpZEnQ5mxWtp0
 klvSba0+gMm7eDC0Ey/NLSqsBRALZ/QMQB0hpdoEXOnDsFuvri1tssVSbrZcZ29JP6Tx
 CZ2ilcFWNainho6mydfyePds6vpWyq4EWM/3KDmlhuAczkh1mBLEw8TxqqP1PxIpCZAV
 ud9P285x5WYerwRmOSxTxCxag55nGLQzSesOmOryF2hfyFiMK/u0nAAT9AgP1OEQBkPr
 knbg==
X-Gm-Message-State: AOJu0Ywe8ZOZrTEiU/8XQgKDaLzkveA7wb5MedxGSS8CuDM7JSmWN2ka
 5BlCfGV+R6wwLm9EcBfPDTfPFx6GVKEgKxrrwhmf/I2oGf656vFB6ygWo/WPNbCiOfpzH8Ganjg
 rw1ewbaldoZhbY9xv4YqblTd9y+PuJFf4Uf4VAw/EvUbN1gO8Jp1CU3G/E1m3V3fABgT1GHNfRM
 B/JVFE5rn6BsZxsXd4PzsBnynRO3X/2A==
X-Gm-Gg: ASbGnctbbdoR7Qn2t88zstPoWeAqXqS5U3g8+bmkwx8q8vCBE/7B4hfVfvZ1L7zrhVE
 w0W5mGvxMcDFkKWj19xouHdCqIbEHL+FMqmnm6rg=
X-Received: by 2002:a17:907:94c2:b0:aa6:19c9:ad08 with SMTP id
 a640c23a62f3a-aac334f31e9mr1019650466b.48.1734917389905; 
 Sun, 22 Dec 2024 17:29:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh/SCuGFH17Wt8QTW7Xb7oYn+uANG7jweu+1VS+Sne54cVlEXIwyekuvJh2kadoXhF0ff0aEB3Sp1Eet+3WkY=
X-Received: by 2002:a17:907:94c2:b0:aa6:19c9:ad08 with SMTP id
 a640c23a62f3a-aac334f31e9mr1019648966b.48.1734917389641; Sun, 22 Dec 2024
 17:29:49 -0800 (PST)
MIME-Version: 1.0
References: <20241219085141.1857343-1-hhan@redhat.com>
 <710b775b-41b6-40ae-8467-dea9ddc3ecf9@tls.msk.ru>
In-Reply-To: <710b775b-41b6-40ae-8467-dea9ddc3ecf9@tls.msk.ru>
From: Han Han <hhan@redhat.com>
Date: Mon, 23 Dec 2024 09:29:38 +0800
Message-ID: <CAHjf+S-OeNVT=KQxVEg6MW4efVTfXy1iTb85QyL6Zja62PD0fw@mail.gmail.com>
Subject: Re: [PATCH] target/i386/cpu: Fix notes for CPU models
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fFvSh2MiUklyU-S3WH01PfrDp0cG_SA_Y2-c2fH2dCE_1734917390
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b97ada0629e5eee7"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hhan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 23 Dec 2024 01:30:01 -0000

--000000000000b97ada0629e5eee7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 22, 2024 at 4:59=E2=80=AFPM Michael Tokarev <mjt@tls.msk.ru> wr=
ote:

> 19.12.2024 11:51, Han Han wrote:
> ...
>
> Applied to the trivial-patches tree, thank you!
>
> Please do Cc: qemu-devel@ the next time.
>
> OK. Thanks for your advice

> /mjt
>
>

--000000000000b97ada0629e5eee7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 22,=
 2024 at 4:59=E2=80=AFPM Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.=
ru">mjt@tls.msk.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">19.12.2024 11:51, Han Han wrote:<br>
...<br>
<br>
Applied to the trivial-patches tree, thank you!<br>
<br>
Please do Cc: qemu-devel@ the next time.<br>
<br></blockquote><div>OK. Thanks for your advice<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
/mjt<br>
<br>
</blockquote></div></div>

--000000000000b97ada0629e5eee7--


