Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT6nh-0001ZT-Mt
	for mharc-qemu-trivial@gnu.org; Fri, 08 Nov 2019 11:07:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58052)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iT6nf-0001Y5-8p
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 11:07:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iT6ne-0004wW-7X
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 11:07:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44444
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iT6ne-0004wH-3j
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 11:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573229269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kdA4X9Z8UPZwZPYLbSBiDcWzZfCxAMjEEmG1ckGuYOo=;
 b=LH9hBdwMiGq9iaBPgVuI2A0TNbnIvoiDhSPHLJenUJjnxFXCF2/dDK+qAu/bmuyrzuAXOl
 KpYkx+5ev833T0i/1ykRtfVIs3/XlS8iD+1nDQoZLjWzIzSAumgf3yyQlfhl+vgKzzZWyb
 67ZT5LslrRDT7BDRATzsF4rAiFN0WvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-dq9nGt3-P4C4DQNrX6O6eA-1; Fri, 08 Nov 2019 11:07:46 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33A8E107ACC4;
 Fri,  8 Nov 2019 16:07:45 +0000 (UTC)
Received: from [10.3.117.38] (ovpn-117-38.phx2.redhat.com [10.3.117.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABF525DA7F;
 Fri,  8 Nov 2019 16:07:38 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] trace: Forbid dynamic field width in event format
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-trivial@nongnu.org
References: <20191108144042.30245-1-philmd@redhat.com>
 <20191108144042.30245-4-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <191fbe18-73b2-4d22-5540-8775688166a8@redhat.com>
Date: Fri, 8 Nov 2019 10:07:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191108144042.30245-4-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: dq9nGt3-P4C4DQNrX6O6eA-1
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
X-List-Received-Date: Fri, 08 Nov 2019 16:07:52 -0000

On 11/8/19 8:40 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Since not all trace backends support dynamic field width in
> format (dtrace via stap does not), forbid them.
>=20
> Add a check to refuse field width in new formats:
>=20

> +++ b/scripts/tracetool/__init__.py
> @@ -206,6 +206,7 @@ class Event(object):
>                         "\s*"
>                         "(?:(?:(?P<fmt_trans>\".+),)?\s*(?P<fmt>\".+))?"
>                         "\s*")
> +    _DFWRE =3D re.compile(".*(%0?\*).*")

The use of leading and trailing .* is pointless if the RE itself is used=20
unanchored and where you only care if the () matched.

This doesn't catch all valid uses of * in a printf format.  Better might=20
be something like:

_DFWRE =3D re.compile("%[\d\.\- +#']*\*")

which matches only if there is a %, any number of characters that can=20
form a printf flag, as well as a numeric field width but dynamic precision.


> +        if Event._DFWRE.match(fmt):
> +            raise ValueError("Event format must not contain field width =
'%*'")
>  =20
>           if len(fmt_trans) > 0:
>               fmt =3D [fmt_trans, fmt]
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


