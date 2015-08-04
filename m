Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMbFj-00040b-Co
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:23:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMbFg-0003x4-O3
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:23:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMbFa-0000rg-SL
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:23:28 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:40867)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbFX-0000nK-QZ; Tue, 04 Aug 2015 08:23:19 -0400
Received: from weber.rr44.fr ([2001:bc8:30d7:120:7e05:7ff:fe0d:f152])
	by hall.aurel32.net with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbFV-0007f0-3q; Tue, 04 Aug 2015 14:23:17 +0200
Received: from aurel32 by weber.rr44.fr with local (Exim 4.85)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMbFU-0002Ns-D8; Tue, 04 Aug 2015 14:23:16 +0200
Date: Tue, 4 Aug 2015 14:23:16 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20150804122316.GA8918@aurel32.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-10-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1438593291-27109-10-git-send-email-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:bc8:30d7:100::1
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, crosthwaitepeter@gmail.com,
	pbonzini@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 09/11] target-arm: dfilter support for
 in_asm, op, opt_op
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
X-List-Received-Date: Tue, 04 Aug 2015 12:23:29 -0000

On 2015-08-03 10:14, Alex Benn=E9e wrote:
> Each individual architecture needs to use the qemu_log_in_addr_range()
> feature for enabling in_asm and marking blocks for op/opt_op output.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  target-arm/translate-a64.c | 6 ++++--
>  target-arm/translate.c     | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> index 689f2be..0b0f4ae 100644
> --- a/target-arm/translate-a64.c
> +++ b/target-arm/translate-a64.c
> @@ -11026,7 +11026,8 @@ void gen_intermediate_code_internal_a64(ARMCPU *c=
pu,
>              gen_io_start();
>          }
> =20
> -        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OP=
T))) {
> +        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OP=
T) &&
> +                     qemu_log_in_addr_range(dc->pc))) {
>              tcg_gen_debug_insn_start(dc->pc);
>          }
> =20
> @@ -11131,7 +11132,8 @@ done_generating:
>      gen_tb_end(tb, num_insns);
> =20
>  #ifdef DEBUG_DISAS
> -    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
> +    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
> +        qemu_log_in_addr_range(pc_start)) {
>          qemu_log("----------------\n");
>          qemu_log("IN: %s\n", lookup_symbol(pc_start));
>          log_target_disas(cs, pc_start, dc->pc - pc_start,
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 69ac18c..c914be0 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -11316,7 +11316,8 @@ static inline void gen_intermediate_code_internal=
(ARMCPU *cpu,
>          if (num_insns + 1 =3D=3D max_insns && (tb->cflags & CF_LAST_IO))
>              gen_io_start();
> =20
> -        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OP=
T))) {
> +        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OP=
T)) &&
> +            qemu_log_in_addr_range(dc->pc)) {
>              tcg_gen_debug_insn_start(dc->pc);
>          }
> =20
> @@ -11489,7 +11490,8 @@ done_generating:
>      gen_tb_end(tb, num_insns);
> =20
>  #ifdef DEBUG_DISAS
> -    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
> +    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
> +        qemu_log_in_addr_range(pc_start)) {
>          qemu_log("----------------\n");
>          qemu_log("IN: %s\n", lookup_symbol(pc_start));
>          log_target_disas(cs, pc_start, dc->pc - pc_start,

We probably want to do the same for the other architectures.

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

