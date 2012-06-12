Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SeNgd-0006S9-B3
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jun 2012 05:46:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SeNgX-0006Rk-D6
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2012 05:46:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SeNgR-0004a5-43
	for qemu-trivial@nongnu.org; Tue, 12 Jun 2012 05:46:48 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:44516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SeNgQ-0004Z6-Qy; Tue, 12 Jun 2012 05:46:43 -0400
Received: by bkwj10 with SMTP id j10so4709721bkw.4
	for <multiple recipients>; Tue, 12 Jun 2012 02:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TaFtAWgDTMEeglXGTH8xr5mtit8++hwfLXbZNRCHOMA=;
	b=iKPUzQaLDQWiLAlj5MwpJozMEXnECeGN0wu7KoTiLfVX/eZEVmsH1RFDhIbSHap4dV
	B/H6QkuWkAPMPNh0eMv6SvgNN4fMdCFh12Sn0JcooyIJcLTk9HmQRfbFTiWN/0EfLfmR
	oeBX6GjQe5uzGgWOJtoSm1AvDnO/LX9vxsGhR2IQTKXY99iuIG1uVcPz1iUIal/aQV1Z
	sa17El57o1dWzVYYdA3TSDakUhwx/brBBxCCpVl7Jo9pgCqdbzHfg7qUln3iKczeR68N
	a/LKaNSqvi1KNYcjhPlpTInhTELltuw2ut6vc496qNEeCrwW6NUGQutUlIkzA4J6UJR0
	LPGQ==
Received: by 10.205.129.8 with SMTP id hg8mr11581048bkc.25.1339494399450;
	Tue, 12 Jun 2012 02:46:39 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	h18sm19511410bkh.8.2012.06.12.02.46.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jun 2012 02:46:39 -0700 (PDT)
Date: Tue, 12 Jun 2012 10:46:37 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120612094637.GB29104@stefanha-thinkpad.localdomain>
References: <1339225719-5434-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1339225719-5434-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Makefile: Remove
	BUILD_DIR from qapi-dir
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
X-List-Received-Date: Tue, 12 Jun 2012 09:46:53 -0000

On Sat, Jun 09, 2012 at 09:08:38AM +0200, Stefan Weil wrote:
> qapi-dir does not need an absolute path. All other build directories
> are relative. When BUILD_DIR is removed, the build output looks better
> (no long lines with absolute paths when everything else uses short
> lines):
> 
>   GEN   qapi-generated/qga-qapi-types.c
>   CC    qapi-generated/qga-qapi-types.o
>   GEN   qapi-generated/qga-qapi-visit.c
>   CC    qapi-generated/qga-qapi-visit.o
>   GEN   qapi-generated/qga-qmp-marshal.c
>   CC    qapi-generated/qga-qmp-marshal.o
> 
> Using a relative path also avoids potential problems when BUILD_DIR
> includes blanks.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

