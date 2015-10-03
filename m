Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk680-00082a-Bz
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 04:00:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZiQDD-0004d9-Db
	for qemu-trivial@nongnu.org; Sat, 03 Oct 2015 13:03:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZiQDC-00010z-Hb
	for qemu-trivial@nongnu.org; Sat, 03 Oct 2015 13:03:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55843)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZiQD7-0000yx-Q6; Sat, 03 Oct 2015 13:03:01 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AEAB74035C;
	Sat,  3 Oct 2015 20:03:00 +0300 (MSK)
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 9A93CA66;
	Sat,  3 Oct 2015 20:03:00 +0300 (MSK)
Message-ID: <56100A44.1030809@msgid.tls.msk.ru>
Date: Sat, 03 Oct 2015 20:03:00 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: David Gibson <david@gibson.dropbear.id.au>, peter.maydell@linaro.org, 
	alex.bennee@linaro.org
References: <1442986032-26529-1-git-send-email-david@gibson.dropbear.id.au>
In-Reply-To: <1442986032-26529-1-git-send-email-david@gibson.dropbear.id.au>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] .travis.yml: Run make check for all
 targets, not just some
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
X-List-Received-Date: Sat, 03 Oct 2015 17:03:11 -0000

23.09.2015 08:27, David Gibson wrote:
> ed173cb ".travis.yml: remove "make check" from main matrix" stopped running
> make check for all the Travis build targets for various reasons.  It
> continued to run make check on one Travis build, which builds for a big
> list of all (? nearly all) our supported softmmu targets.
> 
> Unfortunately, due to a spacing / quoting error it only actually builds for
> the alpha, arm, aarch64 and cris targets.  Specifically, the list of
> targets is split over several lines.  Even with YAML folding, this will
> leave spaces in the list, meaning $TARGETS won't have the value we need.
> 
> I had a look at the YAML spec and I couldn't quickly see a way of splitting
> the list so that it doesn't end up with spaces, so this patch fixes the
> problem by putting the whole list on one huge line.

Applied to -trivial, thank you!

/mjt

