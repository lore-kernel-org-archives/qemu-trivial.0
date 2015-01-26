Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFo42-0004SW-3o
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jan 2015 13:07:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YFo3v-0004JB-3D
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 13:07:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1YFo3u-0002XU-6T
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 13:06:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47180)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1YFo3o-0002X1-NP; Mon, 26 Jan 2015 13:06:52 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0QI6pi0026267
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 26 Jan 2015 13:06:52 -0500
Received: from work-vm (ovpn-116-95.ams2.redhat.com [10.36.116.95])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0QI6mi4011577
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Mon, 26 Jan 2015 13:06:50 -0500
Date: Mon, 26 Jan 2015 18:06:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20150126180647.GD2291@work-vm>
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
	<1422270747-23994-8-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1422270747-23994-8-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, quintela@redhat.com, qemu-devel@nongnu.org,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 7/7] migration: do
	floating-point division
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
X-List-Received-Date: Mon, 26 Jan 2015 18:07:03 -0000

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> Dividing integer expressions transferred_bytes and time_spent, and then converting
> the integer quotient to type double. Any remainder, or fractional part of the
> quotient, is ignored.  Fix this.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  migration/migration.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index b3adbc6..6db75b8 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -646,7 +646,7 @@ static void *migration_thread(void *opaque)
>          if (current_time >= initial_time + BUFFER_DELAY) {
>              uint64_t transferred_bytes = qemu_ftell(s->file) - initial_bytes;
>              uint64_t time_spent = current_time - initial_time;
> -            double bandwidth = transferred_bytes / time_spent;
> +            double bandwidth = (double)transferred_bytes / time_spent;
>              max_size = bandwidth * migrate_max_downtime() / 1000000;
>  
>              s->mbps = time_spent ? (((double) transferred_bytes * 8.0) /

This feels like it would be better to fix this by merging it into
the s->mbps calculation just off the bottom; we currently have:

            uint64_t transferred_bytes = qemu_ftell(s->file) - initial_bytes;
            uint64_t time_spent = current_time - initial_time;
            double bandwidth = transferred_bytes / time_spent;
            max_size = bandwidth * migrate_max_downtime() / 1000000;

            s->mbps = time_spent ? (((double) transferred_bytes * 8.0) /
                    ((double) time_spent / 1000.0)) / 1000.0 / 1000.0 : -1;

 
Note that the mbps has a check for time_spent being 0 - if that can ever happen,
how come 'bandwidth' has never triggered it?
 
  transferred_bytes    -    bytes
  time_spent           -    ms
  bandwidth            -    bytes/ms
  migrate_max_downtime -    in ns
  s->mbps              -    mbit/s

giving

  max_size = bytes/ms * time-in-ns  / 1000000
           = bytes/ms * time-in-ms
           = bytes

so how about something like:
            uint64_t transferred_bytes = qemu_ftell(s->file) - initial_bytes;
            uint64_t time_spent = current_time - initial_time;
            double   bytes_s    = (double) transferred_bytes / ((double) time_spent / 1000.0));
            s->mbps = (bytes_s * 8.0) / 1000000.0;
            max_size = bytes_s * (migrate_max_downtime() / 1000000000.0);

that also needs the trace fixing and the line a few lines below, I *think* we have
   dirty_bytes_rate is in bytes/second ? (arch_init.c)
   expected_downtime in ms ?
                s->expected_downtime = s->dirty_bytes_rate / bandwidth;
so,  bytes/s / bytes/ms    erm that's supposed to come out as time in ms

                s->expected_downtime = (int64_t)(1000 * (double)s->dirty_bytes_rate / bytes_s);

Yeuch.

Dave

> -- 
> 1.8.3.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

