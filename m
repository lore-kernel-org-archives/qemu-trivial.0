Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RLAsQ-0005WV-78
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2011 05:43:26 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RLAsH-00052f-VV
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 05:43:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RLAsD-0003RC-VJ
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2011 05:43:17 -0400
Received: from cantor2.suse.de ([195.135.220.15]:34151 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RLAs0-0003Ot-HR; Tue, 01 Nov 2011 05:43:00 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.221.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 96A2C8B2F9;
	Tue,  1 Nov 2011 10:42:58 +0100 (CET)
Message-ID: <4EAFB0D1.60706@suse.de>
Date: Tue, 01 Nov 2011 09:41:53 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
References: <1320128513-16208-1-git-send-email-wdongxu@linux.vnet.ibm.com>
In-Reply-To: <1320128513-16208-1-git-send-email-wdongxu@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, raywang@linux.vnet.ibm.com, qemu-devel@nongnu.org,
	stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] use g_free,
	instead of free
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
X-List-Received-Date: Tue, 01 Nov 2011 09:43:24 -0000

Am 01.11.2011 07:21, schrieb Dong Xu Wang:
> From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
>=20
> Fix mismatching allocation and deallocation: g_free should be used to p=
air with g_malloc.
> Also fix coding style.
>=20
> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>

I took the time to go through the changes. Me, I would've preferred this
to be two patches (one cleanup, one fix), since the style changes make
up the majority of this patch... Two style changes are missing for
perfection, cf. inline.

Changelog is missing. Did just the description change since v1? In that
case Ray Wang's Reviewed-by is missing. Otherwise please describe!

Trusting Ray that g_free() was right in the first place,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

> ---
>  block/cloop.c |  119 +++++++++++++++++++++++++++++++------------------=
--------
>  1 files changed, 65 insertions(+), 54 deletions(-)
>=20
> diff --git a/block/cloop.c b/block/cloop.c
> index 775f8a9..1884b8c 100644
> --- a/block/cloop.c
> +++ b/block/cloop.c

> @@ -74,26 +76,28 @@ static int cloop_open(BlockDriverState *bs, int fla=
gs)
>      s->offsets =3D g_malloc(offsets_size);
>      if (bdrv_pread(bs->file, 128 + 4 + 4, s->offsets, offsets_size) <
>              offsets_size) {
> -	goto cloop_close;
> +        goto cloop_close;
>      }
>      for(i=3D0;i<s->n_blocks;i++) {
> -	s->offsets[i]=3Dbe64_to_cpu(s->offsets[i]);
> -	if(i>0) {
> -	    uint32_t size=3Ds->offsets[i]-s->offsets[i-1];
> -	    if(size>max_compressed_block_size)
> -		max_compressed_block_size=3Dsize;
> -	}
> +        s->offsets[i] =3D be64_to_cpu(s->offsets[i]);
> +        if (i > 0) {
> +            uint32_t size =3D s->offsets[i] - s->offsets[i-1];

i - 1 theoretically

> +            if (size > max_compressed_block_size) {
> +                max_compressed_block_size =3D size;
> +            }
> +        }
>      }
> =20
>      /* initialize zlib engine */
> -    s->compressed_block =3D g_malloc(max_compressed_block_size+1);
> +    s->compressed_block =3D g_malloc(max_compressed_block_size + 1);
>      s->uncompressed_block =3D g_malloc(s->block_size);
> -    if(inflateInit(&s->zstream) !=3D Z_OK)
> -	goto cloop_close;
> -    s->current_block=3Ds->n_blocks;
> +    if (inflateInit(&s->zstream) !=3D Z_OK) {
> +        goto cloop_close;
> +    }
> +    s->current_block =3D s->n_blocks;
> =20
>      s->sectors_per_block =3D s->block_size/512;
> -    bs->total_sectors =3D s->n_blocks*s->sectors_per_block;
> +    bs->total_sectors =3D s->n_blocks * s->sectors_per_block;
>      qemu_co_mutex_init(&s->lock);
>      return 0;
> =20
> @@ -105,27 +109,30 @@ static inline int cloop_read_block(BlockDriverSta=
te *bs, int block_num)
>  {
>      BDRVCloopState *s =3D bs->opaque;
> =20
> -    if(s->current_block !=3D block_num) {
> -	int ret;
> -        uint32_t bytes =3D s->offsets[block_num+1]-s->offsets[block_nu=
m];
> +    if (s->current_block !=3D block_num) {
> +        int ret;
> +        uint32_t bytes =3D s->offsets[block_num + 1]-s->offsets[block_=
num];

] - s

> =20
>          ret =3D bdrv_pread(bs->file, s->offsets[block_num], s->compres=
sed_block,
>                           bytes);
> -        if (ret !=3D bytes)
> +        if (ret !=3D bytes) {
>              return -1;
> +        }
> +
> +        s->zstream.next_in =3D s->compressed_block;
> +        s->zstream.avail_in =3D bytes;
> +        s->zstream.next_out =3D s->uncompressed_block;
> +        s->zstream.avail_out =3D s->block_size;
> +        ret =3D inflateReset(&s->zstream);
> +        if (ret !=3D Z_OK) {
> +            return -1;
> +        }
> +        ret =3D inflate(&s->zstream, Z_FINISH);
> +        if (ret !=3D Z_STREAM_END || s->zstream.total_out !=3D s->bloc=
k_size) {
> +            return -1;
> +        }
> =20
> -	s->zstream.next_in =3D s->compressed_block;
> -	s->zstream.avail_in =3D bytes;
> -	s->zstream.next_out =3D s->uncompressed_block;
> -	s->zstream.avail_out =3D s->block_size;
> -	ret =3D inflateReset(&s->zstream);
> -	if(ret !=3D Z_OK)
> -	    return -1;
> -	ret =3D inflate(&s->zstream, Z_FINISH);
> -	if(ret !=3D Z_STREAM_END || s->zstream.total_out !=3D s->block_size)
> -	    return -1;
> -
> -	s->current_block =3D block_num;
> +        s->current_block =3D block_num;
>      }
>      return 0;
>  }

> @@ -160,20 +170,21 @@ static coroutine_fn int cloop_co_read(BlockDriver=
State *bs, int64_t sector_num,
>  static void cloop_close(BlockDriverState *bs)
>  {
>      BDRVCloopState *s =3D bs->opaque;
> -    if(s->n_blocks>0)
> -	free(s->offsets);
> -    free(s->compressed_block);
> -    free(s->uncompressed_block);
> +    if (s->n_blocks > 0) {
> +        g_free(s->offsets);
> +    }
> +    g_free(s->compressed_block);
> +    g_free(s->uncompressed_block);

Here are the 3 functional changes!

>      inflateEnd(&s->zstream);
>  }
> =20
>  static BlockDriver bdrv_cloop =3D {
> -    .format_name	=3D "cloop",
> -    .instance_size	=3D sizeof(BDRVCloopState),
> -    .bdrv_probe		=3D cloop_probe,
> -    .bdrv_open		=3D cloop_open,
> -    .bdrv_read          =3D cloop_co_read,
> -    .bdrv_close		=3D cloop_close,
> +    .format_name    =3D "cloop",
> +    .instance_size  =3D sizeof(BDRVCloopState),
> +    .bdrv_probe     =3D cloop_probe,
> +    .bdrv_open      =3D cloop_open,
> +    .bdrv_read      =3D cloop_co_read,
> +    .bdrv_close     =3D cloop_close,
>  };
> =20
>  static void bdrv_cloop_init(void)

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

