Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEVtu-0001u6-1u
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2017 02:44:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eEVtq-0001s5-QD
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 02:44:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eEVtp-0005yB-Jf
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 02:44:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48506)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eEVtk-0005tr-Ux; Tue, 14 Nov 2017 02:44:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE67E5D686;
	Tue, 14 Nov 2017 07:44:43 +0000 (UTC)
Received: from [10.36.116.149] (ovpn-116-149.ams2.redhat.com [10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DA992A2DD;
	Tue, 14 Nov 2017 07:44:41 +0000 (UTC)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, armbru@redhat.com,
	Paolo Bonzini <pbonzini@redhat.com>, alistair23@gmail.com,
	Richard Henderson <rth@twiddle.net>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
	<55c70157d3650022c60f73da5a4ab238aeddb467.1510612380.git.alistair.francis@xilinx.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4d096eaf-4757-5d75-4004-90f939e7768a@redhat.com>
Date: Tue, 14 Nov 2017 08:44:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <55c70157d3650022c60f73da5a4ab238aeddb467.1510612380.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 14 Nov 2017 07:44:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 28/29] tcg: Replace
 fprintf(stderr, "*\n" with error_report()
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
X-List-Received-Date: Tue, 14 Nov 2017 07:44:52 -0000

On 13.11.2017 23:36, Alistair Francis wrote:
> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.
[...]
> diff --git a/cpus.c b/cpus.c
> index 114c29b6a0..d73df01659 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -258,7 +258,7 @@ int64_t cpu_get_icount_raw(void)
>  
>      if (cpu && cpu->running) {
>          if (!cpu->can_do_io) {
> -            fprintf(stderr, "Bad icount read\n");
> +            error_report("Bad icount read");
>              exit(1);
>          }
>          /* Take into account what has run */
> @@ -1113,7 +1113,7 @@ static void *qemu_kvm_cpu_thread_fn(void *arg)
>  
>      r = kvm_init_vcpu(cpu);
>      if (r < 0) {
> -        fprintf(stderr, "kvm_init_vcpu failed: %s\n", strerror(-r));
> +        error_report("kvm_init_vcpu failed: %s", strerror(-r));
>          exit(1);
>      }
>  
> @@ -1143,7 +1143,7 @@ static void *qemu_kvm_cpu_thread_fn(void *arg)
>  static void *qemu_dummy_cpu_thread_fn(void *arg)
>  {
>  #ifdef _WIN32
> -    fprintf(stderr, "qtest is not supported under Windows\n");
> +    error_report("qtest is not supported under Windows");
>      exit(1);
>  #else
>      CPUState *cpu = arg;
> @@ -1527,7 +1527,7 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
>  #else /* _WIN32 */
>      if (!qemu_cpu_is_self(cpu)) {
>          if (!QueueUserAPC(dummy_apc_func, cpu->hThread, 0)) {
> -            fprintf(stderr, "%s: QueueUserAPC failed with error %lu\n",
> +            error_report("%s: QueueUserAPC failed with error %lu",
>                      __func__, GetLastError());

Wrong indentation of the second line.

>              exit(1);
>          }
> diff --git a/exec.c b/exec.c
> index 97a24a875e..59e0411d0e 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -1076,7 +1076,7 @@ static RAMBlock *qemu_get_ram_block(ram_addr_t addr)
>          }
>      }
>  
> -    fprintf(stderr, "Bad ram offset %" PRIx64 "\n", (uint64_t)addr);
> +    error_report("Bad ram offset %" PRIx64 "", (uint64_t)addr);
>      abort();
>  
>  found:
> @@ -1689,7 +1689,7 @@ static ram_addr_t find_ram_offset(ram_addr_t size)
>      }
>  
>      if (offset == RAM_ADDR_MAX) {
> -        fprintf(stderr, "Failed to find gap of requested size: %" PRIu64 "\n",
> +        error_report("Failed to find gap of requested size: %" PRIu64 "",
>                  (uint64_t)size);

dito.

>          abort();
>      }
> @@ -1719,8 +1719,8 @@ static void qemu_ram_setup_dump(void *addr, ram_addr_t size)
>          ret = qemu_madvise(addr, size, QEMU_MADV_DONTDUMP);
>          if (ret) {
>              perror("qemu_madvise");
> -            fprintf(stderr, "madvise doesn't support MADV_DONTDUMP, "
> -                            "but dump_guest_core=off specified\n");
> +            error_report("madvise doesn't support MADV_DONTDUMP, "
> +                            "but dump_guest_core=off specified");

dito.

>          }
>      }
>  }
> @@ -1756,7 +1756,7 @@ void qemu_ram_set_idstr(RAMBlock *new_block, const char *name, DeviceState *dev)
>      RAMBLOCK_FOREACH(block) {
>          if (block != new_block &&
>              !strcmp(block->idstr, new_block->idstr)) {
> -            fprintf(stderr, "RAMBlock \"%s\" already registered, abort!\n",
> +            error_report("RAMBlock \"%s\" already registered, abort!",
>                      new_block->idstr);

dito

>              abort();
>          }
> @@ -2184,8 +2184,8 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
>                                  flags, -1, 0);
>                  }
>                  if (area != vaddr) {
> -                    fprintf(stderr, "Could not remap addr: "
> -                            RAM_ADDR_FMT "@" RAM_ADDR_FMT "\n",
> +                    error_report("Could not remap addr: "
> +                            RAM_ADDR_FMT "@" RAM_ADDR_FMT "",
>                              length, addr);

Wrong indentation again.

>                      exit(1);
>                  }
> diff --git a/tcg/optimize.c b/tcg/optimize.c
> index 438321c6cc..93bfaad556 100644
> --- a/tcg/optimize.c
> +++ b/tcg/optimize.c
> @@ -122,8 +122,8 @@ static TCGOpcode op_to_mov(TCGOpcode op)
>      case 64:
>          return INDEX_op_mov_i64;
>      default:
> -        fprintf(stderr, "op_to_mov: unexpected return value of "
> -                "function op_bits.\n");
> +        error_report("op_to_mov: unexpected return value of "
> +                "function op_bits.");

dito

>          tcg_abort();
>      }
>  }
> @@ -136,8 +136,8 @@ static TCGOpcode op_to_movi(TCGOpcode op)
>      case 64:
>          return INDEX_op_movi_i64;
>      default:
> -        fprintf(stderr, "op_to_movi: unexpected return value of "
> -                "function op_bits.\n");
> +        error_report("op_to_movi: unexpected return value of "
> +                "function op_bits.");

dito

>          tcg_abort();
>      }
>  }
[...]
> diff --git a/tcg/tci.c b/tcg/tci.c
> index 63f2cd54ab..6c851d3450 100644
> --- a/tcg/tci.c
> +++ b/tcg/tci.c
> @@ -35,7 +35,7 @@
>  /* Marker for missing code. */
>  #define TODO() \
>      do { \
> -        fprintf(stderr, "TODO %s:%u: %s()\n", \
> +        error_report("TODO %s:%u: %s()", \
>                  __FILE__, __LINE__, __func__); \
>          tcg_abort(); \
>      } while (0)
> diff --git a/tcg/tci/tcg-target.inc.c b/tcg/tci/tcg-target.inc.c
> index 913c3802a3..2f4b56d3ba 100644
> --- a/tcg/tci/tcg-target.inc.c
> +++ b/tcg/tci/tcg-target.inc.c
> @@ -29,7 +29,7 @@
>  /* Marker for missing code. */
>  #define TODO() \
>      do { \
> -        fprintf(stderr, "TODO %s:%u: %s()\n", \
> +        error_report("TODO %s:%u: %s()", \
>                  __FILE__, __LINE__, __func__); \

Wrong indentation again. Maybe also fits into one line now?

>          tcg_abort(); \
>      } while (0)
> @@ -403,7 +403,7 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
>  void tci_disas(uint8_t opc)
>  {
>      const TCGOpDef *def = &tcg_op_defs[opc];
> -    fprintf(stderr, "TCG %s %u, %u, %u\n",
> +    error_report("TCG %s %u, %u, %u",
>              def->name, def->nb_oargs, def->nb_iargs, def->nb_cargs);

Wrong indentation

>  }
>  #endif

 Thomas

