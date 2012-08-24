Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4s50-0005EO-4r
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 07:29:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4s4x-0005Cf-0B
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:29:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4s4v-0005gw-2N
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:29:30 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:41279)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T4s4u-0005gb-Ri; Fri, 24 Aug 2012 07:29:28 -0400
Received: by wibhm2 with SMTP id hm2so539368wib.10
	for <multiple recipients>; Fri, 24 Aug 2012 04:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=udEsPN/gyc/V4nzjrXMB/a5LhodFFtzSpLbVU/0bM38=;
	b=W8YoiDrrI6kizX4jSUASrY7haSSVO+Z6CDoaK5zktYwqesqgk04uY4YXJ352ICfVRU
	nOyNPMPnC12sVh1JaNnuewyLShCNaYddzu0II9nE9MWC5a98CrybSYHLo1E3tvW72YlP
	5ftgmnffZBSmlqWkQVZKHRmCom42YVY/ZaA2vNPd6usoFrf4xfgh35TZevttel1o5hCl
	SXg8M1Kw1n8bQHlQhhKl4CU6ierw5dAONqCs0+Qtor4QZdpKoRopxF394BTr+HLtsuUV
	9oY5fErcxKjVwxcPYs0VYBNk2Ma5Jvi37Aeoaf9BsNjvwThGijijuUPMvw9u6jrnxp9Z
	CzeQ==
Received: by 10.180.105.163 with SMTP id gn3mr4909879wib.2.1345807767910;
	Fri, 24 Aug 2012 04:29:27 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id el6sm3915174wib.8.2012.08.24.04.29.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 04:29:26 -0700 (PDT)
Date: Fri, 24 Aug 2012 12:29:20 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120824112920.GL10867@stefanha-thinkpad.localdomain>
References: <1345784583-25640-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1345784583-25640-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for 1.2] qemu-ga: Fix null pointer passed
 to unlink in failure branch
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
X-List-Received-Date: Fri, 24 Aug 2012 11:29:32 -0000

On Fri, Aug 24, 2012 at 07:03:03AM +0200, Stefan Weil wrote:
> Clang reports this warning:
> 
> Null pointer passed as an argument to a 'nonnull' parameter
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  qemu-ga.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Nice, this looks like a legitimate bug that was detected by clang.  We
call become_daemon(NULL).

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

