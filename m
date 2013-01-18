Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TwDxo-00060Y-5l
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jan 2013 10:34:40 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwDxj-0005zV-N5
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 10:34:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwDxY-0007wv-6z
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 10:34:35 -0500
Received: from mail-bk0-f44.google.com ([209.85.214.44]:41531)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TwDxX-0007r8-Jc
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 10:34:24 -0500
Received: by mail-bk0-f44.google.com with SMTP id w11so2068289bku.17
	for <qemu-trivial@nongnu.org>; Fri, 18 Jan 2013 07:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=8AT8AQh4HoySk0ImmrNC+XKux0fojEn9XYEXFL2F2l8=;
	b=FbrJI8IP3WtqBvm2yaTjh06JnVxXY5OP7vItEquBTBkkRRrVzj5C7VmC8tmyhjIBhP
	jWrJWRnRnGVjGRnc3G2SJ+n7/Im0hxt6Y+bvu+YHHnj9rKNQa8UJRV5uz1shuYHyCqMP
	VmhwJ8Eh00/N7grHjigynZi0pyyA24m1GU1eY4/WNYCVHpunmQ/Ikiy6FUOPpRWpSdAa
	CIIGnSTl7pA5fIAGapBAkzHvpA6OLgZ1o7zbIS+jxkun6WNi2B3MfBD+VmLV9g1udGbt
	HF9FeW7zRPHolVqr7wSbLOSxBzqTl/3+po6/mSW6jkqh5jE1nlPxnfhlzIj1Ved6L9z/
	3vrg==
X-Received: by 10.204.156.139 with SMTP id x11mr2498657bkw.128.1358523251070; 
	Fri, 18 Jan 2013 07:34:11 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id s10sm1543115bkw.3.2013.01.18.07.34.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 07:34:10 -0800 (PST)
Date: Fri, 18 Jan 2013 16:34:07 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Stillwell <dragonfax@gmail.com>
Message-ID: <20130118153407.GA20613@stefanha-thinkpad.redhat.com>
References: <CAG0b9_jOiRwSik_Np5ym=_LOiAPhuMtZOJ6kCMv+WrftnX1LAQ@mail.gmail.com>
	<20130118134205.GA24367@stefanha-thinkpad.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130118134205.GA24367@stefanha-thinkpad.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.44
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] trival patch to master to fix osx build
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
X-List-Received-Date: Fri, 18 Jan 2013 15:34:38 -0000

On Fri, Jan 18, 2013 at 02:42:05PM +0100, Stefan Hajnoczi wrote:
> On Tue, Jan 15, 2013 at 11:52:35PM -0800, Jason Stillwell wrote:
> > symbol isnt' defined when __APPLE__
> > this moves the symbol to the right place so it doesn't break the build.
> 
> Please follow http://wiki.qemu.org/Contribute/SubmitAPatch and resubmit
> your patch inline (no attachments) and with Signed-off-by:.

Please also CC qemu-devel@nongnu.org.

Stefan

