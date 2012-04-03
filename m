Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SEzXW-0007fV-Hp
	for mharc-qemu-trivial@gnu.org; Tue, 03 Apr 2012 04:56:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SEzXU-0007fG-3x
	for qemu-trivial@nongnu.org; Tue, 03 Apr 2012 04:56:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SEzXN-0008LR-NH
	for qemu-trivial@nongnu.org; Tue, 03 Apr 2012 04:56:31 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:43589)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SEzXN-0008LF-EH; Tue, 03 Apr 2012 04:56:25 -0400
Received: by wibhn6 with SMTP id hn6so3036559wib.10
	for <multiple recipients>; Tue, 03 Apr 2012 01:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZzoCz2v9gtQ/ETMXomjmJWITPs2+q44toxYpqBHLQWI=;
	b=GpTOsSOud9R2cUCpsOBt4386lGThvDkkCtHm1aQcpQZg/oOJoCVlgub5KS25ib2kEx
	ptUMLW2KI3jSS/nYU6fDwCIR3tI4gZapJGadkNvKgTIIlHfHLYHxZWhudqW9CJNqDt99
	T2VgpuTJ6wBq7xO38Ys3iAwITA2sFZFS25rpHowAAwrR5bVjIohHFZUtA7b9h6D0tdSK
	AiLgIkrbnG4NJloBo7ESfggFh1ycJ3FJHBLOikBNt4qjHmYSsglBU0LuvtfMCq32KAsf
	x2IWGazinL2MlPcGlctcVxV+PQW05ob7deMcAsyKM+jQKNBp/fLc13enHpokZmugsRnv
	rhtw==
Received: by 10.180.104.137 with SMTP id ge9mr34199641wib.20.1333443382524;
	Tue, 03 Apr 2012 01:56:22 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	ea6sm41206848wib.5.2012.04.03.01.56.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Apr 2012 01:56:21 -0700 (PDT)
Date: Tue, 3 Apr 2012 09:56:20 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20120403085620.GC30614@stefanha-thinkpad.localdomain>
References: <1333379439-8688-1-git-send-email-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333379439-8688-1-git-send-email-anthony.perard@citrix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial <qemu-trivial@nongnu.org>, QEMU-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH trivial] make: fix clean rule by removing
 build file in qom/
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
X-List-Received-Date: Tue, 03 Apr 2012 08:56:33 -0000

On Mon, Apr 02, 2012 at 04:10:39PM +0100, Anthony PERARD wrote:
> Make clean does not clean the 'qom' directory, leaving *.o and *.d files. This
> patch fixes this.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> ---
>  Makefile |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

> tg: (a3b6181..) fix/make-clean (depends on: master)

What's this?  I'm curious.  First I thought it was a signature joke that
I didn't get but I guess it's for some kind of commit tracking system?

Stefan

