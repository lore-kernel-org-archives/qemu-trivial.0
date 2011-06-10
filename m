Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QV0eo-0000XT-Sk
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jun 2011 08:17:47 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QV0em-0000Ws-CF
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2011 08:17:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QV0ek-00078k-LR
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2011 08:17:43 -0400
Received: from mail-vw0-f45.google.com ([209.85.212.45]:45392)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QV0eh-00075x-0X; Fri, 10 Jun 2011 08:17:39 -0400
Received: by vws17 with SMTP id 17so2397541vws.4
	for <multiple recipients>; Fri, 10 Jun 2011 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=SEmSq+nqg7CpLsHrur73n0j98oV+NX5VfXr8bitpZFY=;
	b=qm2KwaSu3NarRM2W1oNyXrrHY0jP2FouwaM0/0dSzn5ugT2XdzGuqRUqHWVyNr0oP7
	FM6NJWmK8CdVXXTqgAL+lq6w59QO+sI9teMl/JNNcNO8CDciKQhISCgqka0DqshvYAMT
	oc3HnO0bqM8VmOfggiNvLhqjI4EWC4wSAAzJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=W2amVLKHVBtiywwdEDEb2w+3gRR01bGDe+JTxg7WJ7YouLaHhOAt9WRnDaGsFBxqzy
	9gv8LnTmZzB3X9aIAnbDgaQK0bsdnVI4b9RsrpebQKA31y2VKo87/VJ53TILkwMayXa/
	iaEDTO+z/187SEtxjs8L26jv3FNfj9IxB/asA=
MIME-Version: 1.0
Received: by 10.220.118.80 with SMTP id u16mr705036vcq.214.1307708258222; Fri,
	10 Jun 2011 05:17:38 -0700 (PDT)
Received: by 10.220.199.66 with HTTP; Fri, 10 Jun 2011 05:17:38 -0700 (PDT)
In-Reply-To: <20110610104329.GC31768@teriyaki.cdg.redhat.com>
References: <20110531054345.GA17412@amit-x200.redhat.com>
	<1306828429-9139-1-git-send-email-cfergeau@redhat.com>
	<1306828429-9139-3-git-send-email-cfergeau@redhat.com>
	<20110610104329.GC31768@teriyaki.cdg.redhat.com>
Date: Fri, 10 Jun 2011 13:17:38 +0100
Message-ID: <BANLkTimekZreaf7wJGr7+wCi6pKOizOKiw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Christophe Fergeau <cfergeau@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.212.45
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH-v3 2/2] kvm: Fix
	unused-but-set-variable warning
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
X-List-Received-Date: Fri, 10 Jun 2011 12:17:45 -0000

On Fri, Jun 10, 2011 at 11:43 AM, Christophe Fergeau
<cfergeau@redhat.com> wrote:
> Ping?

Let me add these patches to the trivial-patches tree since they
haven't been picked up.

Stefan

