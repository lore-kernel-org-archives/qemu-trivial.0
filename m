Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvpF8-0005N8-3l
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2013 08:10:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TvpF6-0005HU-0f
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 08:10:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TvpF0-00055Q-IX
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 08:10:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:10032)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TvpEw-00053Y-IH; Thu, 17 Jan 2013 08:10:42 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0HDAd89032153
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 17 Jan 2013 08:10:40 -0500
Received: from blackfin.pond.sub.org (ovpn-116-65.ams2.redhat.com
	[10.36.116.65])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0HDAVjp011395; Thu, 17 Jan 2013 08:10:37 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id F2991200A9; Thu, 17 Jan 2013 14:10:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1358357540-29862-1-git-send-email-armbru@redhat.com>
	<1358357540-29862-7-git-send-email-armbru@redhat.com>
	<20130117112215.GI2586@stefanha-thinkpad.redhat.com>
Date: Thu, 17 Jan 2013 14:10:30 +0100
In-Reply-To: <20130117112215.GI2586@stefanha-thinkpad.redhat.com> (Stefan
	Hajnoczi's message of "Thu, 17 Jan 2013 12:22:15 +0100")
Message-ID: <87obgorm49.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 06/11] virtfs-proxy-helper: Fix
	unchecked strdup() by conv. to g_strdup()
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
X-List-Received-Date: Thu, 17 Jan 2013 13:10:53 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Wed, Jan 16, 2013 at 06:32:15PM +0100, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> ---
>>  fsdev/virtfs-proxy-helper.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
>> index 6b9afd3..36f6616 100644
>> --- a/fsdev/virtfs-proxy-helper.c
>> +++ b/fsdev/virtfs-proxy-helper.c
>> @@ -1039,7 +1039,7 @@ int main(int argc, char **argv)
>>          }
>>          switch (c) {
>>          case 'p':
>> -            rpath = strdup(optarg);
>> +            rpath = g_strdup(optarg);
>>              break;
>>          case 'n':
>>              is_daemon = false;
>> @@ -1048,7 +1048,7 @@ int main(int argc, char **argv)
>>              sock = atoi(optarg);
>>              break;
>>          case 's':
>> -            sock_name = strdup(optarg);
>> +            sock_name = g_strdup(optarg);
>
> rpath and sock_name are leaked.  Not important though because they are
> in main().

Yup.  Freeing stuff before main returns isn't worth your while or mine
:)

