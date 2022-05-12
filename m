Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1npB4J-00065x-3c
	for mharc-qemu-trivial@gnu.org; Thu, 12 May 2022 11:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1npB4B-00061v-4C
 for qemu-trivial@nongnu.org; Thu, 12 May 2022 11:49:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1npB49-00066B-C7
 for qemu-trivial@nongnu.org; Thu, 12 May 2022 11:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652370564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fEyuA1t6b7UKCgLNW2WXWpyYp+0uxw2qdHmw+Q/dk+Y=;
 b=Xg/iOVPJ4/tP8g7EdH3azFCgMiicJsHh8j8HF7STQx+QVMF03hPBpl5EOs3UUQIL46ZKWG
 cfgfvJK9iaZwsbRDZ/yTARCk2H+4ix07TGqIn5TLYVpNK6yV42yyDtpTyGM9tZgLywPt/s
 QxMpacrLMrc2N3FSguWBZBtLWgdMJ4E=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-FZd9XFVIOESc5IuGy2Tolw-1; Thu, 12 May 2022 11:49:23 -0400
X-MC-Unique: FZd9XFVIOESc5IuGy2Tolw-1
Received: by mail-qt1-f197.google.com with SMTP id
 f12-20020a05622a1a0c00b002f3b5acc2e7so4125841qtb.1
 for <qemu-trivial@nongnu.org>; Thu, 12 May 2022 08:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fEyuA1t6b7UKCgLNW2WXWpyYp+0uxw2qdHmw+Q/dk+Y=;
 b=XPX5QbsKIHRyX+wpAWf0WOCQDGHTH1G0zKIaUhtIk7+t7FSitB63jxsdeZoNPHeF+W
 wmuGk1eFNUH5X+KmKsYpuxQaeadVJVz9DzzF6haqoU4wvr/INVcaqKC+45QlAFpR7SRP
 oR/pKkcT8KzsGpAx++sxDHCKag2q8R2qOOJREBT9eEAFOQQmPceAY3OJrKTo8oQ2+bn5
 AMBad2HasDl8h8jhVUYC6xj8/3dnL27dh91LMMv7kNVNkbiQ5FkhbS2DgE95bg7tbcoh
 plFIYpfojxklIoCpzHlJQDozXkko/qMHJXNMaazfZobghBO5jme12zCWndOFepQl3AgJ
 FnSQ==
X-Gm-Message-State: AOAM5314RqgvdPOnq2M9n0YjFLp0Y5T7wTR42xTs3uYIgGPgIEer/Bus
 eGA4u6eEt9ndXemgiuuLr4O3zPAmOFjwkoNfg982Y05DSMqWGQ9HjIEG5wFwiiidcC0G7W7MPRn
 c/DSFChKHRtsK5kCSQ0ENjBPxHR7QrfD4cg==
X-Received: by 2002:a05:6214:1cc3:b0:456:56d:f2c5 with SMTP id
 g3-20020a0562141cc300b00456056df2c5mr546716qvd.119.1652370563283; 
 Thu, 12 May 2022 08:49:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMg0LTdBbHHShbdHvaXdddgn6TwKjYQWYOyNRMgbMK4rQ0T8l7kBVwlB6W6maZOLCVj59LgkQBpV6mSt4Ieqw=
X-Received: by 2002:a05:6214:1cc3:b0:456:56d:f2c5 with SMTP id
 g3-20020a0562141cc300b00456056df2c5mr546701qvd.119.1652370563039; Thu, 12 May
 2022 08:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220427154931.3166388-1-eperezma@redhat.com>
In-Reply-To: <20220427154931.3166388-1-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 12 May 2022 17:48:47 +0200
Message-ID: <CAJaqyWdwzUnP71LNEDe6Fo+th9-qMLQXJMgeo2nb3jE-GyUCPw@mail.gmail.com>
Subject: Re: [PATCH] util: Return void on iova_tree_remove
To: qemu-level <qemu-devel@nongnu.org>
Cc: qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 12 May 2022 15:49:28 -0000

On Wed, Apr 27, 2022 at 5:50 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> It always returns IOVA_OK so nobody uses it.
>
> Acked-by: Jason Wang <jasowang@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Hi! Friendly ping about this, is it something pending from my side?

Thanks!

> ---
>  include/qemu/iova-tree.h | 4 +---
>  util/iova-tree.c         | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
> index c938fb0793..16bbfdf5f8 100644
> --- a/include/qemu/iova-tree.h
> +++ b/include/qemu/iova-tree.h
> @@ -72,10 +72,8 @@ int iova_tree_insert(IOVATree *tree, const DMAMap *map=
);
>   * provided.  The range does not need to be exactly what has inserted,
>   * all the mappings that are included in the provided range will be
>   * removed from the tree.  Here map->translated_addr is meaningless.
> - *
> - * Return: 0 if succeeded, or <0 if error.
>   */
> -int iova_tree_remove(IOVATree *tree, const DMAMap *map);
> +void iova_tree_remove(IOVATree *tree, const DMAMap *map);
>
>  /**
>   * iova_tree_find:
> diff --git a/util/iova-tree.c b/util/iova-tree.c
> index 6dff29c1f6..fee530a579 100644
> --- a/util/iova-tree.c
> +++ b/util/iova-tree.c
> @@ -164,15 +164,13 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_it=
erator iterator)
>      g_tree_foreach(tree->tree, iova_tree_traverse, iterator);
>  }
>
> -int iova_tree_remove(IOVATree *tree, const DMAMap *map)
> +void iova_tree_remove(IOVATree *tree, const DMAMap *map)
>  {
>      const DMAMap *overlap;
>
>      while ((overlap =3D iova_tree_find(tree, map))) {
>          g_tree_remove(tree->tree, overlap);
>      }
> -
> -    return IOVA_OK;
>  }
>
>  /**
> --
> 2.27.0
>
>


