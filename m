Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPs0N-00088i-Bt
	for mharc-qemu-trivial@gnu.org; Sun, 31 Jan 2016 08:25:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aPs0K-00084H-0A
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 08:25:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aPs0G-0002z3-St
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 08:25:23 -0500
Received: from nm3-vm8.bullet.mail.gq1.yahoo.com ([98.136.218.151]:56217)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sitsofe@yahoo.com>) id 1aPs0G-0002yp-LJ
	for qemu-trivial@nongnu.org; Sun, 31 Jan 2016 08:25:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1454246719; bh=1aZe6GynDvdml6l9xGfugYp2yXbU/4n7+ZtHGC+tFpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject;
	b=XlFhrkLqXQA/+SmC/o+4woS8duWDpAC8Jr0vk1B8AvppFj+Ln3kU2mj+6K+ToV5DpNgoowpQe1ZWmH1pOXof3NCPP+QJg7kaa0oxMZ+B332RlbOvWywNrOl6zttLZpIISSjCzVqnQG0efgserPjGU9RfbTsk9yfMSjy4Qr6TocU7rWc2J2Jo9ulmSFtFnf68jmSFDI+GmS+pBWyFL6VXkqquFkshJtcvIIFRuSpb+clMhBFMc++9yA64rXcJsvYE1UIjjnhcfXMubM9v7UlotSyl0asMl6cAw8Egd1h56PJL0oPwYDGoF1/wbCKTLMPP9BOgqw7MXJkIE6iBtpq79Q==
Received: from [216.39.60.183] by nm3.bullet.mail.gq1.yahoo.com with NNFMP;
	31 Jan 2016 13:25:19 -0000
Received: from [208.71.42.190] by tm19.bullet.mail.gq1.yahoo.com with NNFMP;
	31 Jan 2016 13:25:19 -0000
Received: from [127.0.0.1] by smtp201.mail.gq1.yahoo.com with NNFMP;
	31 Jan 2016 13:25:19 -0000
X-Yahoo-Newman-Id: 33458.34146.bm@smtp201.mail.gq1.yahoo.com
X-Yahoo-Newman-Property: ymail-3
X-YMail-OSG: XExWRtYVM1mGSLvkj0DEnUpdiTOYaQeSj8mE66VndxwSXnN
	6Rpn14MxG7NnVhlbPviF6kMeMLvXwel47cjRPgscz2jM0UufWSHVqbv0eHWQ
	2JHqOk90R3xQb6CuvABGK4n2.9IK3.V4FJih0ZfG91.bp4jPJv9iOTxoPO2v
	JsRAMWtYZKTFgI1wnzfc05hHQzX7PLRDQSft6nNM7ScU8ulE.5fJaCdAIkFU
	s_e0lSnQaj1GgOfELRo9Vn1d2mx_knJf2Xj05b9Zst0f82ahI4WDIYO3zuk5
	f3RKSHO9I9PSfSXNJYobrrPSwBZhfpDQfTMINRAdcUAQZmTDHHjtxwA8CZXh
	zdqlvP.aU4Nc2WuZeFXfVFnW6ii2BMIGc8mFPO1cCP43g1qlUr7BxowAhjna
	tCOaj7UsvZ41ZiPn5J5COkbvd.gfrqVgxmepxhE_4o7LooaUdM60esMe9JDi
	lnw8yoYEcPREJhAlyham.B27GOCRQLStQH1T5BJtu.0hRivcOdGwncXbmZOB
	CM9LwTfQoLDZ7iuT1OMRZTC6QTxVq8cZbUexZsSu8uA--
X-Yahoo-SMTP: mEA9emqswBDufi8V3X8MBXZonFM-
Date: Sun, 31 Jan 2016 13:25:09 +0000
From: Sitsofe Wheeler <sitsofe@yahoo.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160131132459.GA26489@sucs.org>
References: <1451979212-25479-1-git-send-email-sitsofe@yahoo.com>
	<568E5D29.4000805@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <568E5D29.4000805@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 98.136.218.151
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 0/3] qemu-nbd.texi formatting,
 grammar and completeness fixes
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
X-List-Received-Date: Sun, 31 Jan 2016 13:25:25 -0000

Hi,

On Thu, Jan 07, 2016 at 01:42:17PM +0100, Paolo Bonzini wrote:
> 
> On 05/01/2016 08:33, Sitsofe Wheeler wrote:
> > Bring the qemu-nbd man page up to date with options and fix some styling and
> > grammar issues along the way.
> > 
> > Changes from v1:
> > - Add disconnect usage to synopsis.
> > - Add styling to synopsis usage.
> > - Fix up the grammar in the description.
> > - Move filename variable description out of the option table.
> > - Add a description of the NBD dev variable.
> > - Add reference to qemu man page to see also section.
> > - Fix sentence capitalisation in options section.
> > 
> > Sitsofe Wheeler (3):
> >   qemu-nbd: Fix unintended texi verbatim formatting
> >   qemu-nbd: Minor texi updates
> >   qemu-nbd: Fix texi sentence capitalisation
> > 
> >  qemu-nbd.texi | 80 +++++++++++++++++++++++++++++++++--------------------------
> >  1 file changed, 45 insertions(+), 35 deletions(-)
> > 
> 
> Thanks, queued.  Will send a pull request some time next week.

Just checking - did this one get lost? Nothing's popped up in the QEMU
git repos yet...

-- 
Sitsofe | http://sucs.org/~sits/

