Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLXXe-0006Gd-5S
	for mharc-qemu-trivial@gnu.org; Wed, 11 Feb 2015 08:41:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLXXb-00069c-Ot
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 08:41:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YLXXX-0003VS-30
	for qemu-trivial@nongnu.org; Wed, 11 Feb 2015 08:41:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YLXXS-0003Un-OB; Wed, 11 Feb 2015 08:41:10 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1BDf60h024929
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 11 Feb 2015 08:41:07 -0500
Received: from blackfin.pond.sub.org (ovpn-116-65.ams2.redhat.com
	[10.36.116.65])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1BDf5Xl019252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 11 Feb 2015 08:41:06 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8D42130000B4; Wed, 11 Feb 2015 14:41:04 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: <arei.gonglei@huawei.com>
References: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
Date: Wed, 11 Feb 2015 14:41:04 +0100
In-Reply-To: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com> (arei
	gonglei's message of "Wed, 11 Feb 2015 12:12:03 +0800")
Message-ID: <87vbj87ehb.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 00/11] trivial: Remove
	superfluous '\n' around error_report/error_setg
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
X-List-Received-Date: Wed, 11 Feb 2015 13:41:20 -0000

<arei.gonglei@huawei.com> writes:

> From: Gonglei <arei.gonglei@huawei.com>
>
> Yestoday, I found that some files have superflous '\n' charactor
> around error_report/error_setg when reviewed patches.
>
> By a simply script, the below files were listed. Classify and fix
> them. It's suitable for appling via qemu-trivial IMHO.

You can find my script in commit 312fd5f :)

> Gonglei (11):
>   block: remove superfluous '\n' around error_report/error_setg
>   a9gtimer: remove superfluous '\n' around error_setg
>   pl330.c: remove superfluous '\n' around error_setg
>   numa: remove superfluous '\n' around error_setg
>   Remove superfluous '\n' around error_report()
>   vhost-scsi: Remove superfluous '\n' around error_report()
>   vfio: Remove superfluous '\n' around error_report()
>   xtensa: Remove superfluous '\n' around error_report()
>   tpm: Remove superfluous '\n' around error_report()
>   arm/digic_boards: Remove superfluous '\n' around error_report()
>   vhost: Remove superfluous '\n' around error_report()

When I fixed this before, I didn't split it up (commits 312fd5f 6daf194
be62a2eb).  Splitting it up is fine, of course.  Having the catch-all as
PATCH 05/11 is a bit odd, though.  Its qemu-img.c hunk could go into
PATCH 01, because qemu-img is part of the block subsystem.  Not worth a
respin as far as I'm concerned.

Reviewed-by: Markus Armbruster <armbru@redhat.com>

