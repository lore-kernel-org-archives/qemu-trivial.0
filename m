Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jEtmh-0001xE-22
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2020 07:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jEtme-0001v4-MC
 for qemu-trivial@nongnu.org; Thu, 19 Mar 2020 07:56:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jEtmd-0004c7-KX
 for qemu-trivial@nongnu.org; Thu, 19 Mar 2020 07:56:20 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:45013)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jEtmd-0004bJ-Hi
 for qemu-trivial@nongnu.org; Thu, 19 Mar 2020 07:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584618979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=be0q9ZHIRTRarz/YFy+cCj0leqx5lfgIKYVCSf44jWY=;
 b=PykAd2aN5+XcT9tfpAEbZXFn9AolbR2sbJQ4cquMheDz+0onJoo0m1g58AoWcZY1K308fQ
 seQ3MN8YTTIJTVt5epyXXGCApXlJteNewuZWOTum7ag7dpxZL8QRLGZVDD84lxTzznFfHs
 laYUgLMhVFzLhFJTrAeRYw5JBLZ6Pjg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-6WTZz2tPN36VV1c6bciPzQ-1; Thu, 19 Mar 2020 07:56:17 -0400
X-MC-Unique: 6WTZz2tPN36VV1c6bciPzQ-1
Received: by mail-wr1-f71.google.com with SMTP id l16so893713wrr.6
 for <qemu-trivial@nongnu.org>; Thu, 19 Mar 2020 04:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4mN8e2YUDMF2Q8E19Xczl63rnrWlCgvY8HgHBpRw48w=;
 b=a3MP9t+Oj8SAvgA+NUBHdocgfdBKvXOMycLwfB9ORAmkriooZ0emfJTGRFNgxF1Lwo
 k4XsSld7n1xL3WEqoSsRtW5/p25ok59jootQYZIbkguhHTQ0G9jiyCilt0Tm+O0ky3s3
 yooWR9vSMbAKqEJ1+o7GuTebmEoSVaRncQj4lLm/rkZP7vdyNmH7z1yK7EFhVDvYT6FK
 2rNMi8jrNq750YGrVZh6reipo1FfRsBxCPj2H25oa9klWk6hm+80b+zZx2dP93tsO/fm
 DHSStwZIKRY51eJpaDs6hnXyuaHfdgQpriQjxwy4CHr+AelUzviANDDQ53KuoXYX9541
 vRqw==
X-Gm-Message-State: ANhLgQ3Zdvh1wCVnTv51BuiPOeOovVuT/NS8aanODVgZmH3KW9VwKMcF
 9i7TQpykLGR3zeRGHQ8ObFFoMzaLwZFEkCBuXsPT6s3dVdw384G3Mw0Kgh7r4k4wvB5f1CE74xu
 at/03FjKdWFyTUOK3ZA==
X-Received: by 2002:adf:ed86:: with SMTP id c6mr3701192wro.286.1584618975696; 
 Thu, 19 Mar 2020 04:56:15 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu9vsau8S7NJNU7xSjIVy2lNbs92ldz5OljgBgjULdzoRsFXEFBa/uIGEXkQt8sdVgnV4JEuw==
X-Received: by 2002:adf:ed86:: with SMTP id c6mr3701161wro.286.1584618975402; 
 Thu, 19 Mar 2020 04:56:15 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.15.43])
 by smtp.gmail.com with ESMTPSA id y5sm2817683wmi.34.2020.03.19.04.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2020 04:56:14 -0700 (PDT)
Subject: Re: [PATCH] hw/isa/superio: Correct the license text
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson
 <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org
References: <20200312213712.16671-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eb427089-c7c2-c4d2-ba39-51d79c39484f@redhat.com>
Date: Thu, 19 Mar 2020 12:56:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312213712.16671-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
X-List-Received-Date: Thu, 19 Mar 2020 11:56:22 -0000

On 12/03/20 22:37, Philippe Mathieu-Daud=C3=A9 wrote:
> The license is the 'GNU General Public License v2.0 or later',
> not 'and':
>=20
>   This program is free software; you can redistribute it and/ori
>   modify it under the terms of the GNU General Public License as
>   published by the Free Software Foundation; either version 2 of
>   the License, or (at your option) any later version.
>=20
> Fix the license comment.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/isa/superio.h   | 2 +-
>  hw/isa/isa-superio.c       | 2 +-
>  hw/isa/smc37c669-superio.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/hw/isa/superio.h b/include/hw/isa/superio.h
> index b151dcd753..147cc0a7b7 100644
> --- a/include/hw/isa/superio.h
> +++ b/include/hw/isa/superio.h
> @@ -3,7 +3,7 @@
>   *
>   * Copyright (c) 2018 Philippe Mathieu-Daud=C3=A9
>   *
> - * This code is licensed under the GNU GPLv2 and later.
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
>   * See the COPYING file in the top-level directory.
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
> diff --git a/hw/isa/isa-superio.c b/hw/isa/isa-superio.c
> index c4e391916c..180a8b9625 100644
> --- a/hw/isa/isa-superio.c
> +++ b/hw/isa/isa-superio.c
> @@ -5,7 +5,7 @@
>   * Copyright (c) 2011-2012 Andreas F=C3=A4rber
>   * Copyright (c) 2018 Philippe Mathieu-Daud=C3=A9
>   *
> - * This code is licensed under the GNU GPLv2 and later.
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
>   * See the COPYING file in the top-level directory.
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
> diff --git a/hw/isa/smc37c669-superio.c b/hw/isa/smc37c669-superio.c
> index 901a9f8e65..18287741cb 100644
> --- a/hw/isa/smc37c669-superio.c
> +++ b/hw/isa/smc37c669-superio.c
> @@ -3,7 +3,7 @@
>   *
>   * Copyright (c) 2018 Philippe Mathieu-Daud=C3=A9
>   *
> - * This code is licensed under the GNU GPLv2 and later.
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
>   * See the COPYING file in the top-level directory.
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
>=20

Queued, thanks.

Paolo


