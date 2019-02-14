Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDsE-0002WN-7K
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 05:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1guDs3-00024t-Ac
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:04:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1guDqG-0004z5-Io
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 05:02:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:30328)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1guDqA-0004g2-Hh; Thu, 14 Feb 2019 05:01:58 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C266A5DBB;
	Thu, 14 Feb 2019 10:01:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75DCF1024905;
	Thu, 14 Feb 2019 10:01:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id F245311386C5; Thu, 14 Feb 2019 11:01:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	mst@redhat.com, qemu-trivial@nongnu.org
References: <20190212134758.10514-1-dgilbert@redhat.com>
	<20190212134758.10514-5-dgilbert@redhat.com>
Date: Thu, 14 Feb 2019 11:01:15 +0100
In-Reply-To: <20190212134758.10514-5-dgilbert@redhat.com> (David Alan
	Gilbert's message of "Tue, 12 Feb 2019 13:47:58 +0000")
Message-ID: <87k1i2aduc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 14 Feb 2019 10:01:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] wavcapture: Convert to
 error_report
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
X-List-Received-Date: Thu, 14 Feb 2019 10:04:04 -0000

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> writes:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Kill off a pile of monitor_printf's and cur_mon usage.

You also switch from the two line error format

    <error message>
    Reason: <strerror(errno)>

to the more common

    <error message>: <strerror(errno)>

Suggest to mention that you're changing error messages in the commit
message.

> The only one left in wavcapture.c is the info case.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

