Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iaLBp-0006wT-0m
	for mharc-qemu-trivial@gnu.org; Thu, 28 Nov 2019 09:54:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iaLBk-0006ss-KW
 for qemu-trivial@nongnu.org; Thu, 28 Nov 2019 09:54:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iaLBT-0002ik-4K
 for qemu-trivial@nongnu.org; Thu, 28 Nov 2019 09:54:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37856
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iaLBR-0002XI-Um
 for qemu-trivial@nongnu.org; Thu, 28 Nov 2019 09:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574952856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eHV1Eyf8uC3LYSu2U8Zq/CxZWGGQvWuQ1uaFhUtf0BA=;
 b=JeeergixusrZh21QJXr6J6o5mBWQdiYNI1WTt6a8Eo2PigYNV/euk5jn/t/88FMIk3nTNl
 WrGu30aW/uP1Z4O2TYmFPTMk8PUV9MDbJKrpXWgPsaDMJZm3UjiYQpbHfLGjR/nvH95pD2
 l/BhfgdLdDPyAkfaRyG9lAYdA+II0S8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-Gym19HnYMOaLipVZqsjwRg-1; Thu, 28 Nov 2019 09:54:14 -0500
Received: by mail-wm1-f69.google.com with SMTP id l23so3776143wmh.6
 for <qemu-trivial@nongnu.org>; Thu, 28 Nov 2019 06:54:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p3E/8222RacGj97HRp98RDwGuYZify7STc5zCtCPmlA=;
 b=nZXQ0sSCJmULa2Su8wWjkdZZc01SzlF0xvYSfyDlRDE1VnwNvqQIl+FhT7ketw4Bu9
 CgktQpQSF5IksoI9Ki2gb/Q5PoWcVfWxc31aP2gMv8PkXCpYocengQN5JNa+w6K+XDkF
 dyq8o+0iPachzEQTr53gsTlBCvW3XMfD22ULTCo+4j/arvD5VCgJ/+LLpu4HkFxlMZV1
 6t2MC3I8PpfDdwfoj4wNRpyd42YwRMD3GBufGTMoZ9fr11HWLCIPdKt0zLjgT0eMM9/q
 fKsGjowH80Q47YCmQYokGzjzyfBIy/zQtsofEpwmTq29O3WNkdr8N8P5R1XfQBiFGiIO
 Eb+g==
X-Gm-Message-State: APjAAAXUiGXg6dv2HHV3OLq15bhgCy+4FrJhorHHt429yuglyLuqVXMM
 KGvIjJDq7yzidrKVur3Fmk5ajnTUXL0oE80gtDYG1dhkALW4cnKJQ2WVlA61boPxdvOmvV+gHr9
 +Tqg8jsIJA9qdY7v6ww==
X-Received: by 2002:a05:600c:2049:: with SMTP id
 p9mr9991237wmg.128.1574952853052; 
 Thu, 28 Nov 2019 06:54:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqzCKb/aNTSW2ihQ+T777nqsOYp6qTkaYQMxiBlXU7Z4sX3nKr7CirYN4GyG4/ya3fezDQCLKw==
X-Received: by 2002:a05:600c:2049:: with SMTP id
 p9mr9991217wmg.128.1574952852855; 
 Thu, 28 Nov 2019 06:54:12 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id y6sm23896220wrn.21.2019.11.28.06.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2019 06:54:12 -0800 (PST)
Subject: Re: [PATCH] vfio-ccw: Fix error message
To: Boris Fiuczynski <fiuczy@linux.ibm.com>, qemu-s390x@nongnu.org,
 cohuck@redhat.com, alex.williamson@redhat.com, farman@linux.ibm.com
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20191128143015.5231-1-fiuczy@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1d285275-5964-2415-e52e-1b60397d2918@redhat.com>
Date: Thu, 28 Nov 2019 15:54:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191128143015.5231-1-fiuczy@linux.ibm.com>
Content-Language: en-US
X-MC-Unique: Gym19HnYMOaLipVZqsjwRg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Thu, 28 Nov 2019 14:54:39 -0000

On 11/28/19 3:30 PM, Boris Fiuczynski wrote:
> Signed-off-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
> Reviewed-by: Eric Farman <farman@linux.ibm.com>
> ---
>   hw/vfio/ccw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 6863f6c69f..3b5520ae75 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -102,7 +102,7 @@ again:
>           if (errno =3D=3D EAGAIN) {
>               goto again;
>           }
> -        error_report("vfio-ccw: wirte I/O region failed with errno=3D%d"=
, errno);
> +        error_report("vfio-ccw: write I/O region failed with errno=3D%d"=
, errno);
>           ret =3D -errno;
>       } else {
>           ret =3D region->ret_code;
>=20

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>


