Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YdPqo-0007vL-4D
	for mharc-qemu-trivial@gnu.org; Wed, 01 Apr 2015 17:07:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YdPql-0007v1-UA
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 17:07:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YdPqj-00031Z-4X
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 17:06:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1YdPqi-00031V-U8; Wed, 01 Apr 2015 17:06:57 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t31L6nfK027972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 1 Apr 2015 17:06:49 -0400
Received: from scv.usersys.redhat.com (vpn-59-118.rdu2.redhat.com
	[10.10.59.118])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t31L6mxX024792; Wed, 1 Apr 2015 17:06:48 -0400
Message-ID: <551C5DE7.70904@redhat.com>
Date: Wed, 01 Apr 2015 17:06:47 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>, qemu-devel@nongnu.org
References: <1427911244-22565-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1427911244-22565-1-git-send-email-emaste@freebsd.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qtest: Add assertion that
 required environment variable is set
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
X-List-Received-Date: Wed, 01 Apr 2015 21:07:01 -0000



On 04/01/2015 02:00 PM, Ed Maste wrote:
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>   tests/libqtest.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/libqtest.c b/tests/libqtest.c
> index 12d65bd..54550a8 100644
> --- a/tests/libqtest.c
> +++ b/tests/libqtest.c
> @@ -453,6 +453,7 @@ void qtest_qmp_discard_response(QTestState *s, const char *fmt, ...)
>   const char *qtest_get_arch(void)
>   {
>       const char *qemu = getenv("QTEST_QEMU_BINARY");
> +    g_assert(qemu != NULL);
>       const char *end = strrchr(qemu, '/');
>
>       return end + strlen("/qemu-system-");
>

This one has annoyed me in the past, too.

I wonder if it would be even nicer to add an fprintf to give the user a 
nice message explaining exactly what went wrong, though -- since this 
particular error is only going to happen when a user is invoking the 
test manually.

Maybe:

if (qemu == NULL) {
   fprintf(stderr, "...");
   g_assert_not_reached();
}

Though that does read a little strangely. ("Here's a nice error message 
for something we are asserting will never happen.")



Well, either way, it's better than segfaulting, so:

Reviewed-by: John Snow <jsnow@redhat.com>

