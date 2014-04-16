Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WaTi1-00005c-An
	for mharc-qemu-trivial@gnu.org; Wed, 16 Apr 2014 13:33:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WaThu-0008Ni-4l
	for qemu-trivial@nongnu.org; Wed, 16 Apr 2014 13:33:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WaThp-0007RG-EX
	for qemu-trivial@nongnu.org; Wed, 16 Apr 2014 13:33:10 -0400
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=42786
	helo=v220110690675601.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WaThf-0007P3-UG; Wed, 16 Apr 2014 13:32:56 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	62E1311822B5; Wed, 16 Apr 2014 19:32:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id bATOYBhwB-B4; Wed, 16 Apr 2014 19:32:50 +0200 (CEST)
Received: from [134.155.149.83] (vpn-149-83.vpn.uni-mannheim.de
	[134.155.149.83])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	F311E11822B4; Wed, 16 Apr 2014 19:32:49 +0200 (CEST)
Message-ID: <534EBEC1.9070801@weilnetz.de>
Date: Wed, 16 Apr 2014 19:32:49 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Igor Ryzhov <iryzhov@arccn.ru>, qemu-devel@nongnu.org
References: <1397655787-27780-1-git-send-email-iryzhov@arccn.ru>
In-Reply-To: <1397655787-27780-1-git-send-email-iryzhov@arccn.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: qemu-trivial <qemu-trivial@nongnu.org>, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Unnecessary comma.
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
X-List-Received-Date: Wed, 16 Apr 2014 17:33:14 -0000

Am 16.04.2014 15:43, schrieb Igor Ryzhov:
> Signed-off-by: Igor Ryzhov <iryzhov@arccn.ru>
> ---
>  net/net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/net.c b/net/net.c
> index e3ef1e4..60a07f1 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -473,7 +473,7 @@ ssize_t qemu_deliver_packet(NetClientState *sender,
>  
>      if (ret == 0) {
>          nc->receive_disabled = 1;
> -    };
> +    }
>  
>      return ret;
>  }
> 

Reviewed-by: Stefan Weil <sw@weilnetz.de>

CC'ing qemu-trivial

PS. The "." at the end of your subject line is unnecessary, too. :-)


