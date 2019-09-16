Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i9prR-0006rX-Gj
	for mharc-qemu-trivial@gnu.org; Mon, 16 Sep 2019 08:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59270)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i9prP-0006pk-7c
 for qemu-trivial@nongnu.org; Mon, 16 Sep 2019 08:12:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i9prO-0002kH-8N
 for qemu-trivial@nongnu.org; Mon, 16 Sep 2019 08:12:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59700
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i9prO-0002k8-5M
 for qemu-trivial@nongnu.org; Mon, 16 Sep 2019 08:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1568635921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=17WD0nVxljDzm3o40Oz2gLib+S4SFISJaDGPpRM5RJw=;
 b=ILH2Opr3cH/LsyCMRkKFb5tjNk3FjI6IrqfhcKZQxvVoVlX0oJGHmG7s5ASSJLpRUry+lk
 MD7jZ1/K/1hZi9dwBLNlXI4oHk0Mzy5OY8q4ZToUyRyXLXEtJxeVMGSdtCqHp3d9hyMNWx
 4SHgwytAouyqHh2fQHZXOTQWLuvacvw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-Cq28nvZsOlmLQysVocMyGg-1; Mon, 16 Sep 2019 08:11:58 -0400
Received: by mail-wm1-f72.google.com with SMTP id j125so3713478wmj.6
 for <qemu-trivial@nongnu.org>; Mon, 16 Sep 2019 05:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5DVTHvqOu6nKBfLneUjMAg25wAmlgg3qXoALvsCWNGg=;
 b=SqSwgcS/F8WSh+My3Yck5pSQ3FMYJ3jNCTPVJcDAjPzL/+xp6jlxWVbmhzFW7MuD4P
 QHrXSl7mYDzrmQDZU0iw7paKAGRUz4YG4Ud3mmMhlEiIo+xsxn/b4qjmQK5P95UXlzIT
 Q1vt68l2BDE2vVaDapjML6MyUKOiHcgV18je6jNLmTjxLxs3yUDZpQgcICsfMVnaApmq
 eSN7ibFR+E/bw9wYk+A3HEmhPQSRu7+inzZk9E5FKdPIzWFxyz9TSIauImds0NJTSjUr
 RoA56KZEnJDNdxjwETuw96lECwUoSE4tbPxFM4BbuOsRDCr0clxwtdRfDsCLsjvsZ2Uu
 K/PQ==
X-Gm-Message-State: APjAAAXO3XGETEssxRoT9CHyYWo67wBKEd/4xn4gtTPDQLw9IOYSHYkd
 mHgqxKzfrBpkxqlBNg6UdWHR2BpSO3oOeSlv+9QGpeL1cK/0n8j2tSR+O/i6nlrJ7ANxGJrJn6k
 19/IWv6bkfkFIuQpC5w==
X-Received: by 2002:adf:b3c1:: with SMTP id x1mr42485427wrd.33.1568635916534; 
 Mon, 16 Sep 2019 05:11:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/dkJujENyM7EBUHlAmYwRrfpe9awj5BVfOC5np7cHa3yTJiVX16InvvhWl/lTbB4fUUEKWQ==
X-Received: by 2002:adf:b3c1:: with SMTP id x1mr42485407wrd.33.1568635916270; 
 Mon, 16 Sep 2019 05:11:56 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id t203sm14007205wmf.42.2019.09.16.05.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2019 05:11:55 -0700 (PDT)
To: James Le Cuirot <chewi@gentoo.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20190914145155.19360-1-chewi@gentoo.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6f0b46b7-6e12-55bc-9e87-6919a124c1f3@redhat.com>
Date: Mon, 16 Sep 2019 14:11:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190914145155.19360-1-chewi@gentoo.org>
Content-Language: en-US
X-MC-Unique: Cq28nvZsOlmLQysVocMyGg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Add xkbcommon
 configure options
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
X-List-Received-Date: Mon, 16 Sep 2019 12:12:04 -0000

On 9/14/19 4:51 PM, James Le Cuirot wrote:
> This dependency is currently "automagic", which is bad for distributions.
>=20

Fixes: 6a021536e23
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> Signed-off-by: James Le Cuirot <chewi@gentoo.org>
> ---
>  configure | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/configure b/configure
> index 30aad233d1..30544f52e6 100755
> --- a/configure
> +++ b/configure
> @@ -1521,6 +1521,10 @@ for opt do
>    ;;
>    --disable-libpmem) libpmem=3Dno
>    ;;
> +  --enable-xkbcommon) xkbcommon=3Dyes
> +  ;;
> +  --disable-xkbcommon) xkbcommon=3Dno
> +  ;;
>    *)
>        echo "ERROR: unknown option $opt"
>        echo "Try '$0 --help' for more information"
> @@ -1804,6 +1808,7 @@ disabled with --disable-FEATURE, default is enabled=
 if available:
>    capstone        capstone disassembler support
>    debug-mutex     mutex debugging support
>    libpmem         libpmem support
> +  xkbcommon       xkbcommon support
> =20
>  NOTE: The object files are built at the place where configure is launche=
d
>  EOF
>=20


