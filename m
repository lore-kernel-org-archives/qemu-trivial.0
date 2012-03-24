Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SBaHS-0002ye-0K
	for mharc-qemu-trivial@gnu.org; Sat, 24 Mar 2012 19:21:54 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SBaHP-0002op-2n
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2012 19:21:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SBaHN-0003WL-Ev
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2012 19:21:50 -0400
Received: from cantor2.suse.de ([195.135.220.15]:57092 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SBaHJ-0003W1-Vb; Sat, 24 Mar 2012 19:21:46 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 6E9F68FA98;
	Sun, 25 Mar 2012 00:21:43 +0100 (CET)
Message-ID: <4F6E5706.3020604@suse.de>
Date: Sun, 25 Mar 2012 00:21:42 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120215 Thunderbird/10.0.2
MIME-Version: 1.0
To: =?UTF-8?B?SGVydsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
References: <1332629775-15200-1-git-send-email-hpoussin@reactos.org>
In-Reply-To: <1332629775-15200-1-git-send-email-hpoussin@reactos.org>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qxl: fix compilation
	failure on 32 bit hosts
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
X-List-Received-Date: Sat, 24 Mar 2012 23:21:52 -0000

Am 24.03.2012 23:56, schrieb Herv=C3=A9 Poussineau:
>=20
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

Cf. http://patchwork.ozlabs.org/patch/148493/ - looks identical.

Andreas

> ---
>  trace-events |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/trace-events b/trace-events
> index 70f059d..8fa1c1c 100644
> --- a/trace-events
> +++ b/trace-events
> @@ -726,7 +726,7 @@ ppm_save(const char *filename, void *display_surfac=
e) "%s surface=3D%p"
>  # hw/qxl.c
>  disable qxl_interface_set_mm_time(int qid, uint32_t mm_time) "%d %d"
>  disable qxl_io_write_vga(int qid, const char *mode, uint32_t addr, uin=
t32_t val) "%d %s addr=3D%u val=3D%u"
> -qxl_create_guest_primary(int qid, uint32_t width, uint32_t height, uin=
t64_t mem, uint32_t format, uint32_t position) "%d %dx%d mem=3D%lx %d,%d"
> +qxl_create_guest_primary(int qid, uint32_t width, uint32_t height, uin=
t64_t mem, uint32_t format, uint32_t position) "%d %dx%d mem=3D%"PRIx64" =
%d,%d"
>  qxl_create_guest_primary_rest(int qid, int32_t stride, uint32_t type, =
uint32_t flags) "%d %d,%d,%d"
>  qxl_destroy_primary(int qid) "%d"
>  qxl_enter_vga_mode(int qid) "%d"

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

