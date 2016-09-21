Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bmn5l-0004Da-BH
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2016 15:22:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <voipio@kos.to>) id 1bmn5i-0004AG-Po
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 15:22:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <voipio@kos.to>) id 1bmn5g-0007I2-D0
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 15:21:57 -0400
Received: from jessie.kos.to ([212.47.231.226]:43954 helo=pilvi.kos.to)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <voipio@kos.to>)
	id 1bmn5Z-0007F1-Dp; Wed, 21 Sep 2016 15:21:49 -0400
Received: from kos.to (jessie.kos.to [212.47.231.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pilvi.kos.to (Postfix) with ESMTPSA id 344E92C0021;
	Wed, 21 Sep 2016 19:21:41 +0000 (UTC)
Received: (nullmailer pid 25473 invoked by uid 1000);
	Wed, 21 Sep 2016 19:21:40 -0000
Date: Wed, 21 Sep 2016 19:21:40 +0000
From: Riku Voipio <riku.voipio@iki.fi>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Message-ID: <20160921192140.GF24113@kos.to>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
	<1474034177-17663-10-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474034177-17663-10-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.47.231.226
Subject: Re: [Qemu-trivial] [PATCH 09/26] qemu-user: use exit(EXIT_SUCCESS)
 and exit(EXIT_FAILURE)
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
X-List-Received-Date: Wed, 21 Sep 2016 19:22:00 -0000

On Fri, Sep 16, 2016 at 03:56:00PM +0200, Laurent Vivier wrote:
> This patch is the result of coccinelle script
> scripts/coccinelle/exit.cocci
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> CC: Riku Voipio <riku.voipio@iki.fi>

Acked-by: Riku Voipio <riku.voipio@iki.fi>

> ---
>  bsd-user/main.c      | 20 ++++++++++----------
>  linux-user/main.c    |  4 ++--
>  linux-user/syscall.c |  2 +-
>  3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 0fb08e4..e47e4d7 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -658,7 +658,7 @@ void cpu_loop(CPUSPARCState *env)
>  #endif
>              printf ("Unhandled trap: 0x%x\n", trapnr);
>              cpu_dump_state(cs, stderr, fprintf, 0);
> -            exit (1);
> +            exit(EXIT_FAILURE);
>          }
>          process_pending_signals (env);
>      }
> @@ -708,7 +708,7 @@ static void usage(void)
>             TARGET_NAME,
>             interp_prefix,
>             x86_stack_size);
> -    exit(1);
> +    exit(EXIT_FAILURE);
>  }
>  
>  THREAD CPUState *thread_cpu;
> @@ -752,7 +752,7 @@ int main(int argc, char **argv)
>  
>      if ((envlist = envlist_create()) == NULL) {
>          (void) fprintf(stderr, "Unable to allocate envlist\n");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>  
>      /* add current environment into the list */
> @@ -793,7 +793,7 @@ int main(int argc, char **argv)
>              envlist_free(envlist);
>              if ((envlist = envlist_create()) == NULL) {
>                  (void) fprintf(stderr, "Unable to allocate envlist\n");
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>          } else if (!strcmp(r, "U")) {
>              r = argv[optind++];
> @@ -815,7 +815,7 @@ int main(int argc, char **argv)
>              if (qemu_host_page_size == 0 ||
>                  (qemu_host_page_size & (qemu_host_page_size - 1)) != 0) {
>                  fprintf(stderr, "page size must be a power of two\n");
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>          } else if (!strcmp(r, "g")) {
>              gdbstub_port = atoi(argv[optind++]);
> @@ -828,7 +828,7 @@ int main(int argc, char **argv)
>  #if defined(cpu_list)
>                      cpu_list(stdout, &fprintf);
>  #endif
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>          } else if (!strcmp(r, "B")) {
>             guest_base = strtol(argv[optind++], NULL, 0);
> @@ -867,7 +867,7 @@ int main(int argc, char **argv)
>          mask = qemu_str_to_log_mask(log_mask);
>          if (!mask) {
>              qemu_print_log_usage(stdout);
> -            exit(1);
> +            exit(EXIT_FAILURE);
>          }
>          qemu_set_log(mask);
>      }
> @@ -878,7 +878,7 @@ int main(int argc, char **argv)
>      filename = argv[optind];
>  
>      if (!trace_init_backends()) {
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      trace_init_file(trace_file);
>  
> @@ -914,7 +914,7 @@ int main(int argc, char **argv)
>      cpu = cpu_init(cpu_model);
>      if (!cpu) {
>          fprintf(stderr, "Unable to find CPU definition\n");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      env = cpu->env_ptr;
>  #if defined(TARGET_SPARC) || defined(TARGET_PPC)
> @@ -1010,7 +1010,7 @@ int main(int argc, char **argv)
>      /* enable 64 bit mode if possible */
>      if (!(env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM)) {
>          fprintf(stderr, "The selected x86 CPU does not support 64 bit mode\n");
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      env->cr[4] |= CR4_PAE_MASK;
>      env->efer |= MSR_EFER_LMA | MSR_EFER_LME;
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 3ad70f8..0ab5360 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -4243,7 +4243,7 @@ int main(int argc, char **argv, char **envp)
>      optind = parse_args(argc, argv);
>  
>      if (!trace_init_backends()) {
> -        exit(1);
> +        exit(EXIT_FAILURE);
>      }
>      trace_init_file(trace_file);
>  
> @@ -4700,7 +4700,7 @@ int main(int argc, char **argv, char **envp)
>              if ((env->active_fpu.fcr31_rw_bitmask &
>                    (1 << FCR31_NAN2008)) == 0) {
>                  fprintf(stderr, "ELF binary's NaN mode not supported by CPU\n");
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>              if ((info->elf_flags & EF_MIPS_NAN2008) != 0) {
>                  env->active_fpu.fcr31 |= (1 << FCR31_NAN2008);
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ca06943..da1f581 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -6513,7 +6513,7 @@ void syscall_init(void)
>              if (arg_type[0] != TYPE_PTR) {
>                  fprintf(stderr, "cannot patch size for ioctl 0x%x\n",
>                          ie->target_cmd);
> -                exit(1);
> +                exit(EXIT_FAILURE);
>              }
>              arg_type++;
>              size = thunk_type_size(arg_type, 0);
> -- 
> 2.5.5
> 

