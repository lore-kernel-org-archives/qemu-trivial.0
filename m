Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRaSy-0007ko-Bn
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 03:10:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cRaSv-0007j5-Go
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 03:10:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cRaSt-0005wi-Ii
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 03:10:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41258)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cRaSm-0005tk-51; Thu, 12 Jan 2017 03:10:24 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E7704DD49;
	Thu, 12 Jan 2017 08:10:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-38.ams2.redhat.com
	[10.36.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4C8E1696B;
	Thu, 12 Jan 2017 08:10:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5DC1511386A2; Thu, 12 Jan 2017 09:10:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-trivial@nongnu.org
References: <1484167250-16089-1-git-send-email-thuth@redhat.com>
Date: Thu, 12 Jan 2017 09:10:21 +0100
In-Reply-To: <1484167250-16089-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Wed, 11 Jan 2017 21:40:50 +0100")
Message-ID: <87tw94em1e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 12 Jan 2017 08:10:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] monitor: Fix crashes when
 using HMP commands without CPU
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
X-List-Received-Date: Thu, 12 Jan 2017 08:10:35 -0000

Thomas Huth <thuth@redhat.com> writes:

> When running certain HMP commands ("info registers", "info cpustats"
> or dumping virtual memory) with the "none" machine, QEMU crashes
> with a segmentation fault. This happens because the "none" machine does
> not have any CPUs by default,

"Sachen gibt's!"

>                               but these HMP commands did not check for
> a valid CPU pointer yet. Add such a check now and print a message
> about the missing CPU instead.

Have you checked uses of first_cpu elsewhere?  Out of scope for this
patch, of course.

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  monitor.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/monitor.c b/monitor.c
> index 0841d43..0103979 100644
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

Why are the following dereferences safe?

   CPUArchState *mon_get_cpu_env(void)
   {
       return mon_get_cpu()->env_ptr;
   }

   int monitor_get_cpu_index(void)
   {
       return mon_get_cpu()->cpu_index;
   }

> @@ -1043,7 +1046,13 @@ int monitor_get_cpu_index(void)
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
> @@ -1076,7 +1085,13 @@ static void hmp_info_history(Monitor *mon, const QDict *qdict)
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
> @@ -1235,6 +1250,12 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
>      int l, line_size, i, max_digits, len;
>      uint8_t buf[16];
>      uint64_t v;
> +    CPUState *cs = mon_get_cpu();
> +
> +    if (!cs && (format == 'i' || !is_physical)) {
> +        monitor_printf(mon, "Can not dump without CPU\n");
> +        return;
> +    }
>  
>      if (format == 'i') {
>          int flags = 0;
> @@ -1264,7 +1285,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
>          flags = msr_le << 16;
>          flags |= env->bfd_mach;
>  #endif
> -        monitor_disas(mon, mon_get_cpu(), addr, count, is_physical, flags);
> +        monitor_disas(mon, cs, addr, count, is_physical, flags);
>          return;
>      }
>  
> @@ -1303,7 +1324,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
>          if (is_physical) {
>              cpu_physical_memory_read(addr, buf, l);
>          } else {
> -            if (cpu_memory_rw_debug(mon_get_cpu(), addr, buf, l, 0) < 0) {
> +            if (cpu_memory_rw_debug(cs, addr, buf, l, 0) < 0) {
>                  monitor_printf(mon, " Cannot access memory\n");
>                  break;
>              }

