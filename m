Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XtCSZ-00081c-Nf
	for mharc-qemu-trivial@gnu.org; Tue, 25 Nov 2014 04:30:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XtCSR-0007pQ-Mi
	for qemu-trivial@nongnu.org; Tue, 25 Nov 2014 04:30:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XtCSL-0006mi-K7
	for qemu-trivial@nongnu.org; Tue, 25 Nov 2014 04:30:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XtCS5-0006ZH-Q8; Tue, 25 Nov 2014 04:30:30 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAP9UTiD015524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 25 Nov 2014 04:30:29 -0500
Received: from blackfin.pond.sub.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAP9UQqH026007
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 25 Nov 2014 04:30:28 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D74FF307D514; Tue, 25 Nov 2014 10:30:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Amos Kong <akong@redhat.com>
References: <1416902756-26593-1-git-send-email-akong@redhat.com>
Date: Tue, 25 Nov 2014 10:30:25 +0100
In-Reply-To: <1416902756-26593-1-git-send-email-akong@redhat.com> (Amos Kong's
	message of "Tue, 25 Nov 2014 16:05:56 +0800")
Message-ID: <873897ocem.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp: fix typo in
	input-send-event examples
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
X-List-Received-Date: Tue, 25 Nov 2014 09:30:58 -0000

Amos Kong <akong@redhat.com> writes:

> Lack of two closed bracket in json commands.
>
> Signed-off-by: Amos Kong <akong@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

