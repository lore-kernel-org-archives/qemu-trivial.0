Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvpM2-0000bc-HC
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2013 08:18:02 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TvpLz-0000RE-1m
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 08:18:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TvpLt-0006nx-64
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 08:17:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:16570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TvpLq-0006n1-9q; Thu, 17 Jan 2013 08:17:50 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0HDHmdF017963
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 17 Jan 2013 08:17:49 -0500
Received: from blackfin.pond.sub.org (ovpn-116-65.ams2.redhat.com
	[10.36.116.65])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0HDHm3V013215; Thu, 17 Jan 2013 08:17:48 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6F1C1200A9; Thu, 17 Jan 2013 14:17:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1358357540-29862-1-git-send-email-armbru@redhat.com>
	<1358357540-29862-9-git-send-email-armbru@redhat.com>
	<20130117112420.GJ2586@stefanha-thinkpad.redhat.com>
Date: Thu, 17 Jan 2013 14:17:47 +0100
In-Reply-To: <20130117112420.GJ2586@stefanha-thinkpad.redhat.com> (Stefan
	Hajnoczi's message of "Thu, 17 Jan 2013 12:24:20 +0100")
Message-ID: <87k3rcrls4.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 08/11] qemu-log: Plug trivial memory
	leak in cpu_set_log_filename()
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
X-List-Received-Date: Thu, 17 Jan 2013 13:18:01 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Wed, Jan 16, 2013 at 06:32:17PM +0100, Markus Armbruster wrote:
>> diff --git a/qemu-log.c b/qemu-log.c
>> index 64a1b88..30c8b01 100644
>> --- a/qemu-log.c
>> +++ b/qemu-log.c
>> @@ -21,10 +21,12 @@
>>  #include "qemu/log.h"
>>  
>>  #ifdef WIN32
>> -static const char *logfilename = "qemu.log";
>> +#define DEFAULT_LOGFILENAME "qemu.log"
>>  #else
>> -static const char *logfilename = "/tmp/qemu.log";
>> +#define DEFAULT_LOGFILENAME "/tmp/qemu.log"
>>  #endif
>> +
>> +static const char *logfilename;
> [...]
>> @@ -84,6 +88,7 @@ void qemu_set_log(int log_flags, bool use_own_buffers)
>>  
>>  void cpu_set_log_filename(const char *filename)
>>  {
>> +    g_free((void *)logfilename);
>
> Might as well drop the const from the variable declaration to indicate
> that we allocate/free this string.

Never thought of const that way.  Dropping const from logfilename is
fine with me.

I wish free()'s parameter was const void *.  Can't be changed now.  Sad
that glib didn't get it right either.

