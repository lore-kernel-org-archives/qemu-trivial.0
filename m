Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bUGHl-0006e3-8T
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2016 12:41:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1bUGHj-0006cE-48
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 12:41:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1bUGHh-0007pK-SW
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 12:41:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1bUGHc-0007nH-7N; Mon, 01 Aug 2016 12:41:40 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F1E63BB19;
	Mon,  1 Aug 2016 16:41:38 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-171.bos.redhat.com
	[10.18.17.171])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u71GfbeO006044; Mon, 1 Aug 2016 12:41:38 -0400
To: Fam Zheng <famz@redhat.com>
References: <1470027888-24381-1-git-send-email-famz@redhat.com>
From: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <abd48ab4-4fd2-9e5e-c680-cbac5396f594@redhat.com>
Date: Mon, 1 Aug 2016 12:41:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1470027888-24381-1-git-send-email-famz@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 01 Aug 2016 16:41:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] curl: Cast fd to int for
 DPRINTF
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Aug 2016 16:41:48 -0000



On 08/01/2016 01:04 AM, Fam Zheng wrote:
> Currently "make docker-test-mingw@fedora" has a warning like:
>
>     /tmp/qemu-test/src/block/curl.c: In function 'curl_sock_cb':
>     /tmp/qemu-test/src/block/curl.c:172:6: warning: format '%d' expects
>     argument of type 'int', but argument 4 has type 'curl_socket_t {aka long
>     long unsigned int}'
>          DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, fd);
>           ^
>     cc1: all warnings being treated as errors
>
> Cast to int to suppress it.
>
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  block/curl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/curl.c b/block/curl.c
> index da9f5e8..426fb4d 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -169,7 +169,7 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
>      state->sock_fd = fd;
>      s = state->s;
>
> -    DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, fd);
> +    DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, (int)fd);
>      switch (action) {
>          case CURL_POLL_IN:
>              aio_set_fd_handler(s->aio_context, fd, false,
>

Is curl_socket_t always of type long long unsigned int? why not use %llu ?

(...Yeah, I know, we're probably not going to be dealing with FDs above 
2-4 billion, just curious...)

--js

Benefit of doubt (this cast is almost certain to never do the wrong 
thing, and even if it did, it's just a dprintf)

Reviewed-by: John Snow <jsnow@redhat.com>

