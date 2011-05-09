Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJKLT-0007hb-H2
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2011 02:53:31 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1QJKLQ-0007bt-FM
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 02:53:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1QJKLP-0002XX-Lt
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 02:53:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39143)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1QJKLN-0002X5-PZ; Mon, 09 May 2011 02:53:25 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p496rNlC009106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 9 May 2011 02:53:23 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-23.phx2.redhat.com
	[10.3.112.23])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p496rIlq009435; Mon, 9 May 2011 02:53:19 -0400
Message-ID: <4DC78F5D.7080505@redhat.com>
Date: Mon, 09 May 2011 08:53:17 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110307 Fedora/3.1.9-0.39.b3pre.fc14
	Lightning/1.0b3pre Mnenhy/0.8.3 Thunderbird/3.1.9
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1304322846-24376-4-git-send-email-pbonzini@redhat.com>
	<BANLkTikq7uuwZOhdFdJD4a1PkHneD6a=Fg@mail.gmail.com>
In-Reply-To: <BANLkTikq7uuwZOhdFdJD4a1PkHneD6a=Fg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 4/4] fix compilation when reconfiguring
 without dtrace backend
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
X-List-Received-Date: Mon, 09 May 2011 06:53:29 -0000

On 05/08/2011 01:15 PM, Stefan Hajnoczi wrote:
> I think the real problem is that dependencies need to be regenerated
> after ./configure?

There are three ways to do that, the trivial but wrong one, and the 
correct but overzealous one:

- delete .d files.  This forces regeneration of dependencies, but if you 
do not correspondingly delete .o files, you will likely have an 
incomplete build (possibly _nothing_ will be built).

- delete .d and .o files.  This forces regeneration of dependencies and 
recompilation.  True, a lot of distros are using ccache nowadays, but 
still this will cause a complete walk of all directories to pass those 
files to ccache and relink the executables.  It will likely take a 
minute or three.

- detect changes in the configuration and, if those happen, delete .d 
and .o files.  This is the correct one, and for one what the Linux 
kernel makefiles do, but also the biggest effort to implement.

Paolo

