Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UT7rs-0007h1-2E
	for mharc-qemu-trivial@gnu.org; Fri, 19 Apr 2013 05:44:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7rp-0007gu-Jp
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UT7rk-0007pl-Ae
	for qemu-trivial@nongnu.org; Fri, 19 Apr 2013 05:44:29 -0400
Received: from mail-we0-x22c.google.com ([2a00:1450:400c:c03::22c]:58053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UT7rk-0007pe-1g; Fri, 19 Apr 2013 05:44:24 -0400
Received: by mail-we0-f172.google.com with SMTP id r3so3343650wey.17
	for <multiple recipients>; Fri, 19 Apr 2013 02:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=E5HG829IvY8FXkmpvJmEj2xH+wOqXJjhviKWaY+vUtU=;
	b=b/h9pidi58NmYJ1g3NuxfnMplCCqIoP0woPkGxRUMLkKZy8ZfATgRVpc977k2zNiOF
	9g3BsYRdO3kkEM1If/D15oBP5TFFF3dtvGn+dUE5MBcKmbP3NDh3NGUO2X+O0nQnfavW
	5VjltiYnczUQzw9FiwB2QxTwa7Zvkv+QGkgsXUarfnktLugvAAGFmN87CrlrKtxNfrmi
	24vr+PYTkHngAuIP9OHn3nL01FRFzI25oujTNygHOkEGnVSO7xusnzWAwPkiDz+OcW0y
	jwHI6eabNlTgjant5W6H3SXE3aOaWsA5lk9s3eBsd8ON2/2S8L2Q8haGk01X81tLRfAs
	BTtw==
X-Received: by 10.180.183.133 with SMTP id em5mr14315666wic.26.1366364663214; 
	Fri, 19 Apr 2013 02:44:23 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:f833:9039:bb71:5207])
	by mx.google.com with ESMTPSA id t14sm2573543wib.0.2013.04.19.02.44.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 02:44:22 -0700 (PDT)
Date: Fri, 19 Apr 2013 11:44:20 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130419094420.GG30143@stefanha-thinkpad.redhat.com>
References: <1366316465-32710-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366316465-32710-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22c
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	"Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/ssh: Add missing gcc
	format attributes
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
X-List-Received-Date: Fri, 19 Apr 2013 09:44:31 -0000

On Thu, Apr 18, 2013 at 10:21:05PM +0200, Stefan Weil wrote:
> Now gcc will check whether format string and variable arguments match.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> Please note: I could only run limited tests with the new code
> because ssh.c is currently not compiled in my w32/w64 environment.
> 
> Regards,
> Stefan W.
> 
>  block/ssh.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

