Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLG2D-0007uG-Na
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 13:59:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLG2B-0007rS-Rp
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 13:59:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLG2B-0005tf-47
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 13:59:43 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33529)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YLG26-0005rB-HC; Tue, 10 Feb 2015 13:59:38 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 531E6419B0;
	Tue, 10 Feb 2015 21:59:37 +0300 (MSK)
Message-ID: <54DA5519.80308@msgid.tls.msk.ru>
Date: Tue, 10 Feb 2015 21:59:37 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
References: <1421846317-7088-1-git-send-email-armbru@redhat.com>	<CAEgOgz73n5P+LH=pa4+qqxNwoX45BJbaKbQK4VSZGkB8eYAthw@mail.gmail.com>
	<87pp9ij7mk.fsf@blackfin.pond.sub.org>
In-Reply-To: <87pp9ij7mk.fsf@blackfin.pond.sub.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] xilinx_ethlite: Clean up
 after commit 2f991ad
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
X-List-Received-Date: Tue, 10 Feb 2015 18:59:44 -0000

10.02.2015 15:03, Markus Armbruster wrote:
> Since maintainers haven't picked it up: could this go in via -trivial?
> 
> Peter Crosthwaite <peter.crosthwaite@xilinx.com> writes:
> 
>> On Wed, Jan 21, 2015 at 5:18 AM, Markus Armbruster <armbru@redhat.com> wrote:
>>> The "fall through" added by the commit is clearly intentional.  Mark
>>> it so.  Hushes up Coverity.

Applied to -trivial, thank you!

/mjt

