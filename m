Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aw9TL-0006C1-7c
	for mharc-qemu-trivial@gnu.org; Fri, 29 Apr 2016 10:32:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aw9TC-0005q5-4w
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 10:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aw9T0-0004si-FV
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 10:32:32 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:54313)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1aw9Si-0004it-Cp; Fri, 29 Apr 2016 10:32:08 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id A1BD2102376;
	Fri, 29 Apr 2016 16:31:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qkL0IpOhQ5gY; Fri, 29 Apr 2016 16:31:54 +0200 (CEST)
Received: from [134.155.36.73] (edv13.bib.uni-mannheim.de [134.155.36.73])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 83DFB1021AE;
	Fri, 29 Apr 2016 16:31:54 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1461935279-30418-1-git-send-email-jano.vesely@gmail.com>
	<CAFEAcA-yNp8wGnyzMrTu=28g4vYPv-5F-PJ4aeHq8xSnxRZLkA@mail.gmail.com>
	<5723680D.2050601@weilnetz.de>
	<CAFEAcA9dHj60vTBm5TG0Ob072U64Vy8A0cGocPg7LNdO=aNqow@mail.gmail.com>
Cc: Jan Vesely <jano.vesely@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <9e437a9d-1725-5e2a-a43d-7952ccdf79ed@weilnetz.de>
Date: Fri, 29 Apr 2016 16:31:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9dHj60vTBm5TG0Ob072U64Vy8A0cGocPg7LNdO=aNqow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 134.155.96.80
Subject: Re: [Qemu-trivial] [PATCH] configure: Check if struct fsxattr is
 available from linux header
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Apr 2016 14:32:45 -0000

Am 29.04.2016 um 16:00 schrieb Peter Maydell:
> On 29 April 2016 at 14:56, Stefan Weil <sw@weilnetz.de> wrote:
>> Am 29.04.2016 um 15:54 schrieb Peter Maydell:
>>
>>> This means we'll build with a HAVE_FSXATTR define set, but
>>> nothing in the tree tries to use that as far as I can tell:
>>> "git grep HAVE_FSXATTR" returns no matches. What am I missing?
>> It's used by the system headers:
>>
>> /usr/include/xfs/xfs_fs.h:#ifndef HAVE_FSXATTR
> ...so this is a bug in the system headers that we're working
> around? It would probably be useful to say so in a comment
> in configure, otherwise it's liable to get ripped out in
> future when somebody notices it's not used any more.
> (For instance HAVE_IFADDRS_H isn't used and looks like dead
> code in configure.)
>
> thanks
> -- PMM

Is it a bug of the system headers? Or simply a design which
requires users to be careful when including certain header files?

Both /usr/include/xfs/xfs_fs.h and /usr/include/linux/fs.h define
the same struct fsxattr, and both definitions are identical.

Updating to xfslib-dev 4.3.0 did not help for Debian. This means
that even with a consistent installation of Debian Testing
QEMU fails to build as soon as CONFIG_XFS is defined.

Of course a good comment would be helpful here, e. g.

# Avoid redefinition of struct fsxattr in xfs/xfs_fs.h.
# It is already defined in linux/fs.h.

Stefan


