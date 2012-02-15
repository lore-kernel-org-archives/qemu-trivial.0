Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RxYlo-0002sw-1p
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2012 01:55:16 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RxYll-0002p1-JR
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2012 01:55:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RxYlk-0001dR-JV
	for qemu-trivial@nongnu.org; Wed, 15 Feb 2012 01:55:13 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:55946)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>)
	id 1RxYlh-0001ca-Hd; Wed, 15 Feb 2012 01:55:09 -0500
Received: by pbbro12 with SMTP id ro12so1336612pbb.4
	for <multiple recipients>; Tue, 14 Feb 2012 22:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=qOU/3yaCuB1v+bt+c8E9/OP0yLV6JgmLuIxTHSNULTI=;
	b=RYZkEZWLDzYCtDJOSo5jKbVMrvMRcG6G0+tbIAWw3uxD2gD27MvJn2k3Jm/qhjynlN
	y+hIj0xnmm687Gy7Kzfck4SAKcTbLxL/O1qfRKCk5BTMhqhaQeuAuyjP7JLku3TrQXU9
	FiIPe3aGrJPFlGEyFkMJXsUzoG3ggttpxsKww=
MIME-Version: 1.0
Received: by 10.68.233.74 with SMTP id tu10mr420567pbc.98.1329288907680; Tue,
	14 Feb 2012 22:55:07 -0800 (PST)
Sender: alex.barcelo@gmail.com
Received: by 10.142.208.6 with HTTP; Tue, 14 Feb 2012 22:55:07 -0800 (PST)
Received: by 10.142.208.6 with HTTP; Tue, 14 Feb 2012 22:55:07 -0800 (PST)
In-Reply-To: <CAFKAgTfOTniTEteFa5Rkms6PYXxDBFOS7g1VQNU4szXmC6T5Pw@mail.gmail.com>
References: <CAFKAgTcgMqVpopxTw8+8N005OSOoNM33L2a8DLJvn7Tpa-BGvQ@mail.gmail.com>
	<CAFKAgTfOTniTEteFa5Rkms6PYXxDBFOS7g1VQNU4szXmC6T5Pw@mail.gmail.com>
Date: Wed, 15 Feb 2012 07:55:07 +0100
X-Google-Sender-Auth: RFhF2NNNNcFDM_XvU5qzwV-jyBs
Message-ID: <CAFKAgTeS9T=eTo2PQqc5DYwfZq_+8Dj0vCa9zB1X9dVWHziypQ@mail.gmail.com>
From: Alex Barcelo <abarcelo@ac.upc.edu>
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary=047d7b33ca3c256dae04b8fb312c
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>
Subject: Re: [Qemu-trivial] [TRIVIAL v2] Bad zero comparison for
	sas_ss_flags on powerpc
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
X-List-Received-Date: Wed, 15 Feb 2012 06:55:15 -0000

--047d7b33ca3c256dae04b8fb312c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

ping? is this ok? Or it is not trivial at all, and better do a normal
patch? And write it better?

I have no inconvenience on doing so, but I didn't want to duplicate patches
in the list.
El 10/02/2012 10:57, "Alex Barcelo" <abarcelo@ac.upc.edu> escribi=F3:

> // Test source and desired /real output:
>
> #include <signal.h>
> #include <unistd.h>
> #include <stdio.h>
> #include <stdlib.h>
>
> void handler(int sig)
> {
>   unsigned int a;
>   // to prevent uninitialized stack, normally a =3D 0
>   if ( a>10 ) a =3D 0;
>   a =3D a + 1;
>   printf ("new value: %d\n" , a );
>   if (a > 7) _exit(a);
>   return;
> }
>
> int main()
> {
>   int ret;
>   char * stackA =3D malloc(SIGSTKSZ);
>   char * stackB =3D malloc(SIGSTKSZ);
>   stack_t ssA =3D {
>       .ss_size =3D SIGSTKSZ,
>       .ss_sp =3D stackA,
>   };
>   stack_t ssB =3D {
>       .ss_size =3D SIGSTKSZ,
>       .ss_sp =3D stackB,
>   };
>   struct sigaction sa =3D {
>       .sa_handler =3D handler,
>       .sa_flags =3D SA_ONSTACK
>   };
>
>   // no error checking, only debug output
>   ret =3D sigfillset(&sa.sa_mask);
>   printf ( "Sigfillset: %d\n" , ret );
>   ret =3D sigaction(SIGUSR1, &sa, 0);
>   printf ( "Sigaction: %d\n" , ret );
>
>   while (1) {
>       printf ("On stack A -- " );
>       ret =3D sigaltstack(&ssA, 0);
>       printf ( "sigaltstack return: %d -- " , ret );
>       kill(0, SIGUSR1);
>       sleep(1);
>       printf ("                                    -- " );
>       kill(0, SIGUSR1);
>       sleep(1);
>
>       printf ("On stack B -- " );
>       ret =3D sigaltstack(&ssB, 0);
>       printf ( "sigaltstack return: %d -- " , ret );
>       kill(0, SIGUSR1);
>       sleep(1);
>   }
> }
>
> /* Desired output:
> Sigfillset: 0
> Sigaction: 0
> On stack A -- sigaltstack return: 0 -- new value: 1
>                                   -- new value: 2
> On stack B -- sigaltstack return: 0 -- new value: 1
> On stack A -- sigaltstack return: 0 -- new value: 3
>                                   -- new value: 4
> On stack B -- sigaltstack return: 0 -- new value: 2
> On stack A -- sigaltstack return: 0 -- new value: 5
>                                   -- new value: 6
> On stack B -- sigaltstack return: 0 -- new value: 3
> On stack A -- sigaltstack return: 0 -- new value: 7
>                                   -- new value: 8
>
> Output for ppc without patch:
> Sigfillset: 0
> Sigaction: 0
> On stack A -- sigaltstack return: 0 -- new value: 1
>                                   -- new value: 2
> On stack B -- sigaltstack return: 0 -- new value: 3 // WRONG!!
> On stack A -- sigaltstack return: 0 -- new value: 4
>                                   -- new value: 5 // WRONG AGAIN!
> ...
> */
>

--047d7b33ca3c256dae04b8fb312c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>ping? is this ok? Or it is not trivial at all, and better do a normal pa=
tch? And write it better?</p>
<p>I have no inconvenience on doing so, but I didn&#39;t want to duplicate =
patches in the list.</p>
<div class=3D"gmail_quote">El 10/02/2012 10:57, &quot;Alex Barcelo&quot; &l=
t;<a href=3D"mailto:abarcelo@ac.upc.edu">abarcelo@ac.upc.edu</a>&gt; escrib=
i=F3:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
// Test source and desired /real output:<br>
<br>
#include &lt;signal.h&gt;<br>
#include &lt;unistd.h&gt;<br>
#include &lt;stdio.h&gt;<br>
#include &lt;stdlib.h&gt;<br>
<br>
void handler(int sig)<br>
{<br>
 =A0 unsigned int a;<br>
 =A0 // to prevent uninitialized stack, normally a =3D 0<br>
 =A0 if ( a&gt;10 ) a =3D 0;<br>
 =A0 a =3D a + 1;<br>
 =A0 printf (&quot;new value: %d\n&quot; , a );<br>
 =A0 if (a &gt; 7) _exit(a);<br>
 =A0 return;<br>
}<br>
<br>
int main()<br>
{<br>
 =A0 int ret;<br>
 =A0 char * stackA =3D malloc(SIGSTKSZ);<br>
 =A0 char * stackB =3D malloc(SIGSTKSZ);<br>
 =A0 stack_t ssA =3D {<br>
 =A0 =A0 =A0 .ss_size =3D SIGSTKSZ,<br>
 =A0 =A0 =A0 .ss_sp =3D stackA,<br>
 =A0 };<br>
 =A0 stack_t ssB =3D {<br>
 =A0 =A0 =A0 .ss_size =3D SIGSTKSZ,<br>
 =A0 =A0 =A0 .ss_sp =3D stackB,<br>
 =A0 };<br>
 =A0 struct sigaction sa =3D {<br>
 =A0 =A0 =A0 .sa_handler =3D handler,<br>
 =A0 =A0 =A0 .sa_flags =3D SA_ONSTACK<br>
 =A0 };<br>
<br>
 =A0 // no error checking, only debug output<br>
 =A0 ret =3D sigfillset(&amp;sa.sa_mask);<br>
 =A0 printf ( &quot;Sigfillset: %d\n&quot; , ret );<br>
 =A0 ret =3D sigaction(SIGUSR1, &amp;sa, 0);<br>
 =A0 printf ( &quot;Sigaction: %d\n&quot; , ret );<br>
<br>
 =A0 while (1) {<br>
 =A0 =A0 =A0 printf (&quot;On stack A -- &quot; );<br>
 =A0 =A0 =A0 ret =3D sigaltstack(&amp;ssA, 0);<br>
 =A0 =A0 =A0 printf ( &quot;sigaltstack return: %d -- &quot; , ret );<br>
 =A0 =A0 =A0 kill(0, SIGUSR1);<br>
 =A0 =A0 =A0 sleep(1);<br>
 =A0 =A0 =A0 printf (&quot; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0-- &quot; );<br>
 =A0 =A0 =A0 kill(0, SIGUSR1);<br>
 =A0 =A0 =A0 sleep(1);<br>
<br>
 =A0 =A0 =A0 printf (&quot;On stack B -- &quot; );<br>
 =A0 =A0 =A0 ret =3D sigaltstack(&amp;ssB, 0);<br>
 =A0 =A0 =A0 printf ( &quot;sigaltstack return: %d -- &quot; , ret );<br>
 =A0 =A0 =A0 kill(0, SIGUSR1);<br>
 =A0 =A0 =A0 sleep(1);<br>
 =A0 }<br>
}<br>
<br>
/* Desired output:<br>
Sigfillset: 0<br>
Sigaction: 0<br>
On stack A -- sigaltstack return: 0 -- new value: 1<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -- new=
 value: 2<br>
On stack B -- sigaltstack return: 0 -- new value: 1<br>
On stack A -- sigaltstack return: 0 -- new value: 3<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -- new=
 value: 4<br>
On stack B -- sigaltstack return: 0 -- new value: 2<br>
On stack A -- sigaltstack return: 0 -- new value: 5<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -- new=
 value: 6<br>
On stack B -- sigaltstack return: 0 -- new value: 3<br>
On stack A -- sigaltstack return: 0 -- new value: 7<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -- new=
 value: 8<br>
<br>
Output for ppc without patch:<br>
Sigfillset: 0<br>
Sigaction: 0<br>
On stack A -- sigaltstack return: 0 -- new value: 1<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -- new=
 value: 2<br>
On stack B -- sigaltstack return: 0 -- new value: 3 // WRONG!!<br>
On stack A -- sigaltstack return: 0 -- new value: 4<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -- new=
 value: 5 // WRONG AGAIN!<br>
...<br>
*/<br>
</blockquote></div>

--047d7b33ca3c256dae04b8fb312c--

