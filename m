Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RTWWa-0004Du-Vl
	for mharc-qemu-trivial@gnu.org; Thu, 24 Nov 2011 05:27:24 -0500
Received: from eggs.gnu.org ([140.186.70.92]:39266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RTWWV-0004Dm-SY
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 05:27:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RTWWR-0003Mp-Mu
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 05:27:19 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:62308)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RTWWR-0003Ma-E4; Thu, 24 Nov 2011 05:27:15 -0500
Received: by bkbzu5 with SMTP id zu5so3025133bkb.4
	for <multiple recipients>; Thu, 24 Nov 2011 02:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iQqYMGpRCghDYg4PIVLIYn6aokTcNcquS4M/wLkPAYU=;
	b=CgZWcfUOglWB5xnOf80D3ZorVnzJXLrhIqptomfPkaw35K255xOkvkeqKEXHaHA3Sk
	fJzBBd2VbBcAlbAuysqbVTUjKJEfPyGLP07nyS+zuuP+e77vYzQuEYoNIFelvj61SHra
	tcnTbbb4JJWShYaxQEJijs4ZOkUWKqCLthP9k=
Received: by 10.204.9.204 with SMTP id m12mr28532155bkm.131.1322130434289;
	Thu, 24 Nov 2011 02:27:14 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	a10sm24963414fam.20.2011.11.24.02.27.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 02:27:13 -0800 (PST)
Date: Thu, 24 Nov 2011 10:27:12 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mark <wudx05@gmail.com>
Message-ID: <20111124102712.GA27170@stefanha-thinkpad.localdomain>
References: <CAGtkxYxddRxBCJib+0xid-2BcS4WaUoxE1-Hc6FcsVwBDHVK4Q@mail.gmail.com>
	<CAOfR6VHZHvcp-808F5n2NPv4E_zUjeToNBjx_2FyM+Wjb+oY5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOfR6VHZHvcp-808F5n2NPv4E_zUjeToNBjx_2FyM+Wjb+oY5A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Zhi Hui Li <zhihuili@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] os-win32.c : fix memory leak
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
X-List-Received-Date: Thu, 24 Nov 2011 10:27:24 -0000

On Thu, Nov 24, 2011 at 05:15:30PM +0800, Mark wrote:
> If you free the string, it will cause the environment variable unavailable.
>  More details please see the following text extracted from manual of
> "putenv":
> 
>        The  libc4  and  libc5  and  glibc 2.1.2 versions conform to SUSv2:
> the pointer string given to putenv() is used.  In particular, this
>        string becomes part of the environment; changing it later will
> change the environment.  (Thus, it is an error is to call putenv() with
>        an automatic variable as the argument, then return from the calling
> function while string is still part of the environment.)  However,
>        glibc 2.0-2.1.1 differs: a copy of the string is used.  On the one
> hand this causes a memory leak, and on the other hand  it  violates
>        SUSv2.  This has been fixed in glibc 2.1.2.

I don't think this matters since os-win32.c is only built for mingw,
which uses the Microsoft C runtime and not glibc.

However, there is no documentation for putenv(3) on MSDN because the
function has been deprecated :(.  So I think the safest thing to do is
to assume this will leak memory but we are not allowed to free the
string.

Either you could investigate the new _putenv(3) and test the Windows
build to make sure it works.  Or you could send a patch that adds a
comment explaining why there is a memory leak here.

Stefan

