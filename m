Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQjQT-0002yq-Gh
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2011 13:05:17 -0400
Received: from eggs.gnu.org ([140.186.70.92]:57977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQjQN-0002l4-HS
	for qemu-trivial@nongnu.org; Sun, 29 May 2011 13:05:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1QQjQM-0003no-Ht
	for qemu-trivial@nongnu.org; Sun, 29 May 2011 13:05:11 -0400
Received: from fmmailgate01.web.de ([217.72.192.221]:39637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1QQjQJ-0003mm-UW; Sun, 29 May 2011 13:05:08 -0400
Received: from smtp04.web.de  ( [172.20.0.225])
	by fmmailgate01.web.de (Postfix) with ESMTP id 7724C18F98BAB;
	Sun, 29 May 2011 19:05:05 +0200 (CEST)
Received: from [87.173.127.118] (helo=[10.0.1.1])
	by smtp04.web.de with asmtp (TLSv1:AES128-SHA:128) (WEB.DE 4.110 #2)
	id 1QQjQH-0000EI-00; Sun, 29 May 2011 19:05:05 +0200
Message-Id: <8736D7AA-0AED-41E6-8A48-24BB1A948A8C@web.de>
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
To: Alexandre Raymond <cerbere@gmail.com>
In-Reply-To: <BANLkTikpOwSnNS7Y4B8+ZAO=dT-JimQTAw@mail.gmail.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sun, 29 May 2011 19:05:04 +0200
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
	<1306516951-31105-2-git-send-email-cerbere@gmail.com>
	<E3869720-39F6-4B6C-AD9A-E566DEE2005E@web.de>
	<BANLkTikpOwSnNS7Y4B8+ZAO=dT-JimQTAw@mail.gmail.com>
X-Mailer: Apple Mail (2.936)
Sender: andreas.faerber@web.de
X-Sender: Andreas.Faerber@web.de
X-Provags-ID: V01U2FsdGVkX19PvZKgnl3WKts02dCuxgg6Ja9tOYoRE4+h/dXO
	srbBHB+e8GRDwSDn0UEkocS+7Qrq9Qb5pIYDD8rNKFbSGObCT1
	lS5iQFgb1/1uSzHAhEwg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.221
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/6] Fix incorrect check for
	fdatasync() in configure
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
X-List-Received-Date: Sun, 29 May 2011 17:05:16 -0000

Hi Alexandre,

Am 29.05.2011 um 17:46 schrieb Alexandre Raymond:

> According to this excerpt from The Open Group Base Specifications
> Issue 6 (http://pubs.opengroup.org/onlinepubs/009695399/basedefs/unistd.h.html 
> ),
> '>0' indeed means that the functionality is implemented and can be
> used.
> ----8<----
> The following symbolic constants, if defined in <unistd.h>, shall have
> a value of -1, 0, or greater, unless otherwise specified below. If
> these are undefined, the fpathconf(), pathconf(), or sysconf()
> functions can be used to determine whether the option is provided for
> a particular invocation of the application.
>
> If a symbolic constant is defined with the value -1, the option is not
> supported. Headers, data types, and function interfaces required only
> for the option need not be supplied. An application that attempts to
> use anything associated only with the option is considered to be
> requiring an extension.
>
> If a symbolic constant is defined with a value greater than zero, the
> option shall always be supported when the application is executed. All
> headers, data types, and functions shall be present and shall operate
> as specified.
>
> If a symbolic constant is defined with the value zero, all headers,
> data types, and functions shall be present. The application can check
> at runtime to see whether the option is supported by calling
> fpathconf(), pathconf(), or sysconf() with the indicated name
> parameter.
> ----8<----

Indeed, confirmed in Issue 7, thanks a lot. Could you please provide  
me with an updated commit message saying so? Then I'll apply it.

Andreas

