Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wpq9X-00035u-GN
	for mharc-qemu-trivial@gnu.org; Wed, 28 May 2014 22:33:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1Wpq9U-0002zU-Fd
	for qemu-trivial@nongnu.org; Wed, 28 May 2014 22:33:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1Wpq9T-0000qu-Mr
	for qemu-trivial@nongnu.org; Wed, 28 May 2014 22:33:08 -0400
Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d]:42880)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1Wpq9N-0000q8-JN; Wed, 28 May 2014 22:33:01 -0400
Received: by mail-qg0-f45.google.com with SMTP id z60so20594239qgd.32
	for <multiple recipients>; Wed, 28 May 2014 19:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=EZioCv6ZSHn3XMLXut8GKzGbaRGfclDWWMdrTBuYx6U=;
	b=RUHgUs+Wo8D5pUzusxwOQwBzLLtsLEOuqdv0uH1xsTFRwcvlng/5Dbg/yZowxUb+h7
	9Pb0zsCZL+fdE3b/egtxvpGjwdaQyxFUEKMjHO6icmCCKLG/7qLP8+XKeAOe+JTLnsI1
	IsRvGuSbooQ7stk34G4oDctop+6TS8JTOn+stgooaT6mJ5yrLprf2/LOIprLJBanCtiB
	1FBkdhwXfc0/Pm4nkiv6SpwCHZ3bSRAOrwZ3C7JF+Z2RX3IvDvEOKXXTWXfoN6PmV9bd
	qzvpeBN3iibLxu7Ios6KQhYXi0Lnt61/mrMnhXzz7mYfOwwxmEH9gg4YEkm5YWeHc8+/
	ZoFw==
MIME-Version: 1.0
X-Received: by 10.140.104.44 with SMTP id z41mr5298244qge.76.1401330780806;
	Wed, 28 May 2014 19:33:00 -0700 (PDT)
Sender: carpeddiem@gmail.com
Received: by 10.140.49.239 with HTTP; Wed, 28 May 2014 19:33:00 -0700 (PDT)
In-Reply-To: <5368F36B.3040804@redhat.com>
References: <1399382220-14874-1-git-send-email-peter.maydell@linaro.org>
	<5368F36B.3040804@redhat.com>
Date: Wed, 28 May 2014 22:33:00 -0400
X-Google-Sender-Auth: 9FdiGzcHWltxE96HnkRwt84eSYA
Message-ID: <CAPyFy2BxjzzkKAZ3=YfF=nfHE2ftJH8uX5QXwV_HwM0qZqyUSg@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22d
Cc: Peter Maydell <peter.maydell@linaro.org>, patches@linaro.org,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Don Slutz <dslutz@verizon.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Put tempfiles in
 subdir so we can clean up libtool files
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
X-List-Received-Date: Thu, 29 May 2014 02:33:09 -0000

On 6 May 2014 10:36, Eric Blake <eblake@redhat.com> wrote:
>
> mktemp is not POSIX.  BSD mktemp lacks -t:
>
> http://www.freebsd.org/cgi/man.cgi?query=mktemp&apropos=0&sektion=1&manpath=Red+Hat+Linux%2Fi386+9&format=html

You managed to link to a mktemp man page for some old Red Hat version
there (note the URL); FreeBSD's mktemp man page (for the 9.2 release)
is here:

http://www.freebsd.org/cgi/man.cgi?query=mktemp&apropos=0&sektion=1&manpath=FreeBSD+9.2-RELEASE&arch=default&format=html

which supports -t, but with a different meaning compared to contemporary Linux.

