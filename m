Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwTVx-0005qG-Kl
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 03:38:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1SwTVq-0005om-6r
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 03:38:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1SwTVk-0001xo-H4
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 03:38:34 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:60685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1SwTVk-0001xg-BU; Wed, 01 Aug 2012 03:38:28 -0400
Received: by yenl1 with SMTP id l1so6799016yen.4
	for <multiple recipients>; Wed, 01 Aug 2012 00:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=yWwLkQ1fidmau2DizANuwGGYV+gi7Y4MNzaNcVZzPGw=;
	b=biHwgWHtUiJ/nl8SCvbVQfZDPZN905Q4E0ffrTxSJdsUBveHY4vW/tHi5TA+gPtpsr
	GTzN6jfzNmT6thlu0BAl14gmySp0AoEl/IjKc4vywAYZY/MRkkkpt7CFL78QB24BP6s9
	9cBfe++31YnzljNHYL3yn5JVccybF5WvJsosYtRbQEduB3EXpRufPAwzAvRAXdj/zprf
	l5Mu7bMTWydMGz1uAUhpGvaqNbKu3x4ZQe/l8V3Ny2nfnSFE5sh7MdBiOVPhVAd1DG6g
	Jgd9b02IZjX+1N5LJACSXY0O6hioUFBCHwB6YaaJGA6jm9UqlOG20UYA9gnKuTOmUryr
	fmCQ==
Received: by 10.66.88.131 with SMTP id bg3mr38154774pab.16.1343806706707;
	Wed, 01 Aug 2012 00:38:26 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-169-1.ip50.fastwebnet.it.
	[93.34.169.1])
	by mx.google.com with ESMTPS id qo7sm2051615pbc.12.2012.08.01.00.38.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 00:38:25 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5018DCEB.9060208@redhat.com>
Date: Wed, 01 Aug 2012 09:38:19 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Hannes Reinecke <hare@suse.de>
References: <1343714097-545-1-git-send-email-sw@weilnetz.de>
	<5017EE1D.8060908@suse.de> <5017EEFD.5070503@redhat.com>
	<5017EFC6.1050705@suse.de> <5017F0A2.5030400@redhat.com>
	<5017F1E3.90806@suse.de> <87y5m06jx1.fsf@codemonkey.ws>
	<5017FD81.3040707@redhat.com> <50185960.9050700@suse.de>
In-Reply-To: <50185960.9050700@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] megasas: Update function
	megasys_scsi_uninit
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
X-List-Received-Date: Wed, 01 Aug 2012 07:38:40 -0000

Il 01/08/2012 00:17, Hannes Reinecke ha scritto:
> Ad 2: no, the SAS address for the devices is _not_ the WWN.
> The WWN is the ID of the LUN, whereas the SAS address is the ID of the
> Target. So to be correct we would need to generate unique SAS addressed
> per target which needs to be different from the WWN.

Oh, that's even easier then, just delete all the get_wwn stuff and use
HBA address + 1 + sdev->id.

Paolo

> However, megasas does not need to present SAS addresses here; we can set
> the interface to PCI-E (instead of SAS) and just use the LUN number.
> Sadly I've yet to figure out the code for PCIE.
> (Doing it correctly involves staring a binary output and figuring the
> meaning of bits. Did I mention I don't have documentation for that beast?)
> That's what's stalled the patch for now.



