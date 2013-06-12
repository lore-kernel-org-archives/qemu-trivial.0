Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Umm4m-0007SA-7w
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 10:31:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1Umm4g-0007QZ-RD
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 10:31:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1Umm4d-0004TZ-4N
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 10:30:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43178)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1Umm4c-0004Sy-Sd; Wed, 12 Jun 2013 10:30:55 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5CEUftX013997
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 12 Jun 2013 10:30:41 -0400
Received: from lacos-laptop.usersys.redhat.com (vpn1-7-250.ams2.redhat.com
	[10.36.7.250])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5CEUc6X029966; Wed, 12 Jun 2013 10:30:39 -0400
Message-ID: <51B8869E.2030801@redhat.com>
Date: Wed, 12 Jun 2013 16:33:02 +0200
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130513 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1370467013-9270-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA9cb2k_=c10cV5C3zi-kbhrNwahEtZF4L08GO8N=ub=cA@mail.gmail.com>
	<51B860CC.1000309@msgid.tls.msk.ru>
In-Reply-To: <51B860CC.1000309@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org,
	liguang <lig.fnst@cn.fujitsu.com>
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
X-List-Received-Date: Wed, 12 Jun 2013 14:31:02 -0000

On 06/12/13 13:51, Michael Tokarev wrote:
> 06.06.2013 01:22, Peter Maydell wrote:
>> Personally I think a lot of the random rubbish in
>> our .gitignore is bogus and should be removed.
>> Basically anything that's an editor dropping or
>> .patch or TAGS file or similar is a local workflow
>> thing and should be dealt with by setting up a global
>> ignorefile in your local git config. The only
>> things in the .gitignore in the public repo should
>> be files which QEMU's build process itself creates.
>>
>> But I know not everybody agrees with this, which is
>> why all this stuff is in the .gitignore :-)
> 
> I'm one of the few who completely agrees, there's no
> place for various random rubbery in there, only things
> which are really generated during build should be there.
> 
> I'd really love to remove all the cruft.  But who else
> disagrees?

I agree that .gitignore should list only files produced by the build
process. Anything else can be added to a global ignore file (which I
haven't heard of before, but it probably does exist :)), *or* to

  .git/info/exclude

(recommended by Eric Blake to me some months back)

This file is not tracked like .gitignore, but it doesn't need tracking.

Laszlo

