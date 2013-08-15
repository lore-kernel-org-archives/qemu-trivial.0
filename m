Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VA2k6-0002CV-8C
	for mharc-qemu-trivial@gnu.org; Thu, 15 Aug 2013 14:57:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1VA2jz-00022j-Jf
	for qemu-trivial@nongnu.org; Thu, 15 Aug 2013 14:57:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1VA2jt-0004LN-Km
	for qemu-trivial@nongnu.org; Thu, 15 Aug 2013 14:57:47 -0400
Received: from mail.avalus.com ([89.16.176.221]:60610)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1VA2jt-0004LI-Ey
	for qemu-trivial@nongnu.org; Thu, 15 Aug 2013 14:57:41 -0400
Received: by mail.avalus.com (Postfix) with ESMTPSA id 6E044C5603E;
	Thu, 15 Aug 2013 19:57:24 +0100 (BST)
Date: Thu, 15 Aug 2013 19:57:23 +0100
From: Alex Bligh <alex@alex.org.uk>
To: Taimoor <taimoor.mrza@gmail.com>, qemu-devel@nongnu.org
Message-ID: <32390D0B333534A8350ACFFA@nimrod.local>
In-Reply-To: <1376590408-7037-1-git-send-email-tmirza@codesourcery.com>
References: <1376590408-7037-1-git-send-email-tmirza@codesourcery.com>
X-Mailer: Mulberry/4.0.8 (Mac OS X)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 89.16.176.221
Cc: qemu-trivial@nongnu.org, Taimoor Mirza <tmirza@codesourcery.com>,
	Alex Bligh <alex@alex.org.uk>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] slirp: Port redirection
 option behave	differently on Linux and Windows
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Alex Bligh <alex@alex.org.uk>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2013 18:57:53 -0000



--On 15 August 2013 23:13:28 +0500 Taimoor <taimoor.mrza@gmail.com> wrote:

> diff --git a/slirp/socket.c b/slirp/socket.c
> index 8e8819c..e4685bb 100644
> --- a/slirp/socket.c
> +++ b/slirp/socket.c
> @@ -1,4 +1,4 @@
> -/*
> +x/*
>   * Copyright (c) 1995 Danny Gasparovski.
>   *
>   * Please read the file COPYRIGHT for the
> @@ -627,7 +627,9 @@ tcp_listen(Slirp *slirp, uint32_t haddr, u_int hport,

You appear to have introduced an additional character at the top of
the file.

-- 
Alex Bligh

