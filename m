Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WT3Na-0007jD-TH
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 02:01:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WT3NU-0007ab-Ag
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 02:01:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WT3NP-00021g-Ef
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 02:01:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WT3ND-0001y9-Rg; Thu, 27 Mar 2014 02:01:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 7CD2B435D3;
	Thu, 27 Mar 2014 10:01:04 +0400 (MSK)
Message-ID: <5333BEA0.7040309@msgid.tls.msk.ru>
Date: Thu, 27 Mar 2014 10:01:04 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Igor Mammedov <imammedo@redhat.com>
Subject: [Qemu-trivial] current (2014-03-27) trivial patches
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
X-List-Received-Date: Thu, 27 Mar 2014 06:01:29 -0000

Hello.

I weren't able to process -trivial patches regularly for a while,
and we are now past 2.0-rc1 schedule, which means hard freeze and
bugfix-only mode, as far as I can see.

Current queue can be seen at

 http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches-next

(I rebased it to current master).

It contains:

 - adding missing 'static' attributes series by Stefan Weil,
   which is safe to go for 2.0

 - a few documentation changes/fixes, which is definitely safe for 2.0

 - bugfix for KVM_GET_DIRTY_LOG ioctl, which should go to 2.0

 - series by Peter which tries to avoid shifting into sign bit,
   which has been reviewed and looks safe, but I'm not sure if
   it's okay for 2.0 (it doesn't hurt to keep it out for now)

 - conversion of -m to QemuOpts, for which I unfortunately don't
   have good reason to go to 2.0 currently

 - 2 patches left from series by Prasad Joshi, which are safe for 2.0.

I think that except of -m-to-QemuOpts conversion, everything should
go to 2.0, maybe that one too (Cc'ing Igor for that as well).

I'm about to prepare pull request, but want to hear some opinions
first, even for such trivial ;) things, because I weren't following
development lately.

Thanks,

/mjt

