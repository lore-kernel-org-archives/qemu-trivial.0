Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROxX5-00061O-5i
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2011 15:17:03 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1ROx3u-0007hq-H6
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 14:47:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1ROx3c-0002Ft-2d
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 14:46:54 -0500
Received: from mail-gy0-f173.google.com ([209.85.160.173]:54481)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1ROx3R-0002BC-Ft; Fri, 11 Nov 2011 14:46:25 -0500
Received: by mail-gy0-f173.google.com with SMTP id 11so3672346gyb.4
	for <multiple recipients>; Fri, 11 Nov 2011 11:46:25 -0800 (PST)
Received: by 10.50.170.105 with SMTP id al9mr14516124igc.28.1321040784861;
	Fri, 11 Nov 2011 11:46:24 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id hz1sm9471287igc.5.2011.11.11.11.46.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 11:46:23 -0800 (PST)
Message-ID: <4EBD7B8D.80306@codemonkey.ws>
Date: Fri, 11 Nov 2011 13:46:21 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1321004409-3274-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1321004409-3274-1-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.160.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/5] Plug a few trivial
	resource leaks
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
X-List-Received-Date: Fri, 11 Nov 2011 20:17:01 -0000

On 11/11/2011 03:40 AM, Markus Armbruster wrote:
> As usual, shit happens on error paths.

Applied all.  Thanks.

Regards,

Anthony Liguori

>
> Markus Armbruster (5):
>    qemu-char: Plug memory leak on qemu_chr_open_pty() error path
>    ui: Plug memory leaks on parse_keyboard_layout() error path
>    qemu-sockets: Plug fd leak on unix_connect_opts() error path
>    posix-aio-compat: Plug memory leak on paio_init() error path
>    os-posix: Plug fd leak in qemu_create_pidfile()
>
>   os-posix.c         |    3 +++
>   posix-aio-compat.c |    1 +
>   qemu-char.c        |   19 ++++++++++---------
>   qemu-sockets.c     |    1 +
>   ui/keymaps.c       |   12 +++++++-----
>   5 files changed, 22 insertions(+), 14 deletions(-)
>


