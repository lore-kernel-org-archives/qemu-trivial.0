Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqKbN-00036H-PM
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 06:36:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1XqKbG-0002zs-Qc
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 06:36:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1XqKb8-0002H2-NO
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 06:36:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1XqKb8-0002Ge-Fu; Mon, 17 Nov 2014 06:35:58 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAHBZm2q030970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 17 Nov 2014 06:35:48 -0500
Received: from [10.36.112.46] (ovpn-112-46.ams2.redhat.com [10.36.112.46])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAHB0nvD022973
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Mon, 17 Nov 2014 06:00:51 -0500
Message-ID: <5469D561.9000902@redhat.com>
Date: Mon, 17 Nov 2014 12:00:49 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org
References: <1416203645-2584-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1416203645-2584-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] net: The third parameter of getsockname
	should be initialized
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
X-List-Received-Date: Mon, 17 Nov 2014 11:36:11 -0000



On 17/11/2014 06:54, zhanghailiang wrote:
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
>  
> 

Applied, thanks.

