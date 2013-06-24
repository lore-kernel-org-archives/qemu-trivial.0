Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur74Y-0004S1-0L
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 09:44:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1Ur2Vg-0003kZ-Aw
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 04:52:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1Ur2Vd-0000fg-Ms
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 04:52:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:20583)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1Ur2VU-0000dd-4F; Mon, 24 Jun 2013 04:52:16 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O8qEi4017970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 04:52:14 -0400
Received: from lacos-laptop.usersys.redhat.com (vpn1-4-230.ams2.redhat.com
	[10.36.4.230])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5O8qDZH008840; Mon, 24 Jun 2013 04:52:13 -0400
Message-ID: <51C8094F.10500@redhat.com>
Date: Mon, 24 Jun 2013 10:54:39 +0200
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130513 Thunderbird/17.0.6
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
In-Reply-To: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Mon, 24 Jun 2013 09:44:43 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 00/13] A bunch of little
 socket + chardev fixes
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
X-List-Received-Date: Mon, 24 Jun 2013 08:52:31 -0000

On 06/24/13 08:39, Gerd Hoffmann wrote:
>   Hi,
> 
> Here is v2 of the series, addressing Michaels review comments.
> 
> cheers,
>   Gerd
> 
> Gerd Hoffmann (13):
>   qemu-socket: zero-initialize SocketAddress
>   qemu-socket: drop pointless allocation
>   qemu-socket: catch monitor_get_fd failures
>   qemu-char: check optional fields using has_*
>   qemu-char: use more specific error_setg_* variants
>   qemu-char: print notification to stderr
>   qemu-char: fix documentation for telnet+wait socket flags
>   qemu-char: don't leak opts on error
>   qemu-char: use ChardevBackendKind in in CharDriver
>   qemu-char: minor mux chardev fixes
>   qemu-char: add -chardev mux support
>   qemu-char: report udb backend errors
>   qemu-socket: don't leak opts on error
> 
>  include/sysemu/char.h |    2 +-
>  qapi-schema.json      |    7 ++++---
>  qemu-char.c           |   45 ++++++++++++++++++++++++++++++++-------------
>  util/qemu-sockets.c   |    9 ++++-----
>  4 files changed, 41 insertions(+), 22 deletions(-)
> 

I think 11/13 doesn't qualify for qemu-trivial. In any case, it does
seem correct, like the rest.

With the commit message fixups from Michael: series

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo

