Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUZQN-0003nS-Te
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 08:03:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZUZQH-0003bk-GO
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 08:03:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZUZQG-0007Vk-MO
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 08:03:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59316)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZUZQE-0007V9-M8; Wed, 26 Aug 2015 08:03:18 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 4B89E8CF4E;
	Wed, 26 Aug 2015 12:03:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-105.ams2.redhat.com
	[10.36.116.105])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QC3GuG019313
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 26 Aug 2015 08:03:17 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3397F303F90B; Wed, 26 Aug 2015 14:03:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1440587838-25595-1-git-send-email-berrange@redhat.com>
Date: Wed, 26 Aug 2015 14:03:16 +0200
In-Reply-To: <1440587838-25595-1-git-send-email-berrange@redhat.com> (Daniel
	P. Berrange's message of "Wed, 26 Aug 2015 12:17:11 +0100")
Message-ID: <87h9nmp88r.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/7] Misc trivial code
	cleanups
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
X-List-Received-Date: Wed, 26 Aug 2015 12:03:26 -0000

"Daniel P. Berrange" <berrange@redhat.com> writes:

> This is a series of misc trivial code cleanups that I
> originally used to illustrate the use of GNULIB's
> syntax-check facility:
>
>   http://lists.nongnu.org/archive/html/qemu-devel/2015-07/msg06268.html
>
> Since it appears the license of the GNULIB syntax-check
> is problematic, this series has separated the fixes out
> from the GNULIB additions, to allow for possibility of
> merging them as-is.

Series
Reviewed-by: Markus Armbruster <armbru@redhat.com>

