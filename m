Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvnEe-00058V-Mu
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2012 04:57:44 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RvnEb-0004yu-TY
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2012 04:57:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RvnEW-0002Am-2u
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2012 04:57:41 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:55134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>)
	id 1RvnEM-0002A4-2T; Fri, 10 Feb 2012 04:57:26 -0500
Received: by pbbro12 with SMTP id ro12so2597561pbb.4
	for <multiple recipients>; Fri, 10 Feb 2012 01:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=VMBiJQi1VEnvdTJhGqDIR1N/+i1r1DrXgbP5b9Jlwxw=;
	b=joY1mSfmvCK2ovHmrZfUgTtHES/AV/haym7dQpJKwGds8F+D0smDhgJp9HTpR3HW+B
	vrIiIxnUxAFqt+WVTegIWd1LqHzScpPASfnLk5duoRggGPBPTX6+d9mjUdqQvqqzBNFs
	Y3pUS8igoDlNEDx1sp/sWfQXBmlWk08DfH9+Q=
Received: by 10.68.227.132 with SMTP id sa4mr14806667pbc.64.1328867845110;
	Fri, 10 Feb 2012 01:57:25 -0800 (PST)
MIME-Version: 1.0
Sender: alex.barcelo@gmail.com
Received: by 10.142.208.6 with HTTP; Fri, 10 Feb 2012 01:57:05 -0800 (PST)
In-Reply-To: <CAFKAgTcgMqVpopxTw8+8N005OSOoNM33L2a8DLJvn7Tpa-BGvQ@mail.gmail.com>
References: <CAFKAgTcgMqVpopxTw8+8N005OSOoNM33L2a8DLJvn7Tpa-BGvQ@mail.gmail.com>
From: Alex Barcelo <abarcelo@ac.upc.edu>
Date: Fri, 10 Feb 2012 10:57:05 +0100
X-Google-Sender-Auth: JKuKJhUrzDQWePdMB9eAwmsYP4w
Message-ID: <CAFKAgTfOTniTEteFa5Rkms6PYXxDBFOS7g1VQNU4szXmC6T5Pw@mail.gmail.com>
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
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
X-List-Received-Date: Fri, 10 Feb 2012 09:57:43 -0000

// Test source and desired /real output:

#include <signal.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

void handler(int sig)
{
   unsigned int a;
   // to prevent uninitialized stack, normally a = 0
   if ( a>10 ) a = 0;
   a = a + 1;
   printf ("new value: %d\n" , a );
   if (a > 7) _exit(a);
   return;
}

int main()
{
   int ret;
   char * stackA = malloc(SIGSTKSZ);
   char * stackB = malloc(SIGSTKSZ);
   stack_t ssA = {
       .ss_size = SIGSTKSZ,
       .ss_sp = stackA,
   };
   stack_t ssB = {
       .ss_size = SIGSTKSZ,
       .ss_sp = stackB,
   };
   struct sigaction sa = {
       .sa_handler = handler,
       .sa_flags = SA_ONSTACK
   };

   // no error checking, only debug output
   ret = sigfillset(&sa.sa_mask);
   printf ( "Sigfillset: %d\n" , ret );
   ret = sigaction(SIGUSR1, &sa, 0);
   printf ( "Sigaction: %d\n" , ret );

   while (1) {
       printf ("On stack A -- " );
       ret = sigaltstack(&ssA, 0);
       printf ( "sigaltstack return: %d -- " , ret );
       kill(0, SIGUSR1);
       sleep(1);
       printf ("                                    -- " );
       kill(0, SIGUSR1);
       sleep(1);

       printf ("On stack B -- " );
       ret = sigaltstack(&ssB, 0);
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

