Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fG4s2-0000Kg-R2
	for mharc-qemu-trivial@gnu.org; Tue, 08 May 2018 11:49:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1fG4rz-0000J7-I7
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 11:49:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1fG4ry-0001oe-Sv
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 11:49:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jcody@redhat.com>)
	id 1fG4rq-0001j7-Rh; Tue, 08 May 2018 11:49:30 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com
	[10.5.11.24])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5EB061B8C;
	Tue,  8 May 2018 15:49:29 +0000 (UTC)
Received: from localhost (ovpn-117-144.phx2.redhat.com [10.3.117.144])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E63230B36E3;
	Tue,  8 May 2018 15:49:27 +0000 (UTC)
Date: Tue, 8 May 2018 11:49:27 -0400
From: Jeff Cody <jcody@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20180508154927.GE6722@localhost.localdomain>
References: <20180503225648.13153-1-jsnow@redhat.com>
	<20180503225648.13153-6-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180503225648.13153-6-jsnow@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 08 May 2018 15:49:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH 5/5] qemu-img-cmds.hx: add
 passive-aggressive note
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 08 May 2018 15:49:42 -0000

On Thu, May 03, 2018 at 06:56:48PM -0400, John Snow wrote:
> I'm kidding. It's very easy to forget there are per-command sections
> in the texi, and insane that we don't autogenerate those, too.
> 
> Until then, leave a little post-it note in this .hx file until I
> find a way to delete it.
>

Hopefully helps, but as you said the real fix is autogeneration.

Reviewed-by: Jeff Cody <jcody@redhat.com>

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  qemu-img-cmds.hx | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
> index 84deb858af..3d2f7b26eb 100644
> --- a/qemu-img-cmds.hx
> +++ b/qemu-img-cmds.hx
> @@ -6,6 +6,9 @@ HXCOMM DEF(command, callback, arg_string) is used to construct
>  HXCOMM command structures and help message.
>  HXCOMM HXCOMM can be used for comments, discarded from both texi and C
>  
> +HXCOMM When amending the TEXI sections, please remember to copy the usage
> +HXCOMM over to the per-command sections in qemu-img.texi.
> +
>  STEXI
>  @table @option
>  ETEXI
> -- 
> 2.14.3
> 
> 

