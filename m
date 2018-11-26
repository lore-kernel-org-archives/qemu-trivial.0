Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRBOu-0003Mm-6J
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 02:33:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gRBOq-0003Lz-6K
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 02:33:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gRBOp-0002iY-Ib
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 02:33:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46526)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gRBOk-0002Q7-P2; Mon, 26 Nov 2018 02:33:38 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F7AA8535D;
	Mon, 26 Nov 2018 07:33:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 731675D776;
	Mon, 26 Nov 2018 07:33:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 92F175DEFE; Mon, 26 Nov 2018 08:33:31 +0100 (CET)
Date: Mon, 26 Nov 2018 08:33:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181126073331.ankv2nyifmnuagra@sirius.home.kraxel.org>
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-18-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181125205000.10324-18-philmd@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 26 Nov 2018 07:33:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-3.1 17/25] MAINTAINERS: Add a missing
 entry to SPICE
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
X-List-Received-Date: Mon, 26 Nov 2018 07:33:44 -0000

On Sun, Nov 25, 2018 at 09:49:52PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2795135a09..28e5038c73 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1736,6 +1736,7 @@ F: ui/spice-*.c
>  F: audio/spiceaudio.c
>  F: hw/display/qxl*
>  F: qapi/ui.json
> +F: docs/spice-port-fqdn.txt

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

