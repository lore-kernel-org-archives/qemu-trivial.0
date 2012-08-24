Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4wp8-00035h-MO
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 12:33:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T4wp6-0002zw-Ck
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 12:33:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1T4wp5-0004Qp-4B
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 12:33:28 -0400
Received: from cantor2.suse.de ([195.135.220.15]:44779 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1T4wox-0004Ph-Fu; Fri, 24 Aug 2012 12:33:19 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id D65FEA3EBF;
	Fri, 24 Aug 2012 18:33:17 +0200 (CEST)
Message-ID: <5037ACCA.2070207@suse.de>
Date: Fri, 24 Aug 2012 18:33:14 +0200
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: BALATON Zoltan <balaton@eik.bme.hu>,
	Anthony Liguori <anthony@codemonkey.ws>,
	Stefan Hajnoczi <stefanha@gmail.com>
References: <Pine.GSO.4.64.1208221717460.28960@mono>
In-Reply-To: <Pine.GSO.4.64.1208221717460.28960@mono>
X-Enigmail-Version: 1.5a1pre
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Fix copy&paste typos in
 documentation comments
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
X-List-Received-Date: Fri, 24 Aug 2012 16:33:29 -0000

Am 22.08.2012 17:18, schrieb BALATON Zoltan:
>=20
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  memory.h |   11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
>  v2: indented memory_region_init_ram_ptr
>=20
> diff --git a/memory.h b/memory.h
> index bd1bbae..f6c8e32 100644
> --- a/memory.h
> +++ b/memory.h
> @@ -252,9 +252,9 @@ void memory_region_init_ram(MemoryRegion *mr,
>                              uint64_t size);
>=20
>  /**
> - * memory_region_init_ram:  Initialize RAM memory region from a
> user-provided.
> - *                          pointer.  Accesses into the region will mo=
dify
> - *                          memory directly.
> + * memory_region_init_ram_ptr:  Initialize RAM memory region from a
> + *                              user-provided pointer.  Accesses into =
the
> + *                              region will modify memory directly.

@Anthony: Didn't you have a patch reformatting the whole file gtk-doc
style? My guess is, that's no longer up to date?

Apart from slightly different markup, the gtk-doc convention seems to be
to have the function name on a line of its own and the description
starting on a line of its own, not indented to the function name.
http://developer.gnome.org/gtk-doc-manual/unstable/documenting_symbols.ht=
ml.en
(cf. Anthony's include/qemu/object.h)

Not objecting to this patch but questioning whether we should rebreak it
to avoid future reindenting.

@Stefan: Either way it would be nice to mention "memory" in the commit
message, please. :)

Regards,
Andreas

>   *
>   * @mr: the #MemoryRegion to be initialized.
>   * @name: the name of the region.
> @@ -581,7 +581,8 @@ void memory_region_add_subregion(MemoryRegion *mr,
>                                   target_phys_addr_t offset,
>                                   MemoryRegion *subregion);
>  /**
> - * memory_region_add_subregion: Add a subregion to a container, with
> overlap.
> + * memory_region_add_subregion_overlap: Add a subregion to a container
> + *                                      with overlap.
>   *
>   * Adds a subregion at @offset.  The subregion may overlap with other
>   * subregions.  Conflicts are resolved by having a higher @priority hi=
de a
> @@ -743,7 +744,7 @@ void memory_listener_unregister(MemoryListener
> *listener);
>  void memory_global_dirty_log_start(void);
>=20
>  /**
> - * memory_global_dirty_log_stop: begin dirty logging for all regions
> + * memory_global_dirty_log_stop: end dirty logging for all regions
>   */
>  void memory_global_dirty_log_stop(void);
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

