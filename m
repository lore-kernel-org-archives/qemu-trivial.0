Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRasH-0000ga-UR
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 03:36:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cRasB-0000VZ-Uu
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 03:36:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cRas7-0001KT-8n
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 03:36:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43308)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cRas0-0001Hv-OF; Thu, 12 Jan 2017 03:36:28 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC05680F6D;
	Thu, 12 Jan 2017 08:36:28 +0000 (UTC)
Received: from [10.36.116.62] (ovpn-116-62.ams2.redhat.com [10.36.116.62])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0C8aPAt005006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Jan 2017 03:36:27 -0500
To: Markus Armbruster <armbru@redhat.com>
References: <1484167250-16089-1-git-send-email-thuth@redhat.com>
	<87tw94em1e.fsf@dusky.pond.sub.org>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-trivial@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ad4e2d18-4cef-9df1-3d85-4749cf000175@redhat.com>
Date: Thu, 12 Jan 2017 09:36:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <87tw94em1e.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 12 Jan 2017 08:36:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 12 Jan 2017 08:36:44 -0000

On 12.01.2017 09:10, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
>=20
>> When running certain HMP commands ("info registers", "info cpustats"
>> or dumping virtual memory) with the "none" machine, QEMU crashes
>> with a segmentation fault. This happens because the "none" machine doe=
s
>> not have any CPUs by default,
>=20
> "Sachen gibt's!"
>=20
>>                               but these HMP commands did not check for
>> a valid CPU pointer yet. Add such a check now and print a message
>> about the missing CPU instead.
>=20
> Have you checked uses of first_cpu elsewhere?  Out of scope for this
> patch, of course.

I only looked at monitor.c so far, and that's the only spot that uses
this variable there.

But it seems like gdbstub.c has the same bug, too. If I start the "none"
machine and attach a remote gdb, QEMU segfaults here, too.
I've put this on my TODO-list... (I think it should be fixed with a
separate patch).

>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  monitor.c | 29 +++++++++++++++++++++++++----
>>  1 file changed, 25 insertions(+), 4 deletions(-)
>>
>> diff --git a/monitor.c b/monitor.c
>> index 0841d43..0103979 100644
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
>=20
> Why are the following dereferences safe?
>=20
>    CPUArchState *mon_get_cpu_env(void)
>    {
>        return mon_get_cpu()->env_ptr;
>    }
>=20
>    int monitor_get_cpu_index(void)
>    {
>        return mon_get_cpu()->cpu_index;
>    }

Oh, they are apparently not safe either. The HMP commands "nmi" and
"memsave", which use these functions, are crashing on the "none"
machine, too... I'll send a v2 of my patch to fix these, too ...

Thanks for the review!

 Thomas


