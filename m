Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YHHpe-0000co-Oj
	for mharc-qemu-trivial@gnu.org; Fri, 30 Jan 2015 15:06:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YHHpc-0000Zs-Uv
	for qemu-trivial@nongnu.org; Fri, 30 Jan 2015 15:06:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1YHHpX-0004TJ-LU
	for qemu-trivial@nongnu.org; Fri, 30 Jan 2015 15:06:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34003)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1YHHpX-0004T5-Es; Fri, 30 Jan 2015 15:06:15 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0UK6EiP009205
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 30 Jan 2015 15:06:14 -0500
Received: from scv.usersys.redhat.com (vpn-50-137.rdu2.redhat.com
	[10.10.50.137])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0UK6DW3030572; Fri, 30 Jan 2015 15:06:13 -0500
Message-ID: <54CBE435.9090409@redhat.com>
Date: Fri, 30 Jan 2015 15:06:13 -0500
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <1422646675-17657-1-git-send-email-kwolf@redhat.com>
In-Reply-To: <1422646675-17657-1-git-send-email-kwolf@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-sockets: Fix buffer
	overflow in inet_parse()
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
X-List-Received-Date: Fri, 30 Jan 2015 20:06:21 -0000



On 01/30/2015 02:37 PM, Kevin Wolf wrote:
> The size of the stack allocated host[] array didn't account for the
> terminating '\0' byte that sscanf() writes. Fix the array size.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   util/qemu-sockets.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index a76bb3c..aacf1fc 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -512,7 +512,7 @@ InetSocketAddress *inet_parse(const char *str, Error **errp)
>   {
>       InetSocketAddress *addr;
>       const char *optstr, *h;
> -    char host[64];
> +    char host[65];
>       char port[33];
>       int to;
>       int pos;
>

You don't really need reviews for trivial, right?
*shrug*

Reviewed-by: John Snow <jsnow@redhat.com>

