Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YtEfP-0000N4-Ff
	for mharc-qemu-trivial@gnu.org; Fri, 15 May 2015 08:24:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YtEfL-0000FT-9F
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 08:24:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YtEfJ-0008Fe-S2
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 08:24:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YtEfF-0008Eq-7G; Fri, 15 May 2015 08:24:29 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4FCORlB006643
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 15 May 2015 08:24:28 -0400
Received: from blackfin.pond.sub.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4FCOPO9006438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 15 May 2015 08:24:27 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 18CA93040D28; Fri, 15 May 2015 14:24:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
References: <4d325283e37f8f4ebf42b2e3ca41985f2e69e26c.1431682266.git.pkrempa@redhat.com>
Date: Fri, 15 May 2015 14:24:25 +0200
In-Reply-To: <4d325283e37f8f4ebf42b2e3ca41985f2e69e26c.1431682266.git.pkrempa@redhat.com>
	(Peter Krempa's message of "Fri, 15 May 2015 11:31:43 +0200")
Message-ID: <874mneghae.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] util: socket: Add
	missing localaddr and localport option for DGRAM socket
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
X-List-Received-Date: Fri, 15 May 2015 12:24:37 -0000

Peter Krempa <pkrempa@redhat.com> writes:

> The 'socket_optslist' structure does not contain the 'localaddr' and
> 'localport' options that are parsed in case you are creating a
> 'connect' type UDP character device.
>
> I've noticed it happening after commit f43e47dbf6de24db20ec9b588bb6cc762
> made qemu abort() after seeing the invalid option.
>
> A minimal reproducer for the case is:
> $ qemu-system-x86_64 -chardev udp,id=charrng0,host=127.0.0.1,port=1234,localaddr=,localport=1234
> qemu-system-x86_64: -chardev udp,id=charrng0,host=127.0.0.1,port=1234,localaddr=,localport=1234: Invalid parameter 'localaddr'
> Aborted (core dumped)
>
> Prior to the commit mentioned above the error would be printed but the
> value for localaddr and localport was simply ignored. I did not go
> trhough the code to find out when it was broken.

s/trhough/through/

Perhaps this can be touched up on commit.

>
> Add the two fields so that the options can again be parsed correctly and
> qemu doesn't abort().
>
> Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1220252
>
> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

File has no maintainer.  Adding qemu-trivial.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

