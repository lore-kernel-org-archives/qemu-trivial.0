Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iZFFy-00032y-1r
	for mharc-qemu-trivial@gnu.org; Mon, 25 Nov 2019 09:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49612)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iZFFv-0002wW-5k
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 09:22:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iZFBi-0007Yp-S9
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 09:18:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48165
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iZFBi-0007Wz-OW
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 09:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574691482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qaFD3f7HMP8cL1ToH5R+SqgA9eUolEzEIxWblD1mqnE=;
 b=ctgcbWo6Txa8vwSljiywONQqEtDN57gZbtIM+J2IlDz9c6NDVJ0idYkUvnku0bz1l40Cyt
 NnX59/yL7757wLftJcotjFUE2Xx0hN+lOxCICF/5kEcbntwFQSSob+zLkqbPeQQnp9otzV
 /o7CkW1onaevfjGM1AdRvv0rkiO6DE0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-aMBXxX_HNlqMQlVwU9mSeg-1; Mon, 25 Nov 2019 09:17:58 -0500
Received: by mail-wm1-f70.google.com with SMTP id h191so6623896wme.5
 for <qemu-trivial@nongnu.org>; Mon, 25 Nov 2019 06:17:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0BrC9KBfOfeOJ+nX3vNAcQ+cDBIyTuwtkb+cj2hz++g=;
 b=p3PuSaQS/2KtYtOrOpYB4aVMVLzZQJm8W4ryNYOPqgBRpADnX7Q9ZSQQm6XP9i4yu8
 354f2L5aRMx3YCIL8zbYtTSEuCgnr8dgUbup3orE7yEBhW5U6sxNL5iSEJmFWlvYMeeS
 KxyHMMjPXuWEoWa8mj17xdM3n/nkWqtqhegWcuKlg336KhhGhfoV+0I/sK1PI4QGlet/
 pSdQ5qIDCVh4MFV4stLBHIuYDr+zSF8kIIXI8nqShttL8T9vej9S1luInurL+/s2RqKw
 tSKFsVe7HbpK+QopR/Z7e82VNKLxcKgMRjGOw/RVmTLdNfrgMCPVAB59XHasF4nVMc0i
 3hAQ==
X-Gm-Message-State: APjAAAUyETVCJTdm2S2U8eJUG1NNckHvXtsMDfYBJg0HuF+lQBcxLM4Z
 f3rPaXrOzGa04fjjDnTUIVnilUkR0VDs+Ik3jVOYxS14ymbxLdC6tlqOoKLY7C9knYfeoyMLi3Q
 bYZPw+l6PmpTKh5ePgQ==
X-Received: by 2002:a5d:4146:: with SMTP id c6mr30815819wrq.250.1574691477685; 
 Mon, 25 Nov 2019 06:17:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqxiP3ZwDpMMLYsnSgWBe5uSRK1CKp4DycKmevreQiuskUlBfVMSlQV/8M6nPh0fyAGREyu9MA==
X-Received: by 2002:a5d:4146:: with SMTP id c6mr30815782wrq.250.1574691477356; 
 Mon, 25 Nov 2019 06:17:57 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id 65sm11322158wrs.9.2019.11.25.06.17.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2019 06:17:56 -0800 (PST)
Subject: Re: [PATCH 1/2] util/cutils: Turn FIXME comment into
 QEMU_BUILD_BUG_ON()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, tao3.xu@intel.com
References: <20191125133846.27790-1-armbru@redhat.com>
 <20191125133846.27790-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c195ba59-6cb8-526f-5450-914051ef5f6f@redhat.com>
Date: Mon, 25 Nov 2019 15:17:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191125133846.27790-2-armbru@redhat.com>
Content-Language: en-US
X-MC-Unique: aMBXxX_HNlqMQlVwU9mSeg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-List-Received-Date: Mon, 25 Nov 2019 14:22:24 -0000

On 11/25/19 2:38 PM, Markus Armbruster wrote:
> qemu_strtoi64() assumes int64_t is long long.  This is marked FIXME.
> Replace by a QEMU_BUILD_BUG_ON() to avoid surprises.
>=20
> Same for qemu_strtou64().
>=20
> Fix a typo in qemu_strtoul()'s contract while there.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   util/cutils.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/util/cutils.c b/util/cutils.c
> index fd591cadf0..b372dd3e68 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -502,7 +502,7 @@ int qemu_strtoul(const char *nptr, const char **endpt=
r, int base,
>    * Convert string @nptr to an int64_t.
>    *
>    * Works like qemu_strtol(), except it stores INT64_MAX on overflow,
> - * and INT_MIN on underflow.
> + * and INT64_MIN on underflow.
>    */
>   int qemu_strtoi64(const char *nptr, const char **endptr, int base,
>                    int64_t *result)
> @@ -517,8 +517,9 @@ int qemu_strtoi64(const char *nptr, const char **endp=
tr, int base,
>           return -EINVAL;
>       }
>  =20
> +    /* This assumes int64_t is long long TODO relax */
> +    QEMU_BUILD_BUG_ON(sizeof(int64_t) !=3D sizeof(long long));

Ready for 128-bit!
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>       errno =3D 0;
> -    /* FIXME This assumes int64_t is long long */
>       *result =3D strtoll(nptr, &ep, base);
>       return check_strtox_error(nptr, ep, endptr, errno);
>   }
> @@ -541,8 +542,9 @@ int qemu_strtou64(const char *nptr, const char **endp=
tr, int base,
>           return -EINVAL;
>       }
>  =20
> +    /* This assumes uint64_t is unsigned long long TODO relax */
> +    QEMU_BUILD_BUG_ON(sizeof(uint64_t) !=3D sizeof(unsigned long long));
>       errno =3D 0;
> -    /* FIXME This assumes uint64_t is unsigned long long */
>       *result =3D strtoull(nptr, &ep, base);
>       /* Windows returns 1 for negative out-of-range values.  */
>       if (errno =3D=3D ERANGE) {
>=20


