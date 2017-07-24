Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZir4-0004cb-7d
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 15:17:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZir1-0004bD-Rg
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:17:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZir0-0005kN-Ub
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:17:19 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:49351)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1dZiqw-0005id-1j; Mon, 24 Jul 2017 15:17:14 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0Lutwv-1ditlS0esj-0105yo; Mon, 24 Jul 2017 21:16:59 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-27-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cc23ddee-ad10-74ef-874c-6ed1ef485d2e@vivier.eu>
Date: Mon, 24 Jul 2017 21:16:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-27-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:K556BgsIYHwg62/TUOXmQRpKsOkt9sYlK+gl+VM7OXSKG8eRMVM
	XR0lmgdPCmIEC1UTiCkEtYhcNDiwXt0c+XcezSSM6JyOP1KjtsArQ6K+XULVxif/xnih0jG
	rmp2ImUaeeJeXvc/0/TPRv/bjv06wgXEyGDvVSdLdPrNXV7b+hMkQ6ayBuBGmK6wXOElCz6
	FMiCriaHueteawkR3fWbQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:EdeYoHtuvIc=:oJ9PVApR5LsEFPoNwn+tzQ
	ptAw3ZAM9rB5doH2aRvcPK7KoF3iQFwvShluejZ+6YkzSzq72qE0yxXxO6ynjJuH5KbMkji1e
	9r7WVoBln5Yz/FzMPgv4w57tEnwCVx82TdK1AKOwGtlxE0OtlcKWci8z4DO0ruOvZA9xdRPSj
	BpffuGjjnntHitlLCuJVDQ7+AWXbwT/NR3OTuMaGk3m4nsunwiyGEiob0pLAXPJzAc9xEyPEe
	bJfiJH1A/r0DuCVOSMf6zCUtLgzmZuaF7nrMKwNHGb2d1rgFEMUJPdjLEhyhUfQHIT4n4FCA9
	ufMpNIg/O0VuspDprX06bzgwZniQ6dp/hNoGxJyz0vnf1a+zyWYC+H7LDjZ8HC1XN6lyq0z1K
	lBfAjLw80ZB/EcA/ckIQz9KJ07qXW0uV1W1Twf2RcjAzWffpVt2Y42yM31+N9VjJSq5vE+ZxM
	HhG8OQh2jbk0eBi6regOf3a8KuAUtvWLW9qw+FQKLzxSsQs4vIOz7+LrsA/BW7jNNYx16bfVX
	WA6X7o5wl8JqhJ0i9L20JwSy05yP8dvz5Y+lEfE6OodCXdnInvI/edoN7xZ1jxDUdPW5pQIPA
	blOq55E0ztVNfazDuGZrsaVD5ylY/YKMCT+cNGraDjRwJ57bp6wuaw7FL/wwksbm8+cInK7A4
	8evLK4LDZfZXj2gyFWZQBKW4WvoWJ2zbihGqz8JmIpquNt2ouG+8wkh+xsWlWd//yf44v1JLB
	KMG2Q+NVFTkN2OTC632AhjwaML9Eode3AN8ggqeShGRs1H3BmXguhhJhWn4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [PATCH for 2.10 26/35] linux-user: use
 is_error() to avoid warnings and make the code clearer
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
X-List-Received-Date: Mon, 24 Jul 2017 19:17:21 -0000

Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
> linux-user/flatload.c:740:9: warning: Loss of sign in implicit conversion
>     if (res > (unsigned long)-4096)
>         ^~~
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

> ---
>  linux-user/flatload.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/linux-user/flatload.c b/linux-user/flatload.c
> index a35a560904..10c529910f 100644
> --- a/linux-user/flatload.c
> +++ b/linux-user/flatload.c
> @@ -224,8 +224,9 @@ static int decompress_exec(
>  		ret = bprm->file->f_op->read(bprm->file, buf, LBUFSIZE, &fpos);
>  		if (ret <= 0)
>  			break;
> -		if (ret >= (unsigned long) -4096)
> +                if (is_error(ret)) {
>  			break;
> +                }
>  		len -= ret;
>  
>  		strm.next_in = buf;
> @@ -283,8 +284,7 @@ calc_reloc(abi_ulong r, struct lib_info *p, int curid, int internalp)
>                      "in same module (%d != %d)\n",
>                      (unsigned) r, curid, id);
>              goto failed;
> -        } else if ( ! p[id].loaded &&
> -                    load_flat_shared_library(id, p) > (unsigned long) -4096) {
> +        } else if (!p[id].loaded && is_error(load_flat_shared_library(id, p))) {
>              fprintf(stderr, "BINFMT_FLAT: failed to load library %d\n", id);
>              goto failed;
>          }
> @@ -523,9 +523,10 @@ static int load_flat_file(struct linux_binprm * bprm,
>                  fpos = 0;
>                  result = bprm->file->f_op->read(bprm->file,
>                                  (char *) textpos, text_len, &fpos);
> -                if (result < (unsigned long) -4096)
> +                if (!is_error(result)) {
>                          result = decompress_exec(bprm, text_len, (char *) datapos,
>                                           data_len + (relocs * sizeof(unsigned long)), 0);
> +                }
>          }
>          else
>  #endif
> @@ -693,8 +694,9 @@ static int load_flat_shared_library(int id, struct lib_info *libs)
>  
>  	res = prepare_binprm(&bprm);
>  
> -	if (res <= (unsigned long)-4096)
> +        if (!is_error(res)) {
>  		res = load_flat_file(&bprm, libs, id, NULL);
> +        }
>  	if (bprm.file) {
>  		allow_write_access(bprm.file);
>  		fput(bprm.file);
> @@ -737,8 +739,9 @@ int load_flt_binary(struct linux_binprm *bprm, struct image_info *info)
>  
>  
>      res = load_flat_file(bprm, libinfo, 0, &stack_len);
> -    if (res > (unsigned long)-4096)
> +    if (is_error(res)) {
>              return res;
> +    }
>  
>      /* Update data segment pointers for all libraries */
>      for (i=0; i<MAX_SHARED_LIBS; i++) {
> 


