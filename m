Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QS7wb-000531-PN
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jun 2011 09:28:13 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QS7wY-00051z-Dw
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2011 09:28:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QS7wX-0007jE-Au
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2011 09:28:10 -0400
Received: from mail-pv0-f173.google.com ([74.125.83.173]:35099)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QS7wR-0007hm-Pf; Thu, 02 Jun 2011 09:28:04 -0400
Received: by pvg3 with SMTP id 3so425684pvg.4
	for <multiple recipients>; Thu, 02 Jun 2011 06:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Xh/oLQUnlPOs42olwrSuXDf6OMBeWfw0Q7dsLY4XmfU=;
	b=wLt02Mk8VmOpzdtGNaBKoV6opza/k84k3B7VrwZNQfGwrBQTlAH17E6hK5pIZuiHxk
	kL6/GZV9c4cCqwVFtshl5y+O9xVUEAulOxPajDc0ylgOu4JEOkQ+woImu2yS+cd/BiFk
	psmQbAfrRKhUJd6VDbgXsXrVl9DRQ8g2vR4Uo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=LvO0BMAtbRa3qVGFVkCZcIgOFWwF1iZ2X8VAw4P7YQtjp6upZgLdlMPUHMQgr4jTW+
	o39eTO+158eVPvuXyNWLMYSuNJAgKjd2TZcMJqxfMNsY3j6qQ79DSSpH3ntJwfs/QwMy
	hHIOeGN7SxuhcWKec1WZ2XK8Mgeh1DE4oDJ8Y=
Received: by 10.68.25.102 with SMTP id b6mr296018pbg.14.1307021282143; Thu, 02
	Jun 2011 06:28:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.55.37 with HTTP; Thu, 2 Jun 2011 06:27:42 -0700 (PDT)
In-Reply-To: <C277121A-7515-4CD2-85E1-BEEE51AC3960@web.de>
References: <1306981290-17308-1-git-send-email-cerbere@gmail.com>
	<C277121A-7515-4CD2-85E1-BEEE51AC3960@web.de>
From: Alexandre Raymond <cerbere@gmail.com>
Date: Thu, 2 Jun 2011 09:27:42 -0400
Message-ID: <BANLkTi=OedruypO6bf4-N0DQ6FJMyCR6dQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix compilation warning due
 to missing header for sigaction
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
X-List-Received-Date: Thu, 02 Jun 2011 13:28:12 -0000

On Thu, Jun 2, 2011 at 6:13 AM, Andreas F=C3=A4rber <andreas.faerber@web.de=
> wrote:
> Am 02.06.2011 um 04:21 schrieb Alexandre Raymond:
>
>> Fix the following warning by including signal.h directly in qemu-common.=
h
>> ----8<----
>> iohandler.c: In function =E2=80=98qemu_init_child_watch=E2=80=99:
>> iohandler.c:172: warning: implicit declaration of function =E2=80=98siga=
ction=E2=80=99
>> iohandler.c:172: warning: nested extern declaration of =E2=80=98sigactio=
n=E2=80=99
>> ----8<----
>>
>> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
>
> Tested-by: Andreas F=C3=A4rber <andreas.faerber@web.de>
>
> Why in qemu-common.h and not in iohandler.c though?
> If we put it into qemu-common.h, you should remove other inclusions of
> signal.h.

Well, I was simply following Anthony's advice from "[PATCH] #include
cleanlines" : "The idea behind qemu-common.h is to avoid direct
includes to help with portability."

Alexandre

