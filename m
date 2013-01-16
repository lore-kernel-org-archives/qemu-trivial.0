Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvVW9-0000jQ-Tt
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 11:07:09 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TvVW2-0000PX-OW
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 11:07:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TvVW1-0001my-RT
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 11:07:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:8554)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TvVVv-0001ln-Aq; Wed, 16 Jan 2013 11:06:55 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0GG6sFq010641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 16 Jan 2013 11:06:54 -0500
Received: from blackfin.pond.sub.org (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0GG6rQl022979; Wed, 16 Jan 2013 11:06:54 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 80191200A9; Wed, 16 Jan 2013 17:06:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <1358346998-26328-1-git-send-email-armbru@redhat.com>
	<1358346998-26328-9-git-send-email-armbru@redhat.com>
	<50F6CCE1.4020503@redhat.com>
Date: Wed, 16 Jan 2013 17:06:53 +0100
In-Reply-To: <50F6CCE1.4020503@redhat.com> (Eric Blake's message of "Wed, 16
	Jan 2013 08:53:05 -0700")
Message-ID: <87a9s9jen6.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 08/11] qemu-log: Plug
	trivial memory leak in cpu_set_log_filename()
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
X-List-Received-Date: Wed, 16 Jan 2013 16:07:09 -0000

Eric Blake <eblake@redhat.com> writes:

> On 01/16/2013 07:36 AM, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  qemu-log.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>> 
>> diff --git a/qemu-log.c b/qemu-log.c
>> index 64a1b88..1eadf1b 100644
>> --- a/qemu-log.c
>> +++ b/qemu-log.c
>> @@ -21,10 +21,12 @@
>>  #include "qemu/log.h"
>>  
>>  #ifdef WIN32
>> -static const char *logfilename = "qemu.log";
>> +#define DEFAULT_LOGFILENAME = "qemu.log"
>
> Syntax error.

How embarrassing.  Unfortunately, it compiles...  I'll respin.

>> @@ -54,11 +56,13 @@ void qemu_log_mask(int mask, const char *fmt, ...)
>>  /* enable or disable low levels log */
>>  void qemu_set_log(int log_flags, bool use_own_buffers)
>>  {
>> +    const char *fname = logfilename ?: DEFAULT_LOGFILENAME;
>
> ?: is not C99, but a GNU extension.  What is our policy on using it?

We got several dozen instancess of ?: spread over the tree.

