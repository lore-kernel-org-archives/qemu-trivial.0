Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ilyOv-0005Oi-Si
	for mharc-qemu-trivial@gnu.org; Mon, 30 Dec 2019 12:00:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ilyOq-0005Fr-VA
 for qemu-trivial@nongnu.org; Mon, 30 Dec 2019 12:00:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ilyOn-0002IT-7f
 for qemu-trivial@nongnu.org; Mon, 30 Dec 2019 12:00:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49697
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ilyOm-0002I8-DP
 for qemu-trivial@nongnu.org; Mon, 30 Dec 2019 12:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577725207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uYHvn2oYThI3z3bqnaWp4TJRAroW2ZDXFyKOmcujNKs=;
 b=VLOgRrXyY7WZWPfs8dNxzOwqQnLoNKCLBT5HTVJDNYos1JYn/xos6tXJgl3VVxjdk5nVcR
 ciIvIynUP5VI3rxtroRCV2hYHuN2prQOjU2xa2/PWB9OxBwag4+05vx0vaNjeMTzVj5Jvy
 zKxJB1sONUJV4r9FIXFyInwx7KZIbQc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-z_uIzSoGMSqpu1M1t9B0OA-1; Mon, 30 Dec 2019 12:00:05 -0500
Received: by mail-wr1-f69.google.com with SMTP id h30so9164164wrh.5
 for <qemu-trivial@nongnu.org>; Mon, 30 Dec 2019 09:00:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BqrS0mPxlhSGMdF6WXF/f+VF7RdTblu/FV8J5psIfCo=;
 b=R2MYSpPz+Wy00q1WsrGBt3o6fL7pJ/jEWAMqUbvLyL6dHvG677QteZwJMwdcxY+0T5
 1wmwRr/PbjCLtO98Ag3QpEI19hDpzlRctrKsJ0wtBYsKROgV2VvJXX/ED2RyI5ggkw0w
 +z6+qD7TOwoTzlaRhWtClyrZrA4/WmbUH343oh/JMokqVyva0DA5eutMXQVeWUJuLDOG
 Gdr9rZti3h7H8TkIBBWguYs21Qh8KyeA/aBMzt6966aagnTCIhJLecnasJfi0PrDZbZo
 /54btpWLvm+jXe9VyoKraOsA3SrXrd76wNcrFTE4JKX8fgL5/qtwtOFyaDENb3qSRE+U
 b75g==
X-Gm-Message-State: APjAAAVApSY+yJ33iR1EQggRyia7/SMySP7/EzHu9HuKuiyzT3vCmrbz
 +JmrxY1kZhvbeebn7pgs3sAZIb6o+JxNmuRivtfhXbxU5ZXcRdIFTm6Nb0nwhcBtjcEjrlpw0Kj
 U9wKRD4t54NxfKBgpkg==
X-Received: by 2002:a5d:6802:: with SMTP id w2mr66582054wru.353.1577725204576; 
 Mon, 30 Dec 2019 09:00:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqxrXmBmTAvQCkVlLexJnKww7T0/7iXsZsPatiQlXiaUe8GPDSUSP/S3nW5Bi1rOl89ksMBTDw==
X-Received: by 2002:a5d:6802:: with SMTP id w2mr66582031wru.353.1577725204259; 
 Mon, 30 Dec 2019 09:00:04 -0800 (PST)
Received: from [192.168.1.25] (abayonne-654-1-186-92.w92-134.abo.wanadoo.fr.
 [92.134.161.92])
 by smtp.gmail.com with ESMTPSA id f207sm20297wme.9.2019.12.30.09.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 09:00:03 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Remove Claudio Fontana bouncing email
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Claudio Fontana <claudio.fontana@gmail.com>
References: <20191230111801.26315-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6e105845-05b1-de20-0844-7081821d0479@redhat.com>
Date: Mon, 30 Dec 2019 18:00:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191230111801.26315-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: z_uIzSoGMSqpu1M1t9B0OA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Mon, 30 Dec 2019 17:00:16 -0000

On 12/30/19 12:18 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Claudio Fontana Huawei email is bouncing, remove it.
>=20
>    The message you sent to claudio.fontana@huawei.com couldn't be
>    delivered due to: Recipient email address is possibly incorrect.
>=20
>    Further information:
>      5.1.1 Error: invalid recipients
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 387879aebc..8db4de6b9a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2383,7 +2383,6 @@ F: plugins/
>   F: tests/plugin
>  =20
>   AArch64 TCG target
> -M: Claudio Fontana <claudio.fontana@huawei.com>
>   M: Claudio Fontana <claudio.fontana@gmail.com>
>   S: Maintained
>   L: qemu-arm@nongnu.org
>=20

Claudio, if you want we can amend to this patch:

-- >8 --
diff --git a/.mailmap b/.mailmap
index 3816e4effe..4ed87fb53f 100644
--- a/.mailmap
+++ b/.mailmap
@@ -43,6 +43,7 @@ Aleksandar Markovic <amarkovic@wavecomp.com>=20
<aleksandar.markovic@mips.com>
  Aleksandar Markovic <amarkovic@wavecomp.com>=20
<aleksandar.markovic@imgtec.com>
  Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arikalo@wavecomp.com>
  Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori=20
<aliguori@us.ibm.com>
+Claudio Fontana <claudio.fontana@gmail.com> <claudio.fontana@huawei.com>
  James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
  Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
  Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
---

Simply reply with your Ack-by such "with .mailmap change:"...


