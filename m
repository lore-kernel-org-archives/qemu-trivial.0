Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRi94-0002xH-3c
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 11:22:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cRi8x-0002sC-9q
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 11:22:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cRi8r-00055d-UG
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 11:22:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57010)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cRi8j-0004zp-H6; Thu, 12 Jan 2017 11:22:13 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD5F481247;
	Thu, 12 Jan 2017 16:22:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EE7B6D255;
	Thu, 12 Jan 2017 16:22:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BBD0E11386A2; Thu, 12 Jan 2017 17:22:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1484224732-1345-1-git-send-email-thuth@redhat.com>
Date: Thu, 12 Jan 2017 17:22:10 +0100
In-Reply-To: <1484224732-1345-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Thu, 12 Jan 2017 13:38:52 +0100")
Message-ID: <877f609rkd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 12 Jan 2017 16:22:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] monitor: Fix crashes
 when using HMP commands without CPU
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
X-List-Received-Date: Thu, 12 Jan 2017 16:22:32 -0000

Thomas Huth <thuth@redhat.com> writes:

> When running certain HMP commands ("info registers", "info cpustats",
> "nmi", "memsave" or dumping virtual memory) with the "none" machine,
> QEMU crashes with a segmentation fault. This happens because the "none"
> machine does not have any CPUs by default, but these HMP commands did
> not check for a valid CPU pointer yet. Add such checks now, so we get
> an error message about the missing CPU instead.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v3:
>  - Use UNASSIGNED_CPU_INDEX instead of hard-coded -1
>  v2:
>  - Added more checks to cover "nmi" and "memsave", too
>
>  hmp.c     |  8 +++++++-
>  monitor.c | 37 +++++++++++++++++++++++++++++++------
>  2 files changed, 38 insertions(+), 7 deletions(-)
>
> diff --git a/hmp.c b/hmp.c
> index b869617..b1c503a 100644
> --- a/hmp.c
> +++ b/hmp.c
> @@ -1013,8 +1013,14 @@ void hmp_memsave(Monitor *mon, const QDict *qdict)
>      const char *filename = qdict_get_str(qdict, "filename");
>      uint64_t addr = qdict_get_int(qdict, "val");
>      Error *err = NULL;
> +    int cpu_index = monitor_get_cpu_index();
>  
> -    qmp_memsave(addr, size, filename, true, monitor_get_cpu_index(), &err);
> +    if (cpu_index < 0) {
> +        monitor_printf(mon, "No CPU available\n");
> +        return;
> +    }
> +
> +    qmp_memsave(addr, size, filename, true, cpu_index, &err);
>      hmp_handle_error(mon, &err);
>  }
>  
> diff --git a/monitor.c b/monitor.c
> index 0841d43..17121ff 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -1025,6 +1025,9 @@ int monitor_set_cpu(int cpu_index)
>  CPUState *mon_get_cpu(void)
>  {
>      if (!cur_mon->mon_cpu) {
> +        if (!first_cpu) {
> +            return NULL;
> +        }
>          monitor_set_cpu(first_cpu->cpu_index);
>      }
>      cpu_synchronize_state(cur_mon->mon_cpu);
> @@ -1033,17 +1036,27 @@ CPUState *mon_get_cpu(void)
>  
>  CPUArchState *mon_get_cpu_env(void)
>  {
> -    return mon_get_cpu()->env_ptr;
> +    CPUState *cs = mon_get_cpu();
> +
> +    return cs ? cs->env_ptr : NULL;
>  }
>  
>  int monitor_get_cpu_index(void)
>  {
> -    return mon_get_cpu()->cpu_index;
> +    CPUState *cs = mon_get_cpu();
> +
> +    return cs ? cs->cpu_index : UNASSIGNED_CPU_INDEX;
>  }
>  
>  static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>  {
> -    cpu_dump_state(mon_get_cpu(), (FILE *)mon, monitor_fprintf, CPU_DUMP_FPU);
> +    CPUState *cs = mon_get_cpu();
> +
> +    if (!cs) {
> +        monitor_printf(mon, "No CPU available\n");
> +        return;
> +    }
> +    cpu_dump_state(cs, (FILE *)mon, monitor_fprintf, CPU_DUMP_FPU);
>  }
>  
>  static void hmp_info_jit(Monitor *mon, const QDict *qdict)
> @@ -1076,7 +1089,13 @@ static void hmp_info_history(Monitor *mon, const QDict *qdict)
>  
>  static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
>  {
> -    cpu_dump_statistics(mon_get_cpu(), (FILE *)mon, &monitor_fprintf, 0);
> +    CPUState *cs = mon_get_cpu();
> +
> +    if (!cs) {
> +        monitor_printf(mon, "No CPU available\n");
> +        return;
> +    }
> +    cpu_dump_statistics(cs, (FILE *)mon, &monitor_fprintf, 0);
>  }
>  
>  static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
> @@ -1235,6 +1254,12 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
>      int l, line_size, i, max_digits, len;
>      uint8_t buf[16];
>      uint64_t v;
> +    CPUState *cs = mon_get_cpu();
> +
> +    if (!cs && (format == 'i' || !is_physical)) {
> +        monitor_printf(mon, "Can not dump without CPU\n");
> +        return;
> +    }

This is basically "if (we're going to dereference cs)".  Not so nice, in
particular since the dereferences are hidden inside mon_get_cpu_env()
calls.  I guess it'll do.

>  
>      if (format == 'i') {
>          int flags = 0;
> @@ -1264,7 +1289,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
>          flags = msr_le << 16;
>          flags |= env->bfd_mach;
>  #endif
> -        monitor_disas(mon, mon_get_cpu(), addr, count, is_physical, flags);
> +        monitor_disas(mon, cs, addr, count, is_physical, flags);
>          return;
>      }
>  
> @@ -1303,7 +1328,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
>          if (is_physical) {
>              cpu_physical_memory_read(addr, buf, l);
>          } else {
> -            if (cpu_memory_rw_debug(mon_get_cpu(), addr, buf, l, 0) < 0) {
> +            if (cpu_memory_rw_debug(cs, addr, buf, l, 0) < 0) {
>                  monitor_printf(mon, " Cannot access memory\n");
>                  break;
>              }

What about get_monitor_def()?

    $ qemu-system-x86_64 --nodefaults -S -display none -M none -monitor stdio
    QEMU 2.8.50 monitor - type 'help' for more information
    (qemu) p $pc
    Segmentation fault (core dumped)

Partial backtrace:

    #0  0x00005555558e00d3 in monitor_get_pc (md=0x5555560bf440 <monitor_defs+1152>, 
        val=0) at /work/armbru/qemu/target/i386/monitor.c:581
    #1  0x00005555557afd09 in get_monitor_def (pval=0x7fffffffc2e8, 
        name=0x7fffffffc300 "pc") at /work/armbru/qemu/monitor.c:2225
    #2  0x00005555557b014c in expr_unary (mon=0x555556830ee0)
        at /work/armbru/qemu/monitor.c:2319
    #3  0x00005555557b02b8 in expr_prod (mon=0x555556830ee0)
        at /work/armbru/qemu/monitor.c:2352
    #4  0x00005555557b0377 in expr_logic (mon=0x555556830ee0)
        at /work/armbru/qemu/monitor.c:2383
    #5  0x00005555557b03fd in expr_sum (mon=0x555556830ee0)
        at /work/armbru/qemu/monitor.c:2411
    #6  0x00005555557b04e7 in get_expr (mon=0x555556830ee0, pval=0x7fffffffc4e0, 
        pp=0x7fffffffc4d8) at /work/armbru/qemu/monitor.c:2435
    #7  0x00005555557b119b in monitor_parse_arguments (mon=0x555556830ee0, 
        endp=0x7fffffffc940, cmd=0x555556185700 <mon_cmds+4032>)
        at /work/armbru/qemu/monitor.c:2779
    #8  0x00005555557b1ac5 in handle_hmp_command (mon=0x555556830ee0, 
        cmdline=0x555556838632 "$pc") at /work/armbru/qemu/monitor.c:2967

Slightly different backtrace for "p $eax":

    #0  0x00005555557afd59 in get_monitor_def (pval=0x7fffffffc2e8, 
        name=0x7fffffffc300 "eax") at /work/armbru/qemu/monitor.c:2234
    #1  0x00005555557b014c in expr_unary (mon=0x555556830ee0)
        at /work/armbru/qemu/monitor.c:2319

Yet another case is when we pass the value of mon_get_cpu() to
target_get_monitor_def().  The implementation in target/ppc/monitor.c
dereferences its argument.

Another one is hmp_info_local_apic():

    (qemu) info lapic
    Segmentation fault (core dumped)

Partial backtrace:

    #0  0x00005555558a615a in x86_cpu_dump_local_apic_state (cs=0x0, 
        f=0x555556830ee0, cpu_fprintf=0x5555557ab8f4 <monitor_fprintf>, flags=131072)
        at /work/armbru/qemu/target/i386/helper.c:327
    #1  0x00005555558e0127 in hmp_info_local_apic (mon=0x555556830ee0, 
        qdict=0x555556833590) at /work/armbru/qemu/target/i386/monitor.c:627
    #2  0x00005555557b1b09 in handle_hmp_command (mon=0x555556830ee0, 
        cmdline=0x55555683863a "") at /work/armbru/qemu/monitor.c:2974

Likewise, info tlb, info mem, ...  Please check all uses of
mon_get_cpu(), mon_get_cpu_env(), monitor_get_cpu_index().

There's one that's particularly fishy: qmp_inject_nmi().  Its use of
mon_get_cpu() via monitor_get_cpu_index() is wrong.  mon_get_cpu()
returns the monitor's current CPU.  "Current CPU" is an HMP concept that
does not exist in QMP.  Due to the way the QMP monitor was grown out of
the HMP monitor, it happens to always return the CPU with index 1.

Feel free to limit your fixing to HMP, and ignore this part of the mess.

