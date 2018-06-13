Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSzr1-00014Z-Ca
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 03:06:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fSzqx-000139-Av
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 03:06:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fSzqw-0002Zx-CR
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 03:05:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43242 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fSzqo-0002SF-Cj; Wed, 13 Jun 2018 03:05:50 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1972818BAFD;
	Wed, 13 Jun 2018 07:05:49 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4C4671117635;
	Wed, 13 Jun 2018 07:05:40 +0000 (UTC)
Date: Wed, 13 Jun 2018 09:05:37 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Kevin Wolf
	<kwolf@redhat.com>, patches@linaro.org, Markus Armbruster
	<armbru@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
	<f4bug@amsat.org>, Stefan Hajnoczi <stefanha@redhat.com>, John Snow
	<jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Message-ID: <20180613090537.0b811eb8.cohuck@redhat.com>
In-Reply-To: <20180612124729.0e630825@w520.home>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
	<650048df-f4b1-b351-f877-be8c84197ba2@linaro.org>
	<85642e2a-f00a-3d85-8525-0ae89e4d71c9@redhat.com>
	<20180612124729.0e630825@w520.home>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 07:05:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 07:05:49 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] CODING_STYLE: Define our
 preferred form for multiline comments
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
X-List-Received-Date: Wed, 13 Jun 2018 07:06:02 -0000

On Tue, 12 Jun 2018 12:47:29 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Tue, 12 Jun 2018 20:12:02 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
> > On 12.06.2018 19:30, Richard Henderson wrote:  
> > > On 06/11/2018 04:17 AM, Peter Maydell wrote:    
> > >> The codebase has a bit of a mix of different multiline
> > >> comment styles. State a preference for the Linux kernel
> > >> style:
> > >>     /*
> > >>      * Star on the left for each line.
> > >>      * Leading slash-star and trailing star-slash
> > >>      * each go on a line of their own.
> > >>      */
> > >>
> > >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > >> ---
> > >> This is not my personal favourite, but seemed to be the
> > >> closest we had to consensus in the mail thread for v1;
> > >> I can live with it in order to avoid getting patches which
> > >> use the styles I like even less :-)    
> > > 
> > > Honestly, I don't like this except for "important" comments.
> > > 
> > > A "small" comment, e.g. one that doesn't quite fit on a single line, now takes
> > > 4 lines instead of 2.  Which is really annoying and IMO tends to break flow.
> > > 
> > > If you don't like
> > > 
> > >   /* gnu
> > >      style */
> > > 
> > > or
> > > 
> > >   /* whatever
> > >    * this is */
> > > 
> > > could you live with
> > > 
> > >   // c99/c++
> > >   // comments    
> > 
> > FWIW:
> > 
> > +1 for one or two of those compact styles for two- or three-line comments.  
> 
> or four-line or single paragraphs or comments that rhyme with
> "orange"...  If the comment is too large for a single line, then take
> some time to say it more concisely, or maybe it does deserve enough
> thought to frame a nice paragraph for it.  We're well into personal
> style here, so either this is important enough to make some people
> unhappy or we should leave it to maintainer preference and consistency
> within a file/area.  Thanks,

+1 to maintainer judgment and consistency.

(And FWIW, c++ style comments are what I use when I comment something
out for debugging, so I don't like them in regular code :)

