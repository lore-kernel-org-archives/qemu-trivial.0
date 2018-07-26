Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fifeO-0002XS-83
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jul 2018 08:45:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fifeJ-0002UD-3a
	for qemu-trivial@nongnu.org; Thu, 26 Jul 2018 08:45:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fifeG-0005Io-5T
	for qemu-trivial@nongnu.org; Thu, 26 Jul 2018 08:45:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38970 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fife9-000509-JF; Thu, 26 Jul 2018 08:45:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0690640216E3;
	Thu, 26 Jul 2018 12:45:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14EA821568A1;
	Thu, 26 Jul 2018 12:45:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C62721138648; Thu, 26 Jul 2018 14:45:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20180419132026.5494-1-kraxel@redhat.com>
	<20180419132026.5494-2-kraxel@redhat.com>
Date: Thu, 26 Jul 2018 14:45:14 +0200
In-Reply-To: <20180419132026.5494-2-kraxel@redhat.com> (Gerd Hoffmann's
	message of "Thu, 19 Apr 2018 15:20:23 +0200")
Message-ID: <87va92dv39.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 26 Jul 2018 12:45:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 26 Jul 2018 12:45:22 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] ui: add qapi parser for
 -display
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
X-List-Received-Date: Thu, 26 Jul 2018 12:45:46 -0000

Gerd Hoffmann <kraxel@redhat.com> writes:

> Add parse_display_qapi() function which parses the -display command line
> using a qapi visitor for DisplayOptions.  Wire up as default catch in
> parse_display().
>
> Improves the error message for unknown display types.
>
> Also enables json as -display argument, i.e. -display "{ 'type': 'gtk' }"

This new option argument syntax is undocumented.  Intentional?

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  vl.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)

