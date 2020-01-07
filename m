Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioikf-0007Ny-Ay
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2020 01:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ioika-00078L-OW
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 01:54:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ioikZ-0001lE-Gw
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 01:54:00 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53226
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ioikZ-0001kC-Ds
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 01:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578380038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A0z8s7inqPti53d0DxeLpcWos8iVLQQpcUsiMQ0VTNw=;
 b=KEQFY1z1TyQX+X1OeyOkdTiOpYh9jJ5lQi5iNkv2ZaQEEI44Bymbpp8gBvapVq0HgcSHve
 6EYMs1e42sM2AmVRbjJf/NSMBr8uReMTM2/j5vGfZstvND5KIWOcxajVK1jWC8A7VSOoNi
 VF6mNhJZeQ2C7IRuVWnrWhCCRrwPaC8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-P2fQ84g6PK2j1qWImvzYig-1; Tue, 07 Jan 2020 01:53:57 -0500
Received: by mail-wr1-f69.google.com with SMTP id l20so21199587wrc.13
 for <qemu-trivial@nongnu.org>; Mon, 06 Jan 2020 22:53:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dzs0OkxOzmXTEn6EoTe06Ew8wnWIXkT7FoNjhS0sZ5M=;
 b=RLhsEwu5qkGCKdh2Vul8isvKB2x2cNKgHSwNVXS2MXSg6FQXBFLf/ZRQmq9I54Rfls
 Y29ehRKoGFdTkHg7G9q/k8gia9/S2Eb/nYI51MAln8cEH8GITVB8OMH9PvTurAC7xZAB
 K8/QYyse9o64NM4R4KkVL5hzMzmCgyjoFuZMCfLZwe3x0CwEXTv02mYsWdWElZrBfcvX
 lRZfNMlQFl/2tIqtNkYqRsesfngG3m+MheL7nT4oX90ZDwYGvmw+qzuVxfK/hUz7QpcH
 XXmqyqG+TTzpBjBXqmgbBWFBkat8CsY4H7bfUDWDb6RMJQu5Z1NlHYOFNK7HYZweo2Ct
 GVSA==
X-Gm-Message-State: APjAAAVWGXuar+1KEq4UlgqGm7WvXzuNSkkZVktnlcnv3EPMJfKP4qaJ
 l7nh5dBtZQTxDKCIx3K0J6DsEhXXMR1XqEfM2Qx5VzhdFL0IG0meKCp45api79aX0zdpFa0TgGY
 L28OioPPSsQboeAbvAg==
X-Received: by 2002:a5d:5345:: with SMTP id t5mr111710601wrv.0.1578380036111; 
 Mon, 06 Jan 2020 22:53:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqx4bqDSESASD66T0iraqarQ9LkWer/zDViuMkKCd0sHAsIHPpvcNrVf+zNfIjP+1M9e3CXCBQ==
X-Received: by 2002:a5d:5345:: with SMTP id t5mr111710587wrv.0.1578380035934; 
 Mon, 06 Jan 2020 22:53:55 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id 18sm25206502wmf.1.2020.01.06.22.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 22:53:55 -0800 (PST)
Subject: Re: [PATCH v1 29/59] cryptodev-vhost.c: remove unneeded 'err' label
 in cryptodev_vhost_start
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-30-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b8ed44d4-d56f-1e2e-92eb-24830d20696c@redhat.com>
Date: Tue, 7 Jan 2020 07:53:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200106182425.20312-30-danielhb413@gmail.com>
Content-Language: en-US
X-MC-Unique: P2fQ84g6PK2j1qWImvzYig-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Tue, 07 Jan 2020 06:54:03 -0000

On 1/6/20 7:23 PM, Daniel Henrique Barboza wrote:
> 'err' can be replaced by 'return r'.
>=20
> CC: Gonglei <arei.gonglei@huawei.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   backends/cryptodev-vhost.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/backends/cryptodev-vhost.c b/backends/cryptodev-vhost.c
> index 8337c9a495..907ca21fa7 100644
> --- a/backends/cryptodev-vhost.c
> +++ b/backends/cryptodev-vhost.c
> @@ -201,7 +201,7 @@ int cryptodev_vhost_start(VirtIODevice *dev, int tota=
l_queues)
>       r =3D k->set_guest_notifiers(qbus->parent, total_queues, true);
>       if (r < 0) {
>           error_report("error binding guest notifier: %d", -r);
> -        goto err;
> +        return r;
>       }
>  =20
>       for (i =3D 0; i < total_queues; i++) {
> @@ -236,7 +236,7 @@ err_start:
>       if (e < 0) {
>           error_report("vhost guest notifier cleanup failed: %d", e);
>       }
> -err:
> +
>       return r;
>   }
>  =20
>=20


