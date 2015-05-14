Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YsszD-00088u-Kv
	for mharc-qemu-trivial@gnu.org; Thu, 14 May 2015 09:15:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <martin@c-home.cz>) id 1YsrWG-0006iS-Sc
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 07:41:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <martin@c-home.cz>) id 1YsrWG-00063W-0g
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 07:41:40 -0400
Received: from gw.c-home.cz ([89.24.150.100]:59224 helo=dmz.c-home.cz)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <martin@c-home.cz>)
	id 1YsrW9-00060W-S4; Thu, 14 May 2015 07:41:34 -0400
Received: from dmz.c-home.cz (localhost [127.0.0.1])
	by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id t4EBfOML025502;
	Thu, 14 May 2015 13:41:24 +0200 (CEST)
Received: from localhost (martin@localhost)
	by dmz.c-home.cz (8.14.4+Sun/8.14.4/Submit) with ESMTP id
	t4EBfNr4025499; Thu, 14 May 2015 13:41:24 +0200 (CEST)
X-Authentication-Warning: dmz.c-home.cz: martin owned process doing -bs
Date: Thu, 14 May 2015 13:41:23 +0200 (CEST)
From: Martin Cerveny <martin@c-home.cz>
To: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <55547221.4030109@redhat.com>
Message-ID: <alpine.GSO.2.00.1505141317030.24664@dmz.c-home.cz>
References: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
	<1431519294-8873-3-git-send-email-M.Cerveny@computer.org>
	<55547221.4030109@redhat.com>
User-Agent: Alpine 2.00 (GSO 1167 2008-08-23)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Solaris 10
X-Received-From: 89.24.150.100
X-Mailman-Approved-At: Thu, 14 May 2015 09:15:37 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/2] scripts: qom-tree: add support of
	path as argument
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Martin Cerveny <M.Cerveny@computer.org>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 May 2015 11:41:42 -0000

Hello.

Ternary/if/else >= python 2.5 (I use the same coding as in scripts/qmp/qemu-ga-client).
"import json" >= python 2.6 (scripts/qmp/qmp.py)
"import argparse" >= python 2.7 (scripts/analyze-migration.py, scripts/vmstate-static-checker.py)
"import optparse" < python 2.7 (deprecated, scripts/qmp/qemu-ga-client)
....

Of course there is no problem to use traditional syntax.
(My platform (centos5.10) has python2.4, I must also replace json imports:
try:
     import json
except ImportError:
     import simplejson as json
)

Which version of python is officialy minimum supported ?

Thanks for explanation of python status.

M.C>

On Thu, 14 May 2015, Paolo Bonzini wrote:

>
>
> On 13/05/2015 14:14, Martin Cerveny wrote:
>>      for item in items:
>>          if item['type'].startswith('child<'):
>> -            list_node(path + '/' + item['name'])
>> +            list_node((path if (path != '/') else '')  + '/' + item['name'])
>
> I'm not sure which Python version introduced if...else.  The more
> traditional idiom would be
>
> 	path != '/' and path or ''
>
> Can you use it, and move the expression out of the 'for item in items'
> loop into a variable?
>
> Paolo
>

