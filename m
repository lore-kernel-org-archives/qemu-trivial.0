Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqwZ9-0006SQ-CU
	for mharc-qemu-trivial@gnu.org; Thu, 23 Mar 2017 02:49:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cqwZ4-0006OE-A0
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 02:49:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cqwYz-0008Qp-3k
	for qemu-trivial@nongnu.org; Thu, 23 Mar 2017 02:49:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53794)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cqwYu-0008QK-Pp; Thu, 23 Mar 2017 02:49:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72D9A81F01;
	Thu, 23 Mar 2017 06:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 72D9A81F01
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 72D9A81F01
Received: from blackfin.pond.sub.org (ovpn-116-26.ams2.redhat.com
	[10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B7287F395;
	Thu, 23 Mar 2017 06:49:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DB6531138645; Thu, 23 Mar 2017 07:49:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>,
	Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <20170322204844.446-1-f4bug@amsat.org>
	<20170322204844.446-2-f4bug@amsat.org>
Date: Thu, 23 Mar 2017 07:49:27 +0100
In-Reply-To: <20170322204844.446-2-f4bug@amsat.org> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed,
	22 Mar 2017 17:48:42 -0300")
Message-ID: <87y3vw1o94.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 23 Mar 2017 06:49:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RESEND 1/3] usb-ccid: make
 ccid_write_data_block() cope with null buffers
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Mar 2017 06:49:45 -0000

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> static code analyzer complain:
>
> hw/usb/dev-smartcard-reader.c:816:5: warning: Null pointer passed as an a=
rgument to a 'nonnull' parameter
>     memcpy(p->abData, data, len);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/usb/dev-smartcard-reader.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
> index 757b8b3f5a..c38a4e5886 100644
> --- a/hw/usb/dev-smartcard-reader.c
> +++ b/hw/usb/dev-smartcard-reader.c
> @@ -799,8 +799,14 @@ static void ccid_write_parameters(USBCCIDState *s, C=
CID_Header *recv)
>  static void ccid_write_data_block(USBCCIDState *s, uint8_t slot, uint8_t=
 seq,
>                                    const uint8_t *data, uint32_t len)
>  {
> -    CCID_DataBlock *p =3D ccid_reserve_recv_buf(s, sizeof(*p) + len);
> +    CCID_DataBlock *p;
>=20=20
> +    if (len =3D=3D 0) {
> +        return;

Correct only if messages without data always have the same meaning as no
message.  Gerd?

> +    }
> +    g_assert(data !=3D NULL);

The assertion feels like noise to me.

> +
> +    p =3D ccid_reserve_recv_buf(s, sizeof(*p) + len);
>      if (p =3D=3D NULL) {
>          return;
>      }


