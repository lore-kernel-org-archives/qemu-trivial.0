Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iWoXR-0004TP-Ui
	for mharc-qemu-trivial@gnu.org; Mon, 18 Nov 2019 16:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37487)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iWoXP-0004SQ-48
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:26:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iWoXM-0003yI-KL
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:26:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39369
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iWoXM-0003xf-GD
 for qemu-trivial@nongnu.org; Mon, 18 Nov 2019 16:26:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574112379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8NcNk4FyttkPtdwzKRuivMwBlpJ7WnN+eDHfZ7LSUY=;
 b=DoIXLxvHrxtTyIy9hzlfRuNvuKk0y+8sUZdPjidtA0ZlBcmzGLoW4hJzM5hSXiRxO+8BzQ
 cTWAT3w7FccZ7mSB0TOPoHSxvF5jyn59gJObFMwxY3cqP3tDKasdQax0gqmCOxLL0smQTm
 ub2d9srypOrsyJKOZ/qbTr1kad+1/3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-s0DmMwWrOPiw8pHPpmPqKg-1; Mon, 18 Nov 2019 16:26:18 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26F241800D7D;
 Mon, 18 Nov 2019 21:26:17 +0000 (UTC)
Received: from [10.3.116.221] (ovpn-116-221.phx2.redhat.com [10.3.116.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C69C100EA05;
 Mon, 18 Nov 2019 21:26:10 +0000 (UTC)
Subject: Re: [PATCH-for-4.2 v3 3/3] trace: Forbid dynamic field width in event
 format
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, qemu-trivial@nongnu.org
References: <20191118210458.11959-1-philmd@redhat.com>
 <20191118210458.11959-4-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c12c9178-6d40-17c5-7572-090cecbcc7a4@redhat.com>
Date: Mon, 18 Nov 2019 15:26:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191118210458.11959-4-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: s0DmMwWrOPiw8pHPpmPqKg-1
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
X-List-Received-Date: Mon, 18 Nov 2019 21:26:24 -0000

On 11/18/19 3:04 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Since not all trace backends support dynamic field width in
> format (dtrace via stap does not), forbid them.
>=20
> Add a check to refuse field width in new formats:
>=20
>    $ make
>    [...]
>      GEN     hw/block/trace.h
>    Traceback (most recent call last):
>      File "scripts/tracetool.py", line 152, in <module>
>        main(sys.argv)
>      File "scripts/tracetool.py", line 143, in main
>        events.extend(tracetool.read_events(fh, arg))
>      File "scripts/tracetool/__init__.py", line 371, in read_events
>        event =3D Event.build(line)
>      File "scripts/tracetool/__init__.py", line 285, in build
>        raise ValueError("Event format must not contain field width '%*'")
>    ValueError: Error at hw/block/trace-events:11: Event format must not c=
ontain field width '%*'
>=20
> Reported-by: Eric Blake <eblake@redhat.com>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1844817
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

> +++ b/docs/devel/tracing.txt
> @@ -113,7 +113,8 @@ Format strings should reflect the types defined in th=
e trace event.  Take
>   special care to use PRId64 and PRIu64 for int64_t and uint64_t types,
>   respectively.  This ensures portability between 32- and 64-bit platform=
s.
>   Format strings must not end with a newline character.  It is the respon=
sibility
> -of backends to adapt line ending for proper logging.
> +of backends to adapt line ending for proper logging.  Format strings mus=
t not
> +use numeric field width dynamic precision (SystemTap does not support th=
em).

Reads awkwardly - a dynamic precision is not numeric in the format=20
string (but '*' instead).  Better might be:

Format strings must not use dynamic field width or precision ('*'), as=20
at least SystemTap does not support them.

Or even:

Format strings may use numeric field width or precision, but must not=20
use dynamic forms ('*') as at least SystemTap does not support that.

>  =20
>   Each event declaration will start with the event name, then its argumen=
ts,
>   finally a format string for pretty-printing. For example:
> diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.p=
y
> index 44c118bc2a..ec7fe9fa4a 100644
> --- a/scripts/tracetool/__init__.py
> +++ b/scripts/tracetool/__init__.py
> @@ -206,6 +206,7 @@ class Event(object):
>                         "\s*"
>                         "(?:(?:(?P<fmt_trans>\".+),)?\s*(?P<fmt>\".+))?"
>                         "\s*")
> +    _DFWRE =3D re.compile(r"%[\d\.\- +#']*\*") # dynamic width precision

The comment is slightly off - this catches both dynamic field width (any=20
'*' before '.') and dynamic precision (any '*' after '.'), maybe the fix=20
is just s/width/width or/

>  =20
>       _VALID_PROPS =3D set(["disable", "tcg", "tcg-trans", "tcg-exec", "v=
cpu"])
>  =20
> @@ -280,6 +281,8 @@ class Event(object):
>           if fmt.endswith(r'\n"'):
>               raise ValueError("Event format must not end with a newline =
"
>                                "character")
> +        if Event._DFWRE.search(fmt):
> +            raise ValueError("Event format must not contain field width =
'%*'")

and I don't know if you want to tweak the error message, maybe:
  Event format must not use dynamic '*'

If we're trying to get stuff in 4.2-rc2, patch 1 and 2 are actual bug=20
fixes and deserve to go in; patch 3 is nice-to-have but doesn't affect=20
the build if it is omitted (as there are no other offenders left), so=20
slipping it into 5.0 for a v4 to clean it up slightly doesn't hurt.  I=20
don't know who would send the pull request, though, and slipping 1 and 2=20
into -rc3 just because of 3 is not ideal.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


