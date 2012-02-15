Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RxaKz-0004qh-KA
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2012 03:35:41 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1RxaKr-0004Sv-I9
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2012 03:35:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1RxaKq-0004Y0-11
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2012 03:35:33 -0500
Received: from cantor2.suse.de ([195.135.220.15]:36929 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1RxaKd-0004Up-EU; Wed, 15 Feb 2012 03:35:19 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 0090590182;
	Wed, 15 Feb 2012 09:35:11 +0100 (CET)
Mime-Version: 1.0 (Apple Message framework v1257)
Content-Type: text/plain; charset=iso-8859-1
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <CAFKAgTeS9T=eTo2PQqc5DYwfZq_+8Dj0vCa9zB1X9dVWHziypQ@mail.gmail.com>
Date: Wed, 15 Feb 2012 09:35:09 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <7B11164E-5A9B-4053-97A1-904E9A776F86@suse.de>
References: <CAFKAgTcgMqVpopxTw8+8N005OSOoNM33L2a8DLJvn7Tpa-BGvQ@mail.gmail.com>
	<CAFKAgTfOTniTEteFa5Rkms6PYXxDBFOS7g1VQNU4szXmC6T5Pw@mail.gmail.com>
	<CAFKAgTeS9T=eTo2PQqc5DYwfZq_+8Dj0vCa9zB1X9dVWHziypQ@mail.gmail.com>
To: Alex Barcelo <abarcelo@ac.upc.edu>
X-Mailer: Apple Mail (2.1257)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-ppc@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [TRIVIAL v2] Bad zero comparison
	for sas_ss_flags on powerpc
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
X-List-Received-Date: Wed, 15 Feb 2012 08:35:39 -0000


On 15.02.2012, at 07:55, Alex Barcelo wrote:

> ping? is this ok? Or it is not trivial at all, and better do a normal =
patch? And write it better?

The patch is fine, but it's not trivial. It's a ppc patch, hence it =
should've gotten CC'ed to qemu-ppc :). Also, whatever mailer you used to =
send the patch line wrapped it:

agraf@lychee:/home/agraf/release/qemu> git pw am 140538
git coERROR: patch seems to be corrupt (line wrapped?)
#40: FILE: linux-user/signal.c:4114:
target_sigaction *ka,

total: 1 errors, 0 warnings, 9 lines checked

Your patch has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

I'll fix it up and apply it to ppc-next.


Thanks!

Alex


