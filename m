Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Umjai-0005qF-1t
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 07:51:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Umjaf-0005kS-58
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 07:51:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Umjad-0002Oo-W4
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 07:51:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59211)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Umjaa-0002Nw-WF; Wed, 12 Jun 2013 07:51:45 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1F8AC41366;
	Wed, 12 Jun 2013 15:51:42 +0400 (MSK)
Message-ID: <51B860CC.1000309@msgid.tls.msk.ru>
Date: Wed, 12 Jun 2013 15:51:40 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1370467013-9270-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA9cb2k_=c10cV5C3zi-kbhrNwahEtZF4L08GO8N=ub=cA@mail.gmail.com>
In-Reply-To: <CAFEAcA9cb2k_=c10cV5C3zi-kbhrNwahEtZF4L08GO8N=ub=cA@mail.gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org, liguang <lig.fnst@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] gitignore: unignore
	*.patch
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
X-List-Received-Date: Wed, 12 Jun 2013 11:51:50 -0000

06.06.2013 01:22, Peter Maydell wrote:
> Personally I think a lot of the random rubbish in
> our .gitignore is bogus and should be removed.
> Basically anything that's an editor dropping or
> .patch or TAGS file or similar is a local workflow
> thing and should be dealt with by setting up a global
> ignorefile in your local git config. The only
> things in the .gitignore in the public repo should
> be files which QEMU's build process itself creates.
> 
> But I know not everybody agrees with this, which is
> why all this stuff is in the .gitignore :-)

I'm one of the few who completely agrees, there's no
place for various random rubbery in there, only things
which are really generated during build should be there.

I'd really love to remove all the cruft.  But who else
disagrees?

Thanks,

/mjt

