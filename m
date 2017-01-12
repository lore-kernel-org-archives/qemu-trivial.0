Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRjH8-0007ZB-En
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 12:34:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cRjH6-0007Xl-LI
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 12:34:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cRjH5-0008Jx-4V
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 12:34:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50156)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cRjGy-0008FT-8U; Thu, 12 Jan 2017 12:34:48 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E7A31831;
	Thu, 12 Jan 2017 17:34:48 +0000 (UTC)
Received: from [10.36.116.33] (ovpn-116-33.ams2.redhat.com [10.36.116.33])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0CHYjWD013908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Jan 2017 12:34:46 -0500
To: Markus Armbruster <armbru@redhat.com>
References: <1484224732-1345-1-git-send-email-thuth@redhat.com>
	<877f609rkd.fsf@dusky.pond.sub.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <03307c8a-b802-861a-fa8c-0af78df41c8a@redhat.com>
Date: Thu, 12 Jan 2017 18:34:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <877f609rkd.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 12 Jan 2017 17:34:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 12 Jan 2017 17:34:58 -0000

On 12.01.2017 17:22, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
>=20
>> When running certain HMP commands ("info registers", "info cpustats",
>> "nmi", "memsave" or dumping virtual memory) with the "none" machine,
>> QEMU crashes with a segmentation fault. This happens because the "none=
"
>> machine does not have any CPUs by default, but these HMP commands did
>> not check for a valid CPU pointer yet. Add such checks now, so we get
>> an error message about the missing CPU instead.
>>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  v3:
>>  - Use UNASSIGNED_CPU_INDEX instead of hard-coded -1
>>  v2:
>>  - Added more checks to cover "nmi" and "memsave", too
>>
>>  hmp.c     |  8 +++++++-
>>  monitor.c | 37 +++++++++++++++++++++++++++++++------
>>  2 files changed, 38 insertions(+), 7 deletions(-)
>>
>> diff --git a/hmp.c b/hmp.c
>> index b869617..b1c503a 100644
>> --- a/hmp.c
>> +++ b/hmp.c
>> @@ -1013,8 +1013,14 @@ void hmp_memsave(Monitor *mon, const QDict *qdi=
ct)
>>      const char *filename =3D qdict_get_str(qdict, "filename");
>>      uint64_t addr =3D qdict_get_int(qdict, "val");
>>      Error *err =3D NULL;
>> +    int cpu_index =3D monitor_get_cpu_index();
>> =20
>> -    qmp_memsave(addr, size, filename, true, monitor_get_cpu_index(), =
&err);
>> +    if (cpu_index < 0) {
>> +        monitor_printf(mon, "No CPU available\n");
>> +        return;
>> +    }
>> +
>> +    qmp_memsave(addr, size, filename, true, cpu_index, &err);
>>      hmp_handle_error(mon, &err);
>>  }
>> =20
>> diff --git a/monitor.c b/monitor.c
>> index 0841d43..17121ff 100644
>> --- a/monitor.c
>> +++ b/monitor.c
>> @@ -1025,6 +1025,9 @@ int monitor_set_cpu(int cpu_index)
>>  CPUState *mon_get_cpu(void)
>>  {
>>      if (!cur_mon->mon_cpu) {
>> +        if (!first_cpu) {
>> +            return NULL;
>> +        }
>>          monitor_set_cpu(first_cpu->cpu_index);
>>      }
>>      cpu_synchronize_state(cur_mon->mon_cpu);
>> @@ -1033,17 +1036,27 @@ CPUState *mon_get_cpu(void)
>> =20
>>  CPUArchState *mon_get_cpu_env(void)
>>  {
>> -    return mon_get_cpu()->env_ptr;
>> +    CPUState *cs =3D mon_get_cpu();
>> +
>> +    return cs ? cs->env_ptr : NULL;
>>  }
>> =20
>>  int monitor_get_cpu_index(void)
>>  {
>> -    return mon_get_cpu()->cpu_index;
>> +    CPUState *cs =3D mon_get_cpu();
>> +
>> +    return cs ? cs->cpu_index : UNASSIGNED_CPU_INDEX;
>>  }
>> =20
>>  static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>>  {
>> -    cpu_dump_state(mon_get_cpu(), (FILE *)mon, monitor_fprintf, CPU_D=
UMP_FPU);
>> +    CPUState *cs =3D mon_get_cpu();
>> +
>> +    if (!cs) {
>> +        monitor_printf(mon, "No CPU available\n");
>> +        return;
>> +    }
>> +    cpu_dump_state(cs, (FILE *)mon, monitor_fprintf, CPU_DUMP_FPU);
>>  }
>> =20
>>  static void hmp_info_jit(Monitor *mon, const QDict *qdict)
>> @@ -1076,7 +1089,13 @@ static void hmp_info_history(Monitor *mon, cons=
t QDict *qdict)
>> =20
>>  static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
>>  {
>> -    cpu_dump_statistics(mon_get_cpu(), (FILE *)mon, &monitor_fprintf,=
 0);
>> +    CPUState *cs =3D mon_get_cpu();
>> +
>> +    if (!cs) {
>> +        monitor_printf(mon, "No CPU available\n");
>> +        return;
>> +    }
>> +    cpu_dump_statistics(cs, (FILE *)mon, &monitor_fprintf, 0);
>>  }
>> =20
>>  static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
>> @@ -1235,6 +1254,12 @@ static void memory_dump(Monitor *mon, int count=
, int format, int wsize,
>>      int l, line_size, i, max_digits, len;
>>      uint8_t buf[16];
>>      uint64_t v;
>> +    CPUState *cs =3D mon_get_cpu();
>> +
>> +    if (!cs && (format =3D=3D 'i' || !is_physical)) {
>> +        monitor_printf(mon, "Can not dump without CPU\n");
>> +        return;
>> +    }
>=20
> This is basically "if (we're going to dereference cs)".  Not so nice, i=
n
> particular since the dereferences are hidden inside mon_get_cpu_env()
> calls.  I guess it'll do.
>=20
>> =20
>>      if (format =3D=3D 'i') {
>>          int flags =3D 0;
>> @@ -1264,7 +1289,7 @@ static void memory_dump(Monitor *mon, int count,=
 int format, int wsize,
>>          flags =3D msr_le << 16;
>>          flags |=3D env->bfd_mach;
>>  #endif
>> -        monitor_disas(mon, mon_get_cpu(), addr, count, is_physical, f=
lags);
>> +        monitor_disas(mon, cs, addr, count, is_physical, flags);
>>          return;
>>      }
>> =20
>> @@ -1303,7 +1328,7 @@ static void memory_dump(Monitor *mon, int count,=
 int format, int wsize,
>>          if (is_physical) {
>>              cpu_physical_memory_read(addr, buf, l);
>>          } else {
>> -            if (cpu_memory_rw_debug(mon_get_cpu(), addr, buf, l, 0) <=
 0) {
>> +            if (cpu_memory_rw_debug(cs, addr, buf, l, 0) < 0) {
>>                  monitor_printf(mon, " Cannot access memory\n");
>>                  break;
>>              }
>=20
> What about get_monitor_def()?
>=20
>     $ qemu-system-x86_64 --nodefaults -S -display none -M none -monitor=
 stdio
>     QEMU 2.8.50 monitor - type 'help' for more information
>     (qemu) p $pc
>     Segmentation fault (core dumped)

Oh, I saw that get_monitor_def() uses mon_get_cpu_env(), but I only
checked with qemu-system-m68k where "p $pc" simply prints "unknown
register" when you run it with the "none" machine ... that's why I
assumed that no fixes would be needed here.

> Likewise, info tlb, info mem, ...=20

These seem to be target specific, too, so I think they could go into a
separate patch instead. If it's OK for you, I'd like to keep my current
patch as it is, and add these items to
http://qemu-project.org/BiteSizedTasks instead - since these are all
non-urgent problems that should be easy to fix for newcomers, too.

 Thomas


