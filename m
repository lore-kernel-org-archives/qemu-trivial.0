Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U0Uip-0002l9-Gl
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2013 05:16:51 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0Uil-0002Ym-Mn
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2013 05:16:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0Uij-00014m-Vb
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2013 05:16:47 -0500
Received: from mail-ea0-f173.google.com ([209.85.215.173]:57924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U0Uig-00012Z-AU; Wed, 30 Jan 2013 05:16:42 -0500
Received: by mail-ea0-f173.google.com with SMTP id i1so619382eaa.32
	for <multiple recipients>; Wed, 30 Jan 2013 02:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=3UcS2KggZzlIh5Xw9H75nb2D0TtmOmKyYuK39EoLJdI=;
	b=ErG6+J9kjCs6EmxaAv2wGh//PvPaTiTFv2VXppokuLS8Mx7VTmJlSIOmQ4uPpW93x9
	oaT/0CujWoZpxjAwR0oiFMa3Q7Isq1Z0+CSWBinHuas6sxQ1cA/iMIu+osnRjOfb3QCN
	fi5x+1A+e+HaU1gjbTcu6DCpQa+gCw47BqJ6aSgh64/w6/ITMe2oOtDmXTepSUTa21f+
	z8GgVUiuYE9gPZrlS3wy5K+ZgyPG0z0R7i4WyY1r7EFBt26LziqFSWq394FpNtR7C/IO
	zq6UnUSzium9J8hEHxROEtvsVsGnp0xv88vTNlLxGTzNWRpwOivcX8ZuO8FG4KC3QFmp
	wIcA==
X-Received: by 10.14.198.198 with SMTP id v46mr13861469een.4.1359541001226;
	Wed, 30 Jan 2013 02:16:41 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id e2sm1218129eeo.8.2013.01.30.02.16.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 02:16:40 -0800 (PST)
Date: Wed, 30 Jan 2013 11:16:35 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130130101635.GA29972@stefanha-thinkpad.redhat.com>
References: <1358769827-7317-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1358769827-7317-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2] qemu-pixman.h: Avoid mutual inclusion
 loop with console.h
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
X-List-Received-Date: Wed, 30 Jan 2013 10:16:50 -0000

On Mon, Jan 21, 2013 at 12:03:47PM +0000, Peter Maydell wrote:
> Remove an unnecessary mutual inclusion loop between qemu-pixman.h and
> console.h, since the former was only including the latter for
> 'PixelFormat*', which can be provided by typedefs.h.  This requires a
> minor adjustment to the files which included qemu-pixman.h, since
> they were relying on it implicitly dragging in all of console.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Stefan: I've made the obvious change to fix the spice compile issue,
> but none of my systems have a new enough spice-protocol/spice-server
> to allow me to configure with spice enabled. I'd appreciate it if
> you could check it does indeed compile OK now...
> 
>  include/ui/qemu-pixman.h   |    2 +-
>  include/ui/spice-display.h |    1 +
>  ui/qemu-pixman.c           |    3 ++-
>  3 files changed, 4 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

