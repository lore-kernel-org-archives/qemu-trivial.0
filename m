Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0s9B-00038D-Fl
	for mharc-qemu-trivial@gnu.org; Thu, 12 May 2016 11:03:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b0s97-00030c-Pj
	for qemu-trivial@nongnu.org; Thu, 12 May 2016 11:03:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b0s93-0002LH-En
	for qemu-trivial@nongnu.org; Thu, 12 May 2016 11:03:24 -0400
Received: from mail.avalus.com ([89.16.176.221]:34281)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>)
	id 1b0s8k-0002E8-Eh; Thu, 12 May 2016 11:03:02 -0400
Received: by mail.avalus.com (Postfix) with ESMTPSA id 4B17CC5609C;
	Thu, 12 May 2016 16:02:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alex.org.uk; s=mail;
	t=1463065377; bh=e8oOgpP/vqI82V/Jm2skVgjyq5vwOBVexad0iMDZrsY=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=P7T83usHWfbv0lt8qK2V9fAYXcXSR4ujnyrS9s/krPBbHYShi53Vbp4WIzvJDkumG
	41CLkBUB3neL+NRXIu3EV/+uBrVEto5ipJ/oJHnOGkhePE2ARirUaA6Vi2LXk2b/er
	U5Z5jksmkElm/CpgM7ilQADksRje91qgUC4qxBOM=
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Alex Bligh <alex@alex.org.uk>
In-Reply-To: <20160511210617.GB5054@grep.be>
Date: Thu, 12 May 2016 16:03:07 +0100
Cc: Alex Bligh <alex@alex.org.uk>, Eric Blake <eblake@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	qemu block <qemu-block@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Content-Transfer-Encoding: 7bit
Message-Id: <0BD4DAC5-17C2-4726-93C5-0522269D2EBF@alex.org.uk>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<20160511210617.GB5054@grep.be>
To: Wouter Verhelst <w@uter.be>
X-Mailer: Apple Mail (2.1878.6)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.16.176.221
Subject: Re: [Qemu-trivial] [Nbd] [Qemu-devel] [PATCH] nbd: fix trim/discard
 commands with a length bigger than NBD_MAX_BUFFER_SIZE
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 May 2016 15:03:27 -0000


On 11 May 2016, at 22:06, Wouter Verhelst <w@uter.be> wrote:

> On Tue, May 10, 2016 at 04:08:50PM +0100, Alex Bligh wrote:
>> What surprises me is that a release kernel is using experimental
>> NBD extensions; there's no guarantee these won't change. Or does
>> fstrim work some other way?
> 
> What makes you say NBD_CMD_TRIM is experimental? It's been implemented for
> years.

Me confusing it with NBD_CMD_WRITE_ZEROES which I corrected later
in the thread.

-- 
Alex Bligh





