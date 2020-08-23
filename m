Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k9sPD-0006Ki-Ki
	for mharc-qemu-trivial@gnu.org; Sun, 23 Aug 2020 11:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1k9sPC-0006KE-1t
 for qemu-trivial@nongnu.org; Sun, 23 Aug 2020 11:59:38 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39174
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1k9sP9-0006oD-Ps
 for qemu-trivial@nongnu.org; Sun, 23 Aug 2020 11:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598198374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YojgVkY/gEEFl1jcuFNUHUWyx2kxbwD4xw5PlPZf7i0=;
 b=bF9LLYH1KDvnZmnAXk17bcqrSnOKGvRi66VV01AkBMx2arIUIgvPkxa7lQSYE7RYKLgv6/
 Px/cEJVn42La1eE4vnUaPx+f2mToAyrNLi6zqw5eFEJLVyyalnfxadGnjZf0ldfrZeqYS7
 Vg8S4poK8AAu17nWPOOOlLZMeHUPKYE=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-fCcUjrv7NXGu86rAwhKW6A-1; Sun, 23 Aug 2020 11:59:32 -0400
X-MC-Unique: fCcUjrv7NXGu86rAwhKW6A-1
Received: by mail-il1-f199.google.com with SMTP id p10so4908932ile.1
 for <qemu-trivial@nongnu.org>; Sun, 23 Aug 2020 08:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YojgVkY/gEEFl1jcuFNUHUWyx2kxbwD4xw5PlPZf7i0=;
 b=Xf8nApbD84hCioSVFl5CEmu8n079g7BN6HqT54WWADenlc1RRX+wjk4Mavr4wqUfL0
 uj1Kq+hLDnK4ImO+HdJgDW7T6YfLI2lx4RUqG6o1FKQ/Jqm7nJ9fmAg1cOxMAqF41C5B
 G+I+CfExBIAy67eTnqR/wLUxps5LvhSHyzuXhZG7jJ5BsNblcFC9+VW9NsdR+oIpBMjP
 nuyz1AH6k10c9vlm16tyuycZCmRDwOOp+vm/PdH0K2MNKzap+Kc0adfDJiJQekoQIzNT
 PvmFHxrzhzO95Ai3gyWhm17DS24MODZb8ZJGzmNr3Rfch5dj5RHBgDctsICRqFsDbXei
 +pVA==
X-Gm-Message-State: AOAM531p7eULgG+WSH/JCwhG8u1ELTepRrIuhlvzNEu2PdKZbVi7SpSr
 7LKhYb8mQw7MYiaYjze/1BbPIcS1DEbvIP6dbBEo7jbdCfsfhd3AgBL8Ux1JuQuosBTiSNfLnKV
 JCeXXdXw2smsrdnBA3586WHDWgnVCtZhF9A==
X-Received: by 2002:a05:6638:2493:: with SMTP id
 x19mr1769611jat.53.1598198372220; 
 Sun, 23 Aug 2020 08:59:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/mg2F5UPkjPsc5xPpRXQ2Twk6vZrCQoxR7WQN1eskG4qNNTKgf07j7GsfK+Ny588Qru4950mb81OscuoFzNY=
X-Received: by 2002:a05:6638:2493:: with SMTP id
 x19mr1769591jat.53.1598198371973; 
 Sun, 23 Aug 2020 08:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200823102617.32358-1-thuth@redhat.com>
In-Reply-To: <20200823102617.32358-1-thuth@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sun, 23 Aug 2020 19:59:20 +0400
Message-ID: <CAMxuvazg9xRTcCqXg6MRdvaMreQwGJ-mEe8WFeDP_toqpKMECw@mail.gmail.com>
Subject: Re: [PATCH] scripts/qemu-version.sh: Add missing space before ']'
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 qemu-trivial <qemu-trivial@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/23 11:59:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Sun, 23 Aug 2020 15:59:38 -0000

Hi

On Sun, Aug 23, 2020 at 2:26 PM Thomas Huth <thuth@redhat.com> wrote:
>
> When configure has been run with --with-pkgversion=3Dxyz, the shell compl=
ains
> about a missing ']' in this script.
>
> Fixes: 2c273f32d3 ("meson: generate qemu-version.h")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

oops, my bad

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  scripts/qemu-version.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/qemu-version.sh b/scripts/qemu-version.sh
> index 4847385e42..03128c56a2 100755
> --- a/scripts/qemu-version.sh
> +++ b/scripts/qemu-version.sh
> @@ -6,7 +6,7 @@ dir=3D"$1"
>  pkgversion=3D"$2"
>  version=3D"$3"
>
> -if [ -z "$pkgversion"]; then
> +if [ -z "$pkgversion" ]; then
>      cd "$dir"
>      if [ -e .git ]; then
>          pkgversion=3D$(git describe --match 'v*' --dirty | echo "")
> --
> 2.18.2
>


