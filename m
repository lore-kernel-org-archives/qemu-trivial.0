Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VB9Ex-00078q-Ni
	for mharc-qemu-trivial@gnu.org; Sun, 18 Aug 2013 16:06:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1VB9Eq-0006vg-K9
	for qemu-trivial@nongnu.org; Sun, 18 Aug 2013 16:06:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1VB9Ek-0001B7-UG
	for qemu-trivial@nongnu.org; Sun, 18 Aug 2013 16:06:12 -0400
Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12]:55035)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1VB9EY-000184-Ty; Sun, 18 Aug 2013 16:05:55 -0400
Received: from [192.168.0.32] (unknown [82.227.227.196])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 6907FA626A;
	Sun, 18 Aug 2013 22:05:49 +0200 (CEST)
Message-ID: <5211291B.8020105@reactos.org>
Date: Sun, 18 Aug 2013 22:05:47 +0200
From: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1376390314-17544-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1376390314-17544-1-git-send-email-hpoussin@reactos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:e0c:1:1599::12
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.6] isa: fix documentation of
	isa_register_portio_list
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
X-List-Received-Date: Sun, 18 Aug 2013 20:06:18 -0000

Ping.

Herv=C3=A9 Poussineau a =C3=A9crit :
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> ---
>  include/hw/isa/isa.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> index 495bcf3..fa45a5b 100644
> --- a/include/hw/isa/isa.h
> +++ b/include/hw/isa/isa.h
> @@ -78,7 +78,7 @@ void isa_register_ioport(ISADevice *dev, MemoryRegion=
 *io, uint16_t start);
>   * @dev: the ISADevice against which these are registered; may be NULL=
.
>   * @start: the base I/O port against which the portio->offset is appli=
ed.
>   * @portio: the ports, sorted by offset.
> - * @opaque: passed into the old_portio callbacks.
> + * @opaque: passed into the portio callbacks.
>   * @name: passed into memory_region_init_io.
>   */
>  void isa_register_portio_list(ISADevice *dev, uint16_t start,


