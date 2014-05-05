Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhHVl-0002rE-Eg
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 07:56:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WhHVf-0002qM-51
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 07:56:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WhHVZ-0003Y6-5q
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 07:56:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39730)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1WhHVY-0003Xj-V2; Mon, 05 May 2014 07:56:33 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s45BuURu024511
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 5 May 2014 07:56:31 -0400
Received: from localhost (dhcp-14-247.nay.redhat.com [10.66.14.247])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s45BUXR1003909; Mon, 5 May 2014 07:30:34 -0400
Date: Mon, 5 May 2014 19:30:45 +0800
From: Fam Zheng <famz@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140505113045.GC4370@T430.nay.redhat.com>
References: <1399287591-6525-1-git-send-email-famz@redhat.com>
	<1399287591-6525-2-git-send-email-famz@redhat.com>
	<5367708D.80803@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5367708D.80803@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/2] docs/memory.txt: Put
 one whitespace between sentences
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
X-List-Received-Date: Mon, 05 May 2014 11:56:44 -0000

On Mon, 05/05 15:05, Michael Tokarev wrote:
> 05.05.2014 14:59, Fam Zheng wrote:
> > In other words, whitespace changes only.
> 
> >  The memory API models the memory and I/O buses and controllers of a QEMU
> > -machine.  It attempts to allow modelling of:
> > +machine. It attempts to allow modelling of:
> 
> What's the point?  In text form, it is quite often and, to my taste, quite
> normal to use 2 spaces after the full-dot (at the end of the sentence), just
> like an extra line between paragraphs.  This way, it is easier to separate
> sentences between each other.
> 
> In real typography, 1.5-sized space is usually used in such places.  But since
> plaintext format has no 1.5-sized space, 2 spaces is used.
> 
> I'd send an opposite patch, which adds additional space where it is missing.. :)
> 

Well, out of my first reaction on the inconsistency. I just get a feeling on
this controversy by looking at the length of this Wikipedia page's reference
section:

http://en.wikipedia.org/wiki/Sentence_spacing#References

Does NOT matter for me, anyway :)

Thanks,
Fam


