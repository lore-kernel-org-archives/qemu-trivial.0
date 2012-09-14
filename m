Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TCQie-0008BR-0A
	for mharc-qemu-trivial@gnu.org; Fri, 14 Sep 2012 03:53:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TCQiW-00089E-ST
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 03:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TCQiT-0007ZT-Df
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 03:53:36 -0400
Received: from mail-wi0-f169.google.com ([209.85.212.169]:65398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TCQiT-0007Yy-6i
	for qemu-trivial@nongnu.org; Fri, 14 Sep 2012 03:53:33 -0400
Received: by wibhm2 with SMTP id hm2so1706666wib.4
	for <qemu-trivial@nongnu.org>; Fri, 14 Sep 2012 00:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VNhMdWWgzoQP+7QxXFAzYMh1Iph9T8t4P6S78v9rAkU=;
	b=Zplz44mzMvqjQjmTDeiflZtsSinyL8kEL/4aqPq+lQ2cSeOsnbVbt2Php5HVfBgM6L
	rdPw+4NQlMqvon0YIw9LidTuiUiSJU+3w6TsoOfojCv1DYAgN0EjCuloWlkvKfyneoQT
	1Bt7Iu+KqN7x8EzM/t4fMNrPwYqTQ9S+bpMvs1+s41VtNL05BigW9ISnZ+N/SuqNryiw
	wjCcjTXSqT8AXRBmAx8mMj5Uq6r1EqFk/J5CesLPv4FC0vEg/NID3GPP+BMQKvBjfQH1
	6vBAzfmd8NvORnKzrVhKGzhj9pOIX5CamTK9hlE6Tl9d+WPCM3RqWdWiL7PNApewCypc
	owog==
Received: by 10.180.104.197 with SMTP id gg5mr4114889wib.9.1347609212242;
	Fri, 14 Sep 2012 00:53:32 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id eu4sm17678373wib.2.2012.09.14.00.53.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Sep 2012 00:53:31 -0700 (PDT)
Date: Fri, 14 Sep 2012 08:53:28 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hitoshi Mitake <h.mitake@gmail.com>
Message-ID: <20120914075328.GC25596@stefanha-thinkpad.localdomain>
References: <1347453510-32284-1-git-send-email-h.mitake@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1347453510-32284-1-git-send-email-h.mitake@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.169
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Andrzej Zaborowski <balrog@zabor.org>
Subject: Re: [Qemu-trivial] [PATCH] curses: don't initialize curses when
	qemu is daemonized
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
X-List-Received-Date: Fri, 14 Sep 2012 07:53:42 -0000

On Wed, Sep 12, 2012 at 09:38:30PM +0900, Hitoshi Mitake wrote:
> Current qemu initializes curses even if -daemonize option is
> passed. This cause problem because shell prompt appears without
> calling endwin().
> 
> This patch adds new function, is_daemonized(), to OS dependent
> code. With this function, curses_display_init() can check that qemu is
> daemonized or not. If daemonized, curses_display_init() returns
> immediately.
> 
> Of course, -daemonize && -curses doesn't make sense. Users shouldn't
> pass the arguments at the same time. But the problem is very painful
> because Ctrl-C cannot be delivered to the terminal. So if this
> approach isn't acceptable, -daemonize && -curses combination should be
> treated as error.

I think it makes sense to explicitly check that -daemonize is used with
-nographic | -vnc | -spice.

Making curses aware of daemonize seems strange and doesn't stop the same
issue with SDL.

Stefan

