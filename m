Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VHAoW-0007oV-Dl
	for mharc-qemu-trivial@gnu.org; Wed, 04 Sep 2013 06:59:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VHAoP-0007oH-An
	for qemu-trivial@nongnu.org; Wed, 04 Sep 2013 06:59:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VHAoJ-00020N-9w
	for qemu-trivial@nongnu.org; Wed, 04 Sep 2013 06:59:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51580)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1VHAoJ-00020H-1o; Wed, 04 Sep 2013 06:59:43 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r84AxT5R030953
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 4 Sep 2013 06:59:30 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-36.ams2.redhat.com
	[10.36.112.36])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r84AxMSW020643; Wed, 4 Sep 2013 06:59:23 -0400
Message-ID: <5227128D.705@redhat.com>
Date: Wed, 04 Sep 2013 12:59:25 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <1378191917-6964-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<52258E44.9010704@redhat.com> <52259F6E.3000205@suse.de>
	<5225C559.2030601@msgid.tls.msk.ru> <52261431.5050705@suse.de>
In-Reply-To: <52261431.5050705@suse.de>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx1.redhat.com id
	r84AxT5R030953
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Alexander Graf <agraf@suse.de>,
	qemu-devel <qemu-devel@nongnu.org>, liguang <lig.fnst@cn.fujitsu.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] cputlb: remove dead function
	tlb_update_dirty
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
X-List-Received-Date: Wed, 04 Sep 2013 10:59:55 -0000

Il 03/09/2013 18:54, Andreas F=E4rber ha scritto:
> Also, I am seeing Paolo pull in huge memory changes but now pinging the
> breakage fixes rather than assembling a pull to fix the fallout. ;)

Well, I didn't put myself as memory maintainer for a reason. :)  But it
looks like a pull request is the best thing to do, so I'll find some
time this week to make one.

Paolo

