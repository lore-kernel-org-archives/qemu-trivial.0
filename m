Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WSNFO-0007cC-7I
	for mharc-qemu-trivial@gnu.org; Tue, 25 Mar 2014 05:02:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WSNFG-0007DG-Rh
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 05:02:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1WSNFA-0002K5-Tx
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 05:02:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37569)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1WSNEy-0002HV-GN; Tue, 25 Mar 2014 05:01:48 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2P90jMs016950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 25 Mar 2014 05:00:48 -0400
Received: from localhost (ovpn-112-45.ams2.redhat.com [10.36.112.45])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2P90cr2008397; Tue, 25 Mar 2014 05:00:39 -0400
Date: Tue, 25 Mar 2014 10:00:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20140325090038.GB17172@stefanha-thinkpad.redhat.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
	<20140324131959.GF4384@stefanha-thinkpad.redhat.com>
	<CAFEAcA-D+6uHgaChtvmmZ6gXoPsAxY=0L9ho6a2xoryYHC6xsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-D+6uHgaChtvmmZ6gXoPsAxY=0L9ho6a2xoryYHC6xsA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Alex Bligh <alex@alex.org.uk>, v.maffione@gmail.com,
	Alexey Kardashevskiy <aik@ozlabs.ru>, "J. Kiszka" <jan.kiszka@siemens.com>,
	Prasad Joshi <prasadjoshi.linux@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Vassili Karpov <av1474@comtv.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, Anthony Liguori <aliguori@amazon.com>,
	Paolo Bonzini <pbonzini@redhat.com>, g.lettieri@iet.unipi.it,
	rizzo@iet.unipi.it, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 1/6] audio: set top level latch for each
	slot
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
X-List-Received-Date: Tue, 25 Mar 2014 09:02:12 -0000

On Mon, Mar 24, 2014 at 01:22:56PM +0000, Peter Maydell wrote:
> On 24 March 2014 13:19, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > On Sun, Mar 23, 2014 at 02:58:38PM +0530, Prasad Joshi wrote:
> >> CSMKeyControll function is supposed to set the top level latch for each
> >> slot. However, at the moment, it incorrectly updates only the first
> >> slot. Patch fixes the problem.
> >>
> >> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
> >> ---
> >>  hw/audio/fmopl.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Peter: This series has some fixes for QEMU 2.0 since they are bug fixes.
> 
> I'm currently assuming that bugfixes for 2.0 will appear in
> the form of pullrequests marked 'for-2.0' from the appropriate
> submaintainers...

Okay, I'll take the relevant ones for the net subsystem and send a pull
request.

Stefan

