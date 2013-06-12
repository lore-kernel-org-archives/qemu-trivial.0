Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Umj7S-0004jn-3L
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 07:21:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1Umj7P-0004gy-8p
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 07:21:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1Umj7O-0000i3-3X
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 07:21:35 -0400
Received: from mx3-phx2.redhat.com ([209.132.183.24]:57904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1Umj7K-0000hL-MK; Wed, 12 Jun 2013 07:21:30 -0400
Received: from zmail15.collab.prod.int.phx2.redhat.com
	(zmail15.collab.prod.int.phx2.redhat.com [10.5.83.17])
	by mx3-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id r5CBLS1B006601;
	Wed, 12 Jun 2013 07:21:29 -0400
Date: Wed, 12 Jun 2013 07:21:27 -0400 (EDT)
From: Alon Levy <alevy@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <556498021.18264518.1371036087771.JavaMail.root@redhat.com>
In-Reply-To: <51B841A8.3030007@msgid.tls.msk.ru>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
	<51B841A8.3030007@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.5.82.11]
X-Mailer: Zimbra 8.0.3_GA_5664 (ZimbraWebClient - FF21 (Linux)/8.0.3_GA_5664)
Thread-Topic: oslib-posix: add qemu_pipe_non_block
Thread-Index: Tr+M1m0BQ0uocKQYjqJqLRPfuLQlkg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.24
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/5] oslib-posix:
	add	qemu_pipe_non_block
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
X-List-Received-Date: Wed, 12 Jun 2013 11:21:36 -0000

> 05.06.2013 00:23, Alon Levy wrote:
> 
>  [PATCH 1/5] oslib-posix: add qemu_pipe_non_block
>  [PATCH 2/5] use qemu_pipe_non_block
>  [PATCH 3/5] libcacard/vscclient: fix leakage of socket on error paths
>  [PATCH 4/5] libcacard/vreader.c: fix possible NULL dereference
>  [PATCH 5/5] libcacard/vscclient.c: fix use of uninitialized variable
> 
> So, what happened with this series?

I still plan to do it, but didn't get to it yet.

> 
> From the above 5 patches, only 3/5 (leakage of socket on error paths)
> is ready to be applied.  Should I apply it now, or wait for the
> respin of whole series?  (Or both?)

I'll be happy if you do. (Both don't actually make sense :)

> 
> Thanks,
> 
> /mjt
> 
> 

