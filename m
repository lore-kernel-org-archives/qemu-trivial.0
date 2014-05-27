Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpHbU-0005XQ-1G
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2014 09:39:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WpHbM-0005Ow-Jj
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 09:39:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WpHbE-0001iv-FL
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 09:39:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58969)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1WpHbE-0001in-7f; Tue, 27 May 2014 09:39:28 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4RDdPYe008150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 27 May 2014 09:39:25 -0400
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-106.ams2.redhat.com
	[10.36.116.106])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4RDdNeS016053; Tue, 27 May 2014 09:39:24 -0400
Message-ID: <5384958B.3000606@redhat.com>
Date: Tue, 27 May 2014 15:39:23 +0200
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Dave Mielke <dave@mielke.cc>, Michael Tokarev <mjt@tls.msk.ru>
References: <20140524232950.GH1904@beta.private.mielke.cc>	<5381E4E4.9040406@msgid.tls.msk.ru>
	<20140525125639.GL1904@beta.private.mielke.cc>
In-Reply-To: <20140525125639.GL1904@beta.private.mielke.cc>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] patch: add delay=<msecs> suboption
 to -display curses
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
X-List-Received-Date: Tue, 27 May 2014 13:39:42 -0000

On 05/25/14 14:56, Dave Mielke wrote:
> [quoted lines by Michael Tokarev on 2014/05/25 at 16:41 +0400]

>> And provided this hasn't been a problem for so many years, 
> 
> Perhaps it hasn't been observed before because the curses UI may not have that 
> many users. I myself must use it as, being blind, it's much easier for me to 
> work in text mode than in graphics mode.

You were too modest to link your own webpage, but I'll do it for us all,
because it'll help our understanding:

http://mielke.cc/brltty/index.html
http://mielke.cc/resume.html#exp-2000-PRESENT

Thanks
Laszlo
PS: stunned and amazed

