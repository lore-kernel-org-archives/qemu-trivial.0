Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qml7E-0003xk-18
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jul 2011 07:20:28 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Qml79-0003mw-Qg
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2011 07:20:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Qml77-0003xL-Em
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2011 07:20:23 -0400
Received: from mail-gw0-f45.google.com ([74.125.83.45]:61140)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Qml76-0003wC-TQ; Fri, 29 Jul 2011 07:20:21 -0400
Received: by gwb19 with SMTP id 19so3143072gwb.4
	for <multiple recipients>; Fri, 29 Jul 2011 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=qeN/IBmOxEvnIHDDo5O7Km1QbDrOGIZy+5kwqLYEzpM=;
	b=bbgNc5ZCI+i6vfkVeIHBKmuLfbbBQEBzipuSEdLU11q02J8q8Qcm1FxcverA9PeGGN
	qphlQh83cU8ftXu/IB0rSQsX6EtNMLwOBcTJdXLJu8hW0tdRM60lhe9HMDtZ4eZRuPWy
	nloaNqWYM3EEN+if0+biSD+PjAL5/DEsmjR+U=
Received: by 10.90.72.8 with SMTP id u8mr982702aga.209.1311938418804;
	Fri, 29 Jul 2011 04:20:18 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-199-31.ip51.fastwebnet.it
	[93.34.199.31])
	by mx.google.com with ESMTPS id q6sm1823633anp.35.2011.07.29.04.20.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 04:20:17 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4E32976D.5090605@redhat.com>
Date: Fri, 29 Jul 2011 13:20:13 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Michael Roth <mdroth@linux.vnet.ibm.com>
References: <1311652562-10794-1-git-send-email-cerbere@gmail.com>
	<1311652562-10794-2-git-send-email-cerbere@gmail.com>
	<m339htczcl.fsf@blackfin.pond.sub.org>
	<CAHWZs7UG9NrAQKAtJN2+eQtbOOGFZrotdfSg3PhQ+FD_mRX4-w@mail.gmail.com>
	<m3k4b4z2nh.fsf@blackfin.pond.sub.org>
	<CAHWZs7VbfrECzwb08-vjRJLcoGXo-OnmPJg0C436qa5FHzFeKA@mail.gmail.com>
	<4E3023BA.3030105@linux.vnet.ibm.com>
In-Reply-To: <4E3023BA.3030105@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: Alexandre Raymond <cerbere@gmail.com>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Qemu Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 1/2] Makefile: distclean should clean all
 possible targets
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
X-List-Received-Date: Fri, 29 Jul 2011 11:20:26 -0000

On 07/27/2011 04:42 PM, Michael Roth wrote:
>> "Delete all files in the current directory (or created by this
>> makefile) that are created by configuring or building the program. If
>> you have unpacked the source and built the program without creating
>> any other files, ‘make distclean’ should leave only the files that
>> were in the distribution. However, there is no need to delete parent
>> directories that were created with ‘mkdir -p’, since they could have
>> existed anyway. "
>>
>> Now, if everyone agrees that "distclean" is fine as it is, I won't
>> insist on anything.
>
> I'm with you in that distclean to me reads as "make clean for
> re-distribution". i.e. a pristine source tree.

It should be like that _as long as you rerun make distclean before every 
reconfiguration_.

Paolo

