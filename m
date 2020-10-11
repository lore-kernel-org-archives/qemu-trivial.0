Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRQbG-0004T9-MU
	for mharc-qemu-trivial@gnu.org; Sat, 10 Oct 2020 21:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kRQbF-0004Se-9l; Sat, 10 Oct 2020 21:56:37 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kRQbD-0004Sh-J7; Sat, 10 Oct 2020 21:56:36 -0400
Received: by mail-ot1-x342.google.com with SMTP id q21so12584570ota.8;
 Sat, 10 Oct 2020 18:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iafPvEnAsyoEe4Ey2SSoAVShKbsoVPNle8hYe14TBV4=;
 b=OXB02dAdZIBTl+KrKmhVSLISLfzH0o8fLIIa7ThYZzQGNC9BPHZKkJS9tOEheZlZhn
 Nk3ZKSC+p881FErg8g3GlehIDx71JaPhZupjhx5TKJN/gHrEkxjboqnySgo/ee7FiaJJ
 A5qQ8+QARSc2n6dxE7fEvcCNvIqIECxzj6bdH3lCBoIKMHLYQN9YAcsU1hPyLAzjzmOI
 5QzJLSddWFSaX3Col5amAfm40K6Ysc7ZU7ozsrn/lRSgwo/AtSLwCUUo7PA/LZyXF0Os
 Ci7gkTmi1aSZ8Cv43ByhUMrqQ768C0JtxNyomAcmd5H9GgFYYxM8DuytCdxCFkhUkZws
 257A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iafPvEnAsyoEe4Ey2SSoAVShKbsoVPNle8hYe14TBV4=;
 b=JueJJ33jUeOcFAvsSzYuyUOgBybHbiTPopHadpp5FIiWzOcCjODR6/jmdpirC2gB7Q
 8GxQK4T5eDnCjFK9r8vUX2QOZFauMAyKHRAJquNZsKU6VkEFTjNKYfQhozPL8vzHal0a
 cvF+qFX9OXsmA31p/SC0yPPBgF5NJ7NeQbH5Rs6TL+ovlmObqAt8uCt8Nzdy5/JyYpaG
 +Wiapk7CJ+X+nnGM1ADlv6WNQ7KVeS3PcmFVH4kLz+VqMbwwXnPuwzq0FLJzUBUBXs6W
 Y8fbDWDgAMBxFDj2JxM7krbIIot3CxuvPdlijMlNWoJ8aZIKzmpVOAj+mKiavel+Xepf
 U5oQ==
X-Gm-Message-State: AOAM533Rbft2tOf8zeZMQwnErIqd0AluPFiRgHmqfyjRJIzpaISWdBAK
 mFScdG4VDB1UpkccRrAE92pk/e6oseNot6PEfcU=
X-Google-Smtp-Source: ABdhPJxkVrr/7++zNogbmBXafpoSSBO5maPk7oU2TXT65H3qOdsLZRPavxdebY1sDpMId4gfYGSGcOAHT0X6CzjxUwo=
X-Received: by 2002:a9d:1a2:: with SMTP id e31mr10721565ote.181.1602381393235; 
 Sat, 10 Oct 2020 18:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201010110730.1575180-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20201010110730.1575180-1-kuhn.chenqun@huawei.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Sun, 11 Oct 2020 09:55:57 +0800
Message-ID: <CAKXe6SJWZ+ek-MefzJzDH=H=N90B67i5pV7CybA2maYq9Euk5w@mail.gmail.com>
Subject: Re: [PATCH] migration/block-dirty-bitmap: fix uninitialized variable
 warning
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: Qemu Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Fam Zheng <fam@euphon.net>, ganqixin@huawei.com, vsementsov@virtuozzo.com, 
 zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-block@nongnu.org, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Euler Robot <euler.robot@huawei.com>, 
 John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 11 Oct 2020 01:56:37 -0000

Chen Qun <kuhn.chenqun@huawei.com> =E4=BA=8E2020=E5=B9=B410=E6=9C=8810=E6=
=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=887:08=E5=86=99=E9=81=93=EF=BC=9A
>
> This if statement judgment is redundant and it will cause a warning:
>
> migration/block-dirty-bitmap.c:1090:13: warning: =E2=80=98bitmap_name=E2=
=80=99 may be used
>  uninitialized in this function [-Wmaybe-uninitialized]
>              g_strlcpy(s->bitmap_name, bitmap_name, sizeof(s->bitmap_name=
));
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  migration/block-dirty-bitmap.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitma=
p.c
> index 5bef793ac0..e09ea4f22b 100644
> --- a/migration/block-dirty-bitmap.c
> +++ b/migration/block-dirty-bitmap.c
> @@ -1084,9 +1084,7 @@ static int dirty_bitmap_load_header(QEMUFile *f, DB=
MLoadState *s,
>              } else {
>                  bitmap_name =3D s->bitmap_alias;
>              }
> -        }
>
> -        if (!s->cancelled) {
>              g_strlcpy(s->bitmap_name, bitmap_name, sizeof(s->bitmap_name=
));
>              s->bitmap =3D bdrv_find_dirty_bitmap(s->bs, s->bitmap_name);
>
> --
> 2.23.0
>
>

