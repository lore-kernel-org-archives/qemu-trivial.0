Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WT9zG-0005ZN-7z
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 09:04:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WT9z9-0005SH-4x
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 09:04:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WT9z1-0000O8-2A
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 09:04:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:65385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WT9z0-0000O3-RA; Thu, 27 Mar 2014 09:04:35 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2RD4W9L015500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 27 Mar 2014 09:04:32 -0400
Received: from blackfin.pond.sub.org (ovpn-116-41.ams2.redhat.com
	[10.36.116.41])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s2RCUZRj032400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 27 Mar 2014 08:30:37 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 2E4E9200D1; Thu, 27 Mar 2014 13:30:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kiyokazu SUTO <suto@ks-and-ks.ne.jp>
References: <20140106-195827-666c9.suto@ks-and-ks.ne.jp>
Date: Thu, 27 Mar 2014 13:30:34 +0100
In-Reply-To: <20140106-195827-666c9.suto@ks-and-ks.ne.jp> (Kiyokazu SUTO's
	message of "06 Jan 2014 19:58:27 +0900")
Message-ID: <8761mzq0wl.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] Virtual VFAT with floppy option
	doesn't work
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
X-List-Received-Date: Thu, 27 Mar 2014 13:04:48 -0000

Kiyokazu SUTO <suto@ks-and-ks.ne.jp> writes:

> Hi,
>
> Virtual VFAT mechanism in recent releases does not work with the
> floppy option, because, in `vvfat_open()' function, the member
> `first_sectors_number' is overwritten with the value for HDD even when
> the floppy option presents.  I attach the diff output just to clarify
> the problem.
>
> Sorry if this has been already fixed in the git repository.

Your fix is correct, but the patch doesn't pass checkpatch, it doesn't
have a proper commit message, and it lacks your S-o-B.  Since the fix is
trivial, and we're very close to the release, I'm going to redo it.
Hope you don't mind.

