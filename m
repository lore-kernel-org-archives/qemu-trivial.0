Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ri1y0-0005zF-9d
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2012 05:51:40 -0500
Received: from eggs.gnu.org ([140.186.70.92]:59756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri1xu-0005ef-WD
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 05:51:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri1xt-0004JL-BZ
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 05:51:34 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:64835)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Ri1xp-0004Fh-Kr; Tue, 03 Jan 2012 05:51:29 -0500
Received: by mail-ee0-f45.google.com with SMTP id b45so18563593eek.4
	for <multiple recipients>; Tue, 03 Jan 2012 02:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gUPfr/3E4R7VXhOAVbDK91SrkLgUNSlJfVmVOYgvNIo=;
	b=e/IqJe1sDJln/o8CaG8FFHi5X1/Jo2GefTrfUWRugaLMszQnIspNE1x63QX5hIfhgn
	B57UTIiq9SA6MG9/Kb1q1Jk2hogSZT7hzLui66R//NDo23/Yw0NF7SA20fkXDD2GiXXN
	LIJIk5I+qwp+Db4LBugLDMXFJ355HZjdsBWss=
Received: by 10.14.2.136 with SMTP id 8mr21734730eef.13.1325587889075;
	Tue, 03 Jan 2012 02:51:29 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id 19sm28141676eew.7.2012.01.03.02.51.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 02:51:28 -0800 (PST)
Date: Tue, 3 Jan 2012 10:51:27 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120103105127.GC28684@stefanha-thinkpad.localdomain>
References: <1324770431-6074-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1324770431-6074-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] net/socket.c: Fix fd leak in
 net_socket_listen_init() error paths
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
X-List-Received-Date: Tue, 03 Jan 2012 10:51:39 -0000

On Sat, Dec 24, 2011 at 11:47:11PM +0000, Peter Maydell wrote:
> Fix a leak of a file descriptor due to missing closesocket() calls
> in error paths in net_socket_listen_init().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Coverity again...
> 
>  net/socket.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches -next tree:
https://github.com/stefanha/qemu/commits/trivial-patches-next

Stefan

