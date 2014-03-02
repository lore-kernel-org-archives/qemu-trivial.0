Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKFF6-0003xH-2p
	for mharc-qemu-trivial@gnu.org; Sun, 02 Mar 2014 17:52:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WKFEy-0003oZ-Ti
	for qemu-trivial@nongnu.org; Sun, 02 Mar 2014 17:52:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WKFEt-0000CK-LT
	for qemu-trivial@nongnu.org; Sun, 02 Mar 2014 17:52:12 -0500
Received: from cantor2.suse.de ([195.135.220.15]:55839 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WKFEj-0000AC-2r; Sun, 02 Mar 2014 17:51:57 -0500
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 4797775011;
	Sun,  2 Mar 2014 22:51:56 +0000 (UTC)
Message-ID: <5313B60A.8010303@suse.de>
Date: Sun, 02 Mar 2014 23:51:54 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1393458706-24883-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1393458706-24883-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] qjson.h: Remove spurious GCC_FMT_ATTR
 markup from qobject_from_json() declaration
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Mar 2014 22:52:18 -0000

Am 27.02.2014 00:51, schrieb Peter Maydell:
> The function qobject_from_json() doesn't actually allow its
> argument to be a format string -- it passes a NULL va_list*
> to qobject_from_jsonv(), and the parser code will then never
> actually intepret %-escape sequences (it tests whether the

"interpret"

> va_list pointer is NULL and will stop with a parse error).
>=20
> The spurious attribute markup causes clang warnings in some
> of the test cases where we programmatically construct JSON
> to feed to qobject_from_json():
>=20
>  tests/test-qmp-input-visitor.c:76:35: warning: format string is not a
>  string literal (potentially insecure) [-Wformat-security]
>     data->obj =3D qobject_from_json(json_string);
>                                   ^~~~~~~~~~~
>=20
> Remove the incorrect attribute.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>

Otherwise

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

