Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCYh3-0001Vj-E3
	for mharc-qemu-trivial@gnu.org; Tue, 27 Mar 2012 11:52:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SCYgu-00014t-JI
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 11:52:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SCYgn-0006GY-1F
	for qemu-trivial@nongnu.org; Tue, 27 Mar 2012 11:52:12 -0400
Received: from cantor2.suse.de ([195.135.220.15]:42884 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SCYgf-00069A-Am; Tue, 27 Mar 2012 11:51:57 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 44E888FE69;
	Tue, 27 Mar 2012 17:51:55 +0200 (CEST)
Message-ID: <4F71E21A.7010009@suse.de>
Date: Tue, 27 Mar 2012 17:51:54 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120215 Thunderbird/10.0.2
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>,
	Paul Brook <paul@codesourcery.com>
References: <1330121921-23462-1-git-send-email-meadori@codesourcery.com>
	<4F4814F7.6040008@suse.de> <4F71D7AD.8080103@codesourcery.com>
	<CAFEAcA8R+J+DeN7V_6bVHhh3kYprA8EKWJXEzfDp7iWjWzYLqQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8R+J+DeN7V_6bVHhh3kYprA8EKWJXEzfDp7iWjWzYLqQ@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Meador Inge <meadori@codesourcery.com>, qemu-devel@nongnu.org,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/1] m68k: Return
 semihosting errno values correctly
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
X-List-Received-Date: Tue, 27 Mar 2012 15:52:19 -0000

Am 27.03.2012 17:43, schrieb Peter Maydell:
> This patch is simple enough (and m68k unmaintained enough)
> that it could reasonably go through qemu-trivial I think.

This one's a Mentor-internal issue though - Paul, are you planning to
handle (your colleague's) m68k patches? Or should we downgrade m68k to
S: Orphan and handle them through some other to be defined way?

I'm asking because I have m68k QOM'ification in the queue and Anthony
has set out not to apply patches for which a submaintainer is defined.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

