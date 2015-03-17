Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXmy3-0002ig-Tk
	for mharc-qemu-trivial@gnu.org; Tue, 17 Mar 2015 04:35:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXmy1-0002gF-Lo
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 04:35:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXmy0-0003yZ-TN
	for qemu-trivial@nongnu.org; Tue, 17 Mar 2015 04:35:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58777)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YXmxq-0003ds-Vr; Tue, 17 Mar 2015 04:35:03 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 53F658E3D9;
	Tue, 17 Mar 2015 08:35:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2H8Z0MV006378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 17 Mar 2015 04:35:01 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 63BD03042B6D; Tue, 17 Mar 2015 09:34:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <5501776A.20202@siemens.com>
Date: Tue, 17 Mar 2015 09:34:59 +0100
In-Reply-To: <5501776A.20202@siemens.com> (Jan Kiszka's message of "Thu, 12
	Mar 2015 12:24:26 +0100")
Message-ID: <87d248t424.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] coverity: Fix
	g_malloc_n-like models
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
X-List-Received-Date: Tue, 17 Mar 2015 08:35:14 -0000

Jan Kiszka <jan.kiszka@siemens.com> writes:

> Allocate the calculated overall size, not only the size of a single
> element.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

I'm feeding this to Coverity locally to gauge its impact.

