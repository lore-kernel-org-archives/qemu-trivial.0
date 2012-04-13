Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SIcKb-000578-6o
	for mharc-qemu-trivial@gnu.org; Fri, 13 Apr 2012 04:58:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SIcKV-0004nP-4h
	for qemu-trivial@nongnu.org; Fri, 13 Apr 2012 04:58:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SIcKO-0006HJ-EM
	for qemu-trivial@nongnu.org; Fri, 13 Apr 2012 04:58:06 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:62685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SIcKF-0006G2-VA; Fri, 13 Apr 2012 04:57:52 -0400
Received: by wibhr17 with SMTP id hr17so2519958wib.10
	for <multiple recipients>; Fri, 13 Apr 2012 01:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i7GM6u1nPqOKVYkQWyrBe0Mfw0262LygLzrhPdQvZhk=;
	b=UI0AjFhVY01BD0KKeOxwGwBOqrsxmzxM4KnUhezR1687/RQAzOZuklY6+GbDoLd/dA
	iLra4uq+yiowHLJ9oTZ9LrWahr8/FXuNjxLxmiSaBf/cloUaEhsxcWzFEHd45a3KzgPP
	MaE3MiwUBJyoObXJUks8H2knR7+AzTyzrsT7t3WTF0FDqdv7dZzC19/8NZzqUuD8I0fe
	+Q4sRhTG1o2aOkeTG3uzv9GeTaH5mTAujqLRmwH5/8zXSuv4SOeHjhKk+IQgbD7u+kmI
	50R8+mxbVArQGAJByAUv21SQX38t4TygfLjOvlnGi1D4tu0zLRbYGet67M9cUxvEibg0
	tu9w==
Received: by 10.180.82.136 with SMTP id i8mr1904481wiy.19.1334307469207;
	Fri, 13 Apr 2012 01:57:49 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id fz9sm3337836wib.3.2012.04.13.01.57.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 01:57:48 -0700 (PDT)
Date: Fri, 13 Apr 2012 09:57:47 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120413085747.GA16000@stefanha-thinkpad.localdomain>
References: <1334231021-25886-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334231021-25886-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, patches@linaro.org, qemu-devel@nongnu.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Brad Smith <brad@comstyle.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] bsd-user: fix compile
	failure
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
X-List-Received-Date: Fri, 13 Apr 2012 08:58:11 -0000

On Thu, Apr 12, 2012 at 12:43:41PM +0100, Peter Maydell wrote:
> bsd-user doesn't actually support reserving a memory area for the
> guest address space, but we need to at least define the reserved_va
> global so that cpu-all.h's RESERVED_VA macro will work correctly.
> 
> This fixes a compilation error introduced in commit 39879bb
> which added a use of RESERVED_VA to h2g_valid().
> 
> Reported-by: Brad Smith <brad@comstyle.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2 changes: added commit hash accidentally omitted from message
> added reported-by line. no code change.
> 
>  bsd-user/main.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

