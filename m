Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iXrfU-0004tR-Dh
	for mharc-qemu-trivial@gnu.org; Thu, 21 Nov 2019 13:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59713)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iXrfS-0004sK-5N
 for qemu-trivial@nongnu.org; Thu, 21 Nov 2019 13:59:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iXrfR-0001Pm-0V
 for qemu-trivial@nongnu.org; Thu, 21 Nov 2019 13:59:02 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25673
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iXrfQ-0001PG-TG
 for qemu-trivial@nongnu.org; Thu, 21 Nov 2019 13:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574362739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uVnBXCN/3xd3yFBQ/JitQNjTmDQhaa8qWXg/izJGYGI=;
 b=QhIF9GQVIoejvo5GbmpJXOb0Xc39v4oHSBoP8eILUU0CShpitmppD/FTEdnLe4q62TiwHw
 g1nAnsWNiTUGZnpcYopuHLbbhC8+agM+brhlmj7J1d094gB+SC72QEa21CbHyvAosvRnQ4
 Iyb9fEexuZCSqz4NBZkkogaapNcBjxQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-E5RLKUWeNj6wbSW1Ufbw_g-1; Thu, 21 Nov 2019 13:58:58 -0500
Received: by mail-wr1-f70.google.com with SMTP id w4so2555441wro.10
 for <qemu-trivial@nongnu.org>; Thu, 21 Nov 2019 10:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DoxUbj1GEYUNvhJw/EScqAg0fyp35HPnwlP7AoZUp5I=;
 b=JvzW1A8umgavoSRR/2EmByxZaCjVEtE2teqHwuqpo3bvqhJSRq4I6TvxI//0R0UaF/
 oJ18Osk+3+kPEy+fdyRyrxQdQJIA0zfWtcy5bchoHZuFyw7qp9Z6S2k/m7kvN1aDemE+
 lm6LzipkAei29EgjciVE4PDXDvOKKl8tIOtVa3M/2DWxBR9ndbGsVHAq06PkxE8UB6r3
 JVKRLL2SMrtMRf3N8a52dUrPe7KuhQNs9AqbSPAYXHVrK18s3Qz/9eXypmM2RPCX9cO2
 gyRvP32sx2+pGbXl1gYAmAMZLV2RVmLnvlW49SPQHjBL2IA3CliyugCvEFvX8xOOPIif
 Xc3g==
X-Gm-Message-State: APjAAAX+wbvVZT3cqX8LLQPgtpyi9po7KttBNwpu19xYhJmYjUiGPiEC
 PrZonGkh+V2AM2xdVWsb2hHGhyYQBjX+tdDwqIlklIxOfVW2zgv3NUkLle4A3scMNKJjJ6U/mLk
 eqqKZHdZXHHLveM7n2A==
X-Received: by 2002:a5d:4142:: with SMTP id c2mr13014869wrq.60.1574362737037; 
 Thu, 21 Nov 2019 10:58:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6eODKBaMCm9/BBCJfW3h2aedJveFmNXOnG0nRpLGgPoK1cPMJI3vsq0aycFTyOhyBZiDe0Q==
X-Received: by 2002:a5d:4142:: with SMTP id c2mr13014844wrq.60.1574362736824; 
 Thu, 21 Nov 2019 10:58:56 -0800 (PST)
Received: from [192.168.43.238] (92.red-95-127-154.staticip.rima-tde.net.
 [95.127.154.92])
 by smtp.gmail.com with ESMTPSA id b17sm4559038wru.36.2019.11.21.10.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 10:58:56 -0800 (PST)
Subject: Re: [PATCH-for-4.2?] vmstate-static-checker: Fix for current python
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, quintela@redhat.com, ehabkost@redhat.com,
 crosa@redhat.com
References: <20191121185303.51685-1-dgilbert@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <19b311c5-d4e2-62e2-8597-07e5419c3688@redhat.com>
Date: Thu, 21 Nov 2019 19:58:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191121185303.51685-1-dgilbert@redhat.com>
Content-Language: en-US
X-MC-Unique: E5RLKUWeNj6wbSW1Ufbw_g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Thu, 21 Nov 2019 18:59:03 -0000

On 11/21/19 7:53 PM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Python 3.7.5 on f31 doesn't seem to like the old type=3Dfile syntax
> on argparse.

Looks 4.2 worth to me.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   scripts/vmstate-static-checker.py | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/vmstate-static-checker.py b/scripts/vmstate-static-c=
hecker.py
> index 21dbdccf3e..9f912dd870 100755
> --- a/scripts/vmstate-static-checker.py
> +++ b/scripts/vmstate-static-checker.py
> @@ -379,9 +379,11 @@ def main():
>       help_text =3D "Parse JSON-formatted vmstate dumps from QEMU in file=
s SRC and DEST.  Checks whether migration from SRC to DEST QEMU versions wo=
uld break based on the VMSTATE information contained within the JSON output=
s.  The JSON output is created from a QEMU invocation with the -dump-vmstat=
e parameter and a filename argument to it.  Other parameters to QEMU do not=
 matter, except the -M (machine type) parameter."
>  =20
>       parser =3D argparse.ArgumentParser(description=3Dhelp_text)
> -    parser.add_argument('-s', '--src', type=3Dfile, required=3DTrue,
> +    parser.add_argument('-s', '--src', type=3Dargparse.FileType('r'),
> +                        required=3DTrue,
>                           help=3D'json dump from src qemu')
> -    parser.add_argument('-d', '--dest', type=3Dfile, required=3DTrue,
> +    parser.add_argument('-d', '--dest', type=3Dargparse.FileType('r'),
> +                        required=3DTrue,
>                           help=3D'json dump from dest qemu')
>       parser.add_argument('--reverse', required=3DFalse, default=3DFalse,
>                           action=3D'store_true',
>=20


