Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvZFJ-00086c-Bg
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 14:01:29 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RvZFC-0007ha-0h
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 14:01:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RvZF7-0001ob-4A
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 14:01:21 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:40885)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>)
	id 1RvZF0-0001lK-NH; Thu, 09 Feb 2012 14:01:10 -0500
Received: by dadp14 with SMTP id p14so1930244dad.4
	for <multiple recipients>; Thu, 09 Feb 2012 11:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=Em92Tm7s7ZXwUTg7aiYwmjFsdGZAIMmfUZGLDN8XRDY=;
	b=BNM3zNuFASa+JvG0w5GnQyCmqddaq3R30YTYJIalHsuMtqbeQGlO2jc1J8YyVg4AEC
	VLz5K6y+M7bgIkao/n86tSOCIWD1YAa1QX5SiRIu9afJRTWZOzTg7fbCjOV4afmHKpkm
	1zl7qAeqUDJGMFs64sQisD2gIjb00wdkIOSrE=
Received: by 10.68.73.103 with SMTP id k7mr8242291pbv.132.1328814069140; Thu,
	09 Feb 2012 11:01:09 -0800 (PST)
MIME-Version: 1.0
Sender: alex.barcelo@gmail.com
Received: by 10.142.208.6 with HTTP; Thu, 9 Feb 2012 11:00:49 -0800 (PST)
In-Reply-To: <4F3413D9.7040204@suse.de>
References: <CAFKAgTdwXj_XZ3EOgwR0=x_biz6s=SJKVsKX5C+z38=SicWY2A@mail.gmail.com>
	<4F3413D9.7040204@suse.de>
From: Alex Barcelo <abarcelo@ac.upc.edu>
Date: Thu, 9 Feb 2012 20:00:49 +0100
X-Google-Sender-Auth: zRJJcFJj-FtAUy9320UmNCGGO1E
Message-ID: <CAFKAgTe-7hZ1U-CE5khEQ792VxsEayuWG6rCmR2F0uuHi7O1PQ@mail.gmail.com>
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [TRIVIAL] sas_ss_flags bug for
	powerpc
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
X-List-Received-Date: Thu, 09 Feb 2012 19:01:28 -0000

On Thu, Feb 9, 2012 at 19:43, Andreas F=E4rber <afaerber@suse.de> wrote:
> Am 09.02.2012 19:30, schrieb Alex Barcelo:
>> Signed-off-by: Alex Barcelo <abarcelo@ac.upc.edu>
>
> This patch needs a better description than "bug",

sorry, something like "Incorrect zero comparison in sas_ss_flags"
would have been better. I used my internal git name for the patch
without realizing.

> and you forgot to cc the linux-user maintainer.
new here, I read Contribute/TrivialPatches and think that it wasn't
needed. Sorry about that.

> The patch should describe what it touches
> (linux-user), what it does, what for and make clear why that is correct.
> Is there a particular test case that's broken without the patch?[1]
>
> I can't speak for Stefan, but to me it is totally unclear from looking
> at the patch what sas_ss_flags() does here so this is likely not really
> a trivial one.

Well, is really trivial when compared to the other architectures,
because all do a zero check and this one does it the other way round.
I'm really new here, and I still don't get the workflow and the way to
do things. Will try my best!

Again, sorry for that.

[1] I did a trying-to-be-easy test case, which didn't work before the
patch and worked after the patch. The unsigned int a value should be
independent between the different stacks, but without this patch no
stack change is done so all the functions use the same stack and the
same a variable.

#include <signal.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

void handler(int sig)
{
    unsigned int a;
    // to prevent uninitialized stack, normally a =3D 0
    if ( a>10 ) a =3D 0;
    a =3D a + 1;
    printf ("new value: %d\n" , a );
    if (a > 7) _exit(a);
    return;
}

int main()
{
    int ret;
    char * stackA =3D malloc(SIGSTKSZ);
    char * stackB =3D malloc(SIGSTKSZ);
    stack_t ssA =3D {
        .ss_size =3D SIGSTKSZ,
        .ss_sp =3D stackA,
    };
    stack_t ssB =3D {
        .ss_size =3D SIGSTKSZ,
        .ss_sp =3D stackB,
    };
    struct sigaction sa =3D {
        .sa_handler =3D handler,
        .sa_flags =3D SA_ONSTACK
    };

    // no error checking, only debug output
    ret =3D sigfillset(&sa.sa_mask);
    printf ( "Sigfillset: %d\n" , ret );
    ret =3D sigaction(SIGUSR1, &sa, 0);
    printf ( "Sigaction: %d\n" , ret );

    while (1) {
        printf ("On stack A -- " );
        ret =3D sigaltstack(&ssA, 0);
        printf ( "sigaltstack return: %d -- " , ret );
        kill(0, SIGUSR1);
        sleep(1);
        printf ("                                    -- " );
        kill(0, SIGUSR1);
        sleep(1);

        printf ("On stack B -- " );
        ret =3D sigaltstack(&ssB, 0);
        printf ( "sigaltstack return: %d -- " , ret );
        kill(0, SIGUSR1);
        sleep(1);
    }
}

/* Desired output:
Sigfillset: 0
Sigaction: 0
On stack A -- sigaltstack return: 0 -- new value: 1
                                    -- new value: 2
On stack B -- sigaltstack return: 0 -- new value: 1
On stack A -- sigaltstack return: 0 -- new value: 3
                                    -- new value: 4
On stack B -- sigaltstack return: 0 -- new value: 2
On stack A -- sigaltstack return: 0 -- new value: 5
                                    -- new value: 6
On stack B -- sigaltstack return: 0 -- new value: 3
On stack A -- sigaltstack return: 0 -- new value: 7
                                    -- new value: 8

Output for ppc without patch:
Sigfillset: 0
Sigaction: 0
On stack A -- sigaltstack return: 0 -- new value: 1
                                    -- new value: 2
On stack B -- sigaltstack return: 0 -- new value: 3 // WRONG!!
On stack A -- sigaltstack return: 0 -- new value: 4
                                    -- new value: 5 // WRONG AGAIN!
...
*/

