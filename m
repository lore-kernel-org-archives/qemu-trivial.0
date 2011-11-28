Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RUymW-0005N6-11
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2011 05:49:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:42776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RUymO-00052e-O3
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 05:49:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RUymK-0006Fk-Vb
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 05:49:44 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:56918)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RUymF-0006Ez-FG; Mon, 28 Nov 2011 05:49:35 -0500
Received: by bkbzu5 with SMTP id zu5so9135752bkb.4
	for <multiple recipients>; Mon, 28 Nov 2011 02:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kC4FRV1JdWzKt+99rXSZmFK/qK89hkjDeG7XAjrpt2k=;
	b=KgZutmi4KmcTjFaXK+lKFcyXzQm8p0KLtfWhzuM19B33S3RSzAWyMDjOPS2BCgNoXf
	JYPf2gHlG9g6u/0psQwi/P4H6fIpplOXi4qF9gpg/ZosVAwCnXwgqjUc+5ioSp90k3BB
	a23X05ClcwNDt984woyQGoBFUsBXrzuWbt+MM=
Received: by 10.204.13.68 with SMTP id b4mr44295030bka.32.1322477373624;
	Mon, 28 Nov 2011 02:49:33 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	x14sm28875869bkf.10.2011.11.28.02.49.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 02:49:31 -0800 (PST)
Date: Mon, 28 Nov 2011 10:49:30 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Zhi Hui Li <zhihuili@linux.vnet.ibm.com>
Message-ID: <20111128104930.GA7173@stefanha-thinkpad.localdomain>
References: <CAGtkxYxddRxBCJib+0xid-2BcS4WaUoxE1-Hc6FcsVwBDHVK4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGtkxYxddRxBCJib+0xid-2BcS4WaUoxE1-Hc6FcsVwBDHVK4Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [PATCH] os-win32.c : fix memory leak
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
X-List-Received-Date: Mon, 28 Nov 2011 10:49:48 -0000

On Thu, Nov 24, 2011 at 04:27:52PM +0800, Zhi Hui Li wrote:
> string is allocated by g_malloc, will not be used after putenv, should be
> free before return.
> 
> Signed-off-by: Li Zhi Hui <zhihuili@linux.vnet.ibm.com>
> ---
>  os-win32.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

