Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk5DF-0002Sc-2s
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 03:02:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1Zh9wZ-0003nr-I7
	for qemu-trivial@nongnu.org; Wed, 30 Sep 2015 01:28:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1Zh9wW-0003ZG-7r
	for qemu-trivial@nongnu.org; Wed, 30 Sep 2015 01:28:43 -0400
Received: from ozlabs.org ([103.22.144.67]:43126)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1Zh9wV-0003Yg-Lx
	for qemu-trivial@nongnu.org; Wed, 30 Sep 2015 01:28:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 98AEC140D21; Wed, 30 Sep 2015 15:28:34 +1000 (AEST)
Date: Wed, 30 Sep 2015 15:26:38 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Christopher Covington <cov@codeaurora.org>
Message-ID: <20150930052638.GB23574@voom>
References: <1443192141-24910-1-git-send-email-cov@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline
In-Reply-To: <1443192141-24910-1-git-send-email-cov@codeaurora.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH]
	s/cpu_get_real_ticks/cpu_get_host_ticks/
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
X-List-Received-Date: Wed, 30 Sep 2015 05:28:45 -0000


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2015 at 10:42:21AM -0400, Christopher Covington wrote:
> This should help clarify the purpose of the function that returns
> the host system's CPU cycle count.
>=20
> Signed-off-by: Christopher Covington <cov@codeaurora.org>

ppc portion

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  bsd-user/main.c           |  2 +-
>  cpus.c                    |  6 +++---
>  hw/intc/xics.c            |  2 +-
>  hw/ppc/ppc.c              |  4 ++--
>  include/qemu/timer.h      | 20 ++++++++++----------
>  linux-user/main.c         |  4 ++--
>  target-alpha/sys_helper.c |  2 +-
>  7 files changed, 20 insertions(+), 20 deletions(-)
>=20
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index f0a1268..adf2de0 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -108,7 +108,7 @@ void cpu_list_unlock(void)
> =20
>  uint64_t cpu_get_tsc(CPUX86State *env)
>  {
> -    return cpu_get_real_ticks();
> +    return cpu_get_host_ticks();
>  }
> =20
>  static void write_dt(void *ptr, unsigned long addr, unsigned long limit,
> diff --git a/cpus.c b/cpus.c
> index dddd056..eba7d5b 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -191,7 +191,7 @@ int64_t cpu_get_ticks(void)
> =20
>      ticks =3D timers_state.cpu_ticks_offset;
>      if (timers_state.cpu_ticks_enabled) {
> -        ticks +=3D cpu_get_real_ticks();
> +        ticks +=3D cpu_get_host_ticks();
>      }
> =20
>      if (timers_state.cpu_ticks_prev > ticks) {
> @@ -239,7 +239,7 @@ void cpu_enable_ticks(void)
>      /* Here, the really thing protected by seqlock is cpu_clock_offset. =
*/
>      seqlock_write_lock(&timers_state.vm_clock_seqlock);
>      if (!timers_state.cpu_ticks_enabled) {
> -        timers_state.cpu_ticks_offset -=3D cpu_get_real_ticks();
> +        timers_state.cpu_ticks_offset -=3D cpu_get_host_ticks();
>          timers_state.cpu_clock_offset -=3D get_clock();
>          timers_state.cpu_ticks_enabled =3D 1;
>      }
> @@ -255,7 +255,7 @@ void cpu_disable_ticks(void)
>      /* Here, the really thing protected by seqlock is cpu_clock_offset. =
*/
>      seqlock_write_lock(&timers_state.vm_clock_seqlock);
>      if (timers_state.cpu_ticks_enabled) {
> -        timers_state.cpu_ticks_offset +=3D cpu_get_real_ticks();
> +        timers_state.cpu_ticks_offset +=3D cpu_get_host_ticks();
>          timers_state.cpu_clock_offset =3D cpu_get_clock_locked();
>          timers_state.cpu_ticks_enabled =3D 0;
>      }
> diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> index 67881c7..9ff5796 100644
> --- a/hw/intc/xics.c
> +++ b/hw/intc/xics.c
> @@ -848,7 +848,7 @@ static target_ulong h_xirr_x(PowerPCCPU *cpu, sPAPRMa=
chineState *spapr,
>      uint32_t xirr =3D icp_accept(ss);
> =20
>      args[0] =3D xirr;
> -    args[1] =3D cpu_get_real_ticks();
> +    args[1] =3D cpu_get_host_ticks();
>      return H_SUCCESS;
>  }
> =20
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index b77e303..2c604ef 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -834,7 +834,7 @@ static void cpu_ppc_set_tb_clk (void *opaque, uint32_=
t freq)
>  static void timebase_pre_save(void *opaque)
>  {
>      PPCTimebase *tb =3D opaque;
> -    uint64_t ticks =3D cpu_get_real_ticks();
> +    uint64_t ticks =3D cpu_get_host_ticks();
>      PowerPCCPU *first_ppc_cpu =3D POWERPC_CPU(first_cpu);
> =20
>      if (!first_ppc_cpu->env.tb_env) {
> @@ -878,7 +878,7 @@ static int timebase_post_load(void *opaque, int versi=
on_id)
>                                       NANOSECONDS_PER_SECOND);
>      guest_tb =3D tb_remote->guest_timebase + MIN(0, migration_duration_t=
b);
> =20
> -    tb_off_adj =3D guest_tb - cpu_get_real_ticks();
> +    tb_off_adj =3D guest_tb - cpu_get_host_ticks();
> =20
>      tb_off =3D first_ppc_cpu->env.tb_env->tb_offset;
>      trace_ppc_tb_adjust(tb_off, tb_off_adj, tb_off_adj - tb_off,
> diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> index 9939246..d0946cb 100644
> --- a/include/qemu/timer.h
> +++ b/include/qemu/timer.h
> @@ -857,7 +857,7 @@ int64_t cpu_icount_to_ns(int64_t icount);
> =20
>  #if defined(_ARCH_PPC)
> =20
> -static inline int64_t cpu_get_real_ticks(void)
> +static inline int64_t cpu_get_host_ticks(void)
>  {
>      int64_t retval;
>  #ifdef _ARCH_PPC64
> @@ -883,7 +883,7 @@ static inline int64_t cpu_get_real_ticks(void)
> =20
>  #elif defined(__i386__)
> =20
> -static inline int64_t cpu_get_real_ticks(void)
> +static inline int64_t cpu_get_host_ticks(void)
>  {
>      int64_t val;
>      asm volatile ("rdtsc" : "=3DA" (val));
> @@ -892,7 +892,7 @@ static inline int64_t cpu_get_real_ticks(void)
> =20
>  #elif defined(__x86_64__)
> =20
> -static inline int64_t cpu_get_real_ticks(void)
> +static inline int64_t cpu_get_host_ticks(void)
>  {
>      uint32_t low,high;
>      int64_t val;
> @@ -905,7 +905,7 @@ static inline int64_t cpu_get_real_ticks(void)
> =20
>  #elif defined(__hppa__)
> =20
> -static inline int64_t cpu_get_real_ticks(void)
> +static inline int64_t cpu_get_host_ticks(void)
>  {
>      int val;
>      asm volatile ("mfctl %%cr16, %0" : "=3Dr"(val));
> @@ -914,7 +914,7 @@ static inline int64_t cpu_get_real_ticks(void)
> =20
>  #elif defined(__ia64)
> =20
> -static inline int64_t cpu_get_real_ticks(void)
> +static inline int64_t cpu_get_host_ticks(void)
>  {
>      int64_t val;
>      asm volatile ("mov %0 =3D ar.itc" : "=3Dr"(val) :: "memory");
> @@ -923,7 +923,7 @@ static inline int64_t cpu_get_real_ticks(void)
> =20
>  #elif defined(__s390__)
> =20
> -static inline int64_t cpu_get_real_ticks(void)
> +static inline int64_t cpu_get_host_ticks(void)
>  {
>      int64_t val;
>      asm volatile("stck 0(%1)" : "=3Dm" (val) : "a" (&val) : "cc");
> @@ -932,7 +932,7 @@ static inline int64_t cpu_get_real_ticks(void)
> =20
>  #elif defined(__sparc__)
> =20
> -static inline int64_t cpu_get_real_ticks (void)
> +static inline int64_t cpu_get_host_ticks (void)
>  {
>  #if defined(_LP64)
>      uint64_t        rval;
> @@ -970,7 +970,7 @@ static inline int64_t cpu_get_real_ticks (void)
>                                : "=3Dr" (value));          \
>      }
> =20
> -static inline int64_t cpu_get_real_ticks(void)
> +static inline int64_t cpu_get_host_ticks(void)
>  {
>      /* On kernels >=3D 2.6.25 rdhwr <reg>, $2 and $3 are emulated */
>      uint32_t count;
> @@ -986,7 +986,7 @@ static inline int64_t cpu_get_real_ticks(void)
> =20
>  #elif defined(__alpha__)
> =20
> -static inline int64_t cpu_get_real_ticks(void)
> +static inline int64_t cpu_get_host_ticks(void)
>  {
>      uint64_t cc;
>      uint32_t cur, ofs;
> @@ -1001,7 +1001,7 @@ static inline int64_t cpu_get_real_ticks(void)
>  /* The host CPU doesn't have an easily accessible cycle counter.
>     Just return a monotonically increasing value.  This will be
>     totally wrong, but hopefully better than nothing.  */
> -static inline int64_t cpu_get_real_ticks (void)
> +static inline int64_t cpu_get_host_ticks (void)
>  {
>      static int64_t ticks =3D 0;
>      return ticks++;
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 782037d..953c8d2 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -215,7 +215,7 @@ void cpu_list_unlock(void)
> =20
>  uint64_t cpu_get_tsc(CPUX86State *env)
>  {
> -    return cpu_get_real_ticks();
> +    return cpu_get_host_ticks();
>  }
> =20
>  static void write_dt(void *ptr, unsigned long addr, unsigned long limit,
> @@ -1425,7 +1425,7 @@ void cpu_loop (CPUSPARCState *env)
>  #ifdef TARGET_PPC
>  static inline uint64_t cpu_ppc_get_tb(CPUPPCState *env)
>  {
> -    return cpu_get_real_ticks();
> +    return cpu_get_host_ticks();
>  }
> =20
>  uint64_t cpu_ppc_load_tbl(CPUPPCState *env)
> diff --git a/target-alpha/sys_helper.c b/target-alpha/sys_helper.c
> index 1f0e1a9..75c96c1 100644
> --- a/target-alpha/sys_helper.c
> +++ b/target-alpha/sys_helper.c
> @@ -34,7 +34,7 @@ uint64_t helper_load_pcc(CPUAlphaState *env)
>  #else
>      /* In user-mode, QEMU_CLOCK_VIRTUAL doesn't exist.  Just pass throug=
h the host cpu
>         clock ticks.  Also, don't bother taking PCC_OFS into account.  */
> -    return (uint32_t)cpu_get_real_ticks();
> +    return (uint32_t)cpu_get_host_ticks();
>  #endif
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWC3KOAAoJEGw4ysog2bOSo7sP/1V4OwNj0x6iJlkVgbrQ4yI/
ugsHjcNfvR/Eb+DLRBZaUZtpiL0Hqs6h0Y5ITmQQea3bTVRz9Lr3ZSNRbSnI+ofx
LUkvkwuzi7YrHjeHJIj/uC27jDkxNMtFm0ELpkc77F1TlJMKYUjpsMpvIsu7HXIK
CP4GX9l2rbHAnirwx8VB2TzhxkOPEGynVpFcqh+WW2SjhjzhqkQ1qo4WxWl9ZYw+
7exGnC/mphg0I8k1BUaHJ7DZ0ZNLxh1crcmJ0NVEsOezwIwLjPig8IGeV+Nhmybr
icpD4ICGEwvc36z/qAF6m+snOgTqNs0VvaVQLb7ZraOdHoMShkED8tgiPYvn5b0u
i75+vmM68ezZpKFveoUN24p+dMaT8j05kIqE+Omj2MY9Oj/9ow6d5rAcuLZ7fyqo
pTZijhLcu7fxa893aCuJzBEE3uOCD/l1EepT9grWfOv5bI3629myN2Wa/f+h1jSU
DfRfvPd7cNnNwJ3wI8jHtz81cnlLOwHkkrjYt5AD8lDcmFWQgxf2VLR5n59aqWNF
8TU8MdAvOzdXHkYcbRzS3M+0DCrFj9WhMAx4ww4bibGSytEt/Wd+gLbUnZpe4rjN
IHWimaroBztzSHVXCFGEHMAl2hIdnKAWBGuMEw4udU/2MG42hxKXhNnn3r1l13yw
s8g/TywgMJkfOykpcwdD
=A/MV
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--

