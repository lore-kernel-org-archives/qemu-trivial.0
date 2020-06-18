Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlp1L-00030H-Sz
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2020 03:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jlp1J-0002yX-W2
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 03:31:34 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55101
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jlp1I-0007jA-FN
 for qemu-trivial@nongnu.org; Thu, 18 Jun 2020 03:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592465491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o3pEsWHg0HprWxm8udfht7MhGDnLJaTUpdy+k+6YDAA=;
 b=SaYfMkBk3YlS2gK4IcFfJjadOoAXC9AtmrnD3nKrWDayo2aFchpfku5KuRAVMZIMGJZT7x
 2VSBjnzj8WsIQfEdkbY8Sx6sRkLGNMiCSj+VPhL34cSRqlSfCvuZDNDE1Su0CkBCxMg5VJ
 tG5PdckxYDHUVCUau6pbiMCu7mxvN1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-2K7sxmAKPf-fBlPrC0R9Yw-1; Thu, 18 Jun 2020 03:31:27 -0400
X-MC-Unique: 2K7sxmAKPf-fBlPrC0R9Yw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A2758005AD;
 Thu, 18 Jun 2020 07:31:26 +0000 (UTC)
Received: from localhost (ovpn-113-212.ams2.redhat.com [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09BFA19931;
 Thu, 18 Jun 2020 07:31:25 +0000 (UTC)
Date: Thu, 18 Jun 2020 08:31:24 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH 2/2] scripts/tracetool: Add plainlog backend
Message-ID: <20200618073124.GA1956319@stefanha-x1.localdomain>
References: <20200617134505.9D06E7482D3@zero.eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <20200617134505.9D06E7482D3@zero.eik.bme.hu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 00:57:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Thu, 18 Jun 2020 07:31:34 -0000

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 03:36:29PM +0200, BALATON Zoltan wrote:
> Add a backend that is the same as the log backend but omits the
> process id and timestamp so logs are easier to read and diff-able.
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  scripts/tracetool/backend/plainlog.py | 48 +++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 scripts/tracetool/backend/plainlog.py
>=20
> diff --git a/scripts/tracetool/backend/plainlog.py b/scripts/tracetool/ba=
ckend/plainlog.py
> new file mode 100644
> index 0000000000..40bbfa6d76
> --- /dev/null
> +++ b/scripts/tracetool/backend/plainlog.py
> @@ -0,0 +1,48 @@
> +# -*- coding: utf-8 -*-
> +
> +"""
> +Stderr built-in backend, plain log without proc ID and time.
> +"""
> +
> +__author__     =3D "Llu????s Vilanova <vilanova@ac.upc.edu>"
> +__copyright__  =3D "Copyright 2012-2017, Llu????s Vilanova <vilanova@ac.=
upc.edu>"

There is a Unicode issue here, Llu=EDs' name is not printed correctly.

> +__license__    =3D "GPL version 2 or (at your option) any later version"
> +
> +__maintainer__ =3D "Stefan Hajnoczi"
> +__email__      =3D "stefanha@linux.vnet.ibm.com"
> +
> +
> +from tracetool import out
> +
> +
> +PUBLIC =3D True
> +
> +
> +def generate_h_begin(events, group):
> +    out('#include "qemu/log-for-trace.h"',
> +        '')
> +
> +
> +def generate_h(event, group):
> +    argnames =3D ", ".join(event.args.names())
> +    if len(event.args) > 0:
> +        argnames =3D ", " + argnames
> +
> +    if "vcpu" in event.properties:
> +        # already checked on the generic format code
> +        cond =3D "true"
> +    else:
> +        cond =3D "trace_event_get_state(%s)" % ("TRACE_" + event.name.up=
per())
> +
> +    out('    if (%(cond)s && qemu_loglevel_mask(LOG_TRACE)) {',
> +        '        qemu_log("%(name)s " %(fmt)s "\\n" %(argnames)s);',
> +        '    }',
> +        cond=3Dcond,
> +        name=3Devent.name,
> +        fmt=3Devent.fmt.rstrip("\n"),
> +        argnames=3Dargnames)

It is not necessary to introduce a new backend. There could be an option
that controls whether or not the timestamp/tid is printed. For example,
-trace timestamp=3Doff or maybe the timestmap/tid can be integrated into
qemu_log() itself so that it's used more consistently and a -d timestamp
option enables it.

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7rGEwACgkQnKSrs4Gr
c8gV3Qf9HZDT+7ZYUwYFkF24dw8ghpc8l6q+BV7pA0cbNTRxLOc/I4FmNrXAV8dK
PZErfcT1hv1RyD0aew37+P9MS1Htul+Al2+e0G5E+b4eDegyyxx45PqjmXXllq2q
40rnWGJWHEYX47EBwvGrs9BrzTK4gMGPrr4ouOQws2a/ar69GoX02+ns9TC5amfL
p0jWbQR7eaIkFurI3sjP0c0ORykx1m0TZC6ztgJJSWu704w5h7/Jd0FzR0vET4Jm
fo+M04uH0nhhqYDWqTCgUas2tj5RxEE+c3k06fXzKB0+4zfSL5+3+0D8ORWeN9um
bjSEjRpsd5n7G3x7GD91SdXHgKUTVw==
=qqIp
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--


