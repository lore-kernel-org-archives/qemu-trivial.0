Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RlKaq-0008Em-Lb
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2012 08:21:24 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlKak-000849-VH
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:21:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlKab-0007O9-Cd
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:21:18 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:53216)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RlKaV-0007NY-J3; Thu, 12 Jan 2012 08:21:03 -0500
Received: by eaak11 with SMTP id k11so696113eaa.4
	for <multiple recipients>; Thu, 12 Jan 2012 05:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Gzr3qUoTEc+g72dvQwH62EStWRTW7+uhVMQDyDFYG80=;
	b=XzGKCq2F9mVW5mocsixQ83IlbB51sTTqqG/Dz6CoUAGUNvtxNZKzOqP0Q92zQ6fjwF
	z1dofwBrpcEZ3hOS0EmltntEpImg1BLPUAct/amv/dLeK3EL130Ql72PnkRIGVo8ah4Z
	CC+0Jj+JsrDTtSaUB8vlayzovCSi8aLa5S/g4=
Received: by 10.213.9.134 with SMTP id l6mr787855ebl.52.1326374462854;
	Thu, 12 Jan 2012 05:21:02 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	y12sm19385821eeb.11.2012.01.12.05.21.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 05:21:02 -0800 (PST)
Date: Thu, 12 Jan 2012 13:21:00 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120112132100.GC22879@stefanha-thinkpad.localdomain>
References: <1326130191-20344-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1326130191-20344-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Add 'fall through' comments to case
 statements without break
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
X-List-Received-Date: Thu, 12 Jan 2012 13:21:23 -0000

On Mon, Jan 09, 2012 at 06:29:51PM +0100, Stefan Weil wrote:
> These comments are used by static code analysis tools and in code reviews
> to avoid false warnings because of missing break statements.
> 
> The case statements handled here were reported by coverity.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/pcnet.c    |    1 +
>  json-lexer.c  |    1 +
>  qemu-option.c |    4 ++++
>  3 files changed, 6 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

