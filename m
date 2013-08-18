Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VB9En-0006q3-Fy
	for mharc-qemu-trivial@gnu.org; Sun, 18 Aug 2013 16:06:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1VB9Eg-0006hT-MG
	for qemu-trivial@nongnu.org; Sun, 18 Aug 2013 16:06:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1VB9Eb-00018j-0l
	for qemu-trivial@nongnu.org; Sun, 18 Aug 2013 16:06:02 -0400
Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12]:53679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1VB9ED-00011a-Bs; Sun, 18 Aug 2013 16:05:33 -0400
Received: from [192.168.0.32] (unknown [82.227.227.196])
	by smtp3-g21.free.fr (Postfix) with ESMTP id BD658A626D;
	Sun, 18 Aug 2013 22:05:18 +0200 (CEST)
Message-ID: <521128FC.10509@reactos.org>
Date: Sun, 18 Aug 2013 22:05:16 +0200
From: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1376473744-18435-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1376473744-18435-1-git-send-email-hpoussin@reactos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:e0c:1:1599::12
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, av1474@comtv.ru,
	qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.6] adlib: sort offsets in portio
	registration
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
X-List-Received-Date: Sun, 18 Aug 2013 20:06:08 -0000

Ping.

CCing stable too.

Herv=C3=A9

Herv=C3=A9 Poussineau a =C3=A9crit :
> This fixes the following assert when -device adlib is used:
> ioport.c:240: portio_list_add: Assertion `pio->offset >=3D off_last' fa=
iled.
>=20
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> ---
>  hw/audio/adlib.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/audio/adlib.c b/hw/audio/adlib.c
> index 0421d47..db4a953 100644
> --- a/hw/audio/adlib.c
> +++ b/hw/audio/adlib.c
> @@ -284,9 +284,9 @@ static void Adlib_fini (AdlibState *s)
>  }
> =20
>  static MemoryRegionPortio adlib_portio_list[] =3D {
> -    { 0x388, 4, 1, .read =3D adlib_read, .write =3D adlib_write, },
>      { 0, 4, 1, .read =3D adlib_read, .write =3D adlib_write, },
>      { 0, 2, 1, .read =3D adlib_read, .write =3D adlib_write, },
> +    { 0x388, 4, 1, .read =3D adlib_read, .write =3D adlib_write, },
>      PORTIO_END_OF_LIST(),
>  };
> =20


