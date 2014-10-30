Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xjmwt-0003Sb-9u
	for mharc-qemu-trivial@gnu.org; Thu, 30 Oct 2014 06:27:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Xjmwn-0003Rr-3t
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 06:27:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Xjmwf-0005L6-7z
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 06:27:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47921)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1Xjmwf-0005L2-0j; Thu, 30 Oct 2014 06:27:09 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9UAR30W028311
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 30 Oct 2014 06:27:03 -0400
Received: from localhost (vpn1-114-233.nay.redhat.com [10.66.114.233])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9UAQxhj017836; Thu, 30 Oct 2014 06:27:01 -0400
Date: Thu, 30 Oct 2014 18:27:20 +0800
From: Fam Zheng <famz@redhat.com>
To: Arthur Gautier <baloo@gandi.net>
Message-ID: <20141030102720.GA29989@fam-t430.nay.redhat.com>
References: <1413984320-28585-1-git-send-email-baloo@gandi.net>
	<5448A656.6030204@msgid.tls.msk.ru>
	<87egtzusaa.fsf@blackfin.pond.sub.org>
	<20141028160041.GA3969@stefanha-thinkpad.redhat.com>
	<20141029012852.GD5490@fam-t430.nay.redhat.com>
	<20141030090919.GA10217@khany.gandi.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141030090919.GA10217@khany.gandi.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	Stefan Hajnoczi <stefanha@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
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
X-List-Received-Date: Thu, 30 Oct 2014 10:27:22 -0000

On Thu, 10/30 10:09, Arthur Gautier wrote:
> On Wed, Oct 29, 2014 at 09:28:52AM +0800, Fam Zheng wrote:
> > On Tue, 10/28 16:00, Stefan Hajnoczi wrote:
> > > On Thu, Oct 23, 2014 at 10:03:25AM +0200, Markus Armbruster wrote:
> > > > Michael Tokarev <mjt@tls.msk.ru> writes:
> > > > 
> > > > > On 10/22/2014 05:25 PM, Arthur Gautier wrote:
> > > > >> We can not rely on int cast to get a correct number of cylinders. The
> > > > >> cylinders information was wrong in 49.9999% of cases.
> > > > >> 
> > > > >> This ensures the cylinders always gets the ceiling value.
> > > > >
> > > > > Good thing, especially the good probability :), and also a good patch
> > > > > which comes with a test.
> > > > >
> > > > > But I wonder if anything can break this way?  Migration, windows guest
> > > > > being unable to find its partitions, something else?
> > 
> > I'd like to hear an answer to this question too, so we know why it's right and
> > worth to have.
> > 
> Sincerely, I didn't tried myself.
> 
> > > > >
> > > > > And more.  What-if our drive size in cylinders will be larger than
> > > > > the size in bytes?  The proposed div_round_up() will increase number
> > > > > of cylinders, so size in CHS will be larger than size in bytes.  Maybe
> > > > > there was a reason why originally the size in cylinders was calculated
> > > > > by truncating extra fractional part?  What-if guest will try to access
> > > > > the very last CHS which is incomplete?
> > 
> > I don't remember a reason why truncating (I doubt there is any), OTOH I'm not
> > sure what is the right thing to do if the guest tries to write to the last
> > incomplete CHS either.
> > 
> > Fam
> 
> Maybe we can expand the disk to the size matching cylinders * sectors *
> sector_size and issue a warning to the user? This way it will always be
> safe.
> 

Possible, but I don't know if it's worth it. Could you explain what doesn't
work now, in order to show *why* you need this change?

Thanks,
Fam

