Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sgIPF-0000GU-Sl
	for mharc-qemu-trivial@gnu.org; Tue, 20 Aug 2024 02:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1sgIPC-0000F9-Pk
 for qemu-trivial@nongnu.org; Tue, 20 Aug 2024 02:31:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1sgIPA-0003zx-Jx
 for qemu-trivial@nongnu.org; Tue, 20 Aug 2024 02:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724135501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ipqdOzdsD3jeKscdJAixqRrYXhLbC9Fh2mP3zpOwGS0=;
 b=IOInq+v7w6/TXpYAcx5wjcQbqwRdjGaRJyMw6s2F4wCMJjhTVXu14rHCyO6A241ppqsSnI
 tM81GTz9PkBTodIsBo9qq4a2AtORVhP2HKdhQaUT8GiSCW0aoPXRQbb+0t+5JLduoJnm5l
 XU9DCh+A1YUdD1qSbeJRgRH+X4H+Tr8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-wOayX9rJNE-N8nVdsyaTCg-1; Tue, 20 Aug 2024 02:31:38 -0400
X-MC-Unique: wOayX9rJNE-N8nVdsyaTCg-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6bf7ad66ab7so82734106d6.1
 for <qemu-trivial@nongnu.org>; Mon, 19 Aug 2024 23:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724135498; x=1724740298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ipqdOzdsD3jeKscdJAixqRrYXhLbC9Fh2mP3zpOwGS0=;
 b=s8WMBEYijoGdW0UWz7JlsA5xf/8Ku10BMEVuwa7R7QfaCLLVAxvhuQ72lQBzi5rXhl
 BXXo2LuZhuPxR86NrzLcHIUGkkeq9fy62eek/DSBDgZMDP0g4xwB5WNKdtDEWhnr0mEv
 jVh6TJ3M4Cr00asj9ip9c/rup5G34t+E7qHWqrFFBSflY6P9JLNWsXpa+qqwTvUBG2hM
 6nq2E/ZYFguv23VOipcO7zNp+GNfntZ0rB/uUuvDeHotB8Q22KUasaiE3t4dqleYZb3w
 8ly5cKmj6z9EoT54yGxwwIMnoft6ITsH/xG4zF9LEaotex3pGtxEj5ldy9G9pvJb4sGn
 cyBA==
X-Gm-Message-State: AOJu0Yy6SehkMHvaTIicNtpc5VaD3Ae8Cxii/2Yv9JChFweSYzgxsENF
 XGkYbsw90K/ZpfDt2FhJUkwhSTTXsF8DMQLGsh9GuyC2dYeCEu0MCbhCr6CMhpgAonihsqDNjnT
 tH4qJzBvbNgpFArroJKx6YeJhBu5KvUXqKYstXw/75DKuqNpG+/j+pMhV597SHm7tPAjSLGvo4B
 SqlRWumnPL66WE4PW0AO3BPZw0GKj37W5O3/kP9cPL
X-Received: by 2002:a05:6214:3da0:b0:6bf:7eeb:99b0 with SMTP id
 6a1803df08f44-6bfa8a55c6dmr46450126d6.14.1724135498250; 
 Mon, 19 Aug 2024 23:31:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIy0YY24/mEQf5+9pdmU3PUnQqELUfZ6FSzI8OSM6k9u/CBU/Ae/Cf9YwGrqzSq+lGOMoVpcMOnPD1Um5N1Rs=
X-Received: by 2002:a05:6214:3da0:b0:6bf:7eeb:99b0 with SMTP id
 6a1803df08f44-6bfa8a55c6dmr46449926d6.14.1724135497844; Mon, 19 Aug 2024
 23:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240820030433.395444-2-wh1sper@zju.edu.cn>
In-Reply-To: <20240820030433.395444-2-wh1sper@zju.edu.cn>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 20 Aug 2024 10:31:26 +0400
Message-ID: <CAMxuvaz5P4uHHLjhFE-+aFHGmVZq1zN62Qu2ReuXkOvvyC9-zQ@mail.gmail.com>
Subject: Re: [PATCH] hw/display/vhost-user-gpu.c: fix vhost_user_gpu_chr_read()
To: Haoran Zhang <wh1sper@zju.edu.cn>
Cc: qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.134,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 20 Aug 2024 06:31:47 -0000

On Tue, Aug 20, 2024 at 7:09=E2=80=AFAM Haoran Zhang <wh1sper@zju.edu.cn> w=
rote:
>
> fix vhost_user_gpu_chr_read() where `size` was incorretly passed
> to `msg->flags`.
>
> Signed-off-by: Haoran Zhang <wh1sper@zju.edu.cn>

Good catch,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  hw/display/vhost-user-gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> index 63c64ddde6..c0c66910f1 100644
> --- a/hw/display/vhost-user-gpu.c
> +++ b/hw/display/vhost-user-gpu.c
> @@ -390,7 +390,7 @@ vhost_user_gpu_chr_read(void *opaque)
>      }
>
>      msg->request =3D request;
> -    msg->flags =3D size;
> +    msg->flags =3D flags;
>      msg->size =3D size;
>
>      if (request =3D=3D VHOST_USER_GPU_CURSOR_UPDATE ||
> --
> 2.43.0
>


