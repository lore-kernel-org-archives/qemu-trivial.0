Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTRv4-0005J2-4Z
	for mharc-qemu-trivial@gnu.org; Fri, 28 Mar 2014 04:13:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WTRuy-0005BY-2e
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 04:13:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WTRut-0004Kf-Hd
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 04:13:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25997)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WTRuk-0004Iy-3f; Fri, 28 Mar 2014 04:13:22 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2S8DJVq015962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 28 Mar 2014 04:13:19 -0400
Received: from blackfin.pond.sub.org (ovpn-116-49.ams2.redhat.com
	[10.36.116.49])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2S8DHnM024370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 28 Mar 2014 04:13:19 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 47461200D1; Fri, 28 Mar 2014 09:13:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kiyokazu SUTO <suto@ks-and-ks.ne.jp>
References: <20140106-195827-666c9.suto@ks-and-ks.ne.jp>
	<8761mzq0wl.fsf@blackfin.pond.sub.org>
	<20140328-034023-03541.suto@ks-and-ks.ne.jp>
Date: Fri, 28 Mar 2014 09:13:17 +0100
In-Reply-To: <20140328-034023-03541.suto@ks-and-ks.ne.jp> (Kiyokazu SUTO's
	message of "28 Mar 2014 03:40:23 +0900")
Message-ID: <87txai91wi.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
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
X-List-Received-Date: Fri, 28 Mar 2014 08:13:40 -0000

Kiyokazu SUTO <suto@ks-and-ks.ne.jp> writes:

> Citation (with leading "> " of each line) from article:
>   <8761mzq0wl.fsf@blackfin.pond.sub.org>
>     by Markus Armbruster <armbru@redhat.com> :
>> Your fix is correct, but the patch doesn't pass checkpatch, it doesn't
>> have a proper commit message, and it lacks your S-o-B.  Since the fix is
>> trivial, and we're very close to the release, I'm going to redo it.
>> Hope you don't mind.
>
> I do not mind at all.  My post was just a report.  I'm sorry if it
> wasted your time.
>
> Thanks for fixing the problem.

You certainly didn't waste my time!  Thanks for your clear bug report.

