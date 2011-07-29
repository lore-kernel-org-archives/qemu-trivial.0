Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QmoD2-0005nO-Vs
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jul 2011 10:38:40 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1QmoCz-0005mD-4O
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2011 10:38:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1QmoCu-0006dQ-RQ
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2011 10:38:37 -0400
Received: from e3.ny.us.ibm.com ([32.97.182.143]:53027)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>)
	id 1QmoCu-0006aO-Oo; Fri, 29 Jul 2011 10:38:32 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e3.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id p6TEENVg023274;
	Fri, 29 Jul 2011 10:14:23 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p6TEc7GK164406; Fri, 29 Jul 2011 10:38:07 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	p6TEc6dX027446; Fri, 29 Jul 2011 10:38:07 -0400
Received: from [9.65.49.9] (sig-9-65-49-9.mts.ibm.com [9.65.49.9])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p6TEc5Hr027420; Fri, 29 Jul 2011 10:38:06 -0400
Message-ID: <4E32C5CD.9070001@us.ibm.com>
Date: Fri, 29 Jul 2011 09:38:05 -0500
From: Anthony Liguori <aliguori@us.ibm.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <1311690791.7898.6.camel@d941e-10>
In-Reply-To: <1311690791.7898.6.camel@d941e-10>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by e3.ny.us.ibm.com id
	p6TEENVg023274
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 32.97.182.143
Cc: qemu-trivial@nongnu.org, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix a compilation error in
	xen-mapcache.c
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
X-List-Received-Date: Fri, 29 Jul 2011 14:38:38 -0000

On 07/26/2011 09:33 AM, Stefan Berger wrote:
> This patch fixes a compilation error in xen-mapcache.c .
>
> /home/stefanb/qemu/qemu-git/xen-mapcache.c: In function =E2=80=98xen_ra=
m_addr_from_mapcache=E2=80=99:
> /home/stefanb/qemu/qemu-git/xen-mapcache.c:240:42: error: variable =E2=80=
=98pentry=E2=80=99 set but not used [-Werror=3Dunused-but-set-variable]
> cc1: all warnings being treated as errors
>
> Signed-off-by: Stefan Berger<stefanb@linux.vnet.ibm.com>

Applied.  Thanks.

Regards,

Anthony Liguori

>
> ---
>   xen-mapcache.c |    3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> Index: qemu-git/xen-mapcache.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- qemu-git.orig/xen-mapcache.c
> +++ qemu-git/xen-mapcache.c
> @@ -237,7 +237,7 @@ uint8_t *xen_map_cache(target_phys_addr_
>
>   ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
>   {
> -    MapCacheEntry *entry =3D NULL, *pentry =3D NULL;
> +    MapCacheEntry *entry =3D NULL;
>       MapCacheRev *reventry;
>       target_phys_addr_t paddr_index;
>       target_phys_addr_t size;
> @@ -263,7 +263,6 @@ ram_addr_t xen_ram_addr_from_mapcache(vo
>
>       entry =3D&mapcache->entry[paddr_index % mapcache->nr_buckets];
>       while (entry&&  (entry->paddr_index !=3D paddr_index || entry->si=
ze !=3D size)) {
> -        pentry =3D entry;
>           entry =3D entry->next;
>       }
>       if (!entry) {
>
>
>


