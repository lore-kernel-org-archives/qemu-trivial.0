Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bUOCq-0007Ih-Ii
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2016 21:09:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bUOCo-0007HV-9H
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 21:09:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1bUOCn-0002TR-F1
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 21:09:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1bUOCj-0002St-4J; Mon, 01 Aug 2016 21:09:09 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70FE1C04B323;
	Tue,  2 Aug 2016 01:09:08 +0000 (UTC)
Received: from localhost (dhcp-14-122.nay.redhat.com [10.66.14.122])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u72197Dm027008; Mon, 1 Aug 2016 21:09:07 -0400
Date: Tue, 2 Aug 2016 09:09:06 +0800
From: Fam Zheng <famz@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <20160802010906.GA680@ad.usersys.redhat.com>
References: <1470027888-24381-1-git-send-email-famz@redhat.com>
	<abd48ab4-4fd2-9e5e-c680-cbac5396f594@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abd48ab4-4fd2-9e5e-c680-cbac5396f594@redhat.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 02 Aug 2016 01:09:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] curl: Cast fd to int for
 DPRINTF
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
X-List-Received-Date: Tue, 02 Aug 2016 01:09:15 -0000

On Mon, 08/01 12:41, John Snow wrote:
> > -    DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, fd);
> > +    DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, (int)fd);
> >      switch (action) {
> >          case CURL_POLL_IN:
> >              aio_set_fd_handler(s->aio_context, fd, false,
> > 
> 
> Is curl_socket_t always of type long long unsigned int? why not use %llu ?

Since it is a typedef, variation between platforms is imaginable. On Linux it
is 4 bytes, the error is only seen on Windows.

Fam

