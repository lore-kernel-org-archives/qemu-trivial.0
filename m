Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZwpa-00075D-UH
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2015 04:03:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ZZwpV-0006wg-TO
	for qemu-trivial@nongnu.org; Thu, 10 Sep 2015 04:03:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ZZwpU-0001LZ-Ml
	for qemu-trivial@nongnu.org; Thu, 10 Sep 2015 04:03:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43013)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1ZZwpP-0001Jh-6l; Thu, 10 Sep 2015 04:03:31 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 6A6BA461EF;
	Thu, 10 Sep 2015 08:03:30 +0000 (UTC)
Received: from redhat.com (ovpn-116-92.ams2.redhat.com [10.36.116.92])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t8A83Q1T011285; Thu, 10 Sep 2015 04:03:28 -0400
Date: Thu, 10 Sep 2015 11:03:25 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150910110257-mutt-send-email-mst@redhat.com>
References: <1410092666-17405-1-git-send-email-zifeitong@gmail.com>
	<CAJ7wx-FqAPy85ROq3cprYmA39X--z83jBaLhhpwocXRHHnqc8w@mail.gmail.com>
	<54227845.6090508@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54227845.6090508@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Nikolay Nikolaev <n.nikolaev@virtualopensystems.com>,
	Kirill Batuzov <batuzovk@ispras.ru>, Anthony Liguori <aliguori@amazon.com>,
	Zifei Tong <zifeitong@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] qemu-char: Do not disconnect when
 there's data for reading
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
X-List-Received-Date: Thu, 10 Sep 2015 08:03:42 -0000

On Wed, Sep 24, 2014 at 11:52:37AM +0400, Michael Tokarev wrote:
> 16.09.2014 09:31, Zifei Tong wrote:
> > Friendly ping.
> > 
> > Also CC to qemu-trivial.
> 
> There was at least 2 subsequent versions of this down the line,
> a v2 and a v3.  (Just to show why I haven't applied it to -trivial).
> 
> Thanks,
> 
> /mjt

It's also far from trivial.
I don't see why it applies there.

> > On Sun, Sep 7, 2014 at 8:24 PM, Zifei Tong <zifeitong@gmail.com> wrote:
> >> After commit 812c1057f6175ac9a9829fa2920a2b5783814193 (Handle G_IO_HUP
> >> in tcp_chr_read for tcp chardev), the connection is disconnected when in
> >> G_IO_HUP condition.
> >>
> >> However, it's possible that the channel is in G_IO_IN condition at the
> >> same time, meaning there is data for reading. In that case, the
> >> remaining data is not handled.
> >>
> >> I saw a related bug when running socat in write-only mode, with
> >>
> >>   $ echo "quit" | socat -u - UNIX-CONNECT:qemu-monitor
> >>
> >> the monitor won't not run the 'quit' command.
> >>
> >> CC: Kirill Batuzov <batuzovk@ispras.ru>
> >> CC: Nikolay Nikolaev <n.nikolaev@virtualopensystems.com>
> >> CC: Anthony Liguori <aliguori@amazon.com>
> >> Signed-off-by: Zifei Tong <zifeitong@gmail.com>
> >> ---
> >>  qemu-char.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/qemu-char.c b/qemu-char.c
> >> index 1a8d9aa..5018c3a 100644
> >> --- a/qemu-char.c
> >> +++ b/qemu-char.c
> >> @@ -2706,7 +2706,7 @@ static gboolean tcp_chr_read(GIOChannel *chan, GIOCondition cond, void *opaque)
> >>      uint8_t buf[READ_BUF_LEN];
> >>      int len, size;
> >>
> >> -    if (cond & G_IO_HUP) {
> >> +    if (!(cond & G_IO_IN) && (cond & G_IO_HUP)) {
> >>          /* connection closed */
> >>          tcp_chr_disconnect(chr);
> >>          return TRUE;
> >> --
> >> 2.1.0
> >>
> > 
> 

