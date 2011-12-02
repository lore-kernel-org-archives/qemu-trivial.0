Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWQz5-0007Am-Eq
	for mharc-qemu-trivial@gnu.org; Fri, 02 Dec 2011 06:08:51 -0500
Received: from eggs.gnu.org ([140.186.70.92]:53968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RWQz0-0007A3-3o
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 06:08:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RWQyu-00070D-6Z
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 06:08:46 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:53989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RWQyt-0006zs-W7; Fri, 02 Dec 2011 06:08:40 -0500
Received: by wgbds1 with SMTP id ds1so851374wgb.10
	for <multiple recipients>; Fri, 02 Dec 2011 03:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Zh1aqd3eaxAdVWMZFZj7+WTrw+zPp22ZgjlXHkUKPjg=;
	b=QdGyq3EFSdppVY1g6/WNu+3iQuHmoHO0CK7064CCxJHTwxhHdDgZc3Vff2WiqMjQ2j
	U7SzLUr8piPs0Uixvjazv2hkxN8Cq2YrmoQv89YezuzQJMUgdWusicOVDj8r9stypajX
	+4bt5lR1eF/LL8nZx83OtZQ1rcuLL5JnunKK0=
Received: by 10.227.205.197 with SMTP id fr5mr5530203wbb.3.1322824119047;
	Fri, 02 Dec 2011 03:08:39 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	dy1sm2947515wib.18.2011.12.02.03.08.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 03:08:38 -0800 (PST)
Date: Fri, 2 Dec 2011 11:08:36 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20111202110836.GB19437@stefanha-thinkpad.localdomain>
References: <1322796863-3475-1-git-send-email-zhihuili@linux.vnet.ibm.com>
	<4ED87E29.1010207@linux.vnet.ibm.com>
	<4ED88173.2040505@weilnetz.de> <4ED882E2.6090709@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ED882E2.6090709@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Li Zhi Hui <zhihuili@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	Mark Wu <wudxw@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-nbd.c : fix memory leak
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
X-List-Received-Date: Fri, 02 Dec 2011 11:08:50 -0000

On Fri, Dec 02, 2011 at 08:48:50AM +0100, Paolo Bonzini wrote:
> On 12/02/2011 08:42 AM, Stefan Weil wrote:
> >>>
> >>>-    if (sharing_fds[0] == -1)
> >>>+    if (sharing_fds[0] == -1) {
> >>>+        g_free(sharing_fds);
> >>>          return 1;
> >>>+    }
> >>>
> >>>      if (device) {
> >>>          int ret;
> >>Zhihui,
> >>
> >>Kernel should free all memory used by the process after it exits.  So
> >>there's no memory leak even without explicit free.
> >
> >That's correct. Nevertheless fixing this helps to find other more important
> >memory leaks with static or dynamic code analyzers like cppcheck or
> >valgrind.
> >
> >Reviewed-by: Stefan Weil <sw@weilnetz.de>
> 
> Please hold off, I'm about to introduce large changes to qemu-nbd
> for asynchronous I/O (including getting rid of sharing_fds in favor
> of the main loop) and and I'd rather avoid gratuitous conflicts.

Okay, let's wait for Paolo's changes.

Stefan

