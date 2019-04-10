Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEEgC-0006sl-Er
	for mharc-qemu-trivial@gnu.org; Wed, 10 Apr 2019 10:58:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hEEg9-0006qj-OZ
	for qemu-trivial@nongnu.org; Wed, 10 Apr 2019 10:58:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hEEg7-0001x9-Cy
	for qemu-trivial@nongnu.org; Wed, 10 Apr 2019 10:58:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53470)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1hEEfz-0001qb-At; Wed, 10 Apr 2019 10:58:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7447B30923D8;
	Wed, 10 Apr 2019 14:58:04 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-133.rdu2.redhat.com
	[10.10.121.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 983B16013A;
	Wed, 10 Apr 2019 14:58:03 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20190410045707.16923-1-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <e52ff725-a297-5b3c-af7a-1df30baf464f@redhat.com>
Date: Wed, 10 Apr 2019 16:58:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190410045707.16923-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 10 Apr 2019 14:58:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-4.1] roms: Correct the
 EDK2_BASETOOLS_OPTFLAGS variable description
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
X-List-Received-Date: Wed, 10 Apr 2019 14:58:22 -0000

On 04/10/19 06:57, Philippe Mathieu-Daud=C3=A9 wrote:
> In commit 1cab464136b4 we incorrectly described the
> EDK2_BASETOOLS_OPTFLAGS can pass CPPFLAGS and CFLAGS
> options to the EDK2 build tools, but it only expands
> the CFLAGS (not to the CPPFLAGS).
> Update the description to be more accurate.
>=20
> Reported-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  roms/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/roms/Makefile b/roms/Makefile
> index 1ff78b63bb3..d7fd6025e7c 100644
> --- a/roms/Makefile
> +++ b/roms/Makefile
> @@ -120,8 +120,8 @@ build-efi-roms: build-pxe-roms
>  		$(patsubst %,bin-i386-efi/%.efidrv,$(pxerom_targets)) \
>  		$(patsubst %,bin-x86_64-efi/%.efidrv,$(pxerom_targets))
> =20
> -# Build scripts can pass compiler/linker flags to the EDK2 build tools
> -# via the EDK2_BASETOOLS_OPTFLAGS (CPPFLAGS and CFLAGS) and
> +# Build scripts can pass compiler/linker flags to the EDK2
> +# build  tools via the EDK2_BASETOOLS_OPTFLAGS (CFLAGS) and
>  # EDK2_BASETOOLS_LDFLAGS (LDFLAGS) environment variables.
>  #
>  # Example:
>=20

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Please noone submit a pull request with this patch (for 4.1) until my
edk2 bundling series is merged; as this one will likely introduce
another contextual conflict, and I'd *really* like to avoid another
rebase on my end, due to such an issue.

Thanks!
Laszlo

