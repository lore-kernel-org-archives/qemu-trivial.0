Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TOkMS-0005Mt-IV
	for mharc-qemu-trivial@gnu.org; Thu, 18 Oct 2012 03:17:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TOkMI-0004qV-Py
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 03:17:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TOkMD-0005Lc-8S
	for qemu-trivial@nongnu.org; Thu, 18 Oct 2012 03:17:34 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:44565)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TOkM1-0005JR-Sz; Thu, 18 Oct 2012 03:17:18 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so3358685bkc.4
	for <multiple recipients>; Thu, 18 Oct 2012 00:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k04i8PkdHnGH1aSaSTVmrWClO0oZ/PpghWAbmg3JbUY=;
	b=QvyFqlTUPNjFW4n0Qjh72N/GQqla6KqlNwdbUtJWJv+GQ5khunU+LGvvh/RFSCZhEn
	/KXNceieDuBCp8OLtjQ3Guzvn1Ft040etvlJP2Yt8uGT2iLete1AR6xGgT2iHprMNm7K
	oCEkcI9F7tD/8Dc7zFVKCCFRSYGCNKzhnlSJgTXkx/nP9EAGbI9IRSNDzxGJpVijaM0l
	j3KyoOr1egEJwt/KBUvcDRAUonHHEa3IVRJOWBCSuz2PKk+lfeFDXLD8ktjUEUXFqXBj
	2UYsUc6CF6WZ+ZXQiGwQmMCas4d94IFUtUEMCr4AO56tg3MDxWUff/QhhpvdMdHP0/D+
	pxig==
Received: by 10.204.5.204 with SMTP id 12mr6093002bkw.89.1350544637408;
	Thu, 18 Oct 2012 00:17:17 -0700 (PDT)
Received: from localhost (188-194-252-80-dynip.superkabel.de. [188.194.252.80])
	by mx.google.com with ESMTPS id z22sm13856419bkw.2.2012.10.18.00.17.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 00:17:16 -0700 (PDT)
Date: Thu, 18 Oct 2012 09:15:34 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
Message-ID: <20121018071534.GB22425@stefanha-thinkpad.redhat.com>
References: <20121017164525.0e9b2941@doriath.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20121017164525.0e9b2941@doriath.home>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] block: bdrv_create(): don't leak
 cco.filename on error
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
X-List-Received-Date: Thu, 18 Oct 2012 07:17:42 -0000

On Wed, Oct 17, 2012 at 04:45:25PM -0300, Luiz Capitulino wrote:
> 
> Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>
> ---
>  block.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

