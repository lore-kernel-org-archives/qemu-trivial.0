Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bZJ28-0006Aa-22
	for mharc-qemu-trivial@gnu.org; Mon, 15 Aug 2016 10:38:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bZJ25-00068D-OE
	for qemu-trivial@nongnu.org; Mon, 15 Aug 2016 10:38:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bZJ24-0002x9-0V
	for qemu-trivial@nongnu.org; Mon, 15 Aug 2016 10:38:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1bZJ1y-0002wU-NN; Mon, 15 Aug 2016 10:38:22 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 00A0546264;
	Mon, 15 Aug 2016 14:38:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7FEcKAx003550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 15 Aug 2016 10:38:21 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C2D3511386A2; Mon, 15 Aug 2016 16:38:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Colin Lord <cdlord2@illinois.edu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, pbonzini@redhat.com
References: <1471030248-21637-1-git-send-email-cdlord2@illinois.edu>
Date: Mon, 15 Aug 2016 16:38:19 +0200
In-Reply-To: <1471030248-21637-1-git-send-email-cdlord2@illinois.edu> (Colin
	Lord's message of "Fri, 12 Aug 2016 15:30:48 -0400")
Message-ID: <871t1qf678.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 15 Aug 2016 14:38:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] help: Update help to
 remove misleading display information
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
X-List-Received-Date: Mon, 15 Aug 2016 14:38:30 -0000

Colin Lord <cdlord2@illinois.edu> writes:

> Updates the help messages to remove misleading information about SDL
> being the normal display used.
>
> Signed-off-by: Colin Lord <cdlord2@illinois.edu>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

