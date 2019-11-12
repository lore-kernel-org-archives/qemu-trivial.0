Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iUSHI-0003t6-Te
	for mharc-qemu-trivial@gnu.org; Tue, 12 Nov 2019 04:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45838)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iUSH9-0003s6-O4
 for qemu-trivial@nongnu.org; Tue, 12 Nov 2019 04:15:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iUSH8-0005Ku-OL
 for qemu-trivial@nongnu.org; Tue, 12 Nov 2019 04:15:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33231
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iUSH8-0005KH-Kw
 for qemu-trivial@nongnu.org; Tue, 12 Nov 2019 04:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573550149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=A+tdr1qp7+aUa0drhLGKEWaUxpgrWNl/wUgju6EPFRA=;
 b=Mp8WBJSuak/3crzQgRo9RdMiy4YBDNJWn3DbmmvaTzU858hbIHgG09ffzm2yZhS58CBJNt
 x7nqVqDN3UYfOkAiFP6I7jBqDFRvc2IrDaC5y91IqbY6Xk43qi0A/M+pkgbVOE3oL8wuWF
 QMpqXWvKIRgk2ByMlSqPFiwLo0khhxU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-QqkYnRYXMbiExhKFR2VDmQ-1; Tue, 12 Nov 2019 04:15:46 -0500
Received: by mail-wr1-f70.google.com with SMTP id f8so11568412wrq.6
 for <qemu-trivial@nongnu.org>; Tue, 12 Nov 2019 01:15:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fo6RZMfIdlNBUYkZqR9uVjnc1J5hKM3Tz/Ts0c/kyt0=;
 b=Wz9aFoT8aTCZI9ADw7erk/QM6JM3kB7ADsYt4aoU+HmyGl83MQAlIds4NWj8wU9ex+
 OK3gSwNVbDth2CAZ8fzz6H+RD0xh6MrBvHfZ9xw7Pqu19klWfHua26+wM9vBaT+NTI5x
 /DwXBiUQHAEPGXZkDz8RIDQmh123CTw46QR1M33nLyPUU0EbNNh9SWbodTnqK5FMBPtq
 jNb3H0p53pjnzCf/kbPMz5j61whNl1o+ttT0jSzSo9jUV76Dur5yKuPyjUboU+dN2TqH
 zQuWPHwxB9TTqjkPM9Uh+hU/GtMZ+IHTFZy8EDhFzVf0T9WA4qEKCyDeQftOzrZmX7E0
 UCwg==
X-Gm-Message-State: APjAAAXUnnUkmUWDmvE0SYCYY1a2lDB9tojnLRFHiAJcNF4HLaj+9tzb
 FSCZ6jvsGZH2gTVV0yV7vOSdj5KW2kMmp33832vPqf8EpDpGtVrPEdUaGlVNYQ138rqKe5Kq8Vj
 GJ3kAGKvYJy+2Mak7RA==
X-Received: by 2002:adf:9506:: with SMTP id 6mr26103509wrs.274.1573550145048; 
 Tue, 12 Nov 2019 01:15:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqyI3tpXZhgDWr1vuXVYvXPmeHJW4/Wol11TpBb/x+9EBOXYEMXJGcBYAHXNGauNC9YGjebT3g==
X-Received: by 2002:adf:9506:: with SMTP id 6mr26103486wrs.274.1573550144682; 
 Tue, 12 Nov 2019 01:15:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:8c9d:1a6f:4730:367c?
 ([2001:b07:6468:f312:8c9d:1a6f:4730:367c])
 by smtp.gmail.com with ESMTPSA id p14sm20842897wrq.72.2019.11.12.01.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2019 01:15:44 -0800 (PST)
Subject: Re: [PATCH qemu] scripts: Detect git worktrees for get_maintainer.pl
 --git
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <20191112034532.69079-1-aik@ozlabs.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <049148d5-0a35-e8bf-4a8b-714a3f1fb9d1@redhat.com>
Date: Tue, 12 Nov 2019 10:15:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191112034532.69079-1-aik@ozlabs.ru>
Content-Language: en-US
X-MC-Unique: QqkYnRYXMbiExhKFR2VDmQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
X-List-Received-Date: Tue, 12 Nov 2019 09:15:58 -0000

On 12/11/19 04:45, Alexey Kardashevskiy wrote:
> Recent git versions support worktrees where .git is not a directory but
> a file with a path to the .git repository; however the get_maintainer.pl
> script only recognises the .git directory, let's fix it.
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  scripts/get_maintainer.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index 71415e3c7061..27991eb1cfb4 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -81,7 +81,7 @@ my %VCS_cmds;
> =20
>  my %VCS_cmds_git =3D (
>      "execute_cmd" =3D> \&git_execute_cmd,
> -    "available" =3D> '(which("git") ne "") && (-d ".git")',
> +    "available" =3D> '(which("git") ne "") && (-e ".git")',
>      "find_signers_cmd" =3D>
>  =09"git log --no-color --follow --since=3D\$email_git_since " .
>  =09    '--format=3D"GitCommit: %H%n' .
>=20

Queued, thanks.

Paolo


