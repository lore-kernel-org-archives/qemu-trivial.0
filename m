Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpKWt-00061S-5g
	for mharc-qemu-trivial@gnu.org; Wed, 28 Sep 2016 15:28:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bpKWq-0005yq-At
	for qemu-trivial@nongnu.org; Wed, 28 Sep 2016 15:28:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bpKWm-0004Wp-4d
	for qemu-trivial@nongnu.org; Wed, 28 Sep 2016 15:28:27 -0400
Received: from mail.weilnetz.de ([37.221.199.173]:48137)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bpKWl-0004Wf-V3
	for qemu-trivial@nongnu.org; Wed, 28 Sep 2016 15:28:24 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id EEDCC11810AF;
	Wed, 28 Sep 2016 21:28:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Ctt_mJiHfilB; Wed, 28 Sep 2016 21:28:20 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (p54AC80C7.dip0.t-ipconnect.de
	[84.172.128.199])
	by mail.weilnetz.de (Postfix) with ESMTPSA id C317D11810A5;
	Wed, 28 Sep 2016 21:28:19 +0200 (CEST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1474986431-2701-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <01cb50c8-bc3b-b248-2ac9-5045d3898346@weilnetz.de>
Date: Wed, 28 Sep 2016 21:28:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474986431-2701-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add some more pattern to
 recognize all win32 related files
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
X-List-Received-Date: Wed, 28 Sep 2016 19:28:29 -0000

Am 27.09.2016 um 16:27 schrieb Thomas Huth:
> The get_maintainer.pl script currently thinks that the win32
> related files in the util and include folders are currently
> unmaintained. Thus let's add some additional wildcards to
> match these files.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6902885..a5dec30 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -324,6 +324,8 @@ L: qemu-devel@nongnu.org
>  M: Stefan Weil <sw@weilnetz.de>
>  S: Maintained
>  F: *win32*
> +F: */*win32*
> +F: include/*/*win32*
>  F: qemu.nsi
>
>  ARM Machines
>

Thank you, Thomas, for this patch. I suggest a small modification 
because there is already a maintainer for qga/ (Michael Roth) and I 
cannot contribute much to the QEMU guest agent. Therefore I'd prefer 
excluding that directory. That requires replacing */*win32* by an 
explicit list of directories.

Otherwise fine for me.

Reviewed-by: Stefan Weil <sw@weilnetz.de>


