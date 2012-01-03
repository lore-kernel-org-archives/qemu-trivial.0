Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ri1xo-0005IM-Bl
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2012 05:51:28 -0500
Received: from eggs.gnu.org ([140.186.70.92]:59684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri1xl-00056K-Cl
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 05:51:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri1xg-0004HM-7E
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 05:51:22 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:64835)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Ri1xZ-0004Fh-E8; Tue, 03 Jan 2012 05:51:13 -0500
Received: by mail-ee0-f45.google.com with SMTP id b45so18563593eek.4
	for <multiple recipients>; Tue, 03 Jan 2012 02:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lfk3eiIS5SqYwTw4RDAwvBwjy+NJgwN7Pz3l4hS9vGs=;
	b=ec5tnuIp7zqkYzwuxI0KYGtP+pfNYyfYratECQfPjcgLdystmkHfW5333ahGwIhZ/6
	0J9h0TaBBgiEfNxQ6GTAOgGq2prnjpTCIOOkcuaoS9zpDBzyDO2k9KLj4ULxPzMwbxKM
	7SyErpi1qfUBwJJEJB8lt+g//gNixz5DMoLy8=
Received: by 10.14.37.2 with SMTP id x2mr21171816eea.90.1325587872807;
	Tue, 03 Jan 2012 02:51:12 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	t59sm204152349eeh.10.2012.01.03.02.51.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 02:51:12 -0800 (PST)
Date: Tue, 3 Jan 2012 10:51:10 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120103105110.GB28684@stefanha-thinkpad.localdomain>
References: <1324769844-5991-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1324769844-5991-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] gdbstub: Fix fd leak in gdbserver_open()
 error path
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
X-List-Received-Date: Tue, 03 Jan 2012 10:51:26 -0000

On Sat, Dec 24, 2011 at 11:37:24PM +0000, Peter Maydell wrote:
> Fix a leak of a file descriptor in error exit paths in
> gdbserver_open().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Of no great consequence, but it was in the pile of coverity complaints
> and it's a trivial fix.
> 
>  gdbstub.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches -next tree:
https://github.com/stefanha/qemu/commits/trivial-patches-next

Stefan

