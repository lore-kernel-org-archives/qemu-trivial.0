Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSNxt-0002eD-4I
	for mharc-qemu-trivial@gnu.org; Sat, 05 Oct 2013 05:15:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSNxl-0002US-NU
	for qemu-trivial@nongnu.org; Sat, 05 Oct 2013 05:15:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSNxf-0003d3-PT
	for qemu-trivial@nongnu.org; Sat, 05 Oct 2013 05:15:49 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSNxT-0003W7-Db; Sat, 05 Oct 2013 05:15:31 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5758D40AC6;
	Sat,  5 Oct 2013 13:15:30 +0400 (MSK)
Message-ID: <524FD8B2.9090201@msgid.tls.msk.ru>
Date: Sat, 05 Oct 2013 13:15:30 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1380469272-19230-1-git-send-email-sw@weilnetz.de>	<52488A00.6000405@msgid.tls.msk.ru>
	<52488E98.3060505@weilnetz.de>
	<871u46iq96.fsf@blackfin.pond.sub.org>
	<5249E4CD.1050605@weilnetz.de> <524C6DD0.9070605@msgid.tls.msk.ru>
	<524C80ED.3020507@weilnetz.de> <524D2745.8060906@redhat.com>
In-Reply-To: <524D2745.8060906@redhat.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: Fix compiler
 warning ('caps' may be used uninitialized)
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
X-List-Received-Date: Sat, 05 Oct 2013 09:15:55 -0000

Okay.  This takes just too long and too many people
are affected.  I'll just set the variable in question
(caps) to NULL at entry for now, -- it is not a critical
path and the current code is correct anyway.  This is
becoming ridiculous, when there are so many different
opinions about such a trivial thing, with the result
being that nothing is fixed.  Setting it to NULL at
least will let a buildbot to be fixed for now.

Thanks,

/mjt

