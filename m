Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UvFPF-00010T-1N
	for mharc-qemu-trivial@gnu.org; Fri, 05 Jul 2013 19:27:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UvFPC-0000ty-1M
	for qemu-trivial@nongnu.org; Fri, 05 Jul 2013 19:27:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1UvFPA-0005n9-MH
	for qemu-trivial@nongnu.org; Fri, 05 Jul 2013 19:27:09 -0400
Received: from cantor2.suse.de ([195.135.220.15]:41088 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1UvFP1-0005ij-MI; Fri, 05 Jul 2013 19:26:59 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 1EA7DA4EB7;
	Sat,  6 Jul 2013 01:26:58 +0200 (CEST)
Message-ID: <51D7563C.90000@suse.de>
Date: Sat, 06 Jul 2013 01:26:52 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>,
	Scott Wood <scottwood@freescale.com>, Blue Swirl <blauwirbel@gmail.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc <qemu-ppc@nongnu.org>, Hu Tao <hutao@cn.fujitsu.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] ANN: DeveloperNews - a qemu-devel digest for
	maintainers and contributors
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
X-List-Received-Date: Fri, 05 Jul 2013 23:27:11 -0000

Hello everyone,

Inspired by a complaint from Scott about information getting lost
amongst qemu-devel mails, and spawning a qemu-announce mailing list
being out of my powers, I have started a simple Wiki page:

http://wiki.qemu.org/DeveloperNews

The idea is to have a brief summary of decisions and code changes that
affect all maintainers and/or contributors, with references into
qemu-devel archive or git.qemu.org or developers' blogs for more info,
latest news sorted first.
For example, to aid in getting up to speed after a four-week vacation,
and to aid hobbyists in coping with the sheer incredible list volume.

Self-explanatory that this will only work when information there is less
than on qemu-devel (i.e., not every PULL or patchset linked).
The intended scope is not random news about what changed in qemu.git but
code changes that require fellow developers to rebase or to adopt new
patterns and conventions and review criteria. The removal of some
function does not necessarily need to be documented there (anyone
building against latest master would notice a breakage) but whenever
there's old and new ways to do things, we can advise which to choose.

The initial contents is of course biased to what's close to my heart;
but it's a Wiki, so for instance Stefan H. could add a bullet point
about new devices please using new asynchronous block layer APIs only.

Obviously adding Wiki contents is work, it cannot replace cover letters
or commit messages, but after the n-th reply pages like SubmitAPatch or
QOMConventions have become very handy to refer to.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

