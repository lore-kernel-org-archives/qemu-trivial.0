Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJ2pd-0005xh-Ff
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2011 08:43:45 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJ2pa-0005o5-Je
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 08:43:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RJ2pV-0003aN-Hr
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 08:43:39 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:33968)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RJ2pK-0003Vi-H3; Wed, 26 Oct 2011 08:43:26 -0400
Received: by wyh15 with SMTP id 15so1776633wyh.4
	for <multiple recipients>; Wed, 26 Oct 2011 05:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=lrPdtsVFfplTOBjCad7r4km9KWlOR1HRzkpxW+D+Cow=;
	b=rBZpsnSwm482z/qK0zBlypN6vYKpa5eGAnT6s+Wv31sg8jsqLneLNUt3kS/8nI/xfo
	/hNNtx18vOit2gMxl3ZX3qf+DaLiMm014nUr5kF+ESV3hD9jKjiIRkplP+Mh6edDoT+/
	u1kqrROJFbIwvMlPPpjJTIY1NXF7wHhiBuhyw=
Received: by 10.216.230.83 with SMTP id i61mr8160078weq.39.1319633005202;
	Wed, 26 Oct 2011 05:43:25 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id es5sm2957200wbb.11.2011.10.26.05.43.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Oct 2011 05:43:24 -0700 (PDT)
Date: Wed, 26 Oct 2011 13:43:22 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20111026124322.GA27267@stefanha-thinkpad.localdomain>
References: <20111021095709.GA10092@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20111021095709.GA10092@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] exec.c: Remove useless comment
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
X-List-Received-Date: Wed, 26 Oct 2011 12:43:43 -0000

On Fri, Oct 21, 2011 at 05:57:09PM +0800, 陳韋任 wrote:
>   As phys_ram_size had been removed since QEMU 0.12. Remove the useless
> comment.
> 
> Signed-off-by: Chen Wen-Ren <chenwj@iis.sinica.edu.tw>
> ---
>  exec.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

