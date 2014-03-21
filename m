Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WR40m-00019Z-Re
	for mharc-qemu-trivial@gnu.org; Fri, 21 Mar 2014 14:17:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1WR40c-0000nb-Hd
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 14:17:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1WR40X-0003Ne-Ly
	for qemu-trivial@nongnu.org; Fri, 21 Mar 2014 14:17:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59746)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1WR40N-0003M4-KL; Fri, 21 Mar 2014 14:17:19 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2LIHF91007713
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Mar 2014 14:17:15 -0400
Received: from localhost ([10.3.113.8])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2LIHEIR014966; Fri, 21 Mar 2014 14:17:15 -0400
Date: Fri, 21 Mar 2014 15:17:13 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Fabien Chouteau <chouteau@adacore.com>
Message-ID: <20140321181713.GE2057@otherpad.lan.raisama.net>
References: <1395080791-18640-1-git-send-email-ehabkost@redhat.com>
	<532C7F18.1010507@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <532C7F18.1010507@adacore.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] CODING_STYLE: Section
 about mixed declarations
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
X-List-Received-Date: Fri, 21 Mar 2014 18:17:39 -0000

On Fri, Mar 21, 2014 at 07:04:08PM +0100, Fabien Chouteau wrote:
> On 03/17/2014 07:26 PM, Eduardo Habkost wrote:
> > We had an unwritten rule about declarations having to be at beginning of
> > blocks. Make it a written rule.
> > 
> 
> Hello Eduardo,
> 
> Is it possible to check this rule in script/checkpatch.pl? (or is it already?)

checkpatch.pl doesn't check it, currently. It is possible to check it,
if somebody writes the code to do that.

-- 
Eduardo

