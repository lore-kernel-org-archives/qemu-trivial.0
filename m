Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UkJvw-0003Kk-1v
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2013 16:03:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UkJvp-0003E3-Ue
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 16:03:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UkJvl-0007Jf-Dc
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 16:03:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42124)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UkJvV-0007E7-06; Wed, 05 Jun 2013 16:03:21 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 72A2840AD7;
	Thu,  6 Jun 2013 00:03:18 +0400 (MSK)
Message-ID: <51AF9984.8030103@msgid.tls.msk.ru>
Date: Thu, 06 Jun 2013 00:03:16 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1370444532-68682-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1370444532-68682-1-git-send-email-emaste@freebsd.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Use ${config_host_ld} variable
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
X-List-Received-Date: Wed, 05 Jun 2013 20:03:47 -0000

05.06.2013 19:02, Ed Maste wrote:
> -  linker_script="-Wl,-T../config-host.ld -Wl,-T,\$(SRC_PATH)/ldscripts/\$(ARCH).ld"
> +  linker_script="-Wl,-T../${config_host_ld} -Wl,-T,\$(SRC_PATH)/ldscripts/\$(ARCH).ld"

Do we really care?  To me it looks like it is better
to just remove the variable (which is nothing but just
an extra indirection) and be done with it.

The variable has been introduced by this commit:

commit 4bf6b55b346d33ff16dd25f75bbea8e21f95dfa6
Author: Juan Quintela <quintela@redhat.com>
Date:   Wed Jul 22 22:37:40 2009 +0200

    set SEARCH_PATH for the linker script from output of ld --verbose -v

    Signed-off-by: Juan Quintela <quintela@redhat.com>
    Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>

which description does not cover introduction of
this variable, and apparently it meant to be something
different really.  The thing is: that commit introduced
that envvar, but at the same time, added several
references to open-coded name (config-host.ld) into
several places (including the one which is being
patched now).

I really don't see a point to have it in a variable at all.

Ditto for $config_host_mak for that matter.

Both are used in makefiles as well, and used there
directly.

Maybe just get rid of that cruft?  If there will be
a need for actual variable, it will be trivial to
introduce it and patch in this single place where
it is referenced... :)

Thanks,

/mjt

