Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK6l0-0002AD-Vl
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 08:11:54 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6kx-00021Z-VB
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 08:11:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6kw-0001eo-O5
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 08:11:51 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:35439)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK6ki-0001Z7-5F; Fri, 05 Oct 2012 08:11:36 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so760191bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 05:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SAtpcZKyaKVpfTWzrH5oPL6WV9z1keMysOKryJl5G6Q=;
	b=VSqQYpcT/qVs1SuXoJprQ56zygQhXrCF3TjnTu4tpGg4MAxtIkyzoq2Fx36NsVbXtE
	LtMOuMdG3pRbdf2Wk8zE6KqUPN/OUGE2NSDJstt3EdW8rU+FZrSftQypuHyVl/QUPEdR
	Sa8R+QOhatPmBd2i10kldSwwJXXjnEPb7oknvODgZ6aCdd2tXE10bKlXgBi4JIs6B3El
	DJ30/Pao+6OXcHOuFZLpVUx6fnGKQO6oQLQfmhIfjaxNP6HdgE+LZvsP4JvVuBbtJoYe
	G1LBqZK5waR0l8SxLRoep98WE3ZT+ydyYSD70srBDM0H2vtFRNcdQClIyRccZKXqUmiY
	iUgw==
Received: by 10.204.6.17 with SMTP id 17mr2632373bkx.129.1349439095131;
	Fri, 05 Oct 2012 05:11:35 -0700 (PDT)
Received: from localhost ([82.113.121.2])
	by mx.google.com with ESMTPS id ht18sm2843653bkc.14.2012.10.05.05.11.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 05:11:34 -0700 (PDT)
Date: Fri, 5 Oct 2012 14:11:32 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121005121132.GA10951@stefanha-thinkpad.redhat.com>
References: <1348724502-22542-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1348724502-22542-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] cpu: Add missing 'static' attribute to
 qemu_global_mutex
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
X-List-Received-Date: Fri, 05 Oct 2012 12:11:53 -0000

On Thu, Sep 27, 2012 at 07:41:42AM +0200, Stefan Weil wrote:
> Contrary to its name, 'qemu_global_mutex' is only used locally
> in cpus.c.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  cpus.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

