Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWh7o-0003YS-UR
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 04:08:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YWh7m-0003Uv-79
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 04:08:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YWh7l-0002Bw-A9
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 04:08:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YWh7h-0002Ao-0g; Sat, 14 Mar 2015 04:08:41 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 6CC638F2E1;
	Sat, 14 Mar 2015 08:08:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2E88bRb006891
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sat, 14 Mar 2015 04:08:38 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 73C6530408AB; Sat, 14 Mar 2015 09:08:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <1426251334-29445-1-git-send-email-pbonzini@redhat.com>
	<5502EC71.9000009@redhat.com>
Date: Sat, 14 Mar 2015 09:08:36 +0100
In-Reply-To: <5502EC71.9000009@redhat.com> (Eric Blake's message of "Fri, 13
	Mar 2015 07:56:01 -0600")
Message-ID: <87h9to6lx7.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	famz@redhat.com, qemu-devel@nongnu.org, zhaoshenglong@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: fix resource leak with
	monitor_fdset_add_fd
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
X-List-Received-Date: Sat, 14 Mar 2015 08:08:47 -0000

Eric Blake <eblake@redhat.com> writes:

> On 03/13/2015 06:55 AM, Paolo Bonzini wrote:
>> monitor_fdset_add_fd returns an AddfdInfo struct (used by the QMP
>> command add_fd).  Free it.
>> 
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>> 	v1->v2: line length [Fam], pass &error_abort [Shannon]
>> ---
>>  vl.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>> 
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
>> diff --git a/vl.c b/vl.c
>> index eba5d4c..9eae8f9 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -1011,6 +1011,7 @@ static int parse_add_fd(QemuOpts *opts, void *opaque)
>>      int fd, dupfd, flags;
>>      int64_t fdset_id;
>>      const char *fd_opaque = NULL;
>> +    AddfdInfo *fdinfo;
>>  
>>      fd = qemu_opt_get_number(opts, "fd", -1);
>>      fdset_id = qemu_opt_get_number(opts, "set", -1);
>> @@ -1060,8 +1061,10 @@ static int parse_add_fd(QemuOpts *opts, void *opaque)
>>      }
>>  
>>      /* add the duplicate fd, and optionally the opaque string, to
>> the fd set */
>> -    monitor_fdset_add_fd(dupfd, true, fdset_id, fd_opaque ? true : false,
>> -                         fd_opaque, NULL);
>> +    fdinfo = monitor_fdset_add_fd(dupfd, true, fdset_id,
>> +                                  fd_opaque ? true : false, fd_opaque,
>
> I might have written !!fd_opaque (as cond ? true : false always looks so
> long), but that's cosmetic and doesn't affect the review.

The use of ?: here borders on code obfuscation.  Please clean it up.

If you can't stand !!fd_opaque, then use fd_opaque != NULL.

