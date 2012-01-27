Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqfQZ-0005Jl-Sp
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 01:36:51 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RqfQX-0005Eg-V6
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 01:36:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RqfQX-0002f2-3K
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 01:36:49 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:35802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RqfQU-0002ej-E7; Fri, 27 Jan 2012 01:36:46 -0500
Received: by pbdd2 with SMTP id d2so1692832pbd.4
	for <multiple recipients>; Thu, 26 Jan 2012 22:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QgyDshqdIn+4J0FBk8VmXRJ8EJOS2o1i0/gajtNUdEk=;
	b=oiVFLmUXu/pegA4HBQRQt8opzdWmFYNQ1CCCdCaj0dh+vifUwbGprNHKS2UfjT9mHA
	6XXiukPooHSt9LNF6SaJOtTnQCdEJ/lGDyvvlLqcdXJLu1IMHJKEsZfmZ9HjdjAPdkwv
	Y5bfNq/Oyl8IW49cbBEs/dIpiYSkBSekzTc/A=
Received: by 10.68.74.164 with SMTP id u4mr12126864pbv.85.1327646205035;
	Thu, 26 Jan 2012 22:36:45 -0800 (PST)
Received: from localhost (42-98-55-070.static.netvigator.com. [42.98.55.70])
	by mx.google.com with ESMTPS id i1sm17491233pbt.19.2012.01.26.22.36.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 22:36:43 -0800 (PST)
Date: Fri, 27 Jan 2012 06:36:39 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20120127063639.GA22748@stefanha-thinkpad.localdomain>
References: <1327613801-5828-1-git-send-email-lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1327613801-5828-1-git-send-email-lersek@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] keep the PID file locked for the
 lifetime of the process
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
X-List-Received-Date: Fri, 27 Jan 2012 06:36:51 -0000

On Thu, Jan 26, 2012 at 10:36:41PM +0100, Laszlo Ersek wrote:
> The lockf() call in qemu_create_pidfile() aims at ensuring mutual
> exclusion. We shouldn't close the pidfile on success, because that drops
> the lock as well [1]:
> 
>     "File locks shall be released on first close by the locking process
>     of any file descriptor for the file."
> 
> Coverity may complain again about the leaked file descriptor; let's
> worry about that later.
> 
> [1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/lockf.html
> 
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---

Isn't the normal way to do pidfiles O_CREAT | O_EXCL?  It may not work
on all NFS versions but putting the pidfile on NFS doesn't really make
sense.

Then we can drop the lockf(3) completely.

Stefan

