Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMb8R-00034b-BT
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:15:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb8G-0002iI-PX
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:15:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb8D-0005ku-JA
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:15:48 -0400
Received: from hall.aurel32.net ([195.154.112.97]:39096)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1ZMb8D-0005k5-AC
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:15:45 -0400
Received: from weber.rr44.fr ([2001:bc8:30d7:120:7e05:7ff:fe0d:f152])
	by hall.aurel32.net with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMb87-0007R9-O9; Tue, 04 Aug 2015 14:15:39 +0200
Received: from aurel32 by weber.rr44.fr with local (Exim 4.85)
	(envelope-from <aurelien@aurel32.net>)
	id 1ZMb87-0002D4-2P; Tue, 04 Aug 2015 14:15:39 +0200
Date: Tue, 4 Aug 2015 14:15:39 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Message-ID: <20150804121539.GB6574@aurel32.net>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-2-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1438593291-27109-2-git-send-email-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 195.154.112.97
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 01/11] tcg: add ability to dump
 /tmp/perf-<pid>.map files
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
X-List-Received-Date: Tue, 04 Aug 2015 12:15:56 -0000

On 2015-08-03 10:14, Alex Benn=E9e wrote:
> This allows the perf tool to map samples to each individual translation
> block. This could be expanded for user space but currently it gives
> enough information to find any hotblocks by other means.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
>=20
> ---
>=20
> v2:
>   - hoist up into translate-all.c
>   - don't use pointless glib wrappers
>   - use proper format types for portability
>   - mark prologue/epilog area
>   - rebase
>=20
> v3:
>   - fix bracket for perf-map
>   - find an include for the tb_enable_perfmap() declaration
>   - checkpatch clean-ups
> ---
>  include/qemu-common.h |  2 ++
>  qemu-options.hx       |  9 +++++++++
>  translate-all.c       | 26 ++++++++++++++++++++++++++
>  vl.c                  |  4 ++++
>  4 files changed, 41 insertions(+)
>=20
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index fb3da6c..60b87d0 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -382,6 +382,8 @@ typedef struct PCIHostDeviceAddress {
>  void tcg_exec_init(unsigned long tb_size);
>  bool tcg_enabled(void);
> =20
> +void tb_enable_perfmap(void);
> +
>  void cpu_exec_init_all(void);
> =20
>  /* CPU save/load.  */
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 77f5853..ae53346 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3572,6 +3572,15 @@ to the RNG daemon.
> =20
>  ETEXI
> =20
> +DEF("perfmap", 0, QEMU_OPTION_PERFMAP, \
> +    "-perfmap        generate a /tmp/perf-${pid}.map file for perf\n",
> +    QEMU_ARCH_ALL)
> +STEXI
> +@item -perfmap
> +@findex -perfmap
> +This will cause QEMU to generate a map file for Linux perf tools that wi=
ll allow
> +basic profiling information to be broken down into basic blocks.
> +ETEXI
> =20
>  HXCOMM This is the last statement. Insert new options before this line!
>  STEXI
> diff --git a/translate-all.c b/translate-all.c
> index 60a3d8b..c05e2a5 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -27,6 +27,7 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include <inttypes.h>
> +#include <glib.h>
> =20
>  #include "config.h"
> =20
> @@ -133,6 +134,24 @@ static void tb_link_page(TranslationBlock *tb, tb_pa=
ge_addr_t phys_pc,
>                           tb_page_addr_t phys_page2);
>  static TranslationBlock *tb_find_pc(uintptr_t tc_ptr);
> =20
> +static FILE *tb_perfmap;
> +
> +void tb_enable_perfmap(void)
> +{
> +    gchar *map_file =3D g_strdup_printf("/tmp/perf-%d.map", getpid());
> +    tb_perfmap =3D fopen(map_file, "w");

What about symlink attacks there?

> +    g_free(map_file);
> +}
> +
> +static void tb_write_perfmap(tcg_insn_unit *start, int size, target_ulon=
g pc)
> +{
> +    if (tb_perfmap) {
> +        fprintf(tb_perfmap,
> +                "%"PRIxPTR" %x subject-"TARGET_FMT_lx"\n",
> +                (uintptr_t) start, size, pc);
> +    }
> +}
> +
>  void cpu_gen_init(void)
>  {
>      tcg_context_init(&tcg_ctx);=20
> @@ -190,6 +209,7 @@ int cpu_gen_code(CPUArchState *env, TranslationBlock =
*tb, int *gen_code_size_ptr
>      s->code_out_len +=3D gen_code_size;
>  #endif
> =20
> +    tb_write_perfmap(gen_code_buf, gen_code_size, tb->pc);
>  #ifdef DEBUG_DISAS
>      if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
>          qemu_log("OUT: [size=3D%d]\n", gen_code_size);
> @@ -669,6 +689,12 @@ static inline void code_gen_alloc(size_t tb_size)
>              tcg_ctx.code_gen_buffer_size - 1024;
>      tcg_ctx.code_gen_buffer_size -=3D 1024;
> =20
> +    if (tb_perfmap) {
> +        fprintf(tb_perfmap,
> +                "%"PRIxPTR" %x tcg-prologue-buffer\n",
> +                (uintptr_t) tcg_ctx.code_gen_prologue, 1024);
> +    }
> +
>      tcg_ctx.code_gen_buffer_max_size =3D tcg_ctx.code_gen_buffer_size -
>          (TCG_MAX_OP_SIZE * OPC_BUF_SIZE);
>      tcg_ctx.code_gen_max_blocks =3D tcg_ctx.code_gen_buffer_size /
> diff --git a/vl.c b/vl.c
> index 0adbbd6..1d2de4f 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -122,6 +122,7 @@ int main(int argc, char **argv)
>  #include "qapi-event.h"
>  #include "exec/semihost.h"
>  #include "crypto/init.h"
> +#include "qemu-common.h"
> =20
>  #define MAX_VIRTIO_CONSOLES 1
>  #define MAX_SCLP_CONSOLES 1
> @@ -3348,6 +3349,9 @@ int main(int argc, char **argv, char **envp)
>              case QEMU_OPTION_D:
>                  log_file =3D optarg;
>                  break;
> +            case QEMU_OPTION_PERFMAP:
> +                tb_enable_perfmap();
> +                break;
>              case QEMU_OPTION_s:
>                  add_device_config(DEV_GDB, "tcp::" DEFAULT_GDBSTUB_PORT);
>                  break;
> --=20
> 2.5.0
>=20
>=20

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

