Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TsKuh-0007Q2-Vu
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jan 2013 17:11:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1TsKuf-0007IR-M8
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 17:11:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1TsKue-0006VB-Ls
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 17:11:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:20941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1TsKuc-0006Uo-Hd; Mon, 07 Jan 2013 17:11:18 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r07MBH5v032177
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 7 Jan 2013 17:11:17 -0500
Received: from blackpad.lan.raisama.net (vpn1-7-15.gru2.redhat.com
	[10.97.7.15])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r07MBGMS023595; Mon, 7 Jan 2013 17:11:16 -0500
Received: by blackpad.lan.raisama.net (Postfix, from userid 500)
	id 2F7F2203D16; Mon,  7 Jan 2013 20:12:57 -0200 (BRST)
Date: Mon, 7 Jan 2013 20:12:57 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130107221257.GG18372@otherpad.lan.raisama.net>
References: <1357579795-11770-1-git-send-email-peter.maydell@linaro.org>
	<50EB0805.604@weilnetz.de>
	<CAFEAcA8rwVhbgUbc3VRtgQUWtztkdXyxYfhxJozytdVQyeFY-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8rwVhbgUbc3VRtgQUWtztkdXyxYfhxJozytdVQyeFY-g@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qga/channel-posix.c:
 Explicitly include string.h
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
X-List-Received-Date: Mon, 07 Jan 2013 22:11:22 -0000

On Mon, Jan 07, 2013 at 05:50:14PM +0000, Peter Maydell wrote:
> On 7 January 2013 17:38, Stefan Weil <sw@weilnetz.de> wrote:
> > Am 07.01.2013 18:29, schrieb Peter Maydell:
> >
> >> Explicitly include string.h to avoid warnings under MacOS X/clang
> >> about implicit declarations of strerror() and strlen().
> 
> > Better: include qemu-common.h first and remove all
> > three standard includes.
> 
> This would be reversing direction from commit 4d4922c33...
> I took the commit message in that commit to imply that we
> shouldn't be including qemu-common.h for standalone
> executables like qga.

Including qemu-common.h from .c files is OK, although I wouldn't do that
in this specific case (I would include string.h instead).

The problem with qemu-common.h is when it is included by header files,
because qemu-common.h includes lots of other headers, easily leading to
circular header dependencies.

-- 
Eduardo

