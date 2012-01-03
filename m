Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ri36s-0008FR-Ux
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2012 07:04:54 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri36m-0007qw-8A
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 07:04:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri36l-0007jX-2j
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 07:04:48 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:61120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Ri36f-0007im-K2; Tue, 03 Jan 2012 07:04:41 -0500
Received: by eekb45 with SMTP id b45so18612014eek.4
	for <multiple recipients>; Tue, 03 Jan 2012 04:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7mR/SC5zMPk3mlWjcReE+vtrLYKFe//oJxRFubbG70M=;
	b=DMTCnijw6iPblW17zPJ2bjO90BcyF1XOsnOkskgjqhurcPuRI3US4+kQxp4hpPvFdM
	9I/N1BSpso/YetXKhUAMKEHwWibTj4olqGtSxFDDOrwr71HWefLvoMV4bdemSR/bnRB3
	DR+beRn3+kwSOXRVh+loF6fSQZcOHScKLNqb8=
Received: by 10.213.22.207 with SMTP id o15mr13153760ebb.124.1325592280515;
	Tue, 03 Jan 2012 04:04:40 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	t1sm204914159eeb.3.2012.01.03.04.04.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 04:04:39 -0800 (PST)
Date: Tue, 3 Jan 2012 12:04:37 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20120103120437.GC28826@stefanha-thinkpad.localdomain>
References: <1325527237-24146-1-git-send-email-pbonzini@redhat.com>
	<1325527237-24146-6-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1325527237-24146-6-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 5/8] qemu-queue: really simplify QSIMPLEQ
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
X-List-Received-Date: Tue, 03 Jan 2012 12:04:52 -0000

On Mon, Jan 02, 2012 at 07:00:34PM +0100, Paolo Bonzini wrote:
> QSIMPLEQ is still relatively heavyweight when used as a free list,
> compared to a simple singly-linked list.  One disadvantage is that
> it requires an initializer macro, unlike for example QLIST.

<pedantic>QSIMPLEQ is no longer a queue if you cannot easily use it in a
FIFO manner.  A queue can efficiently push elements on one end and pop
them from the other end.</pedantic>

Stefan

