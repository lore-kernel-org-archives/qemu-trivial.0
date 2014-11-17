Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqGa3-0007SP-Vk
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 02:18:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XqGZw-0007Fr-Ql
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 02:18:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XqGZs-0006of-11
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 02:18:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XqGZh-0006m0-Pl; Mon, 17 Nov 2014 02:18:13 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAH7I52I021135
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 17 Nov 2014 02:18:06 -0500
Received: from blackfin.pond.sub.org (ovpn-116-46.ams2.redhat.com
	[10.36.116.46])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAH7I3Kl029877
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 17 Nov 2014 02:18:05 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1329A30403AF; Mon, 17 Nov 2014 08:18:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
References: <1416203645-2584-1-git-send-email-zhang.zhanghailiang@huawei.com>
Date: Mon, 17 Nov 2014 08:18:03 +0100
In-Reply-To: <1416203645-2584-1-git-send-email-zhang.zhanghailiang@huawei.com>
	(zhanghailiang's message of "Mon, 17 Nov 2014 13:54:05 +0800")
Message-ID: <87zjbqmh1w.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
	stefanha@redhat.com, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: The third parameter of
	getsockname should be initialized
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
X-List-Received-Date: Mon, 17 Nov 2014 07:18:33 -0000

zhanghailiang <zhang.zhanghailiang@huawei.com> writes:

> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  net/socket.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/socket.c b/net/socket.c
> index fb21e20..ca4b8ba 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -352,7 +352,7 @@ static NetSocketState *net_socket_fd_init_dgram(NetClientState *peer,
>  {
>      struct sockaddr_in saddr;
>      int newfd;
> -    socklen_t saddr_len;
> +    socklen_t saddr_len = sizeof(saddr);
>      NetClientState *nc;
>      NetSocketState *s;

Reviewed-by: Markus Armbruster <armbru@redhat.com>

