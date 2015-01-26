Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFoBz-0002KI-My
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jan 2015 13:15:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1YFoBx-0002HS-Pe
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 13:15:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1YFoBw-0005Cn-MK
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 13:15:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>)
	id 1YFoBp-0005BA-FN; Mon, 26 Jan 2015 13:15:09 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0QIF8Mb018891
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 26 Jan 2015 13:15:08 -0500
Received: from localhost (ovpn-116-18.ams2.redhat.com [10.36.116.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0QIF7BR014657; Mon, 26 Jan 2015 13:15:07 -0500
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
In-Reply-To: <20150126180647.GD2291@work-vm> (David Alan Gilbert's message of
	"Mon, 26 Jan 2015 18:06:47 +0000")
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
	<1422270747-23994-8-git-send-email-pbonzini@redhat.com>
	<20150126180647.GD2291@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
Date: Mon, 26 Jan 2015 19:15:06 +0100
Message-ID: <877fw9flxx.fsf@neno.neno>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 7/7] migration: do floating-point division
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: quintela@redhat.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Jan 2015 18:15:19 -0000

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Paolo Bonzini (pbonzini@redhat.com) wrote:
>> Dividing integer expressions transferred_bytes and time_spent, and then converting
>> the integer quotient to type double. Any remainder, or fractional part of the
>> quotient, is ignored.  Fix this.
>> 
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  migration/migration.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/migration/migration.c b/migration/migration.c
>> index b3adbc6..6db75b8 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -646,7 +646,7 @@ static void *migration_thread(void *opaque)
>>          if (current_time >= initial_time + BUFFER_DELAY) {
>>              uint64_t transferred_bytes = qemu_ftell(s->file) - initial_bytes;
>>              uint64_t time_spent = current_time - initial_time;
>> -            double bandwidth = transferred_bytes / time_spent;
>> +            double bandwidth = (double)transferred_bytes / time_spent;
>>              max_size = bandwidth * migrate_max_downtime() / 1000000;
>>  
>>              s->mbps = time_spent ? (((double) transferred_bytes * 8.0) /

Reviewed-by: Juan Quintela <quintela@redhat.com>

we had that fix on RHEL, but I forgot to push it upstream (it was not
needed as it optimized the calculations at the time).

>
> This feels like it would be better to fix this by merging it into
> the s->mbps calculation just off the bottom; we currently have:
>
>             uint64_t transferred_bytes = qemu_ftell(s->file) - initial_bytes;
>             uint64_t time_spent = current_time - initial_time;
>             double bandwidth = transferred_bytes / time_spent;
>             max_size = bandwidth * migrate_max_downtime() / 1000000;
>
>             s->mbps = time_spent ? (((double) transferred_bytes * 8.0) /
>                     ((double) time_spent / 1000.0)) / 1000.0 / 1000.0 : -1;
>
>  
> Note that the mbps has a check for time_spent being 0 - if that can ever happen,
> how come 'bandwidth' has never triggered it?
>  
>   transferred_bytes    -    bytes
>   time_spent           -    ms
>   bandwidth            -    bytes/ms
>   migrate_max_downtime -    in ns
>   s->mbps              -    mbit/s
>
> giving
>
>   max_size = bytes/ms * time-in-ns  / 1000000
>            = bytes/ms * time-in-ms
>            = bytes
>
> so how about something like:
>             uint64_t transferred_bytes = qemu_ftell(s->file) - initial_bytes;
>             uint64_t time_spent = current_time - initial_time;
>             double   bytes_s    = (double) transferred_bytes / ((double) time_spent / 1000.0));
>             s->mbps = (bytes_s * 8.0) / 1000000.0;
>             max_size = bytes_s * (migrate_max_downtime() / 1000000000.0);

I think we can do something like this on the normal tree, or just go for
sane units left and right?


> that also needs the trace fixing and the line a few lines below, I *think* we have
>    dirty_bytes_rate is in bytes/second ? (arch_init.c)
>    expected_downtime in ms ?
>                 s->expected_downtime = s->dirty_bytes_rate / bandwidth;
> so,  bytes/s / bytes/ms    erm that's supposed to come out as time in ms
>
>                 s->expected_downtime = (int64_t)(1000 * (double)s->dirty_bytes_rate / bytes_s);
>
> Yeuch.
>
> Dave
>
>> -- 
>> 1.8.3.1
>> 
>> 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

