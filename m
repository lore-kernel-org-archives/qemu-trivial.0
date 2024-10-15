Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t0fkw-0005Ye-3M
	for mharc-qemu-trivial@gnu.org; Tue, 15 Oct 2024 07:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1t0fko-0005Xc-QH
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 07:30:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1t0fkm-0004EN-JC
 for qemu-trivial@nongnu.org; Tue, 15 Oct 2024 07:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728991815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MaRKN1kHntchFFmkQZ38W2nYmASUOefauZ+iX7KC2Xc=;
 b=b1rdDIQ5UESqH3RELUu1GkWwLM57fsvvK5sAZejt+WeyVTRu1dWGGCAcAnMGsRhlJWxysB
 Vg6IGhS8H8Y5O/IObBfDBLNTQiX5ceNHLOtmDqqXExHDyOgO9xWxTmpW7veiXlpeifnPJ3
 9u5pMACk1BfJ8iDBAwG8m5fv86j8Eqo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-2jRrkOAaOIOlIW-vhFRyDg-1; Tue, 15 Oct 2024 07:30:12 -0400
X-MC-Unique: 2jRrkOAaOIOlIW-vhFRyDg-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b11467e528so672070785a.3
 for <qemu-trivial@nongnu.org>; Tue, 15 Oct 2024 04:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728991812; x=1729596612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MaRKN1kHntchFFmkQZ38W2nYmASUOefauZ+iX7KC2Xc=;
 b=G/E3bcpsXVQ5ldeiey0mf0DRe0VJ4lxDoRP10u8Qju0+H3Zot6xBMcy1m63/RY8xrB
 /vyRC+Q0eDkzE+OGlK0lMONxF61lR5P8voxg9AiC0iTGcFdD4T/75Ew66pMkixNN1PkG
 iHkPDznUh3fie5/9f3y+9Q2PPrXxc+qrR8rKMx4U5q+aMSo7lg+SOucTxoVkJoPLv2JY
 jh/7jPUKkNvulBp5x0yxUtuOt9BprDs5PxP3JgzEM4Weymu0Tziz+HxI+mIHoOlXGVqB
 9oBAlMSFPY6rBK+53hCSz3SteUpfHHZs3veiHoS2WvE1tK7mlwIZcy1P9THevaqxt+5b
 shfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVJDzyiQ05Fh84cQzkr2STsqGG/wsetLByWrj52MwVw4EieGZ9esy1x6G62hcsMN9Oa8aNzeldLwkHRf4=@nongnu.org
X-Gm-Message-State: AOJu0YyT1a8G3uEZUsvRiczB+zRjJt84FWq7o/tMDvB2yi7Ye5rXyq8z
 PR5CoXtmQeAq6pecLGB2gsX7imn9wZZsTwQqqRVM0aonkQKTcKGMpGjM0yAIznYzdWD5zQumiyY
 gZgSNaoBiiVUJwERf4M6smdWn1FbB3NY43fNGDWYKK36jWTF1QdN/9GKn6yrVHL8bMAR3q4Nuwn
 x4ZLoSBRmam4YpwoKwL4m+K9PRwQf1aA==
X-Received: by 2002:a05:620a:1a19:b0:7b1:1013:c27e with SMTP id
 af79cd13be357-7b1418a04fbmr2979585a.60.1728991811841; 
 Tue, 15 Oct 2024 04:30:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA+h/FM3ua5qo5ZVbTaH3HmSx/KufISb/DTV0KFjurPcXGVJSY6QwBRLa1/fKo3O/vAhFi6MPiKMOmLK86Glo=
X-Received: by 2002:a05:620a:1a19:b0:7b1:1013:c27e with SMTP id
 af79cd13be357-7b1418a04fbmr2976985a.60.1728991811522; Tue, 15 Oct 2024
 04:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241015112510.412471-1-thuth@redhat.com>
In-Reply-To: <20241015112510.412471-1-thuth@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 15 Oct 2024 15:30:00 +0400
Message-ID: <CAMxuvazGYBHJuNkYHMxcGZNMOzcVjehdXu9t8rbhb3xSGR1iGw@mail.gmail.com>
Subject: Re: [PATCH v2] ui/console-vc: Silence warning about sprintf() on
 OpenBSD
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Brad Smith <brad@comstyle.com>,
 qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Michael Tokarev <mjt@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.063,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 15 Oct 2024 11:30:23 -0000

On Tue, Oct 15, 2024 at 3:25=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> The linker on OpenBSD complains:
>
>  ld: warning: console-vc.c:824 (../src/ui/console-vc.c:824)([...]):
>  warning: sprintf() is often misused, please use snprintf()
>
> Using g_strdup_printf() is certainly better here, so let's switch
> to that function instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  v2: Use g_strdup_printf() instead of snprintf()
>
>  ui/console-vc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/ui/console-vc.c b/ui/console-vc.c
> index 8393d532e7..53fcee88f4 100644
> --- a/ui/console-vc.c
> +++ b/ui/console-vc.c
> @@ -648,7 +648,7 @@ static void vc_putchar(VCChardev *vc, int ch)
>      QemuTextConsole *s =3D vc->console;
>      int i;
>      int x, y;
> -    char response[40];
> +    g_autofree char *response =3D NULL;
>
>      switch(vc->state) {
>      case TTY_STATE_NORM:
> @@ -821,7 +821,7 @@ static void vc_putchar(VCChardev *vc, int ch)
>                      break;
>                  case 6:
>                      /* report cursor position */
> -                    sprintf(response, "\033[%d;%dR",
> +                    response =3D g_strdup_printf("\033[%d;%dR",
>                             (s->y_base + s->y) % s->total_height + 1,
>                              s->x + 1);
>                      vc_respond_str(vc, response);
> --
> 2.47.0
>


