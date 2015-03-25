Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yan8G-0002xP-JO
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2015 11:22:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yan8D-0002sB-P3
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 11:22:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yan8A-0000M0-HE
	for qemu-trivial@nongnu.org; Wed, 25 Mar 2015 11:22:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41109)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Yan7x-0000HN-Pz; Wed, 25 Mar 2015 11:21:53 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2E1D942654;
	Wed, 25 Mar 2015 18:21:53 +0300 (MSK)
Message-ID: <5512D292.8040107@msgid.tls.msk.ru>
Date: Wed, 25 Mar 2015 18:21:54 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1426869044-21338-1-git-send-email-eblake@redhat.com>
In-Reply-To: <1426869044-21338-1-git-send-email-eblake@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [for-2.3 PATCH v2] gitignore: Ignore more .pod
	files.
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
X-List-Received-Date: Wed, 25 Mar 2015 15:22:10 -0000

20.03.2015 19:30, Eric Blake wrote:
> kvm_stat.{1,pod} started showing up as untracked files in my
> directory, and I nearly accidentally merged them into a commit
> with my usual habit of 'git add .'.  Rather than spelling out
> each such file, just ignore the entire pattern.

Applied to -trivial, thank you!

/mjt

