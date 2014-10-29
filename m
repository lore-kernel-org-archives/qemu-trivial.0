Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjI4B-0007uI-8k
	for mharc-qemu-trivial@gnu.org; Tue, 28 Oct 2014 21:28:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XjI45-0007l9-Bk
	for qemu-trivial@nongnu.org; Tue, 28 Oct 2014 21:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XjI40-00053b-Ev
	for qemu-trivial@nongnu.org; Tue, 28 Oct 2014 21:28:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1XjI40-00053V-59; Tue, 28 Oct 2014 21:28:40 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9T1SYPE016604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 28 Oct 2014 21:28:34 -0400
Received: from localhost (dhcp-14-161.nay.redhat.com [10.66.14.161])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9T1SWoi031394; Tue, 28 Oct 2014 21:28:33 -0400
Date: Wed, 29 Oct 2014 09:28:52 +0800
From: Fam Zheng <famz@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20141029012852.GD5490@fam-t430.nay.redhat.com>
References: <1413984320-28585-1-git-send-email-baloo@gandi.net>
	<5448A656.6030204@msgid.tls.msk.ru>
	<87egtzusaa.fsf@blackfin.pond.sub.org>
	<20141028160041.GA3969@stefanha-thinkpad.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141028160041.GA3969@stefanha-thinkpad.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, Arthur Gautier <baloo@gandi.net>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vmdk: Fix cylinders number
 during convert
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
X-List-Received-Date: Wed, 29 Oct 2014 01:28:50 -0000

On Tue, 10/28 16:00, Stefan Hajnoczi wrote:
> On Thu, Oct 23, 2014 at 10:03:25AM +0200, Markus Armbruster wrote:
> > Michael Tokarev <mjt@tls.msk.ru> writes:
> > 
> > > On 10/22/2014 05:25 PM, Arthur Gautier wrote:
> > >> We can not rely on int cast to get a correct number of cylinders. The
> > >> cylinders information was wrong in 49.9999% of cases.
> > >> 
> > >> This ensures the cylinders always gets the ceiling value.
> > >
> > > Good thing, especially the good probability :), and also a good patch
> > > which comes with a test.
> > >
> > > But I wonder if anything can break this way?  Migration, windows guest
> > > being unable to find its partitions, something else?

I'd like to hear an answer to this question too, so we know why it's right and
worth to have.

> > >
> > > And more.  What-if our drive size in cylinders will be larger than
> > > the size in bytes?  The proposed div_round_up() will increase number
> > > of cylinders, so size in CHS will be larger than size in bytes.  Maybe
> > > there was a reason why originally the size in cylinders was calculated
> > > by truncating extra fractional part?  What-if guest will try to access
> > > the very last CHS which is incomplete?

I don't remember a reason why truncating (I doubt there is any), OTOH I'm not
sure what is the right thing to do if the guest tries to write to the last
incomplete CHS either.

Fam

