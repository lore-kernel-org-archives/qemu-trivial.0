Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwXQK-0001tg-Jz
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 07:49:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1SwXQD-0001SA-0U
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 07:49:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1SwXQC-00034W-0w
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 07:49:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14543)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1SwXQ4-00033b-KA; Wed, 01 Aug 2012 07:48:52 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q71BmnEb031788
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 1 Aug 2012 07:48:50 -0400
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q71BmnMD026498; Wed, 1 Aug 2012 07:48:49 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 90A6320058; Wed,  1 Aug 2012 13:48:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1342539951-30915-1-git-send-email-akong@redhat.com>
	<1343811543-12137-2-git-send-email-akong@redhat.com>
	<20120801105011.GC17816@stefanha-thinkpad.localdomain>
Date: Wed, 01 Aug 2012 13:48:48 +0200
In-Reply-To: <20120801105011.GC17816@stefanha-thinkpad.localdomain> (Stefan
	Hajnoczi's message of "Wed, 1 Aug 2012 11:50:11 +0100")
Message-ID: <876292g7dr.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [RESEND PATCH 1/3] socket: remove
	redundant check
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
X-List-Received-Date: Wed, 01 Aug 2012 11:49:06 -0000

Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Wed, Aug 01, 2012 at 04:59:01PM +0800, Amos Kong wrote:
>> It's aleady in the end of loop, error should be set.
>> 
>> Signed-off-by: Amos Kong <akong@redhat.com>
>> ---
>>  qemu-sockets.c |    4 +---
>>  1 files changed, 1 insertions(+), 3 deletions(-)
>> 
>> diff --git a/qemu-sockets.c b/qemu-sockets.c
>> index 668fa93..c636882 100644
>> --- a/qemu-sockets.c
>> +++ b/qemu-sockets.c
>> @@ -181,9 +181,7 @@ int inet_listen_opts(QemuOpts *opts, int port_offset, Error **errp)
>>                  fprintf(stderr,"%s: bind(%s,%s,%d): %s\n", __FUNCTION__,
>>                          inet_strfamily(e->ai_family), uaddr, inet_getport(e),
>>                          strerror(errno));
>> -                if (!e->ai_next) {
>> -                    error_set(errp, QERR_SOCKET_BIND_FAILED);
>> -                }
>> +                error_set(errp, QERR_SOCKET_BIND_FAILED);
>>              }
>>          }
>>          closesocket(slisten);
>
> This isn't obvious.  It looks like the intent of the if (!e->ai_next) is
> to suppress the error so that the next iteration of the *outer* loop can
> succeed.
>
> Why is it okay to set QERR_SOCKET_BIND_FAILED?  We may have more
> addrinfos left to try in the outer loop.  They may succeed so we don't
> want an error in that case.

You are correct, and the patch is wrong.

See also related
http://lists.nongnu.org/archive/html/qemu-devel/2012-02/msg00772.html

