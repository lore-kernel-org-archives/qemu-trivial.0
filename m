Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZgYNu-0006D0-PY
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2015 09:22:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZgTlq-00032H-HP
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 04:26:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZgTll-0007BH-Ta
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 04:26:50 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:54184)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZgTlg-00078X-Dn; Mon, 28 Sep 2015 04:26:40 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 928D0101279;
	Mon, 28 Sep 2015 10:26:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ce63lGoEo3xc; Mon, 28 Sep 2015 10:26:37 +0200 (CEST)
Received: from [134.155.36.73] (edv13.bib.uni-mannheim.de [134.155.36.73])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 6F1781011CF;
	Mon, 28 Sep 2015 10:26:37 +0200 (CEST)
To: Markus Armbruster <armbru@redhat.com>
References: <1443211950-8207-1-git-send-email-sw@weilnetz.de>
	<871tdjni3w.fsf@blackfin.pond.sub.org>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <5608F9BC.603@weilnetz.de>
Date: Mon, 28 Sep 2015 10:26:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <871tdjni3w.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 134.155.96.80
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trace/simple: Fix warning
 and wrong trace file name for MinGW
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
X-List-Received-Date: Mon, 28 Sep 2015 08:26:54 -0000

Am 28.09.2015 um 09:00 schrieb Markus Armbruster:
> Stefan Weil <sw@weilnetz.de> writes:
>
>> On Windows, getpid() always returns an int value, but pid_t (which is
>> expected by the format string) is either a 32 bit or a 64 bit value.
>>
>> Without a type cast (or a modified format string), the compiler prints
>> a warning when building for 64 bit Windows and the resulting trace_fil=
e_name
>> will include a wrong pid:
>>
>> trace/simple.c:332:9: warning:
>>  format =E2=80=98%lld=E2=80=99 expects argument of type =E2=80=98long =
long int=E2=80=99,
>>  but argument 2 has type =E2=80=98int=E2=80=99 [-Wformat=3D]
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  trace/simple.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/trace/simple.c b/trace/simple.c
>> index 11ad030..56a624c 100644
>> --- a/trace/simple.c
>> +++ b/trace/simple.c
>> @@ -329,7 +329,8 @@ bool st_set_trace_file(const char *file)
>>      g_free(trace_file_name);
>> =20
>>      if (!file) {
>> -        trace_file_name =3D g_strdup_printf(CONFIG_TRACE_FILE, getpid=
());
>> +        /* Type cast needed for Windows where getpid() returns an int=
. */
>> +        trace_file_name =3D g_strdup_printf(CONFIG_TRACE_FILE, (pid_t=
)getpid());
>>      } else {
>>          trace_file_name =3D g_strdup_printf("%s", file);
>>      }
> First we go to the trouble of defining a platform-dependent FMT_pid, an=
d
> then we get to cast anyway.  Meh.
>
> Can you explain why osdep.h's
>
>     #define FMT_pid "%" PRId64
>
> is appropriate for Windows?

Don't blame me for any strangeness which you might find in Windows. :-)

Mingw-w64 sys/types.h defines pid_t to be either an int or an __int64.
FMT_pid must match these definitions.

But getpid returns an int, not a pid_t...


