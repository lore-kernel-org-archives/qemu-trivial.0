Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNRvX-0001Kg-OX
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 11:20:03 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNRvU-0001KX-Op
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 11:20:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNRvT-0007aA-8v
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 11:20:00 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:34893)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNRvT-0007Zy-02
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 11:19:59 -0500
Received: by faap15 with SMTP id p15so6431731faa.4
	for <qemu-trivial@nongnu.org>; Mon, 07 Nov 2011 08:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=D9GthUGIUS9g2HnfRJnnRni3T312juYCmkRdTdd1BMI=;
	b=Lr5p+bXvYJu6vQJ5/m+cDRH3OOeRMe0PxRGZNEOUiUysjZac3OiMM68kuS/0/bkBa7
	mO3tkGhc5ItKvfKe7LZN7QV3Sl6ENhLtl2vKvnEMcSHfCNi8wTiPDun7qKrwDKZoNAKS
	t2ZbXBKnQxrfEY20p2Jk13nCh2C25gx2o4mXA=
Received: by 10.223.7.14 with SMTP id b14mr49097913fab.10.1320682798228;
	Mon, 07 Nov 2011 08:19:58 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id i3sm31813077faf.0.2011.11.07.08.19.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 08:19:57 -0800 (PST)
Date: Mon, 7 Nov 2011 16:19:56 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20111107161956.GC14396@stefanha-thinkpad.localdomain>
References: <20111104193331.GA37125@cs.nctu.edu.tw>
	<20111107081517.GD9450@stefanha-thinkpad.localdomain>
	<20111107094205.GA19396@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20111107094205.GA19396@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Show --cpu option on the help
 list
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
X-List-Received-Date: Mon, 07 Nov 2011 16:20:02 -0000

On Mon, Nov 07, 2011 at 05:42:05PM +0800, 陳韋任 wrote:
> > Please say "Build for host CPU [$cpu]" so that it's 100% clear that this
> > is the host architecture and not the target.
> 
>   Fix. Thanks. :)
> 
> Signed-off-by: Chen Wen-Ren (陳韋任) <chenwj@iis.sinica.edu.tw>
> ---
>  configure |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

