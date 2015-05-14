Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ysrcr-0001W6-1d
	for mharc-qemu-trivial@gnu.org; Thu, 14 May 2015 07:48:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Ysrcn-0001Ti-AV
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 07:48:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Ysrcl-0000dx-Kq
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 07:48:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51203)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Ysrcl-0000dg-DQ; Thu, 14 May 2015 07:48:23 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4EBmLLl025796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 14 May 2015 07:48:21 -0400
Received: from [10.36.112.31] (ovpn-112-31.ams2.redhat.com [10.36.112.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4EBlr0g014216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 14 May 2015 07:48:11 -0400
Message-ID: <55548B65.2030204@redhat.com>
Date: Thu, 14 May 2015 13:47:49 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Cerveny <M.Cerveny@computer.org>
References: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
	<1431519294-8873-3-git-send-email-M.Cerveny@computer.org>
	<55547221.4030109@redhat.com>
	<alpine.GSO.2.00.1505141317030.24664@dmz.c-home.cz>
In-Reply-To: <alpine.GSO.2.00.1505141317030.24664@dmz.c-home.cz>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/2] scripts: qom-tree: add support of
	path as argument
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
X-List-Received-Date: Thu, 14 May 2015 11:48:26 -0000



On 14/05/2015 13:41, Martin Cerveny wrote:
> Hello.
> 
> Ternary/if/else >= python 2.5 (I use the same coding as in
> scripts/qmp/qemu-ga-client).

Oh, that's old.  Shows my knowledge of Python.

Then your patch is okay---thanks for enduring with me. :)

Paolo

> "import json" >= python 2.6 (scripts/qmp/qmp.py)
> "import argparse" >= python 2.7 (scripts/analyze-migration.py,
> scripts/vmstate-static-checker.py)
> "import optparse" < python 2.7 (deprecated, scripts/qmp/qemu-ga-client)
> ....
> 
> Of course there is no problem to use traditional syntax.
> (My platform (centos5.10) has python2.4, I must also replace json imports:
> try:
>     import json
> except ImportError:
>     import simplejson as json
> )
> 
> Which version of python is officialy minimum supported ?
> 
> Thanks for explanation of python status.
> 
> M.C>

