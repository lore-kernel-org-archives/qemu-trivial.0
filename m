Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ShzmL-0008Kg-GD
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 05:03:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ShzmE-0008K6-Iv
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:03:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ShzmC-000761-Q7
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 05:03:38 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:37881)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ShzmC-00075k-Gh; Fri, 22 Jun 2012 05:03:36 -0400
Received: by bkwj10 with SMTP id j10so1441864bkw.4
	for <multiple recipients>; Fri, 22 Jun 2012 02:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xwwAJn39C1KnpeXqDqFIu4Uxj/aJ7rPmihCpQY2MaNs=;
	b=gS8zOdYEkwuEmEDkOzgzfdYugt/KOQLo1KfAJOY2adskkQajx6LLDy3rQxSBe9D7Sj
	hq8QdhtFkBDkWTNKEFGFC12S9eQoQVUHcZy815e4eotj1eHIzlxZ66B4xjCWW5C8L00p
	4MBj2TjFTe/mXckJ7JGl9pRx14My1YmCtX/YlENBgTK1CqVjPkpTkOnACdmMxcrFaB6N
	LnzVr6UNgv87zvryTJbcdjnOX3nEAifAYr6H2Mypmpj2MaM2OOu29DTB46Yi1z5bgU7k
	AfX9/coL1qL+gwSnDRn83XOspORcA9PWsE+Q54f8TTdfJr+eIXe7Ha+s1gfaSU1/1r5u
	A6mg==
Received: by 10.205.137.17 with SMTP id im17mr489539bkc.9.1340355813580;
	Fri, 22 Jun 2012 02:03:33 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	fw10sm35128106bkc.11.2012.06.22.02.03.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 02:03:32 -0700 (PDT)
Date: Fri, 22 Jun 2012 10:03:31 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
Message-ID: <20120622090331.GB27038@stefanha-thinkpad.localdomain>
References: <1340088278-8406-1-git-send-email-peter.crosthwaite@petalogix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1340088278-8406-1-git-send-email-peter.crosthwaite@petalogix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Jim Meyering <meyering@redhat.com>,
	"Peter A. G. Crosthwaite" <peter.croshtwaite@petalogix.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] cadence_gem: Avoid stack-writing
 buffer-overrun
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
X-List-Received-Date: Fri, 22 Jun 2012 09:03:44 -0000

On Tue, Jun 19, 2012 at 04:44:38PM +1000, Peter A. G. Crosthwaite wrote:
> From: Jim Meyering <meyering@redhat.com>
> 
> Use sizeof(rxbuf)-size (not sizeof(rxbuf-size)) as the number
> of bytes to clear.  The latter would always clear 4 or 8
> bytes, possibly writing beyond the end of that stack buffer.
> Alternatively, depending on the value of the "size" parameter,
> it could fail to initialize the end of "rxbuf".
> Spotted by coverity.
> 
> Signed-off-by: Jim Meyering <meyering@redhat.com>
> Signed-off-by: Peter A. G. Crosthwaite <peter.croshtwaite@petalogix.com>
> ---
>  hw/cadence_gem.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

