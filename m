Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckns7-0007dG-Jc
	for mharc-qemu-trivial@gnu.org; Mon, 06 Mar 2017 03:19:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ckns5-0007cK-Md
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 03:19:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ckns4-0002XN-Pz
	for qemu-trivial@nongnu.org; Mon, 06 Mar 2017 03:19:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39840)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1ckns0-0002U0-7C; Mon, 06 Mar 2017 03:19:52 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 667F97E9C2;
	Mon,  6 Mar 2017 08:19:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v268JpGG014444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 6 Mar 2017 03:19:52 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7917C1138647; Mon,  6 Mar 2017 09:19:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170302122429.7737-1-berrange@redhat.com>
Date: Mon, 06 Mar 2017 09:19:49 +0100
In-Reply-To: <20170302122429.7737-1-berrange@redhat.com> (Daniel P. Berrange's
	message of "Thu, 2 Mar 2017 12:24:29 +0000")
Message-ID: <87zigy3jh6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 06 Mar 2017 08:19:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp: allow setting
 properties to empty string in qmp-shell
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
X-List-Received-Date: Mon, 06 Mar 2017 08:19:58 -0000

"Daniel P. Berrange" <berrange@redhat.com> writes:

> The qmp-shell property parser currently rejects attempts to
> set string properties to the empty string eg
>
>   (QEMU) migrate-set-parameters  tls-hostname=
>   Error while parsing command line: Expected a key=value pair, got 'tls-hostname='
> command format: <command-name>  [arg-name1=arg1] ... [arg-nameN=argN]
>
> This is caused by checking the wrong condition after splitting
> the parameter on '='. The "partition" method will return "" for
> the separator field, if the seperator was not present, so that
> is the correct thing to check for malformed syntax.
>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>

I'll take this through my tree, unless qemu-trivial beats me to the
punch.  Thanks!

