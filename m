Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RTWjW-000104-2q
	for mharc-qemu-trivial@gnu.org; Thu, 24 Nov 2011 05:40:46 -0500
Received: from eggs.gnu.org ([140.186.70.92]:32960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RTWjM-0000aa-Mc
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 05:40:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RTWjH-0005kC-5w
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 05:40:36 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:65158)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RTWj9-0005j9-5x; Thu, 24 Nov 2011 05:40:23 -0500
Received: by faas14 with SMTP id s14so2958831faa.4
	for <multiple recipients>; Thu, 24 Nov 2011 02:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eBcFX4CIYy0bdVOSnjvC1piqPwIfUXQuUbRyT14HiCs=;
	b=tFrNXeMc72JezyVW+ajRvT59dcyX8ISrFeLlfSKu1CkjXrNZolTYZIUHgzaBUUVx6/
	mmZj0A568Iqs9oM0A3OQIWl64JIwQfP+N3c40F23oKz6Sa3KPCAqdY2/BJmuGGJe/x9l
	zgkgTP1nwYDRrrLBCRNOW/3xjtc73QVf3NOOM=
Received: by 10.205.134.143 with SMTP id ic15mr28857562bkc.45.1322131221782;
	Thu, 24 Nov 2011 02:40:21 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	q16sm25011077fae.6.2011.11.24.02.40.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 02:40:21 -0800 (PST)
Date: Thu, 24 Nov 2011 10:40:20 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Zhi Hui Li <zhihuili@linux.vnet.ibm.com>
Message-ID: <20111124104020.GB7227@stefanha-thinkpad.localdomain>
References: <CAGtkxYxBfYxcVpQopgpkvf-POUf-uDEjjRht5sOye0REyFExAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGtkxYxBfYxcVpQopgpkvf-POUf-uDEjjRht5sOye0REyFExAQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [PATCH] net/socket.c : fix memory leak
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
X-List-Received-Date: Thu, 24 Nov 2011 10:40:42 -0000

On Thu, Nov 24, 2011 at 04:23:00PM +0800, Zhi Hui Li wrote:
> Signed-off-by: Li Zhi Hui <zhihuili@linux.vnet.ibm.com>
> ---
>  net/socket.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

