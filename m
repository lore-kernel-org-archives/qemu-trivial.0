Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvVSo-0006GN-Al
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 11:03:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TvVSl-00068U-IZ
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 11:03:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TvVSj-0000el-K4
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 11:03:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:2808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TvVSg-0000dt-Im; Wed, 16 Jan 2013 11:03:34 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0GG3WkX004000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 16 Jan 2013 11:03:32 -0500
Received: from blackfin.pond.sub.org (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0GG3VOs020970; Wed, 16 Jan 2013 11:03:31 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5B6B1200A9; Wed, 16 Jan 2013 17:03:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <1358346998-26328-1-git-send-email-armbru@redhat.com>
	<1358346998-26328-5-git-send-email-armbru@redhat.com>
	<50F6CC84.8000908@redhat.com>
Date: Wed, 16 Jan 2013 17:03:30 +0100
In-Reply-To: <50F6CC84.8000908@redhat.com> (Eric Blake's message of "Wed, 16
	Jan 2013 08:51:32 -0700")
Message-ID: <87fw21jest.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 04/11] readline: Fix
	unchecked strdup() by converting to g_strdup()
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
X-List-Received-Date: Wed, 16 Jan 2013 16:03:40 -0000

Eric Blake <eblake@redhat.com> writes:

> On 01/16/2013 07:36 AM, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  readline.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/readline.c b/readline.c
>> index a0c9638..d6e04d4 100644
>> --- a/readline.c
>> +++ b/readline.c
>> @@ -247,14 +247,14 @@ static void readline_hist_add(ReadLineState *rs, const char *cmdline)
>>      }
>>      if (idx == READLINE_MAX_CMDS) {
>>  	/* Need to get one free slot */
>> -	free(rs->history[0]);
>> +        g_free(rs->history[0]);
>>  	memmove(rs->history, &rs->history[1],
>>  	        (READLINE_MAX_CMDS - 1) * sizeof(char *));
>>  	rs->history[READLINE_MAX_CMDS - 1] = NULL;
>>  	idx = READLINE_MAX_CMDS - 1;
>>      }
>>      if (new_entry == NULL)
>> -	new_entry = strdup(cmdline);
>> +        new_entry = g_strdup(cmdline);
>
> As long as you are converting tabs to spaces, you should also be adding {}.

I style-fix exactly the lines I touch anyway.  For what it's worth,
checkpatch is happy.

