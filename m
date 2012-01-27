Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqfEJ-00028L-IG
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 01:24:11 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RqfEG-0001wn-Ar
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 01:24:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RqfEF-0001K9-4x
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 01:24:08 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:43586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RqfEB-0001Ii-Pi; Fri, 27 Jan 2012 01:24:03 -0500
Received: by dajr28 with SMTP id r28so1436527daj.4
	for <multiple recipients>; Thu, 26 Jan 2012 22:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=N+cOWurnIJBHZKBO7Hix023U2NPjd4r5xkLPDr/97w4=;
	b=ZAY/5/3dGq2YYpOhImIUopTnGfAMqhko2lXuKV7NGKsW/cXiksXsnjufC+2ACx85Q3
	LAIelDG+4Hg+8z6fGoh1Qz0SX6pfFCknIcM3hNlLkrAyqFMttyvBu6PiNM/wr+QCSSN6
	fmFSjMwu/EqIYiBMDAgRfptCwuvVgyPPSbjUA=
Received: by 10.68.73.8 with SMTP id h8mr11983756pbv.109.1327645442842;
	Thu, 26 Jan 2012 22:24:02 -0800 (PST)
Received: from localhost (42-98-55-070.static.netvigator.com. [42.98.55.70])
	by mx.google.com with ESMTPS id o7sm17465664pbq.8.2012.01.26.22.23.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 22:24:01 -0800 (PST)
Date: Fri, 27 Jan 2012 06:23:55 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Message-ID: <20120127062355.GA20307@stefanha-thinkpad.localdomain>
References: <1327425457-31313-1-git-send-email-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1327425457-31313-1-git-send-email-afaerber@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: Kevin Wolf <kwolf@redhat.com>,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>,
	Anthony Liguori <aliguori@us.ibm.com>,
	Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Blue Swirl <blauwirbel@gmail.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <andreas.faerber@web.de>,
	Amit Shah <amit.shah@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6] qdev: Add support for
	property type bool
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
X-List-Received-Date: Fri, 27 Jan 2012 06:24:09 -0000

On Tue, Jan 24, 2012 at 06:17:36PM +0100, Andreas Färber wrote:
> From: Andreas Färber <andreas.faerber@web.de>
> 
> VMState supports the type bool but qdev instead supports bit, backed by
> uint32_t. Therefore let's add DEFINE_PROP_BOOL() and qdev_prop_set_bool().
> 
> bool by definition is either true or false. Should the need arise to
> parse yes/no, on/off, 1/0 or whatever as well, we can still add that at
> a later point in time.
> 
> Signed-off-by: Andreas Färber <andreas.faerber@web.de>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Cc: Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>
> ---
>  v5 -> v6:

Please merge through a qemu.git committer.  v6 and discussion means this
isn't trivial.

Stefan

