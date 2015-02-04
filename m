Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIwZd-0005iL-CJ
	for mharc-qemu-trivial@gnu.org; Wed, 04 Feb 2015 04:48:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIwZb-0005eq-7H
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 04:48:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIwZX-0008L5-B5
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 04:48:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YIwZR-0008KR-2C; Wed, 04 Feb 2015 04:48:29 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t149mSfT015753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Feb 2015 04:48:28 -0500
Received: from blackfin.pond.sub.org (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t149mQuY009035
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Feb 2015 04:48:27 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EFBC93040D2D; Wed,  4 Feb 2015 10:48:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <1422375232-29283-1-git-send-email-armbru@redhat.com>
Date: Wed, 04 Feb 2015 10:48:25 +0100
In-Reply-To: <1422375232-29283-1-git-send-email-armbru@redhat.com> (Markus
	Armbruster's message of "Tue, 27 Jan 2015 17:13:49 +0100")
Message-ID: <87d25q80t2.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/3] util/uri: Cleanups and a bug fix
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
X-List-Received-Date: Wed, 04 Feb 2015 09:48:40 -0000

Ping?

Markus Armbruster <armbru@redhat.com> writes:

> Note: checkpatch is unhappy with the first patch, because I refrained
> from cleaning up the ugly return(NULL).  They're all over the place.
>
> Markus Armbruster (3):
>   util/uri: uri_new() can't fail, drop dead error handling
>   util/uri: realloc2n() can't fail, drop dead error handling
>   util/uri: URI member path can be null, compare more carfully
>
>  util/uri.c | 61 +++++++++++++------------------------------------------------
>  1 file changed, 13 insertions(+), 48 deletions(-)

