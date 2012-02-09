Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvQDL-0008Eq-Nd
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 04:22:51 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvQDE-0007pn-5m
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 04:22:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvQD5-0007ls-UF
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 04:22:44 -0500
Received: from mail-wi0-f173.google.com ([209.85.212.173]:36360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RvQCu-0007i1-59; Thu, 09 Feb 2012 04:22:24 -0500
Received: by wibhi20 with SMTP id hi20so1152830wib.4
	for <multiple recipients>; Thu, 09 Feb 2012 01:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TGUw5kS/FWXj3+T12XBUp9NluSNa8enyqwOIVN7jA2U=;
	b=c1JIHqtZWEeFGu/iLZgJY0/SISepsb8yd8pO1qhc3Rt2bxt35H+nGI4ItZzDew2MCd
	S9c8MF5otkHVe5nYE3+qveNXGKYQdxyJlz34M4eyVC3XezGl2sRhuONguU165KQU2D48
	f1B31WsqIx85z9SUv1AcBd+jax/Vj9eOF6O10=
Received: by 10.181.11.231 with SMTP id el7mr36717896wid.0.1328779342892;
	Thu, 09 Feb 2012 01:22:22 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id ho4sm5474843wib.3.2012.02.09.01.22.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 01:22:21 -0800 (PST)
Date: Thu, 9 Feb 2012 08:30:13 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Ulrich Hecht <uli@suse.de>
Message-ID: <20120209083013.GA30974@stefanha-thinkpad.localdomain>
References: <1328010196-32134-1-git-send-email-uli@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1328010196-32134-1-git-send-email-uli@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] linux-user: fail execve() if env/args
 too big
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
X-List-Received-Date: Thu, 09 Feb 2012 09:22:49 -0000

On Tue, Jan 31, 2012 at 12:43:16PM +0100, Ulrich Hecht wrote:
> If the host's page size is equal to or smaller than the target's, native
> execve() will fail appropriately with E2BIG if called with too big an
> environment for the target to handle. It may falsely succeed, however, if
> the host's page size is bigger, and feed the executed target process an
> environment that is too big for it to handle, at which point QEMU barfs and
> exits, confusing procmail's autoconf script and causing the build to fail.
> 
> This patch makes sure that execve() will return E2BIG if the environment is
> too large for the target.
> 
> Signed-off-by: Ulrich Hecht <uli@suse.de>
> ---
>  linux-user/syscall.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

