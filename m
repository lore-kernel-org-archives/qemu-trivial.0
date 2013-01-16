Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvPIG-0007iC-BR
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 04:28:24 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TvPIC-0007Wt-O4
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 04:28:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TvPIB-0005tY-Ln
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 04:28:20 -0500
Received: from mail-wg0-f47.google.com ([74.125.82.47]:59615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TvPHr-0005pK-M9; Wed, 16 Jan 2013 04:27:59 -0500
Received: by mail-wg0-f47.google.com with SMTP id dq11so698113wgb.26
	for <multiple recipients>; Wed, 16 Jan 2013 01:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=COiaxf8JMi6oWOQxro21m1PYXJiu7QU7plAuUpJVXps=;
	b=U5gnUtPAokzT2N8XWd38HGgkR3mRW+bRSO81gDGbmRjCuyU3PZKarCMvcQ3Y5ymnJX
	RfEpBH//MgRb31Xws1raKDzsFZSjGCJoU16/1Z5l+f3RjC/q3wA0T7F4NKbPTsIH3la0
	QX4jGaDQ7LXhIkyypAjQwBpeGbppNcY0SBcPWoPmmxNmxwmuwhz26PiYUUdZEoSQy7nQ
	DUzwTXHlkhd8AW4prPBzqpV/WTGDV86/RNY7LpKpTWs9x6EiLijDnSuB68H/yj3AISmM
	O+olWJr9kGuTZIzfPZXy8JwwbwMXQwh/40RQSfO5AmZQB+rTsHR3fwpC4S8Gnyq7KSJj
	ifHw==
X-Received: by 10.194.238.226 with SMTP id vn2mr812592wjc.23.1358328478876;
	Wed, 16 Jan 2013 01:27:58 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id h19sm7409860wiv.7.2013.01.16.01.27.57
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 01:27:58 -0800 (PST)
Date: Wed, 16 Jan 2013 10:27:56 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Vadim Evard <v.e.evard@gmail.com>
Message-ID: <20130116092756.GB7033@stefanha-thinkpad.redhat.com>
References: <50F5EBDA.2040208@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50F5EBDA.2040208@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.47
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: silencing
 pkg-config's check for curses
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
X-List-Received-Date: Wed, 16 Jan 2013 09:28:22 -0000

On Wed, Jan 16, 2013 at 03:52:58AM +0400, Vadim Evard wrote:
> From d10856f3b1d893b5d3c6ab213eb921d0a24e7766 Mon Sep 17 00:00:00 2001
> From: Vadim Evard <v.e.evard@gmail.com>
> Date: Wed, 16 Jan 2013 03:45:44 +0400
> Subject: [PATCH] configure: silencing pkg-config's check for curses
> 
> ---
>  configure |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Probably best if Anthony or another qemu.git committer applies this
straight away instead of waiting for the next qemu-trivial pull request.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

