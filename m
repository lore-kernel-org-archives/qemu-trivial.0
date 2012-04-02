Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SEgvH-0008IT-Nn
	for mharc-qemu-trivial@gnu.org; Mon, 02 Apr 2012 09:03:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SEgvA-0007wx-5u
	for qemu-trivial@nongnu.org; Mon, 02 Apr 2012 09:03:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SEgv4-0001o8-40
	for qemu-trivial@nongnu.org; Mon, 02 Apr 2012 09:03:43 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:34987)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SEgur-0001lx-1J; Mon, 02 Apr 2012 09:03:25 -0400
Received: by wibhr17 with SMTP id hr17so2331552wib.10
	for <multiple recipients>; Mon, 02 Apr 2012 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Keg419+2ljShAl4p6unVlYu7bnTXkFsxzg+qaODQ5oU=;
	b=ktMfzfFUV1EHx+mj/WrEr0zr1dUFNZTrr3OAlcLH1SGpV0DMjR5Pl74xU0je+R61EU
	pYdBp2fiHs9UTZHlHZVeueQ6kTIRSksPtfNuXPVOlq3krVJFiNMR3dxkHK6kNahYGnt9
	KY8WGMsxRDki674lNyU2bXkYzy2sM88PhpOZYN3D+VDNCOvm8fC+z42OH9dhfjCIp4KC
	/JlLf4CnHwlWLjxt5f/9EjH5Oc+OO0SmmYeXlnbQmzdzr5dmajBwESVNXRevMXN5oudE
	BCvgLVicZS6g3c3v8xRAFDWw9Lp5QKqVusT0pTvqbGWLkpWaGrjkeIHAMdvTrriWfWyw
	brng==
Received: by 10.180.101.230 with SMTP id fj6mr25450840wib.13.1333371802389;
	Mon, 02 Apr 2012 06:03:22 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id j3sm55104804wiw.1.2012.04.02.06.03.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Apr 2012 06:03:21 -0700 (PDT)
Date: Mon, 2 Apr 2012 14:03:20 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Frediano Ziglio <freddy77@gmail.com>
Message-ID: <20120402130320.GC11583@stefanha-thinkpad.localdomain>
References: <1333218734-23920-1-git-send-email-freddy77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333218734-23920-1-git-send-email-freddy77@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] make qemu_event_handle static
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
X-List-Received-Date: Mon, 02 Apr 2012 13:03:49 -0000

On Sat, Mar 31, 2012 at 07:32:14PM +0100, Frediano Ziglio wrote:
> 
> Signed-off-by: Frediano Ziglio <freddy77@gmail.com>
> ---
>  main-loop.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

