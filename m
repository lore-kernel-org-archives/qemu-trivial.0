Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bWh5k-0003sR-61
	for mharc-qemu-trivial@gnu.org; Mon, 08 Aug 2016 05:43:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bWh5h-0003qd-OC
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 05:43:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bWh5f-0006Wh-V2
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 05:43:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36168)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1bWh5a-0006WI-Ix; Mon, 08 Aug 2016 05:43:18 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF701C0828AA;
	Mon,  8 Aug 2016 09:43:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u789hF3B026889
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 8 Aug 2016 05:43:17 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1B05E11386A2; Mon,  8 Aug 2016 11:43:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefano Dong (=?utf-8?B?6JGj5YW05rC0?=) <opensource.dxs@aliyun.com>
Cc: mst@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1470564546-8008-1-git-send-email-opensource.dxs@aliyun.com>
Date: Mon, 08 Aug 2016 11:43:15 +0200
In-Reply-To: <1470564546-8008-1-git-send-email-opensource.dxs@aliyun.com>
	("Stefano Dong =?utf-8?B?KOiRo+WFtOawtCkiJ3M=?= message of "Sun,
	7 Aug 2016 18:09:06 +0800")
Message-ID: <87r39zh9zg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 08 Aug 2016 09:43:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ivshmem: Delete duplicate
 debug message
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2016 09:43:26 -0000

This could go in via qemu-trivial.

Stefano Dong (=E8=91=A3=E5=85=B4=E6=B0=B4) <opensource.dxs@aliyun.com> writ=
es:

> When Debug switch is open, this debug message will print again in
> function 'process_msg'. Delete it.

Suggest to say "Duplicated in commit ca0b756.  Delete it."

> Signed-off-by: Stefano Dong (=E8=91=A3=E5=85=B4=E6=B0=B4) <opensource.dxs=
@aliyun.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

